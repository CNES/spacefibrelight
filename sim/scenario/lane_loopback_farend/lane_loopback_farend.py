##########################################################################
## COMPANY       : CNES
##########################################################################
## TITLE         : lane_loopback_farend.py
## PROJECT       : SPACE FIBRE LIGHT
##########################################################################
## AUTHOR        : Thomas FAVRE-FELIX
## CREATED       : 02/10/2024
##########################################################################
## DESCRIPTION   : Runs tests for verification of the SpaceFibre_Light IP
##                 loopback in configuration 1
##########################################################################
## History       :	V1.0: Creation of the file
##########################################################################

import os

import cocotb
import cocotbext
from cocotb.triggers import Edge, RisingEdge, FallingEdge, Timer, Join, Combine
from cocotb.result import TestFailure, TestError
from cocotb.utils import get_sim_time

#check for cocotb framework existence and import it
try:
    import framework
    from framework import Data
    from tb2 import TB, Data_read_phy_config_parameters, Data_read_lane_config_parameters, Data_read_lane_config_status, \
                CLEARLINE, DISABLED, WAIT, STARTED, INVERTRXPOLARITY, CONNECTING, CONNECTED, \
                ACTIVE, PREPARESTANDBY, LOSSOFSIGNAL, \
                SpaceFibre_IP_freq, SpaceFibre_serial_port_freq, SpaceFibre_IP_period_ns, \
                SpaceFibre_serial_port_period_ns, SpaceFibre_IP_period_ps_int, SpaceFibre_serial_port_period_ps_int, \
                Data_lane_gen_config, Data_lane_gen_control, Data_lane_gen_status, Data_lane_gen_seed, \
                Data_lane_ana_config, Data_lane_ana_control, Data_lane_ana_status, Data_lane_ana_seed 
    print("successfully Found cocotb Framework")
except ImportError as e:
    print("")
    print("Error -> ", e)
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!   COCOTB framework library is not found.                                                      !!")
    print("!!                                                                                               !!")
    print("!!   Have you set FRAMEWORK_COCOTB_INSTALL_PATH variable? prior to launch Runme.sh script?       !!")
    print("!!   Is PYTHONPATH variable include the location of the cocotb_framework python sources?         !!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("")
    exit()

#Global variable of test success or failure
test_failed = 0

target = os.environ.get("HARDWARE_TARGET")


def clean_dir(path):
    """Suppress all files of a directory pointed by path"""
    folder = path
    #create path if needed
    os.makedirs(path,exist_ok=True)
    
    for filename in os.listdir(folder):
        file_path = os.path.join(folder, filename)
        os.unlink(file_path)
        
async def init_to_started(tb):
    """
    Sets the DUT Lane initialisation FSM to Started state.
    """
    not_started=1
    
    #Reset of the DUT
    await tb.reset_DUT_lane_only()


    #LaneReset with Lane_Configurator
    await tb.masters[0].init_run("stimuli/axi/Lane_reset.json")

    #Wait end of phy reset
    tb.logger.info("sim_time %d ns: Wait PHY reset completion", get_sim_time(units = 'ns') )
    await RisingEdge(tb.dut.spacefibre_instance.gen_inst_phy_plus_lane.inst_phy_plus_lane.RST_TX_DONE)
    tb.logger.info("sim_time %d ns: Reset PHY completed", get_sim_time(units = 'ns') )

    #Wait to go to Disabled
    await Timer(2, units = "us")

    #Enable LaneStart and wait to be in Started state
    Data_read_lane_config_parameters.data = bytearray([0x01,0x00,0x00,0x00])
 
    time_out = 0
    await tb.masters[0].write_data(Data_read_lane_config_parameters)
    while not_started==1 and time_out < 100:
        await tb.masters[0].read_data(Data_read_lane_config_status)
        if format(Data_read_lane_config_status.data[0], '0>8b')[4:8] == STARTED:
            not_started = 0
        time_out += 1

async def started_to_active(tb): 
    """
    Sets the DUT Lane initialisation FSM to Active state from Started, checking each of state it goes through.
    """
    global test_failed 

    log_rx = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/Started_to_Active.dat", number_of_word = 2280))
    #Set Lane initialisation FSM from Started to Connecting state
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Started_to_Connecting.dat")

    cocotb.start_soon(tb.masters[0].read_data(Data_read_lane_config_status))

    #Set Lane initialisation FSM from Connecting to Connected state
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Connecting_to_Connected.dat")

    #Check that Lane initialisatiion FSM is in Connecting State
    if format(Data_read_lane_config_status.data[0], '0>8b')[4:8] != CONNECTING:
        test_failed = 1

    cocotb.start_soon(tb.masters[0].read_data(Data_read_lane_config_status))

    #Set Lane initialisation FSM from Connected to Active state
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Connected_to_Active.dat")

    #Check that Lane initialisatiion FSM is in Connected State
    if format(Data_read_lane_config_status.data[0], '0>8b')[4:8] != CONNECTED:
        test_failed = 1

    cocotb.start_soon(tb.masters[0].read_data(Data_read_lane_config_status))
    idle = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/IDLE.dat"))
    #Check that Lane initialisatiion FSM is in Active State
    await Combine(idle, log_rx)
    if format(Data_read_lane_config_status.data[0], '0>8b')[4:8] != ACTIVE:
        test_failed = 1
    

async def wait_end_test(tb):
    """
    Wait for test end to be raised by the Lane_Analyzer.
    Return the Error counter of the Lane_Analyzer.
    """
    await tb.masters[2].read_data(Data_lane_ana_status)
    test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]
    timer = 0
    while test_end != '1' and timer < 2000:
        await tb.masters[2].read_data(Data_lane_ana_status)
        timer += 1
        test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]
        tb.logger.debug("simulation time %d ns : Data_lane_ana_status value read : %s", get_sim_time(units = "ns"), format(Data_lane_ana_status.data[0], '0>8b'))
    if timer >=2000:
        return "11111111"
    return format(Data_lane_ana_status.data[1], '0>8b')[6:8] + format(Data_lane_ana_status.data[0], '0>8b')[0:6]








@cocotb.test()
async def cocotb_run(dut):

    dir_path = os.path.dirname(os.path.realpath(__file__))
    clean_dir(os.path.join(dir_path,"reference/spacefibre_serial"))


    #Instantiation of the testbench and first reset of the DUT
    tb = TB(dut)

    await tb.init_phy_layer()
    await tb.reset_lane_only()

    #Specific variable for the scenario
    global test_failed 

    ##########################################################################
    ##########################################################################
    ##########################################################################
    #####        Step 1: Check phy layer far-end serial loopback        #####
    ##########################################################################
    ##########################################################################
    ##########################################################################

    if target == "VERSAL":
        await tb.reset_lane_only()

        step_1_failed = 0
        #Sets DUT lane initialisation FSM to Active with parallel loopback enabled 
        Data_read_phy_config_parameters.data = bytearray([0x02,0x00,0x00,0x00]) # Enable  far-end loopback
        await tb.masters[0].write_data(Data_read_phy_config_parameters)

        await init_to_started(tb)

        ###########################
        #With loopback during init
        ###########################

        await started_to_active(tb)

        #Incremental data generation

        #Configure Lane_Generator
        Data_lane_gen_config.data = bytearray( [0x84,0x20,0x00,0x00])
        gen_config = cocotb.start_soon(tb.masters[1].write_data(Data_lane_gen_config))

        #Configure Lane_Analizer
        Data_lane_ana_config.data = bytearray( [0x84,0x20,0x00,0x00])
        ana_config = cocotb.start_soon(tb.masters[2].write_data(Data_lane_ana_config))
        await Combine(gen_config, ana_config)

        #Seed of Lane_Generator
        Data_lane_gen_seed.data = bytearray( [0x00,0x00,0x00,0x00])
        gen_seed = cocotb.start_soon(tb.masters[1].write_data(Data_lane_gen_seed))

        #Seed of Lane_Analyzer
        Data_lane_ana_seed.data = bytearray( [0x00,0x00,0x01,0x00])
        ana_seed = cocotb.start_soon(tb.masters[2].write_data(Data_lane_ana_seed))
        await Combine(gen_seed, ana_seed)

        #Start Test
        Data_lane_ana_control.data = bytearray( [0x01,0x00,0x00,0x00])
        await tb.masters[2].write_data(Data_lane_ana_control)
        Data_lane_gen_control.data = bytearray( [0x01,0x00,0x00,0x00])
        await tb.masters[1].write_data(Data_lane_gen_control)
        stimulus_tx = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/255_incremental_data_1_frame.dat", file_format = 16))
        log_rx = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/255_incremental_farendlbfrominit_data_1_frame", number_of_word = 256))

        #Pull until Test End
        error_cnt = await wait_end_test(tb)

        await Combine(*[stimulus_tx, log_rx])

        if error_cnt != "00000000":
            step_1_failed = 1 
            tb.logger.error("simulation time %d ns : step 1.1 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), error_cnt)
        else:
            tb.logger.info("simulation time %d ns : step 1.1 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

        #PRBS data generation

        #Configure Lane_Generator
        Data_lane_gen_config.data = bytearray( [0x9F,0x20,0x00,0x01])
        gen_config = cocotb.start_soon(tb.masters[1].write_data(Data_lane_gen_config))

        #Configure Lane_Analizer
        Data_lane_ana_config.data = bytearray( [0x9F,0x20,0x00,0x01])
        ana_config = cocotb.start_soon(tb.masters[2].write_data(Data_lane_ana_config))
        await Combine(gen_config, ana_config)

        #Seed of Lane_Generator
        Data_lane_gen_seed.data = bytearray( [0x00,0x00,0x00,0x00])
        gen_seed = cocotb.start_soon(tb.masters[1].write_data(Data_lane_gen_seed))

        #Seed of Lane_Analyzer
        Data_lane_ana_seed.data = bytearray( [0x00,0x00,0x00,0x2A])
        ana_seed = cocotb.start_soon(tb.masters[2].write_data(Data_lane_ana_seed))
        await Combine(gen_seed, ana_seed)

        #Start Test
        Data_lane_ana_control.data = bytearray( [0x01,0x00,0x00,0x00])
        await tb.masters[2].write_data(Data_lane_ana_control)
        Data_lane_gen_control.data = bytearray( [0x01,0x00,0x00,0x00])
        await tb.masters[1].write_data(Data_lane_gen_control)
        log_rx = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/16384_PRBS_farendlbfrominit_data_0x1F_frame", number_of_word = 64*0x1F))
        stimulus_tx = cocotb.start_soon(tb.spacefibre_random_generator.write_random_inputs("reference/spacefibre_serial/16384_PRBS_farendlbfrominit_data_0x1F_frame_1.dat",
                                                                        frame_number = 0x1F,
                                                                        frame_size = 0x100,
                                                                        seed = 0x2A_00_00_00))

        #Pull until Test End
        error_cnt = await wait_end_test(tb)

        await Combine(*[stimulus_tx, log_rx])

        if error_cnt != "00000000":
            step_1_failed = 1 
            tb.logger.error("simulation time %d ns : step 1.2 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), error_cnt)
        else:
            tb.logger.info("simulation time %d ns : step 1.2 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

        #Configure Lane_Generator
        Data_lane_gen_config.data = bytearray( [0x9F,0x20,0x00,0x01])
        gen_config = cocotb.start_soon(tb.masters[1].write_data(Data_lane_gen_config))

        #Configure Lane_Analizer
        Data_lane_ana_config.data = bytearray( [0x9F,0x20,0x00,0x01])
        ana_config = cocotb.start_soon(tb.masters[2].write_data(Data_lane_ana_config))
        await Combine(gen_config, ana_config)

        #Seed of Lane_Generator
        Data_lane_gen_seed.data = bytearray( [0x01,0x00,0x00,0x00])
        gen_seed = cocotb.start_soon(tb.masters[1].write_data(Data_lane_gen_seed))

        #Seed of Lane_Analyzer
        Data_lane_ana_seed.data = bytearray( [0x00,0x00,0x00,0x2B])
        ana_seed = cocotb.start_soon(tb.masters[2].write_data(Data_lane_ana_seed))
        await Combine(gen_seed, ana_seed)

        #Start Test
        Data_lane_ana_control.data = bytearray( [0x01,0x00,0x00,0x00])
        await tb.masters[2].write_data(Data_lane_ana_control)
        Data_lane_gen_control.data = bytearray( [0x01,0x00,0x00,0x00])
        await tb.masters[1].write_data(Data_lane_gen_control)
        stimulus_tx = cocotb.start_soon(tb.spacefibre_random_generator.write_random_inputs("reference/spacefibre_serial/16384_PRBS_farendlbfrominit_data_0x1F_frame_2.dat",
                                                                        frame_number = 0x1F,
                                                                        frame_size = 0x100,
                                                                        seed = 0x2B_00_00_00))

        log_rx = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/16384_PRBS_farendlbfrominit_data_0x1F_frame", number_of_word = 64*0x1F))
            
        #Pull until Test End
        error_cnt = await wait_end_test(tb)

        await Combine(*[stimulus_tx, log_rx])

        if error_cnt != "00000000":
            step_1_failed = 1 
            tb.logger.error("simulation time %d ns : step 1.3 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), error_cnt)
        else:
            tb.logger.info("simulation time %d ns : step 1.3 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

        #Configure Lane_Generator
        Data_lane_gen_config.data = bytearray( [0x82,0x20,0x00,0x01])
        gen_config = cocotb.start_soon(tb.masters[1].write_data(Data_lane_gen_config))

        #Configure Lane_Analizer
        Data_lane_ana_config.data = bytearray( [0x82,0x20,0x00,0x01])
        ana_config = cocotb.start_soon(tb.masters[2].write_data(Data_lane_ana_config))
        await Combine(gen_config, ana_config)

        #Seed of Lane_Generator
        Data_lane_gen_seed.data = bytearray( [0x00,0x00,0x00,0x02])
        gen_seed = cocotb.start_soon(tb.masters[1].write_data(Data_lane_gen_seed))

        #Seed of Lane_Analyzer
        Data_lane_ana_seed.data = bytearray( [0x00,0x00,0x00,0x2C])
        ana_seed = cocotb.start_soon(tb.masters[2].write_data(Data_lane_ana_seed))
        await Combine(gen_seed, ana_seed)

        #Start Test
        Data_lane_ana_control.data = bytearray( [0x01,0x00,0x00,0x00])
        await tb.masters[2].write_data(Data_lane_ana_control)
        Data_lane_gen_control.data = bytearray( [0x01,0x00,0x00,0x00])
        await tb.masters[1].write_data(Data_lane_gen_control)
        stimulus_tx = cocotb.start_soon(tb.spacefibre_random_generator.write_random_inputs("reference/spacefibre_serial/16384_PRBS_farendlbfrominit_data_0x1F_frame_3.dat",
                                                                        frame_number = 0x2,
                                                                        frame_size = 0x100,
                                                                        seed = 0x2C_00_00_00))
        log_rx = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/16384_PRBS_farendlbfrominit_data_0x1F_frame", number_of_word = 64*0x2))
            
        #Pull until Test End
        error_cnt = await wait_end_test(tb)

        await Combine(*[stimulus_tx, log_rx])

        if error_cnt != "00000000":
            step_1_failed = 1 
            tb.logger.error("simulation time %d ns : step 1.4 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), error_cnt)
        else:
            tb.logger.info("simulation time %d ns : step 1.4 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

        #Configure Lane_Generator
        Data_lane_gen_config.data = bytearray( [0x81,0x08,0x00,0x01])
        gen_config = cocotb.start_soon(tb.masters[1].write_data(Data_lane_gen_config))

        #Configure Lane_Analizer
        Data_lane_ana_config.data = bytearray( [0x81,0x08,0x00,0x01])
        ana_config = cocotb.start_soon(tb.masters[2].write_data(Data_lane_ana_config))
        await Combine(gen_config, ana_config)

        #Seed of Lane_Generator
        Data_lane_gen_seed.data = bytearray( [0x00,0x00,0x00,0x03])
        gen_seed = cocotb.start_soon(tb.masters[1].write_data(Data_lane_gen_seed))

        #Seed of Lane_Analyzer
        Data_lane_ana_seed.data = bytearray( [0x00,0x00,0x00,0x2D])
        ana_seed = cocotb.start_soon(tb.masters[2].write_data(Data_lane_ana_seed))
        await Combine(gen_seed, ana_seed)

        #Start Test
        Data_lane_ana_control.data = bytearray( [0x01,0x00,0x00,0x00])
        await tb.masters[2].write_data(Data_lane_ana_control)
        Data_lane_gen_control.data = bytearray( [0x01,0x00,0x00,0x00])
        await tb.masters[1].write_data(Data_lane_gen_control)
        stimulus_tx = cocotb.start_soon(tb.spacefibre_random_generator.write_random_inputs("reference/spacefibre_serial/16384_PRBS_farendlbfrominit_data_0x1F_frame_4.dat",
                                                                        frame_number = 0x1,
                                                                        frame_size = 0x44,
                                                                        seed = 0x2D_00_00_00))
        log_rx = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/16384_PRBS_farendlbfrominit_data_0x1F_frame", number_of_word = 0x11*0x1))
            
        #Pull until Test End
        error_cnt = await wait_end_test(tb)

        await Combine(*[stimulus_tx, log_rx])

        if error_cnt != "00000000":
            step_1_failed = 1 
            tb.logger.error("simulation time %d ns : step 1.5 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), error_cnt)
        else:
            tb.logger.info("simulation time %d ns : step 1.5 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


        if step_1_failed == 0:
            tb.logger.info("simulation time %d ns : step 1 result: Pass", get_sim_time(units = "ns"))
        else:
            test_failed = 1
            tb.logger.error("simulation time %d ns : step 1 result: Failed", get_sim_time(units = "ns"))


        #writting the monitors loggers
        tb.write_monitor_data()

            #print results of test
        tb.logger.info("simulation time %d ns : TEST RESULTS :",get_sim_time(units="ns"))

        if step_1_failed == 0:
            tb.logger.info("simulation time %d ns : step 1 result: Pass",get_sim_time(units="ns"))
        else:
            tb.logger.error("simulation time %d ns : step 1 result: Failed", get_sim_time(units="ns"))

    elif target == "NG_ULTRA" :
        tb.logger.info("simulation time %d ns : Test loopback_farend is not applicable to NG ULTRA target",get_sim_time(units="ns"))

    if test_failed == 1:
        raise TestFailure