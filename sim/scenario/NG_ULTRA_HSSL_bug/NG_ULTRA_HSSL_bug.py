##########################################################################
## COMPANY       : CNES
##########################################################################
## TITLE         : lane_receiver.py
## PROJECT       : SPACE FIBRE LIGHT
##########################################################################
## AUTHOR        : Thomas FAVRE-FELIX
## CREATED       : 02/10/2024
##########################################################################
## DESCRIPTION   : Runs tests for verification of the SpaceFibre_Light IP
##                 receiver process
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



target = os.environ.get("HARDWARE_TARGET")

#Global variable of test success or failure
test_failed = 0

def clean_dir(path):
    """Suppress all files of a directory pointed by path"""
    folder = path
    #create path if needed
    os.makedirs(path,exist_ok=True)
    
    for filename in os.listdir(folder):
        file_path = os.path.join(folder, filename)
        os.unlink(file_path)

async def initialization_procedure(tb):
    """
    Perform the initialization needed to be performed before each step of the scenario.
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
    
    #Set Lane initialisatiion FSM from Started to Active state
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Started_to_Active.dat")

    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/50_IDLE.dat", file_format = 16))

    #Check that Lane initialisatiion FSM is in Active State
    await tb.masters[0].read_data(Data_read_lane_config_status)

    await stimuli
    if format(Data_read_lane_config_status.data[0], '0>8b')[4:8] != ACTIVE:
        global test_failed 
        test_failed = 1

async def wait_end_test(tb):
    """
    Wait for test end to be raised by the Lane_Analyzer.
    Return the Error counter of the Lane_Analyzer.
    """
    await tb.masters[2].read_data(Data_lane_ana_status)
    test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]
    timer = 0
    while test_end != '1' and timer < 1000:
        await tb.masters[2].read_data(Data_lane_ana_status)
        timer += 1
        test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]
        tb.logger.debug("simulation time %d ns : Data_lane_ana_status value read : %s", get_sim_time(units = "ns"), format(Data_lane_ana_status.data[0], '0>8b'))
    if timer >=1000:
        tb.logger.error("simulation time %d ns : test timeout", get_sim_time(units = "ns"))
        return "11111111"
    return format(Data_lane_ana_status.data[1], '0>8b')[6:8] + format(Data_lane_ana_status.data[0], '0>8b')[0:6]



async def write_10b_to_Rx(tb, encoded_data, delay, invert_polarity = 0):
    """
    Writes the given data encoded on 10bits to the Rx port
    of the SpaceFibreLight IP after serializing the data.
    Allows to send invalid data encoded.
    """
    time_per_input = tb.spacefibre_driver.time_per_input
    tb.logger.debug("sim_time %d ns: Data encoded to be sent : %d", get_sim_time(units = "ns"), encoded_data)
    serialized_data = tb.spacefibre_driver.invert(encoded_data)
    if delay != 0:
        await Timer(delay, units="fs")
    for d in range(len(serialized_data)):
        if invert_polarity == 0:
            tb.dut.RX_POS.value = serialized_data[d]
            tb.dut.RX_NEG.value = serialized_data[d]^1
        else :
            tb.dut.RX_POS.value = serialized_data[d]^1
            tb.dut.RX_NEG.value = serialized_data[d]
        await Timer(time_per_input, units="fs")
    tb.logger.debug("sim_time %d ns: Data encoded sent : %d", get_sim_time(units = "ns"), encoded_data)

async def send_idle_ctrl_word(tb, number_of_words):
    for x in range(number_of_words):
        await tb.spacefibre_driver.write_to_Rx("11111100", delay = 0, k_encoding = 1)
        await tb.spacefibre_driver.write_to_Rx("11001110", delay = 0, k_encoding = 0)
        await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)
        await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)

@cocotb.test()
async def cocotb_run(dut):

    dir_path = os.path.dirname(os.path.realpath(__file__))
    clean_dir(os.path.join(dir_path,"reference/spacefibre_serial"))

    #Instantiation of the testbench and first reset of the DUT
    tb = TB(dut)
    await tb.reset_lane_only()

    #Specific variable for the scenario
    global test_failed 
    global target


    

    ##########################################################################
    ##########################################################################
    ##########################################################################
    #####    Step 1: Double error detection on out of table reception    #####
    ##########################################################################
    ##########################################################################
    ##########################################################################

    step_1_failed = 0
    #Sets DUT lane initialisation FSM to Active with parallel loopback enabled 
    await initialization_procedure(tb)

    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/50_IDLE.dat", file_format = 16))

    #Configure Lane_Analizer
    Data_lane_ana_config.data = bytearray( [0x90,0x20,0x00,0x01])
    await tb.masters[2].write_data(Data_lane_ana_config)

    #Seed of Lane_Analyzer
    Data_lane_ana_seed.data = bytearray( [0x2A,0x00,0x00,0x00])
    await tb.masters[2].write_data(Data_lane_ana_seed)

    #Start Test
    Data_lane_ana_control.data = bytearray( [0x01,0x00,0x00,0x00])
    await tb.masters[2].write_data(Data_lane_ana_control)

    await stimuli

    await tb.spacefibre_random_generator.write_random_inputs("reference/spacefibre_serial/2048_word_step_3_1.dat",
                                                                    frame_number = 0x10,
                                                                    frame_size = 0x100,
                                                                    seed = 0x00_00_00_2A)
    

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 5000))


    #Pull until Test End
    error_cnt = await wait_end_test(tb)
    
    if error_cnt != "00000000":
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.1 result: Failed\nError counter : %s\n\n\n", get_sim_time(units = "ns"), error_cnt)
    else:
        tb.logger.info("simulation time %d ns : step 1.1 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    

    await tb.masters[0].read_data(Data_read_lane_config_status)
    

    error_cnt = format(Data_read_lane_config_status.data[1], '0>8b')[4:8] + format(Data_read_lane_config_status.data[0], '0>8b')[0:4]
    error_overflow = format(Data_read_lane_config_status.data[1], '0>8b')[3]

    if error_cnt != "00000000" or error_overflow != "0":
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.2 result: Failed\nError counter : %s\nError counter overflow: %s\n\n\n", get_sim_time(units = "ns"), error_cnt, error_overflow)
    else:
        tb.logger.info("simulation time %d ns : step 1.2 result: Pass\n\n\n\n", get_sim_time(units = "ns"))



    #RXERR word reception

    #Configure Lane_Analizer
    Data_lane_ana_config.data = bytearray( [0x01,0x00,0x00,0x04])
    await tb.masters[2].write_data(Data_lane_ana_config)

    #Start Test
    Data_lane_ana_control.data = bytearray( [0x01,0x00,0x00,0x00])
    await tb.masters[2].write_data(Data_lane_ana_control)

    await stimuli
    
    await send_idle_ctrl_word(tb, 7000)

    await write_10b_to_Rx(tb, "1111110101", 0)
    await write_10b_to_Rx(tb, "1100011001", 0)
    await write_10b_to_Rx(tb, "1100011001", 0)
    await write_10b_to_Rx(tb, "1100011001", 0)
    
    await write_10b_to_Rx(tb, "1100011001", 0)
    await write_10b_to_Rx(tb, "1100011001", 0)
    await write_10b_to_Rx(tb, "1100011001", 0)
    await tb.spacefibre_driver.write_to_Rx("00000001", delay = 0, k_encoding = 0) #This will be the word with a disparity error


    tb.logger.info("simulation time %d ns : Step 1 : injection of out of table char\n\n\n\n", get_sim_time(units = "ns"))

    await send_idle_ctrl_word(tb, 100)

    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/50_IDLE.dat", file_format = 16)

    check_error = cocotb.start_soon(tb.masters[0].read_data(Data_read_lane_config_status))
    wait_check_error = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/50_IDLE.dat", file_format = 16))
    
    await check_error

    error_cnt = format(Data_read_lane_config_status.data[1], '0>8b')[4:8] + format(Data_read_lane_config_status.data[0], '0>8b')[0:4]
    error_overflow = format(Data_read_lane_config_status.data[1], '0>8b')[3]

    if error_cnt != "00000001" or error_overflow != "0":
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.3 result: Failed\nError counter : %s\nError counter overflow: %s\n\n\n", get_sim_time(units = "ns"), error_cnt, error_overflow)
    else:
        tb.logger.info("simulation time %d ns : step 1.3 result: Pass\n\n\n\n", get_sim_time(units = "ns"))
    

    
    #Configure Lane_Analizer
    Data_lane_ana_config.data = bytearray( [0x90,0x20,0x00,0x01])
    await tb.masters[2].write_data(Data_lane_ana_config)

    #Seed of Lane_Analyzer
    Data_lane_ana_seed.data = bytearray( [0x2B,0x00,0x00,0x00])
    await tb.masters[2].write_data(Data_lane_ana_seed)

    #Start Test
    Data_lane_ana_control.data = bytearray( [0x01,0x00,0x00,0x00])
    await tb.masters[2].write_data(Data_lane_ana_control)
    
    await wait_check_error
    
    await tb.spacefibre_random_generator.write_random_inputs("reference/spacefibre_serial/2048_word_step_3_2.dat",
                                                                    frame_number = 0x10,
                                                                    frame_size = 0x100,
                                                                    seed = 0x00_00_00_2B)
    
    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 5000))

        
    #Pull until Test End
    error_cnt = await wait_end_test(tb)
    
    if error_cnt != "00000000":
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.4 result: Failed\nError counter : %s\n\n\n", get_sim_time(units = "ns"), error_cnt)
    else:
        tb.logger.info("simulation time %d ns : step 1.4 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    check_error = cocotb.start_soon(tb.masters[0].read_data(Data_read_lane_config_status))
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/50_IDLE.dat", file_format = 16))
    await check_error

    error_cnt = format(Data_read_lane_config_status.data[1], '0>8b')[4:8] + format(Data_read_lane_config_status.data[0], '0>8b')[0:4]
    error_overflow = format(Data_read_lane_config_status.data[1], '0>8b')[3]

    if error_cnt != "00000001" or error_overflow != "0":
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.5 result: Failed\nError counter : %s\nError counter overflow: %s\n\n\n", get_sim_time(units = "ns"), error_cnt, error_overflow)
    else:
        tb.logger.info("simulation time %d ns : step 1.5 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    await stimuli


    for seed in range(2):

        stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/50_IDLE.dat", file_format = 16))

        #Configure Lane_Analizer
        Data_lane_ana_config.data = bytearray( [0x90,0x20,0x00,0x01])
        await tb.masters[2].write_data(Data_lane_ana_config)

        #Seed of Lane_Analyzer
        Data_lane_ana_seed.data = bytearray( [0x2C + seed,0x00,0x00,0x00])
        await tb.masters[2].write_data(Data_lane_ana_seed)

        #Start Test
        Data_lane_ana_control.data = bytearray( [0x01,0x00,0x00,0x00])
        await tb.masters[2].write_data(Data_lane_ana_control)
        
        await stimuli
        logfile  = "reference/spacefibre_serial/12288 _word_step_3_1_" + str(seed) + ".dat"

        await tb.spacefibre_random_generator.write_random_inputs(logfile,
                                                                 frame_number = 0x10,
                                                                 frame_size = 0x100,
                                                                 seed = 0x00_00_00_2C + seed)
        
        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 5000))
            
        #Pull until Test End
        error_cnt = await wait_end_test(tb)

        await stimuli
        
        if error_cnt != "00000000":
            step_1_failed = 1
            tb.logger.error("simulation time %d ns : step 1.%d result: Failed\nError counter : %s\n\n\n", get_sim_time(units = "ns"), 6+seed, error_cnt)
        else:
            tb.logger.info("simulation time %d ns : step 1.%d result: Pass\n\n\n\n", get_sim_time(units = "ns"), 6+seed)



    check_error = cocotb.start_soon(tb.masters[0].read_data(Data_read_lane_config_status))
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/50_IDLE.dat", file_format = 16))
    await check_error

    error_cnt = format(Data_read_lane_config_status.data[1], '0>8b')[4:8] + format(Data_read_lane_config_status.data[0], '0>8b')[0:4]
    error_overflow = format(Data_read_lane_config_status.data[1], '0>8b')[3]

    if error_cnt != "00000000" or error_overflow != "0":
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.8 result: Failed\nError counter : %s\nError counter overflow: %s\n\n\n", get_sim_time(units = "ns"), error_cnt, error_overflow)
    else:
        tb.logger.info("simulation time %d ns : step 1.9 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    await stimuli

    for seed in range(3):

        stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/50_IDLE.dat", file_format = 16))

        #Configure Lane_Analizer
        Data_lane_ana_config.data = bytearray( [0x90,0x20,0x00,0x01])
        await tb.masters[2].write_data(Data_lane_ana_config)

        #Seed of Lane_Analyzer
        Data_lane_ana_seed.data = bytearray( [0x2C + seed,0x00,0x00,0x00])
        await tb.masters[2].write_data(Data_lane_ana_seed)

        #Start Test
        Data_lane_ana_control.data = bytearray( [0x01,0x00,0x00,0x00])
        await tb.masters[2].write_data(Data_lane_ana_control)
        
        await stimuli
        logfile  = "reference/spacefibre_serial/12288 _word_step_3_1_" + str(seed) + ".dat"

        await tb.spacefibre_random_generator.write_random_inputs(logfile,
                                                                 frame_number = 0x10,
                                                                 frame_size = 0x100,
                                                                 seed = 0x00_00_00_2C + seed)
        
        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 5000))
            
        #Pull until Test End
        error_cnt = await wait_end_test(tb)

        await stimuli
        
        if error_cnt != "00000000":
            step_1_failed = 1
            tb.logger.error("simulation time %d ns : step 1.%d result: Failed\nError counter : %s\n\n\n", get_sim_time(units = "ns"),10+seed , error_cnt)
        else:
            tb.logger.info("simulation time %d ns : step 1.%d result: Pass\n\n\n\n", get_sim_time(units = "ns"),10+seed)



    check_error = cocotb.start_soon(tb.masters[0].read_data(Data_read_lane_config_status))
    wait_check_error = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/50_IDLE.dat", file_format = 16))
    await check_error

    error_cnt = format(Data_read_lane_config_status.data[1], '0>8b')[4:8] + format(Data_read_lane_config_status.data[0], '0>8b')[0:4]
    error_overflow = format(Data_read_lane_config_status.data[1], '0>8b')[3]

    if error_cnt != "00000000" or error_overflow != "0":
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.13 result: Failed\nError counter : %s\nError counter overflow: %s\n\n\n", get_sim_time(units = "ns"), error_cnt, error_overflow)
    else:
        tb.logger.info("simulation time %d ns : step 1.13 result: Pass\n\n\n\n", get_sim_time(units = "ns"))



    #RXERR word reception

    #Configure Lane_Analizer
    Data_lane_ana_config.data = bytearray( [0x02,0x00,0x00,0x04])
    await tb.masters[2].write_data(Data_lane_ana_config)

    #Start Test
    Data_lane_ana_control.data = bytearray( [0x01,0x00,0x00,0x00])
    await tb.masters[2].write_data(Data_lane_ana_control)

    await wait_check_error
    
    await write_10b_to_Rx(tb, "1111110101", 0)
    if target == "NG_ULTRA":
        await tb.spacefibre_driver.write_to_Rx("00000001", delay = 0, k_encoding = 0)
    else :
        await write_10b_to_Rx(tb, "1100011001", 0)
    await write_10b_to_Rx(tb, "1100011001", 0)
    await write_10b_to_Rx(tb, "1100011001", 0)


    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/50_IDLE.dat", file_format = 16)

    await write_10b_to_Rx(tb, "1111110101", 0)
    if target == "NG_ULTRA":
        await tb.spacefibre_driver.write_to_Rx("00000001", delay = 0, k_encoding = 0)
    else :
        await write_10b_to_Rx(tb, "1100011001", 0)
    await write_10b_to_Rx(tb, "1100011001", 0)
    await write_10b_to_Rx(tb, "1100011001", 0)


    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 2000))
    
    await wait_end_test(tb)

    await stimuli
    
    check_error = cocotb.start_soon(tb.masters[0].read_data(Data_read_lane_config_status))
    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 1000))
    
    await check_error

    error_cnt = format(Data_read_lane_config_status.data[1], '0>8b')[4:8] + format(Data_read_lane_config_status.data[0], '0>8b')[0:4]
    error_overflow = format(Data_read_lane_config_status.data[1], '0>8b')[3]

    

    if error_cnt != "00000010" or error_overflow != "0":
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.14 result: Failed\nError counter : %s\nError counter overflow: %s\n\n\n", get_sim_time(units = "ns"), error_cnt, error_overflow)
    else:
        tb.logger.info("simulation time %d ns : step 1.14 result: Pass\n\n\n\n", get_sim_time(units = "ns"))
    




    for seed in range (2):
        #Configure Lane_Analizer
        Data_lane_ana_config.data = bytearray( [0x90,0x20,0x00,0x01])
        await tb.masters[2].write_data(Data_lane_ana_config)

        #Seed of Lane_Analyzer
        Data_lane_ana_seed.data = bytearray( [0x2F+seed,0x00,0x00,0x00])
        await tb.masters[2].write_data(Data_lane_ana_seed)

        #Start Test
        Data_lane_ana_control.data = bytearray( [0x01,0x00,0x00,0x00])
        await tb.masters[2].write_data(Data_lane_ana_control)
        
        await stimuli
        
        logfile  = "reference/spacefibre_serial/12288 _word_step_3_1_" + str(12 + seed) + ".dat"

        await tb.spacefibre_random_generator.write_random_inputs(logfile,
                                                                 frame_number = 0x10,
                                                                 frame_size = 0x100,
                                                                 seed = 0x00_00_00_2F+seed)
        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 5000))

            
        #Pull until Test End
        error_cnt = await wait_end_test(tb)
        
        if error_cnt != "00000000":
            step_1_failed = 1
            tb.logger.error("simulation time %d ns : step 1.%d result: Failed\nError counter : %s\n\n\n", get_sim_time(units = "ns"), 15+seed, error_cnt)
        else:
            tb.logger.info("simulation time %d ns : step 1.%d result: Pass\n\n\n\n", get_sim_time(units = "ns"), 15+seed)

    
        
    await stimuli

    check_error = cocotb.start_soon(tb.masters[0].read_data(Data_read_lane_config_status))
    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 1000))
    await check_error

    error_cnt = format(Data_read_lane_config_status.data[1], '0>8b')[4:8] + format(Data_read_lane_config_status.data[0], '0>8b')[0:4]
    error_overflow = format(Data_read_lane_config_status.data[1], '0>8b')[3]

    if error_cnt != "00000001" or error_overflow != "0":
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.17 result: Failed\nError counter : %s\nError counter overflow: %s\n\n\n", get_sim_time(units = "ns"), error_cnt, error_overflow)
    else:
        tb.logger.info("simulation time %d ns : step 1.17 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    



    for seed in range (2):
        #Configure Lane_Analizer
        Data_lane_ana_config.data = bytearray( [0x90,0x20,0x00,0x01])
        await tb.masters[2].write_data(Data_lane_ana_config)

        #Seed of Lane_Analyzer
        Data_lane_ana_seed.data = bytearray( [0x2F+seed,0x00,0x00,0x00])
        await tb.masters[2].write_data(Data_lane_ana_seed)

        #Start Test
        Data_lane_ana_control.data = bytearray( [0x01,0x00,0x00,0x00])
        await tb.masters[2].write_data(Data_lane_ana_control)
        
        await stimuli
        
        logfile  = "reference/spacefibre_serial/12288 _word_step_3_1_" + str(12 + seed) + ".dat"

        await tb.spacefibre_random_generator.write_random_inputs(logfile,
                                                                 frame_number = 0x10,
                                                                 frame_size = 0x100,
                                                                 seed = 0x00_00_00_2F+seed)
        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 5000))

            
        #Pull until Test End
        error_cnt = await wait_end_test(tb)
        
        if error_cnt != "00000000":
            step_1_failed = 1
            tb.logger.error("simulation time %d ns : step 1.%d result: Failed\nError counter : %s\n\n\n", get_sim_time(units = "ns"), 18+seed, error_cnt)
        else:
            tb.logger.info("simulation time %d ns : step 1.%d result: Pass\n\n\n\n", get_sim_time(units = "ns"), 18+seed)

    await stimuli
    await send_idle_ctrl_word(tb, 2000)
    check_error = cocotb.start_soon(tb.masters[0].read_data(Data_read_lane_config_status))
    wait_check_error = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/50_IDLE.dat", file_format = 16))
    await check_error

    error_cnt = format(Data_read_lane_config_status.data[1], '0>8b')[4:8] + format(Data_read_lane_config_status.data[0], '0>8b')[0:4]
    error_overflow = format(Data_read_lane_config_status.data[1], '0>8b')[3]

    if error_cnt != "00000000" or error_overflow != "0":
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.20 result: Failed\nError counter : %s\nError counter overflow: %s\n\n\n", get_sim_time(units = "ns"), error_cnt, error_overflow)
    else:
        tb.logger.info("simulation time %d ns : step 1.20 result: Pass\n\n\n\n", get_sim_time(units = "ns"))





    #Clear rx error counter before the rest of the test
    while error_cnt != "00000000" or error_overflow != "0":

        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 100))

        #Configure Lane_Analizer
        Data_lane_ana_config.data = bytearray( [0x90,0x20,0x00,0x01])
        await tb.masters[2].write_data(Data_lane_ana_config)

        #Seed of Lane_Analyzer
        Data_lane_ana_seed.data = bytearray( [0x2F,0x00,0x00,0x00])
        await tb.masters[2].write_data(Data_lane_ana_seed)

        #Start Test
        Data_lane_ana_control.data = bytearray( [0x01,0x00,0x00,0x00])
        await tb.masters[2].write_data(Data_lane_ana_control)
        
        await stimuli
        
        logfile  = "reference/spacefibre_serial/12288 _word_step_3_1_" + str(12) + ".dat"

        await tb.spacefibre_random_generator.write_random_inputs(logfile,
                                                                frame_number = 0x10,
                                                                frame_size = 0x100,
                                                                seed = 0x00_00_00_2F)
        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 5000))

            
        #Pull until Test End
        error_cnt = await wait_end_test(tb)
        
        if error_cnt != "00000000":
            step_1_failed = 1
            tb.logger.error("simulation time %d ns : step 1.clearing result: Failed\nError counter : %s\n\n\n", get_sim_time(units = "ns"), error_cnt)
        else:
            tb.logger.info("simulation time %d ns : step 1.clearing result: Pass\n\n\n\n", get_sim_time(units = "ns"))

        await stimuli

        await send_idle_ctrl_word(tb, 2000)
        
        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 100))

        check_error = cocotb.start_soon(tb.masters[0].read_data(Data_read_lane_config_status))
        await check_error

        await stimuli

        error_cnt = format(Data_read_lane_config_status.data[1], '0>8b')[4:8] + format(Data_read_lane_config_status.data[0], '0>8b')[0:4]
        error_overflow = format(Data_read_lane_config_status.data[1], '0>8b')[3]















    #Specific test for NGULTRA 64b datapath width lane layer structure 
    if target == "NG_ULTRA" : 
        

        ##########################################################################
        ##########################################################################
        ##########################################################################
        ###  Step 2: triple error detection on two consecutive error reception  ##
        ##########################################################################
        ##########################################################################
        ##########################################################################

        step_2_failed = 0

        #RXERR word reception

        #Configure Lane_Analizer
        Data_lane_ana_config.data = bytearray( [0x04,0x00,0x00,0x04])
        await tb.masters[2].write_data(Data_lane_ana_config)

        #Start Test
        Data_lane_ana_control.data = bytearray( [0x01,0x00,0x00,0x00])
        await tb.masters[2].write_data(Data_lane_ana_control)

        await wait_check_error

        #inject error on first 32bit of datapath
        await write_10b_to_Rx(tb, "1111110101", 0)
        if target == "NG_ULTRA":
            await tb.spacefibre_driver.write_to_Rx("00000001", delay = 0, k_encoding = 0)
        else :
            await write_10b_to_Rx(tb, "1100011001", 0)
        await write_10b_to_Rx(tb, "1100011001", 0)
        await write_10b_to_Rx(tb, "1100011001", 0)


        await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/50_IDLE.dat", file_format = 16)

        #inject error on second 32bit of datapath
        await write_10b_to_Rx(tb, "1111110101", 0)
        if target == "NG_ULTRA":
            await tb.spacefibre_driver.write_to_Rx("00000001", delay = 0, k_encoding = 0)
        else :
            await write_10b_to_Rx(tb, "1100011001", 0)
        await write_10b_to_Rx(tb, "1100011001", 0)
        await write_10b_to_Rx(tb, "1100011001", 0)


        await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/50_IDLE.dat", file_format = 16)

        #inject error on both 32bit of datapath
        await write_10b_to_Rx(tb, "1111110101", 0)
        if target == "NG_ULTRA":
            await tb.spacefibre_driver.write_to_Rx("00000001", delay = 0, k_encoding = 0)
        else :
            await write_10b_to_Rx(tb, "1100011001", 0)
        await write_10b_to_Rx(tb, "1100011001", 0)
        await write_10b_to_Rx(tb, "1100011001", 0)

        await write_10b_to_Rx(tb, "1111110101", 0)
        if target == "NG_ULTRA":
            await tb.spacefibre_driver.write_to_Rx("00000001", delay = 0, k_encoding = 0)
        else :
            await write_10b_to_Rx(tb, "1100011001", 0)
        await write_10b_to_Rx(tb, "1100011001", 0)
        await write_10b_to_Rx(tb, "1100011001", 0)

        tb.logger.info("simulation time %d ns : Step 1 : injection of two consecutive errors(on two 32b word) \n\n\n\n", get_sim_time(units = "ns"))


        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 100))
        
        await wait_end_test(tb)

        await stimuli
        

        check_error = cocotb.start_soon(tb.masters[0].read_data(Data_read_lane_config_status))
        stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/50_IDLE.dat", file_format = 16))
        
        await check_error

        error_cnt = format(Data_read_lane_config_status.data[1], '0>8b')[4:8] + format(Data_read_lane_config_status.data[0], '0>8b')[0:4]
        error_overflow = format(Data_read_lane_config_status.data[1], '0>8b')[3]

        

        if error_cnt != "00000100" or error_overflow != "0":
            step_2_failed = 1
            tb.logger.error("simulation time %d ns : step 2.1 result: Failed\nError counter : %s\nError counter overflow: %s\n\n\n", get_sim_time(units = "ns"), error_cnt, error_overflow)
        else:
            tb.logger.info("simulation time %d ns : step 2.1 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


        for seed in range (3):
            #Configure Lane_Analizer
            Data_lane_ana_config.data = bytearray( [0x90,0x20,0x00,0x01])
            await tb.masters[2].write_data(Data_lane_ana_config)

            #Seed of Lane_Analyzer
            Data_lane_ana_seed.data = bytearray( [0x2F+seed,0x00,0x00,0x00])
            await tb.masters[2].write_data(Data_lane_ana_seed)

            #Start Test
            Data_lane_ana_control.data = bytearray( [0x01,0x00,0x00,0x00])
            await tb.masters[2].write_data(Data_lane_ana_control)
            
            await stimuli
            
            logfile  = "reference/spacefibre_serial/12288 _word_step_3_1_" + str(12 + seed) + ".dat"

            await tb.spacefibre_random_generator.write_random_inputs(logfile,
                                                                    frame_number = 0x10,
                                                                    frame_size = 0x100,
                                                                    seed = 0x00_00_00_2F+seed)
            stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 5000))

                
            #Pull until Test End
            error_cnt = await wait_end_test(tb)
            
            if error_cnt != "00000000":
                step_2_failed = 1
                tb.logger.error("simulation time %d ns : step 2.%d result: Failed\nError counter : %s\n\n\n", get_sim_time(units = "ns"), 2+seed, error_cnt)
            else:
                tb.logger.info("simulation time %d ns : step 2.%d result: Pass\n\n\n\n", get_sim_time(units = "ns"), 2+seed)

        await stimuli

        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 100))

        check_error = cocotb.start_soon(tb.masters[0].read_data(Data_read_lane_config_status))
        
        await check_error

        await stimuli

        error_cnt = format(Data_read_lane_config_status.data[1], '0>8b')[4:8] + format(Data_read_lane_config_status.data[0], '0>8b')[0:4]
        error_overflow = format(Data_read_lane_config_status.data[1], '0>8b')[3]

        if error_cnt != "00000011" or error_overflow != "0":
            step_2_failed = 1
            tb.logger.error("simulation time %d ns : step 2.5 result: Failed\nError counter : %s\nError counter overflow: %s\n\n\n", get_sim_time(units = "ns"), error_cnt, error_overflow)
        else:
            tb.logger.info("simulation time %d ns : step 2.5 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 100))


        for seed in range (2):
            #Configure Lane_Analizer
            Data_lane_ana_config.data = bytearray( [0x90,0x20,0x00,0x01])
            await tb.masters[2].write_data(Data_lane_ana_config)

            #Seed of Lane_Analyzer
            Data_lane_ana_seed.data = bytearray( [0x2F+seed,0x00,0x00,0x00])
            await tb.masters[2].write_data(Data_lane_ana_seed)

            #Start Test
            Data_lane_ana_control.data = bytearray( [0x01,0x00,0x00,0x00])
            await tb.masters[2].write_data(Data_lane_ana_control)
            
            await stimuli
            
            logfile  = "reference/spacefibre_serial/12288 _word_step_3_1_" + str(12 + seed) + ".dat"

            await tb.spacefibre_random_generator.write_random_inputs(logfile,
                                                                    frame_number = 0x10,
                                                                    frame_size = 0x100,
                                                                    seed = 0x00_00_00_2F+seed)
            stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 5000))

                
            #Pull until Test End
            error_cnt = await wait_end_test(tb)
            
            if error_cnt != "00000000":
                step_2_failed = 1
                tb.logger.error("simulation time %d ns : step 2.%d result: Failed\nError counter : %s\n\n\n", get_sim_time(units = "ns"), 6+seed, error_cnt)
            else:
                tb.logger.info("simulation time %d ns : step 2.%d result: Pass\n\n\n\n", get_sim_time(units = "ns"), 6+seed)

        await stimuli

        await send_idle_ctrl_word(tb, 2000)

        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 100))

        check_error = cocotb.start_soon(tb.masters[0].read_data(Data_read_lane_config_status))
        
        await check_error

        await stimuli

        error_cnt = format(Data_read_lane_config_status.data[1], '0>8b')[4:8] + format(Data_read_lane_config_status.data[0], '0>8b')[0:4]
        error_overflow = format(Data_read_lane_config_status.data[1], '0>8b')[3]

        if error_cnt != "00000010" or error_overflow != "0":
            step_2_failed = 1
            tb.logger.error("simulation time %d ns : step 2.8 result: Failed\nError counter : %s\nError counter overflow: %s\n\n\n", get_sim_time(units = "ns"), error_cnt, error_overflow)
        else:
            tb.logger.info("simulation time %d ns : step 2.8 result: Pass\n\n\n\n", get_sim_time(units = "ns"))



        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 100))


        for seed in range (3):
            #Configure Lane_Analizer
            Data_lane_ana_config.data = bytearray( [0x90,0x20,0x00,0x01])
            await tb.masters[2].write_data(Data_lane_ana_config)

            #Seed of Lane_Analyzer
            Data_lane_ana_seed.data = bytearray( [0x2F+seed,0x00,0x00,0x00])
            await tb.masters[2].write_data(Data_lane_ana_seed)

            #Start Test
            Data_lane_ana_control.data = bytearray( [0x01,0x00,0x00,0x00])
            await tb.masters[2].write_data(Data_lane_ana_control)
            
            await stimuli
            
            logfile  = "reference/spacefibre_serial/12288 _word_step_3_1_" + str(12 + seed) + ".dat"

            await tb.spacefibre_random_generator.write_random_inputs(logfile,
                                                                    frame_number = 0x10,
                                                                    frame_size = 0x100,
                                                                    seed = 0x00_00_00_2F+seed)
            stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 5000))

                
            #Pull until Test End
            error_cnt = await wait_end_test(tb)
            
            if error_cnt != "00000000":
                step_2_failed = 1
                tb.logger.error("simulation time %d ns : step 2.%d result: Failed\nError counter : %s\n\n\n", get_sim_time(units = "ns"), 9+seed, error_cnt)
            else:
                tb.logger.info("simulation time %d ns : step 2.%d result: Pass\n\n\n\n", get_sim_time(units = "ns"), 9+seed)

        await stimuli

        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 100))

        check_error = cocotb.start_soon(tb.masters[0].read_data(Data_read_lane_config_status))
        
        await check_error

        await stimuli

        error_cnt = format(Data_read_lane_config_status.data[1], '0>8b')[4:8] + format(Data_read_lane_config_status.data[0], '0>8b')[0:4]
        error_overflow = format(Data_read_lane_config_status.data[1], '0>8b')[3]

        if error_cnt != "00000001" or error_overflow != "0":
            step_2_failed = 1
            tb.logger.error("simulation time %d ns : step 2.12 result: Failed\nError counter : %s\nError counter overflow: %s\n\n\n", get_sim_time(units = "ns"), error_cnt, error_overflow)
        else:
            tb.logger.info("simulation time %d ns : step 2.12 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 100))


        for seed in range (2):
            #Configure Lane_Analizer
            Data_lane_ana_config.data = bytearray( [0x90,0x20,0x00,0x01])
            await tb.masters[2].write_data(Data_lane_ana_config)

            #Seed of Lane_Analyzer
            Data_lane_ana_seed.data = bytearray( [0x2F+seed,0x00,0x00,0x00])
            await tb.masters[2].write_data(Data_lane_ana_seed)

            #Start Test
            Data_lane_ana_control.data = bytearray( [0x01,0x00,0x00,0x00])
            await tb.masters[2].write_data(Data_lane_ana_control)
            
            await stimuli
            
            logfile  = "reference/spacefibre_serial/12288 _word_step_3_1_" + str(12 + seed) + ".dat"

            await tb.spacefibre_random_generator.write_random_inputs(logfile,
                                                                    frame_number = 0x10,
                                                                    frame_size = 0x100,
                                                                    seed = 0x00_00_00_2F+seed)
            stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 5000))

                
            #Pull until Test End
            error_cnt = await wait_end_test(tb)
            
            if error_cnt != "00000000":
                step_2_failed = 1
                tb.logger.error("simulation time %d ns : step 2.%d result: Failed\nError counter : %s\n\n\n", get_sim_time(units = "ns"), 13+seed, error_cnt)
            else:
                tb.logger.info("simulation time %d ns : step 2.%d result: Pass\n\n\n\n", get_sim_time(units = "ns"), 13+seed)

        await stimuli

        await send_idle_ctrl_word(tb, 2000)

        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 100))

        check_error = cocotb.start_soon(tb.masters[0].read_data(Data_read_lane_config_status))
        await check_error

        await stimuli

        error_cnt = format(Data_read_lane_config_status.data[1], '0>8b')[4:8] + format(Data_read_lane_config_status.data[0], '0>8b')[0:4]
        error_overflow = format(Data_read_lane_config_status.data[1], '0>8b')[3]

        if error_cnt != "00000000" or error_overflow != "0":
            step_2_failed = 1
            tb.logger.error("simulation time %d ns : step 2.15 result: Failed\nError counter : %s\nError counter overflow: %s\n\n\n", get_sim_time(units = "ns"), error_cnt, error_overflow)
            
            
            #Clear rx error counter before the rest of the test
            while error_cnt != "00000000" or error_overflow != "0":

                stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 100))

                #Configure Lane_Analizer
                Data_lane_ana_config.data = bytearray( [0x90,0x20,0x00,0x01])
                await tb.masters[2].write_data(Data_lane_ana_config)

                #Seed of Lane_Analyzer
                Data_lane_ana_seed.data = bytearray( [0x2F,0x00,0x00,0x00])
                await tb.masters[2].write_data(Data_lane_ana_seed)

                #Start Test
                Data_lane_ana_control.data = bytearray( [0x01,0x00,0x00,0x00])
                await tb.masters[2].write_data(Data_lane_ana_control)
                
                await stimuli
                
                logfile  = "reference/spacefibre_serial/12288 _word_step_3_1_" + str(12) + ".dat"

                await tb.spacefibre_random_generator.write_random_inputs(logfile,
                                                                        frame_number = 0x10,
                                                                        frame_size = 0x100,
                                                                        seed = 0x00_00_00_2F)
                stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 5000))

                    
                #Pull until Test End
                error_cnt = await wait_end_test(tb)
                
                if error_cnt != "00000000":
                    step_2_failed = 1
                    tb.logger.error("simulation time %d ns : step 2.clearing result: Failed\nError counter : %s\n\n\n", get_sim_time(units = "ns"), error_cnt)
                else:
                    tb.logger.info("simulation time %d ns : step 2.clearing result: Pass\n\n\n\n", get_sim_time(units = "ns"))

                await stimuli

                await send_idle_ctrl_word(tb, 2000)
                
                stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 100))

                check_error = cocotb.start_soon(tb.masters[0].read_data(Data_read_lane_config_status))
                await check_error

                await stimuli

                error_cnt = format(Data_read_lane_config_status.data[1], '0>8b')[4:8] + format(Data_read_lane_config_status.data[0], '0>8b')[0:4]
                error_overflow = format(Data_read_lane_config_status.data[1], '0>8b')[3]




        else:
            tb.logger.info("simulation time %d ns : step 2.15 result: Pass\n\n\n\n", get_sim_time(units = "ns"))






    #writting the monitors loggers
    tb.write_monitor_data()



    #print results of test
    tb.logger.info("simulation time %d ns : TEST RESULTS :",get_sim_time(units="ns"))

    if step_1_failed == 0:
        tb.logger.info("simulation time %d ns : step 1 result: Pass",get_sim_time(units="ns"))
    else:
        tb.logger.error("simulation time %d ns : step 1 result: Failed", get_sim_time(units="ns"))

    if step_2_failed == 0:
        tb.logger.info("simulation time %d ns : step 2 result: Pass",get_sim_time(units="ns"))
    else:
        tb.logger.error("simulation time %d ns : step 2 result: Failed", get_sim_time(units="ns"))

    if test_failed == 1:
        raise TestFailure
