##########################################################################
## COMPANY       : CNES
##########################################################################
## TITLE         : data_link_link_reset.py
## PROJECT       : SPACE FIBRE LIGHT
##########################################################################
## AUTHOR        : Thomas FAVRE-FELIX
## CREATED       : 18/03/2025
##########################################################################
## DESCRIPTION   : Runs tests for verification of the SpaceFibre_Light IP
##                 link reset processes of the data link layer
##########################################################################
## History       :	V1.0: Creation of the file
##########################################################################

import os

import cocotb
import cocotbext
from cocotb.triggers import Edge, RisingEdge, FallingEdge, Timer, Join, Combine, First
from cocotb.result import TestFailure, TestError
from cocotb.utils import get_sim_time

#check for cocotb framework existence and import it
try:
    import framework
    from framework import Data
    from tb2 import TB, Data_read_phy_config_parameters, Data_read_lane_config_parameters, Data_read_lane_config_status, \
                    Data_read_general_control, Data_read_dl_config_parameters, Data_read_dl_config_status_1, Data_read_dl_config_err_mngt, \
                    Data_read_dl_config_status_2, Data_read_dl_config_QoS_1, Data_read_dl_config_QoS_2, \
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
    await tb.reset_DUT()

    #Interface Reset with Lane_Configurator
    await tb.masters[0].init_run("stimuli/axi/Interface_reset.json")


    #Lane Reset with Lane_Configurator
    await tb.masters[0].init_run("stimuli/axi/Lane_reset.json")

    #Wait end of phy reset
    tb.logger.info("sim_time %d ns: Wait PHY reset completion", get_sim_time(units = 'ns') )
    await RisingEdge(tb.dut.spacefibre_instance.gen_inst_phy_plus_lane.inst_phy_plus_lane.RST_TX_DONE)
    tb.logger.info("sim_time %d ns: Reset PHY completed", get_sim_time(units = 'ns') )

    #Wait to go to Disabled
    await Timer(2, units = "us")

    #Enable LaneStart and wait to be in Started state
    Data_read_lane_config_parameters.data = bytearray([0x01, 0x00, 0x00, 0x00])
    time_out = 0
    await tb.masters[0].write_data(Data_read_lane_config_parameters)
    while not_started==1 and time_out < 10000:
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
        tb.logger.error("simulation time %d ns : Test Failed in initialization_procedure()", get_sim_time(units = "ns"))


async def init_lane(tb):
    #Wait to go to Disabled
    await Timer(2, units = "us")

    #Enable LaneStart and wait to be in Started state
    Data_read_lane_config_parameters.data = bytearray([0x01, 0x00, 0x00, 0x00])
    time_out = 0
    not_started = 1
    await tb.masters[0].write_data(Data_read_lane_config_parameters)
    while not_started==1 and time_out < 10000:
        await tb.masters[0].read_data(Data_read_lane_config_status)
        if format(Data_read_lane_config_status.data[0], '0>8b')[4:8] == STARTED:
            not_started = 0
        time_out += 1
    
    #Set Lane initialisatiion FSM from Started to Active state
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Started_to_Active.dat")

    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/50_IDLE.dat", file_format = 16))

    #Check that Lane initialisation FSM is in Active State
    await tb.masters[0].read_data(Data_read_lane_config_status)

    await stimuli
    if format(Data_read_lane_config_status.data[0], '0>8b')[4:8] != ACTIVE:
        global test_failed 
        test_failed = 1
        tb.logger.error("simulation time %d ns : Test Failed in init_lane()", get_sim_time(units = "ns"))


async def wait_end_test_dl(tb, channel):
    """
    Wait for test end to be raised by the selected analyzer.
    Return the Error counter of the selected analyzer.
    """
    await tb.masters[channel].read_data(Data_lane_ana_status)
    test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]
    timer = 0
    while test_end != '1' and timer < 1000:
        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))
        await tb.masters[channel].read_data(Data_lane_ana_status)
        await stimuli
        timer += 1
        test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]
        tb.logger.debug("simulation time %d ns : Data_lane_ana_status value read : %s", get_sim_time(units = "ns"), format(Data_lane_ana_status.data[0], '0>8b'))
    if timer >=1000:
        tb.logger.error("simulation time %d ns : test timeout", get_sim_time(units = "ns"))
        return "11111111"
    return format(Data_lane_ana_status.data[1], '0>8b')[6:8] + format(Data_lane_ana_status.data[0], '0>8b')[0:6]

async def wait_end_test_all_dl(tb):
    """
    Wait for test end to be raised by all analyzer.
    Return the Error counter of all analyzer as a list.
    """
    result = []
    for channel in range(2, 11):
        x = await wait_end_test_dl(tb, 2*channel)
        result += [x]
    return result

async def wait_end_test_all_vc_dl(tb):
    """
    Wait for test end to be raised by all analyzer.
    Return the Error counter of all analyzer as a list.
    """
    result = []
    for channel in range(2, 10):
        x = await wait_end_test_dl(tb, 2*channel)
        result += [x]
    return result

async def start_all_dl(tb):
    """
    Start test on all data link analyzer and all data link generator.
    """
    action = []
    Data_lane_ana_control.data = bytearray([0x01,0x00,0x00,0x00])
    # Start analyzer
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    for channel in range(2, 11):
        x = cocotb.start_soon(tb.masters[2*channel].write_data(Data_lane_ana_control))
        action += [x]
    await Combine(*action)
    await stimuli

    action = []
    Data_lane_gen_control.data = bytearray([0x01,0x00,0x00,0x00])
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    # Start generator
    for channel in range(2, 11):
        x = cocotb.start_soon(tb.masters[2*channel-1].write_data(Data_lane_gen_control))
        action += [x]
    await Combine(*action)
    await stimuli

async def start_all_vc_dl(tb):
    """
    Start test on all data link analyzer and all data link generator.
    """
    action = []
    Data_lane_ana_control.data = bytearray([0x01,0x00,0x00,0x00])
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    # Start analyzer
    for channel in range(2, 10):
        x = cocotb.start_soon(tb.masters[2*channel].write_data(Data_lane_ana_control))
        action += [x]
    await Combine(*action)
    await stimuli

    action = []
    Data_lane_gen_control.data = bytearray([0x01,0x00,0x00,0x00])
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    # Start generator
    for channel in range(2, 10):
        x = cocotb.start_soon(tb.masters[2*channel-1].write_data(Data_lane_gen_control))
        action += [x]
    await Combine(*action)
    await stimuli

async def configure_all_vc_dl(tb, conf, seed):
    """
    Start test on all data link analyzer and all data link generator.
    """
    action = []
    Data_lane_ana_config.data = bytearray(conf)
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    # configure analyzer
    for channel in range(2, 10):
        x = cocotb.start_soon(tb.masters[2*channel].write_data(Data_lane_ana_config))
        action += [x]
    await Combine(*action)
    await stimuli

    action = []
    Data_lane_gen_config.data = bytearray(conf)
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    # configure generator
    for channel in range(2, 10):
        x = cocotb.start_soon(tb.masters[2*channel-1].write_data(Data_lane_gen_config))
        action += [x]
    await Combine(*action)
    await stimuli

    action = []
    Data_lane_ana_seed.data = bytearray(seed)
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    # configure analyzer seed
    for channel in range(2, 10):
        x = cocotb.start_soon(tb.masters[2*channel].write_data(Data_lane_ana_seed))
        action += [x]
    await Combine(*action)
    await stimuli

    action = []
    Data_lane_gen_seed.data = bytearray(seed)
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    # configure generator seed
    for channel in range(2, 10):
        x = cocotb.start_soon(tb.masters[2*channel-1].write_data(Data_lane_gen_seed))
        action += [x]
    await Combine(*action)
    await stimuli


async def start_gen_vc_dl(tb):
    """
    Start test on all data link analyzer and all data link generator.
    """

    action = []
    Data_lane_gen_control.data = bytearray([0x01, 0x00, 0x00, 0x00])
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    # Start generator
    for channel in range(2, 10):
        x = cocotb.start_soon(tb.masters[2*channel-1].write_data(Data_lane_gen_control))
        action += [x]
    await Combine(*action)
    await stimuli

async def configure_gen_vc_dl(tb, conf, seed):
    """
    Start test on all data link analyzer and all data link generator.
    """
    Data_lane_gen_config.data = bytearray(conf)
    action = []
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    # configure generator
    for channel in range(2, 10):
        x = cocotb.start_soon(tb.masters[2*channel-1].write_data(Data_lane_gen_config))
        action += [x]
    await Combine(*action)
    await stimuli

    action = []
    Data_lane_gen_seed.data = bytearray(seed)
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    # configure generator seed
    for channel in range(2, 10):
        x = cocotb.start_soon(tb.masters[2*channel-1].write_data(Data_lane_gen_seed))
        action += [x]
    await Combine(*action)
    await stimuli

async def start_ana_vc_dl(tb):
    """
    Start test on all data link analyzer and all data link generator.
    """
    action = []
    Data_lane_ana_control.data = bytearray([0x01, 0x00, 0x00, 0x00])
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    # Start generator
    for channel in range(2, 10):
        x = cocotb.start_soon(tb.masters[2*channel].write_data(Data_lane_ana_control))
        action += [x]
    await Combine(*action)
    await stimuli
    

async def configure_ana_vc_dl(tb, conf, seed):
    """
    Start test on all data link analyzer and all data link generator.
    """
    action = []
    Data_lane_ana_config.data = bytearray(conf)
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    # configure generator
    for channel in range(2, 10):
        x = cocotb.start_soon(tb.masters[2*channel].write_data(Data_lane_ana_config))
        action += [x]
    await Combine(*action)
    await stimuli

    action = []
    Data_lane_ana_seed.data = bytearray(seed)
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    # configure generator seed
    for channel in range(2, 10):
        x = cocotb.start_soon(tb.masters[2*channel].write_data(Data_lane_ana_seed))
        action += [x]
    await Combine(*action)
    await stimuli

async def configure_model_dl(tb, model, conf, seed):
    """
    Start test on all data link analyzer and all data link generator.
    """
    # configure generator
    Data_lane_gen_config.data = bytearray(conf)

    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    await tb.masters[model].write_data(Data_lane_gen_config)
    await stimuli


    # configure generator seed
    Data_lane_gen_seed.data = bytearray(seed)

    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    await tb.masters[model].write_data(Data_lane_gen_seed)
    await stimuli

async def start_model_dl(tb, model):
    """
    Start test on all data link analyzer and all data link generator.
    """
    Data_lane_gen_control.data = bytearray([0x01,0x00,0x00,0x00])
    # Start model
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    await tb.masters[model].write_data(Data_lane_gen_control)
    await stimuli


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

async def send_FCT(tb, vc, value, seq_num):
    """
    Send an FCT control word to the RX port of the SpaceFibreLight IP
    """
    await tb.spacefibre_driver.write_to_Rx("01111100", delay = 0, k_encoding = 1)
    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8("01111100")
    await tb.spacefibre_driver.write_to_Rx(f"{(value):0>3b}" + f"{(vc):0>5b}", delay = 0, k_encoding = 1)
    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{(value):0>3b}" + f"{(vc):0>5b}", crc_8)
    await tb.spacefibre_driver.write_to_Rx(seq_num, delay = 0, k_encoding = 1)
    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(seq_num , crc_8)
    await tb.spacefibre_driver.write_to_Rx(crc_8, delay = 0, k_encoding = 1)

async def get_resetflag(tb, resetflag_farend, monitor_path):
    """
    Procedure to get the current resetflag of the SpaceFibre Light IP
    """
    await Timer(2, units = "us")
    

    #Enable LaneStart and wait to be in Started state
    Data_read_lane_config_parameters.data = bytearray([0x01, 0x00, 0x00, 0x00])
    time_out = 0
    not_started = 1
    await tb.masters[0].write_data(Data_read_lane_config_parameters)
    while not_started==1 and time_out < 10000:
        await tb.masters[0].read_data(Data_read_lane_config_status)
        if format(Data_read_lane_config_status.data[0], '0>8b')[4:8] == STARTED:
            not_started = 0
        time_out += 1

    monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file(monitor_path, number_of_word = 10000))
    tb.spacefibre_random_generator_data_link.disable_disparity_control = 1

    
    #Set Lane initialisatiion FSM from Started to Active state
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Started_to_Connected.dat")
    while format(Data_read_lane_config_status.data[0], '0>8b')[4:8] != ACTIVE:
        await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/20_DEADBEEF.dat")
        await send_init3(tb, resetflag_farend)
        await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/20_DEADBEEF.dat")
        cocotb.start_soon(tb.masters[0].read_data(Data_read_lane_config_status))
        await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/20_DEADBEEF.dat")

    # result = await First(monitor, stimuli)
    monitor.cancel()

    await send_idle_ctrl_word(tb, 1)

    await monitor
    
    tb.spacefibre_random_generator_data_link.disable_disparity_control = 0

    resetflag_nearend = extract_last_init3(tb, monitor_path + "_hexa.dat")

    return resetflag_nearend


def extract_last_init3(tb, monitor_path):
    """
    Get the value of the link reset flag in the last INIT3 control word of the monitor file located at "monitor_path"
    """
    assert os.path.exists(monitor_path), "Source file doesn't exist"
    
    tb.logger.info("sim_time %d ns: Source file %s to check does exist, open in read mode", get_sim_time(units = "ns"), monitor_path)
    file = open(monitor_path, "r")

    link_reset_flag = None
    file_size = 0
    for line in file:
        file_size += 1
        input_splitted = line.split(';')
        if input_splitted[-1] == "\n":
            input_splitted.remove("\n")
        elif '\n' in input_splitted[-1]:
            input_splitted[-1] = input_splitted[-1].replace("\n", "")
        
        if input_splitted[0][2:8] == "38CEBC" and input_splitted[1] == "0001":
            link_reset_flag = f"{(int(input_splitted[0][0:2], 16)):0>8b}"[7]
    file.close()
    tb.logger.info("sim_time %d ns: Source file %s size is %d", get_sim_time(units = "ns"), monitor_path, file_size)

    return link_reset_flag



async def send_init3(tb, resetflag_farend):
    """
    Send an INIT3 control word with the CAPABILITY_RESET_FLAG set to resetflag_farend
    """
    await tb.spacefibre_driver.write_to_Rx("10111100", 0, k_encoding = 1)
    await tb.spacefibre_driver.write_to_Rx("11001110", 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("00111000", 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("0000001"+str(resetflag_farend), 0, k_encoding = 0)

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

async def send_FCT(tb, vc, value, seq_num):
    """
    Send an FCT control word to the RX port of the SpaceFibreLight IP
    """
    await tb.spacefibre_driver.write_to_Rx("11111100", delay = 0, k_encoding = 1)
    await tb.spacefibre_driver.write_to_Rx("11001110", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)

    await tb.spacefibre_driver.write_to_Rx("11111100", delay = 0, k_encoding = 1)
    await tb.spacefibre_driver.write_to_Rx("11001110", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)

    await tb.spacefibre_driver.write_to_Rx("01111100", delay = 0, k_encoding = 1)
    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8("01111100")
    await tb.spacefibre_driver.write_to_Rx(f"{(value):0>3b}" + f"{(vc):0>5b}", delay = 0, k_encoding = 0)
    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{(value):0>3b}" + f"{(vc):0>5b}", crc_8)
    await tb.spacefibre_driver.write_to_Rx(seq_num, delay = 0, k_encoding = 0)
    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(seq_num , crc_8)
    crc_8 = tb.spacefibre_random_generator_data_link.invert_string(crc_8)
    await tb.spacefibre_driver.write_to_Rx(crc_8, delay = 0, k_encoding = 0)


async def send_ACK(tb, seq_num):
    """
    Send an ACK control word to the RX port of the SpaceFibreLight IP
    """
    await tb.spacefibre_driver.write_to_Rx("11111100", delay = 0, k_encoding = 1)
    await tb.spacefibre_driver.write_to_Rx("11001110", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)

    await tb.spacefibre_driver.write_to_Rx("11111100", delay = 0, k_encoding = 1)
    await tb.spacefibre_driver.write_to_Rx("11001110", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)

    await tb.spacefibre_driver.write_to_Rx("11111100", delay = 0, k_encoding = 1)
    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8("11111100")
    await tb.spacefibre_driver.write_to_Rx("10100010", delay = 0, k_encoding = 0)
    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8("10100010", crc_8)
    await tb.spacefibre_driver.write_to_Rx(seq_num, delay = 0, k_encoding = 0)
    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(seq_num , crc_8)
    crc_8 = tb.spacefibre_random_generator_data_link.invert_string(crc_8)
    await tb.spacefibre_driver.write_to_Rx(crc_8, delay = 0, k_encoding = 0)

async def send_NACK(tb, seq_num):
    """
    Send an NACK control word to the RX port of the SpaceFibreLight IP
    """
    await tb.spacefibre_driver.write_to_Rx("11111100", delay = 0, k_encoding = 1)
    await tb.spacefibre_driver.write_to_Rx("11001110", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)

    await tb.spacefibre_driver.write_to_Rx("11111100", delay = 0, k_encoding = 1)
    await tb.spacefibre_driver.write_to_Rx("11001110", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)

    await tb.spacefibre_driver.write_to_Rx("11111100", delay = 0, k_encoding = 1)
    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8("11111100")
    await tb.spacefibre_driver.write_to_Rx("10111011", delay = 0, k_encoding = 0)
    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8("10111011", crc_8)
    await tb.spacefibre_driver.write_to_Rx(seq_num, delay = 0, k_encoding = 0)
    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(seq_num , crc_8)
    crc_8 = tb.spacefibre_random_generator_data_link.invert_string(crc_8)
    await tb.spacefibre_driver.write_to_Rx(crc_8, delay = 0, k_encoding = 0)

async def send_full(tb, seq_num):
    """
    Send an FULL control word to the RX port of the SpaceFibreLight IP
    """
    await tb.spacefibre_driver.write_to_Rx("11111100", delay = 0, k_encoding = 1)
    await tb.spacefibre_driver.write_to_Rx("11001110", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)

    await tb.spacefibre_driver.write_to_Rx("11111100", delay = 0, k_encoding = 1)
    await tb.spacefibre_driver.write_to_Rx("11001110", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)

    await tb.spacefibre_driver.write_to_Rx("11111100", delay = 0, k_encoding = 1)
    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8("11111100")
    await tb.spacefibre_driver.write_to_Rx("01101111", delay = 0, k_encoding = 0)
    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8("01101111", crc_8)
    await tb.spacefibre_driver.write_to_Rx(seq_num, delay = 0, k_encoding = 0)
    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(seq_num , crc_8)
    crc_8 = tb.spacefibre_random_generator_data_link.invert_string(crc_8)
    await tb.spacefibre_driver.write_to_Rx(crc_8, delay = 0, k_encoding = 0)

async def send_retry(tb):
    """
    Send an RETRY control word to the RX port of the SpaceFibreLight IP
    """
    await tb.spacefibre_driver.write_to_Rx("11111100", delay = 0, k_encoding = 1)
    await tb.spacefibre_driver.write_to_Rx("11001110", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)

    await tb.spacefibre_driver.write_to_Rx("11111100", delay = 0, k_encoding = 1)
    await tb.spacefibre_driver.write_to_Rx("11001110", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)

    await tb.spacefibre_driver.write_to_Rx("11111100", delay = 0, k_encoding = 1)
    await tb.spacefibre_driver.write_to_Rx("11001110", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)

    await tb.spacefibre_driver.write_to_Rx("11111100", delay = 0, k_encoding = 1)
    await tb.spacefibre_driver.write_to_Rx("11001110", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)

    await tb.spacefibre_driver.write_to_Rx("11111100", delay = 0, k_encoding = 1)
    await tb.spacefibre_driver.write_to_Rx("11001110", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)

    await tb.spacefibre_driver.write_to_Rx("11111100", delay = 0, k_encoding = 1)
    await tb.spacefibre_driver.write_to_Rx("11001110", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)

    await tb.spacefibre_driver.write_to_Rx("11111100", delay = 0, k_encoding = 1)
    await tb.spacefibre_driver.write_to_Rx("11001110", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)

    await tb.spacefibre_driver.write_to_Rx("11111100", delay = 0, k_encoding = 1)
    await tb.spacefibre_driver.write_to_Rx("11001110", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("11001111", delay = 0, k_encoding = 0)

    await tb.spacefibre_driver.write_to_Rx("11111100", delay = 0, k_encoding = 1)
    await tb.spacefibre_driver.write_to_Rx("10000111", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("00000000", delay = 0, k_encoding = 0)
    await tb.spacefibre_driver.write_to_Rx("00000000", delay = 0, k_encoding = 0)

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
    await tb.reset()

    #Specific variable for the scenario
    global test_failed 


    ##########################################################################
    ##########################################################################
    ##########################################################################
    #############          Step 1: Check link reset FSM          #############
    ##########################################################################
    ##########################################################################
    ##########################################################################


    step_1_failed = 0
    #Sets DUT lane initialisation FSM to Active

    fct_monitor = cocotb.start_soon(tb.spacefibre_random_generator_data_link.monitor_FCT(30000))

    monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_1", number_of_word = 2500))
    
    
    await tb.reset_DUT()

    #Check Link Reset has been asserted

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_parameters)
    link_rst_asserted = format(Data_read_dl_config_parameters.data[0], '0>8b')[5]

    if link_rst_asserted != '1':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.1 result: Failed\nlink_rst_asserted: %s\n\n\n", get_sim_time(units = "ns"), link_rst_asserted)
    else:
        tb.logger.info("simulation time %d ns : step 1.1 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    Data_read_dl_config_parameters.data = bytearray([0x18, 0x00, 0x00, 0x00])

    await tb.masters[0].write_data(Data_read_dl_config_parameters)
    await stimuli




    LinkResetFlag = await get_resetflag(tb, 0, "reference/spacefibre_serial/monitor_step_1_1")

    #Check in monitor for last init3 ResetFlag = 1
    if LinkResetFlag == None:
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.2 result: Failed, no Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    elif LinkResetFlag != '1':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.2 result: Failed, wrong Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.2 result: Pass\n\n\n\n", get_sim_time(units = "ns"))



    #LaneReset with Lane_Configurator
    await tb.masters[0].init_run("stimuli/axi/Lane_reset.json")

    #Wait end of phy reset
    tb.logger.info("sim_time %d ns: Wait PHY reset completion", get_sim_time(units = 'ns') )
    await RisingEdge(tb.dut.spacefibre_instance.gen_inst_phy_plus_lane.inst_phy_plus_lane.RST_TX_DONE)
    tb.logger.info("sim_time %d ns: Reset PHY completed", get_sim_time(units = 'ns') )


    LinkResetFlag = await get_resetflag(tb, 1, "reference/spacefibre_serial/monitor_step_1_2")

    #Check in monitor for last init3 ResetFlag = 1

    if LinkResetFlag == None:
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.3 result: Failed, no Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    elif LinkResetFlag != '1':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.3 result: Failed, wrong Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.3 result: Pass\n\n\n\n", get_sim_time(units = "ns"))



    #LaneReset with Lane_Configurator
    await tb.masters[0].init_run("stimuli/axi/Lane_reset.json")

    #Wait end of phy reset
    tb.logger.info("sim_time %d ns: Wait PHY reset completion", get_sim_time(units = 'ns') )
    await RisingEdge(tb.dut.spacefibre_instance.gen_inst_phy_plus_lane.inst_phy_plus_lane.RST_TX_DONE)
    tb.logger.info("sim_time %d ns: Reset PHY completed", get_sim_time(units = 'ns') )



    LinkResetFlag = await get_resetflag(tb, 0, "reference/spacefibre_serial/monitor_step_1_3")

    #Check in monitor for last init3 ResetFlag = 0

    if LinkResetFlag == None:
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.4 result: Failed, no Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    elif LinkResetFlag != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.4 result: Failed, wrong Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.4 result: Pass\n\n\n\n", get_sim_time(units = "ns"))



    #InterfaceReset with Lane_Configurator
    await tb.masters[0].init_run("stimuli/axi/Interface_reset.json")

    #Wait end of phy reset
    tb.logger.info("sim_time %d ns: Wait PHY reset completion", get_sim_time(units = 'ns') )
    await RisingEdge(tb.dut.spacefibre_instance.gen_inst_phy_plus_lane.inst_phy_plus_lane.RST_TX_DONE)
    tb.logger.info("sim_time %d ns: Reset PHY completed", get_sim_time(units = 'ns') )

    #Check Link Reset has been asserted

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_parameters)
    link_rst_asserted = format(Data_read_dl_config_parameters.data[0], '0>8b')[5]

    if link_rst_asserted != '1':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.5 result: Failed\nlink_rst_asserted: %s\n\n\n", get_sim_time(units = "ns"), link_rst_asserted)
    else:
        tb.logger.info("simulation time %d ns : step 1.5 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    Data_read_dl_config_parameters.data = bytearray([0x18, 0x00, 0x00, 0x00])

    await tb.masters[0].write_data(Data_read_dl_config_parameters)
    await stimuli




    LinkResetFlag = await get_resetflag(tb, 1, "reference/spacefibre_serial/monitor_step_1_4")

    #Check in monitor for last init3 ResetFlag = 1

    if LinkResetFlag == None:
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.6 result: Failed, no Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    elif LinkResetFlag != '1':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.6 result: Failed, wrong Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.6 result: Pass\n\n\n\n", get_sim_time(units = "ns"))



    #LaneReset with Lane_Configurator
    await tb.masters[0].init_run("stimuli/axi/Lane_reset.json")

    #Wait end of phy reset
    tb.logger.info("sim_time %d ns: Wait PHY reset completion", get_sim_time(units = 'ns') )
    await RisingEdge(tb.dut.spacefibre_instance.gen_inst_phy_plus_lane.inst_phy_plus_lane.RST_TX_DONE)
    tb.logger.info("sim_time %d ns: Reset PHY completed", get_sim_time(units = 'ns') )

    LinkResetFlag = await get_resetflag(tb, 0, "reference/spacefibre_serial/monitor_step_1_5")

    #Check in monitor for last init3 ResetFlag = 0


    if LinkResetFlag == None:
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.8 result: Failed, no Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    elif LinkResetFlag != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.8 result: Failed, wrong Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.8 result: Pass\n\n\n\n", get_sim_time(units = "ns"))



    #LaneReset with Lane_Configurator
    await tb.masters[0].init_run("stimuli/axi/Lane_reset.json")

    #Wait end of phy reset
    tb.logger.info("sim_time %d ns: Wait PHY reset completion", get_sim_time(units = 'ns') )
    await RisingEdge(tb.dut.spacefibre_instance.gen_inst_phy_plus_lane.inst_phy_plus_lane.RST_TX_DONE)
    tb.logger.info("sim_time %d ns: Reset PHY completed", get_sim_time(units = 'ns') )

    LinkResetFlag = await get_resetflag(tb, 1, "reference/spacefibre_serial/monitor_step_1_6")

    #Check in monitor for last init3 ResetFlag = 0

    if LinkResetFlag == None:
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.9 result: Failed, no Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    elif LinkResetFlag != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.9 result: Failed, wrong Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.9 result: Pass\n\n\n\n", get_sim_time(units = "ns"))



    #Check Link Reset has been asserted

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 5))

    await tb.masters[0].read_data(Data_read_dl_config_parameters)
    link_rst_asserted = format(Data_read_dl_config_parameters.data[0], '0>8b')[5]

    if link_rst_asserted != '1':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.10 result: Failed\nlink_rst_asserted: %s\n\n\n", get_sim_time(units = "ns"), link_rst_asserted)
    else:
        tb.logger.info("simulation time %d ns : step 1.10 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    Data_read_dl_config_parameters.data = bytearray([0x18, 0x00, 0x00, 0x00])

    await tb.masters[0].write_data(Data_read_dl_config_parameters)
    await stimuli

    #Wait end of phy reset
    tb.logger.info("sim_time %d ns: Wait PHY reset completion", get_sim_time(units = 'ns') )
    await RisingEdge(tb.dut.spacefibre_instance.gen_inst_phy_plus_lane.inst_phy_plus_lane.RST_TX_DONE)
    tb.logger.info("sim_time %d ns: Reset PHY completed", get_sim_time(units = 'ns') )


    LinkResetFlag = await get_resetflag(tb, 0, "reference/spacefibre_serial/monitor_step_1_7")

    #Check in monitor for last init3 ResetFlag = 1

    if LinkResetFlag == None:
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.11 result: Failed, no Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    elif LinkResetFlag != '1':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.11 result: Failed, wrong Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.11 result: Pass\n\n\n\n", get_sim_time(units = "ns"))




    #LaneReset with Lane_Configurator
    await tb.masters[0].init_run("stimuli/axi/Lane_reset.json")

    #Wait end of phy reset
    tb.logger.info("sim_time %d ns: Wait PHY reset completion", get_sim_time(units = 'ns') )
    await RisingEdge(tb.dut.spacefibre_instance.gen_inst_phy_plus_lane.inst_phy_plus_lane.RST_TX_DONE)
    tb.logger.info("sim_time %d ns: Reset PHY completed", get_sim_time(units = 'ns') )

    LinkResetFlag = await get_resetflag(tb, 1, "reference/spacefibre_serial/monitor_step_1_8")

    #Check in monitor for last init3 ResetFlag = 1

    if LinkResetFlag == None:
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.12 result: Failed, no Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    elif LinkResetFlag != '1':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.12 result: Failed, wrong Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.12 result: Pass\n\n\n\n", get_sim_time(units = "ns"))




    #LaneReset with Lane_Configurator
    await tb.masters[0].init_run("stimuli/axi/Lane_reset.json")

    #Wait end of phy reset
    tb.logger.info("sim_time %d ns: Wait PHY reset completion", get_sim_time(units = 'ns') )
    await RisingEdge(tb.dut.spacefibre_instance.gen_inst_phy_plus_lane.inst_phy_plus_lane.RST_TX_DONE)
    tb.logger.info("sim_time %d ns: Reset PHY completed", get_sim_time(units = 'ns') )

    LinkResetFlag = await get_resetflag(tb, 0, "reference/spacefibre_serial/monitor_step_1_9")

    #Check in monitor for last init3 ResetFlag = 0

    if LinkResetFlag == None:
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.13 result: Failed, no Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    elif LinkResetFlag != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.13 result: Failed, wrong Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.13 result: Pass\n\n\n\n", get_sim_time(units = "ns"))




    #LinkReset with Lane_Configurator
    await tb.masters[0].init_run("stimuli/axi/Link_reset.json")

    #Wait end of phy reset
    tb.logger.info("sim_time %d ns: Wait PHY reset completion", get_sim_time(units = 'ns') )
    await RisingEdge(tb.dut.spacefibre_instance.gen_inst_phy_plus_lane.inst_phy_plus_lane.RST_TX_DONE)
    tb.logger.info("sim_time %d ns: Reset PHY completed", get_sim_time(units = 'ns') )

    #Check Link Reset has been asserted

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_parameters)
    link_rst_asserted = format(Data_read_dl_config_parameters.data[0], '0>8b')[5]

    if link_rst_asserted != '1':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.14 result: Failed\nlink_rst_asserted: %s\n\n\n", get_sim_time(units = "ns"), link_rst_asserted)
    else:
        tb.logger.info("simulation time %d ns : step 1.14 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    Data_read_dl_config_parameters.data = bytearray([0x18, 0x00, 0x00, 0x00])

    await tb.masters[0].write_data(Data_read_dl_config_parameters)
    await stimuli





    LinkResetFlag = await get_resetflag(tb, 0, "reference/spacefibre_serial/monitor_step_1_10")

    #Check in monitor for last init3 ResetFlag = 1

    if LinkResetFlag == None:
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.15 result: Failed, no Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    elif LinkResetFlag != '1':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.15 result: Failed, wrong Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.15 result: Pass\n\n\n\n", get_sim_time(units = "ns"))






    #LaneReset with Lane_Configurator
    await tb.masters[0].init_run("stimuli/axi/Lane_reset.json")

    #Wait end of phy reset
    tb.logger.info("sim_time %d ns: Wait PHY reset completion", get_sim_time(units = 'ns') )
    await RisingEdge(tb.dut.spacefibre_instance.gen_inst_phy_plus_lane.inst_phy_plus_lane.RST_TX_DONE)
    tb.logger.info("sim_time %d ns: Reset PHY completed", get_sim_time(units = 'ns') )

    LinkResetFlag = await get_resetflag(tb, 1, "reference/spacefibre_serial/monitor_step_1_11")

    #Check in monitor for last init3 ResetFlag = 1

    if LinkResetFlag == None:
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.16 result: Failed, no Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    elif LinkResetFlag != '1':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.16 result: Failed, wrong Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.16 result: Pass\n\n\n\n", get_sim_time(units = "ns"))





    #LaneReset with Lane_Configurator
    await tb.masters[0].init_run("stimuli/axi/Lane_reset.json")

    #Wait end of phy reset
    tb.logger.info("sim_time %d ns: Wait PHY reset completion", get_sim_time(units = 'ns') )
    await RisingEdge(tb.dut.spacefibre_instance.gen_inst_phy_plus_lane.inst_phy_plus_lane.RST_TX_DONE)
    tb.logger.info("sim_time %d ns: Reset PHY completed", get_sim_time(units = 'ns') )

    LinkResetFlag = await get_resetflag(tb, 0, "reference/spacefibre_serial/monitor_step_1_12")

    #Check in monitor for last init3 ResetFlag = 0

    if LinkResetFlag == None:
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.17 result: Failed, no Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    elif LinkResetFlag != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.17 result: Failed, wrong Link Reset Flag detected\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.17 result: Pass\n\n\n\n", get_sim_time(units = "ns"))




    await send_idle_ctrl_word(tb, 300)

    await fct_monitor

    tb.spacefibre_random_generator_data_link.fct_counter = [0]*8

    if step_1_failed == 0:
        tb.logger.info("simulation time %d ns : step 1 result: Pass")
    else:
        test_failed = 1
        tb.logger.error("simulation time %d ns : step 1 result: Failed")


    ##########################################################################
    ##########################################################################
    ##########################################################################
    #############       Step 2: Check link reset procedure       #############
    ##########################################################################
    ##########################################################################
    ##########################################################################

    step_2_failed = 0
    #Sets DUT lane initialisation FSM to Active

    fct_monitor = cocotb.start_soon(tb.spacefibre_random_generator_data_link.monitor_FCT(30000))

    monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_2", number_of_word = 20000))
    
    await initialization_procedure(tb)

    #Check FCT request and reset

    #Check that idle frame  PRBS start at 0xFFFF

    await configure_gen_vc_dl(tb, [0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])

    await start_gen_vc_dl(tb)

    #Check that idle frame are sent

    #Send first FCT to each virtual channel
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+1):0>7b}")
        
    #Check that the data frame are received

    await send_idle_ctrl_word(tb, 64*8+100)

    tb.logger.info("simulation time %d ns : input 1\n\n", get_sim_time(units = "ns"))


    #Send first FCT to each virtual channel
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+9):0>7b}")
    
    await configure_gen_vc_dl(tb, [0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x01])
    
    await start_gen_vc_dl(tb)

    #Check that the data frame are received

    await send_idle_ctrl_word(tb, 64*8+100)

    tb.logger.info("simulation time %d ns : input 2\n\n", get_sim_time(units = "ns"))

    #Send first FCT to each virtual channel
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+17):0>7b}")
    
    await configure_gen_vc_dl(tb, [0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x01])
    
    await configure_model_dl(tb, 4, [0xE1,0x1F,0x00,0x01], [0x2A,0x00,0x00,0x00])
    await start_model_dl(tb, 4)

    await start_gen_vc_dl(tb)


    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/step_2_1_" + str(0), 255, 1, 64, 0, 0, 24, delay = 0, invert_polarity = 0, seed = 42)


    #Check that the data frame are received



    result = await wait_end_test_dl(tb, 4)

    if result != "00000000":
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.1 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 2.1 result: Pass\n\n\n\n", get_sim_time(units = "ns"))



    tb.logger.info("simulation time %d ns : input 3\n\n", get_sim_time(units = "ns"))


    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 100))


    #LinkReset with Lane_Configurator
    await tb.masters[0].init_run("stimuli/axi/Link_reset.json")



    #Wait end of phy reset
    tb.logger.info("sim_time %d ns: Wait PHY reset completion", get_sim_time(units = 'ns') )
    await RisingEdge(tb.dut.spacefibre_instance.gen_inst_phy_plus_lane.inst_phy_plus_lane.RST_TX_DONE)
    tb.logger.info("sim_time %d ns: Reset PHY completed", get_sim_time(units = 'ns') )

    await stimuli
    
    await init_lane(tb)



    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_parameters)
    link_rst_asserted = format(Data_read_dl_config_parameters.data[0], '0>8b')[5]

    if link_rst_asserted != '1':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 2.2 result: Failed\nlink_rst_asserted: %s\n\n\n", get_sim_time(units = "ns"), link_rst_asserted)
    else:
        tb.logger.info("simulation time %d ns : step 2.2 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    Data_read_dl_config_parameters.data = bytearray([0x18, 0x00, 0x00, 0x00])

    await tb.masters[0].write_data(Data_read_dl_config_parameters)
    await stimuli

    tb.logger.info("simulation time %d ns : input 4\n\n", get_sim_time(units = "ns"))



    #Check EEP reception, #check EEP on input buffer 0

    #Check FCT request and reset

    #Check that idle frame  PRBS start at 0xFFFF

    await configure_gen_vc_dl(tb, [0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])

    await start_gen_vc_dl(tb)

    #Check that idle frame are sent

    #Send first FCT to each virtual channel
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+1):0>7b}")
        
    #Check that the data frame are received

    await send_idle_ctrl_word(tb, 64*8+100)

    tb.logger.info("simulation time %d ns : input 5\n\n", get_sim_time(units = "ns"))

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 100))

    #InterfaceReset with Lane_Configurator
    await tb.masters[0].init_run("stimuli/axi/Interface_reset.json")



    #Wait end of phy reset
    tb.logger.info("sim_time %d ns: Wait PHY reset completion", get_sim_time(units = 'ns') )
    await RisingEdge(tb.dut.spacefibre_instance.gen_inst_phy_plus_lane.inst_phy_plus_lane.RST_TX_DONE)
    tb.logger.info("sim_time %d ns: Reset PHY completed", get_sim_time(units = 'ns') )

    await stimuli

    await init_lane(tb)
    
    
    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_parameters)
    link_rst_asserted = format(Data_read_dl_config_parameters.data[0], '0>8b')[5]

    if link_rst_asserted != '1':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 2.3 result: Failed\nlink_rst_asserted: %s\n\n\n", get_sim_time(units = "ns"), link_rst_asserted)
    else:
        tb.logger.info("simulation time %d ns : step 2.3 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    Data_read_dl_config_parameters.data = bytearray([0x18, 0x00, 0x00, 0x00])

    await tb.masters[0].write_data(Data_read_dl_config_parameters)
    await stimuli


    tb.logger.info("simulation time %d ns : input 6\n\n", get_sim_time(units = "ns"))

    #Check EEP reception, #check EEP on input buffer 0

    #Check FCT request and reset

    #Check that idle frame  PRBS start at 0xFFFF

    await configure_gen_vc_dl(tb, [0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])

    await start_gen_vc_dl(tb)

    #Check that idle frame are sent

    #Send first FCT to each virtual channel
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+1):0>7b}")
        
    #Check that the data frame are received

    await send_idle_ctrl_word(tb, 64*8+100)


    tb.logger.info("simulation time %d ns : input 7\n\n", get_sim_time(units = "ns"))

    #Send NACK
    await send_NACK(tb, "0" + f"{(9):0>7b}")


    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 100))

    #Check That Link Reset has been asserted

    tb.logger.info("simulation time %d ns : input 8\n\n", get_sim_time(units = "ns"))


    #Wait end of phy reset
    tb.logger.info("sim_time %d ns: Wait PHY reset completion", get_sim_time(units = 'ns') )
    await RisingEdge(tb.dut.spacefibre_instance.gen_inst_phy_plus_lane.inst_phy_plus_lane.RST_TX_DONE)
    tb.logger.info("sim_time %d ns: Reset PHY completed", get_sim_time(units = 'ns') )

    await stimuli

    await init_lane(tb)


    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_parameters)
    link_rst_asserted = format(Data_read_dl_config_parameters.data[0], '0>8b')[5]

    if link_rst_asserted != '1':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 2.4 result: Failed\nlink_rst_asserted: %s\n\n\n", get_sim_time(units = "ns"), link_rst_asserted)
    else:
        tb.logger.info("simulation time %d ns : step 2.4 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    Data_read_dl_config_parameters.data = bytearray([0x18, 0x00, 0x00, 0x00])

    await tb.masters[0].write_data(Data_read_dl_config_parameters)
    await stimuli

    tb.logger.info("simulation time %d ns : input 9\n\n", get_sim_time(units = "ns"))

    #Check EEP reception, #check EEP on input buffer 0

    #Check FCT request and reset

    #Check that idle frame  PRBS start at 0xFFFF


    await configure_gen_vc_dl(tb, [0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])

    await start_gen_vc_dl(tb)

    #Check that idle frame are sent

    #Send first FCT to each virtual channel
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+1):0>7b}")
        
    #Check that the data frame are received

    await send_idle_ctrl_word(tb, 64*8+400)

    tb.logger.info("simulation time %d ns : input 10\n\n", get_sim_time(units = "ns"))


    await fct_monitor

    await monitor





    #writting the monitors loggers
    tb.write_monitor_data()

    #print results of test
    tb.logger.info("\n\nsimulation time %d ns : TEST RESULTS :",get_sim_time(units="ns"))
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
