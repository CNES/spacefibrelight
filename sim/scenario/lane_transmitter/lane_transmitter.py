##########################################################################
## COMPANY       : CNES
##########################################################################
## TITLE         : lane_transmitter.py
## PROJECT       : SPACE FIBRE LIGHT
##########################################################################
## AUTHOR        : Thomas FAVRE-FELIX
## CREATED       : 02/10/2024
##########################################################################
## DESCRIPTION   : Runs tests for verification of the SpaceFibre_Light IP
##                 tranceiver process
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

async def send_idle_ctrl_word(tb, number_of_words):
    for x in range(number_of_words):
        await tb.spacefibre_driver.write_to_Rx("11111100", delay = 0, k_encoding = 1)
        await tb.spacefibre_driver.write_to_Rx("11001110", delay = 0, k_encoding = 0)
        await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)
        await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)

def clean_dir(path):
    """Suppress all files of a directory pointed by path"""
    folder = path
    #create path if needed
    os.makedirs(path,exist_ok=True)
    
    for filename in os.listdir(folder):
        file_path = os.path.join(folder, filename)
        os.unlink(file_path)

async def configure_gen_ana(tb, config, seed):
    """
    Configure the generator and the analyzer of the testbench with matching configuration.
    It then start the test.
    """
    
    #Configure Lane_Analizer and Lane_Generator
    Data_lane_ana_config.data = bytearray(config)
    await tb.masters[2].write_data(Data_lane_ana_config)
    Data_lane_gen_config.data = bytearray(config)
    await tb.masters[1].write_data(Data_lane_gen_config)

    #Seed of Lane_Analyzer and Lane_Generator
    Data_lane_ana_seed.data = bytearray( seed)
    await tb.masters[2].write_data(Data_lane_ana_seed)
    Data_lane_gen_seed.data = bytearray( seed)
    await tb.masters[1].write_data(Data_lane_gen_seed)


    Data_lane_ana_control.data = bytearray([0x01, 0x00, 0x00, 0x00])
    Data_lane_gen_control.data = bytearray([0x01, 0x00, 0x00, 0x00])
    await tb.masters[2].write_data(Data_lane_ana_control)
    await tb.masters[1].write_data(Data_lane_gen_control)


async def wait_end_test(tb):
    """
    Wait for test end to be raised by the Lane_Analyzer.
    Return the Error counter of the Lane_Analyzer.
    """
    await tb.masters[2].read_data(Data_lane_ana_status)
    test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]
    while test_end != '1':
        await tb.masters[2].read_data(Data_lane_ana_status)
        test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]
    return format(Data_lane_ana_status.data[1], '0>8b')[6:8] + format(Data_lane_ana_status.data[0], '0>8b')[0:6]


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
    await send_idle_ctrl_word(tb, 100)
    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 50))
    #Check that Lane initialisatiion FSM is in Active State
    await tb.masters[0].read_data(Data_read_lane_config_status)
    if format(Data_read_lane_config_status.data[0], '0>8b')[4:8] != ACTIVE:
        global test_failed 
        tb.logger.error("simulation time %d ns : Initialisation failed\nState : %s \n\n\n", get_sim_time(units = "ns"), format(Data_read_lane_config_status.data[0], '0>8b')[4:8] )
        test_failed = 1
    await stimuli


def check_skip_word(file_path,tb):
    """
    Check if SKIP words are inserted every 5000 words in the logfile "file_path"
    """
    assert os.path.exists(file_path), "Source file doesn't exist"
    skip_word = "7F7FCEFC;0001"
    input_file = open(file_path, "r")
    c=0
    skip_counter = 0
    compliancy_5000 = 1
    init = 1
    line_number = 0
    for line in input_file:
        c += 1
        line_number += 1
        skip_word_detected = line.find(skip_word)
        if skip_word_detected >= 0:
            if init == 1:
                c = 0
                init = 0
                skip_counter += 1
                tb.logger.info("simulation time %d ns : first skip word detected at line %d after %d words\n\n\n", get_sim_time(units = "ns"), line_number, c)
            elif c != 5000:
                compliancy_5000 = 0
                skip_counter += 1
                tb.logger.error("simulation time %d ns : skip word too early at line %d\nskip counter: %d \nword counter: %d\n\n\n", get_sim_time(units = "ns"), line_number, skip_counter, c)
                c = 0
            else:
                c = 0
                skip_counter += 1
                tb.logger.info("simulation time %d ns : skip word n° %d detected at line %d\n\n\n", get_sim_time(units = "ns"), skip_counter, line_number)
        if c >= 5000 and init == 0:
            compliancy_5000 = 0
            tb.logger.error("simulation time %d ns : skip word timeout at line %d \nline of timeout : %s \n\n\n", get_sim_time(units = "ns"), line_number, line)
    input_file.close()
    return compliancy_5000, skip_counter

def check_idle_word(file_path, tb):
    """
    Count the number of IDLE words inserted when transmitter was idle in the logfile "file_path"
    """
    assert os.path.exists(file_path), "Source file doesn't exist"
    idle_word = "CFCFCEFC;0001"
    input_file = open(file_path, "r")
    c=0
    line_number = 0
    for line in input_file:
        line_number += 1
        if line.find(idle_word) >= 0:
            c += 1
            tb.logger.debug("simulation time %d ns : idle word n° %d detected at line %d\n\n\n", get_sim_time(units = "ns"), c, line_number)
    input_file.close()
    return c

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
    #####        Step 1: Check encoding of data and control words        #####
    ##########################################################################
    ##########################################################################
    ##########################################################################


    step_1_failed = 0
    #Sets DUT lane initialisation FSM to Active with parallel loopback enabled 
    await initialization_procedure(tb)

    if target == "NG_ULTRA" :
        monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_1", number_of_word = 75000))
        loopback = cocotb.start_soon(tb.spacefibre_loopback.loopback(300000))
    else :
        loopback = cocotb.start_soon(tb.spacefibre_loopback.loopback(80000))
        monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_1", number_of_word = 20000))


    #Send 256 incremental data words
    await configure_gen_ana(tb, [0x84,0x20,0x00,0x00], [0x00,0x00,0x00,0x00])

    error_cnt = await wait_end_test(tb)

    if error_cnt != "00000000":
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.1 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), error_cnt)
    else:
        tb.logger.info("simulation time %d ns : step 1.1 result: Pass\n\n\n\n", get_sim_time(units = "ns"))
    
    #Send Data Link layer control words

    await configure_gen_ana(tb, [0x00,0x00,0x00,0x02], [0x00,0x00,0x00,0x00])

    error_cnt = await wait_end_test(tb)

    if error_cnt != "00000000":
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.2 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), error_cnt)
    else:
        tb.logger.info("simulation time %d ns : step 1.2 result: Pass\n\n\n\n", get_sim_time(units = "ns"))
    


    #Send 16384 PRBS data words
    for seed in range(0x2A, 0x2A+16):
        await configure_gen_ana(tb, [0x90,0x20,0x00,0x01], [seed,0x00,0x00,0x00])

        error_cnt = await wait_end_test(tb)

        if error_cnt != "00000000":
            step_1_failed = 1
            tb.logger.error("simulation time %d ns : step 1.%d result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), seed-0x27, error_cnt)
        else:
            tb.logger.info("simulation time %d ns : step 1.%d result: Pass\n\n\n\n", get_sim_time(units = "ns"), seed-0x27)

        if step_1_failed == 1:
            break


    await Combine(loopback, monitor)

    if step_1_failed == 0:
        tb.logger.info("simulation time %d ns : step 1 result: Pass")
    else:
        test_failed = 1
        tb.logger.error("simulation time %d ns : step 1 result: Failed")

    ##########################################################################
    ##########################################################################
    ##########################################################################
    #####           Step 2: Check IDLE and SKIP word insertion           #####
    ##########################################################################
    ##########################################################################
    ##########################################################################

    step_2_failed = 0
    #Sets DUT lane initialisation FSM to Active with parallel loopback enabled 
    await initialization_procedure(tb)



    if target == "NG_ULTRA" :
        loopback = cocotb.start_soon(tb.spacefibre_loopback.loopback(400000))
        await RisingEdge(tb.dut.RX_POS)
        await Timer(80, units="ps")
        await tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_2_alignement", number_of_word = 100)
        monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_2", number_of_word = 70000))
    else:
        loopback = cocotb.start_soon(tb.spacefibre_loopback.loopback(111200))
        monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_2", number_of_word = 27800))

    #Send 16384 PRBS data words
    for seed in range(0x2A, 0x2A+16):
        await configure_gen_ana(tb, [0x90,0x20,0x00,0x01], [seed,0x00,0x00,0x00])

        error_cnt = await wait_end_test(tb)

        if error_cnt != "00000000":
            step_2_failed = 1
            tb.logger.error("simulation time %d ns : step 2.%d result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), seed-0x29, error_cnt)
        else:
            tb.logger.info("simulation time %d ns : step 2.%d result: Pass\n\n\n\n", get_sim_time(units = "ns"), seed-0x29)


        if step_2_failed == 1:
            break
    
    await Combine(loopback, monitor)

    #check skip word compliancy
    compliancy_5000, skip_number = check_skip_word("reference/spacefibre_serial/monitor_step_2_hexa.dat", tb)

    if 0 == compliancy_5000:
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.17 result: Failed\nCompliancy_5000 : %d \nskip_number : %d\n\n\n", get_sim_time(units = "ns"), compliancy_5000, skip_number)
    else:
        tb.logger.info("simulation time %d ns : step 2.17 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    #check that the right amount of idle words have been generated
    idle_number = check_idle_word("reference/spacefibre_serial/monitor_step_2_hexa.dat", tb)



    if target == "NG_ULTRA" :
        if idle_number != (53360 - skip_number):
            step_2_failed = 1
            tb.logger.error("simulation time %d ns : step 2.18 result: Failed\nIdle_umber : %d\n\n\n", get_sim_time(units = "ns"), idle_number)
        else:
            tb.logger.info("simulation time %d ns : step 2.18 result: Pass\n\n\n\n", get_sim_time(units = "ns"))
    else :
        if idle_number != (11160- skip_number):
            step_2_failed = 1
            tb.logger.error("simulation time %d ns : step 2.18 result: Failed\nIdle_umber : %d\n\n\n", get_sim_time(units = "ns"), idle_number)
        else:
            tb.logger.info("simulation time %d ns : step 2.18 result: Pass\n\n\n\n", get_sim_time(units = "ns"))



    if step_2_failed == 0:
        tb.logger.info("simulation time %d ns : step 2 result: Pass")
    else:
        test_failed = 1
        tb.logger.error("simulation time %d ns : step 2 result: Failed")


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