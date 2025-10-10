##########################################################################
## COMPANY       : CNES
##########################################################################
## TITLE         : data_link_reception.py
## PROJECT       : SPACE FIBRE LIGHT
##########################################################################
## AUTHOR        : Thomas FAVRE-FELIX
## CREATED       : 16/03/2025
##########################################################################
## DESCRIPTION   : Runs tests for verification of the SpaceFibre_Light IP
##                 reception chain processes of the data link layer
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

async def lane_initialization(tb):
    """
    Perform the initialization needed to be performed to initialize the lane.
    """
    not_started=1

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
    await send_idle_ctrl_word(tb, 20)
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/50_IDLE.dat", file_format = 16))

    #Check that Lane initialisatiion FSM is in Active State
    await tb.masters[0].read_data(Data_read_lane_config_status)

    await stimuli
    if format(Data_read_lane_config_status.data[0], '0>8b')[4:8] != ACTIVE:
        tb.logger.error("sim_time %d ns: lane initialization failed, status: %s ", get_sim_time(units = 'ns'), format(Data_read_lane_config_status.data[0], '0>8b')[4:8])
        global test_failed 
        test_failed = 1

async def initialization_procedure(tb, monitor_path):
    """
    Perform the initialization needed to be performed before each step of the scenario.
    """
    not_started=1
    
    #Reset of the DUT
    await tb.reset_DUT()

    #LaneReset with Lane_Configurator
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
    
    monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file(monitor_path, number_of_word = 2274))
    
    #Set Lane initialisatiion FSM from Started to Active state
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Started_to_Active.dat")
    await send_idle_ctrl_word(tb, 20)
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/50_IDLE.dat", file_format = 16))

    #Check that Lane initialisatiion FSM is in Active State
    await tb.masters[0].read_data(Data_read_lane_config_status)

    await monitor

    await stimuli
    if format(Data_read_lane_config_status.data[0], '0>8b')[4:8] != ACTIVE:
        tb.logger.error("sim_time %d ns: lane initialization failed, status : %s", get_sim_time(units = 'ns'), format(Data_read_lane_config_status.data[0], '0>8b')[4:8] )
        global test_failed 
        test_failed = 1

async def wait_end_test_dl(tb, channel):
    """
    Wait for test end to be raised by the selected analyzer.
    Return the Error counter of the selected analyzer.
    """
    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 20))
    await tb.masters[channel].read_data(Data_lane_ana_status)
    await stimuli
    test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]
    timer = 0
    while test_end != '1' and timer < 1000:
        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 20))
        await tb.masters[channel].read_data(Data_lane_ana_status)
        await stimuli
        timer += 1
        test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]
        tb.logger.debug("simulation time %d ns : Data_lane_ana_status value read : %s", get_sim_time(units = "ns"), format(Data_lane_ana_status.data[0], '0>8b'))
    if timer >=1000:
        if channel != 20:
            tb.logger.error("\nsimulation time %d ns : test timeout\nFCT_counter model channel %d: %d", get_sim_time(units = "ns"), channel/2-2, tb.spacefibre_random_generator_data_link.fct_counter[int(channel/2-2)])
        else:
            tb.logger.error("\nsimulation time %d ns : test timeout\n", get_sim_time(units = "ns"))
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
    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))
    # configure generator
    for channel in range(2, 10):
        x = cocotb.start_soon(tb.masters[2*channel].write_data(Data_lane_ana_config))
        action += [x]
    await Combine(*action)
    await stimuli

    action = []
    Data_lane_ana_seed.data = bytearray(seed)
    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))
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

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))
    await tb.masters[model].write_data(Data_lane_gen_config)
    await stimuli


    # configure generator seed
    Data_lane_gen_seed.data = bytearray(seed)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))
    await tb.masters[model].write_data(Data_lane_gen_seed)
    await stimuli

async def start_model_dl(tb, model):
    """
    Start test on all data link analyzer and all data link generator.
    """
    Data_lane_gen_control.data = bytearray([0x01,0x00,0x00,0x00])
    # Start model
    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))
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
    # step 1: Check Reception of Frame and Control Words Identification FSM  #
    ##########################################################################
    ##########################################################################
    ##########################################################################


    step_1_failed = 0
    #Sets DUT lane initialisation FSM to Active
    
    fct_monitor = cocotb.start_soon(tb.spacefibre_random_generator_data_link.monitor_FCT(25000))

    await initialization_procedure(tb, "reference/spacefibre_serial/monitor_step_1")

    monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_1", number_of_word = 20+66*8+23))


    seq = 0

    #Send first FCT to each virtual channel
    for x in range(8):
        seq += 1
        await send_FCT(tb, x, 0, "0"+ f"{(seq):0>7b}")
    
    

    # Send 1 frame of 1 packet of 64 word to each virtual channel


    await configure_ana_vc_dl(tb, [0xE1,0x1F,0x00,0x01], [0x2A,0x00,0x00,0x00])

    await start_ana_vc_dl(tb)
    

    for x in range (8):
        await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_1_" + str(x), 255, 1, 64, 0, x, seq)
        seq += 1

    


    results = await wait_end_test_all_vc_dl(tb)

    for result in results:
        if result != "00000000":
            step_1_failed = 1
            tb.logger.error("simulation time %d ns : step 1.1 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
        else:
            tb.logger.info("simulation time %d ns : step 1.1 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    # Send 1 frame of 64 word composed of multiple packets to each virtual channel
    await configure_model_dl(tb, 4, [0x04,0x08,0x00,0x01], [0x00,0x00,0x00,0x05])
    await configure_model_dl(tb, 6, [0x02,0x10,0x00,0x01], [0x00,0x00,0x00,0x07])
    await configure_model_dl(tb, 8, [0x10,0x02,0x00,0x01], [0x00,0x00,0x00,0x09])
    await configure_model_dl(tb, 10, [0x08,0x04,0x00,0x01], [0x00,0x00,0x00,0x11])
    await configure_model_dl(tb, 12, [0x04,0x08,0x00,0x01], [0x00,0x00,0x00,0x13])
    await configure_model_dl(tb, 14, [0x02,0x10,0x00,0x01], [0x00,0x00,0x00,0x15])
    await configure_model_dl(tb, 16, [0x10,0x02,0x00,0x01], [0x00,0x00,0x00,0x17])
    await configure_model_dl(tb, 18, [0x08,0x04,0x00,0x01], [0x00,0x00,0x00,0x03])

    await start_ana_vc_dl(tb)

    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_2_0", 64, 4, 64, 0, 0, seq, seed = 0x05000000)
    seq += 1
    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_2_1", 128, 2, 64, 0, 1, seq, seed = 0x07000000)
    seq += 1
    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_2_2", 16, 16, 64, 0, 2, seq, seed = 0x09000000)
    seq += 1
    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_2_3", 32, 8, 64, 0, 3, seq, seed = 0x11000000)
    seq += 1
    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_2_4", 64, 4, 64, 0, 4, seq, seed = 0x13000000)
    seq += 1
    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_2_5", 128, 2, 64, 0, 5, seq, seed = 0x15000000)
    seq += 1
    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_2_6", 16, 16, 64, 0, 6, seq, seed = 0x17000000)
    seq += 1
    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_2_7", 32, 8, 64, 0, 7, seq, seed = 0x03000000)
    seq += 1



    results = await wait_end_test_all_vc_dl(tb)

    for result in results:
        if result != "00000000":
            step_1_failed = 1
            tb.logger.error("simulation time %d ns : step 1.2 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
        else:
            tb.logger.info("simulation time %d ns : step 1.2 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    # Send an idle frame of 64 word
    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_3_0", 64, 1, 64, 2, 0, seq)


    # Send an idle frame of 31 word
    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_3_0", 31, 1, 64, 2, 0, seq)


    
	# Send a broadcast frame
    await configure_model_dl(tb, 20, [0x01,0x01,0x00,0x00], [0x42,0x00,0x00,0x00])

    await start_model_dl(tb, 20)

    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_3_0", 0x0000004300000042, 1, 0, 1, 0, seq, delay = 0, invert_polarity = 0, seed = 0x42)
    seq = (seq + 1) %128



    result = await wait_end_test_dl(tb, 20)

    if result != "00000000":
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.3 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 1.3 result: Pass\n\n\n\n", get_sim_time(units = "ns"))



	# Start a data frame with 64 words, send a broadcast frame, finish the data frame

    await configure_model_dl(tb, 4, [0xE1,0x1F,0x00,0x00], [0x00,0x10,0x00,0x00])
    await configure_model_dl(tb, 20, [0x01,0x01,0x00,0x00], [0x42,0x00,0x00,0x00])

    await start_model_dl(tb, 4)
    await start_model_dl(tb, 20)

    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Data_frame_with_BC.dat")


    seq = (seq+2)%128

    result = await wait_end_test_dl(tb, 20)

    if result != "00000000":
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.4 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 1.4 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    result = await wait_end_test_dl(tb, 4)

    if result != "00000000":
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.5 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 1.5 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    

    await configure_model_dl(tb, 4, [0xE1,0x1F,0x00,0x01], [0x00,0x20,0x00,0x00])
    await configure_model_dl(tb, 20, [0x01,0x01,0x00,0x00], [0x42,0x00,0x00,0x00])

    await start_model_dl(tb, 4)
    await start_model_dl(tb, 20)

	# Send an EDF, check that no error is detected

    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/EDF.dat")

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))
    
    
    await tb.masters[20].read_data(Data_lane_ana_status)
    test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]
    if test_end == "1":
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.6 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.6 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.6 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.6 result: Pass\n\n\n\n", get_sim_time(units = "ns"))
    
    
    await stimuli

    Data_read_dl_config_parameters.data = bytearray([0x04, 0x00, 0x40, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli



	# Send an EBF, check that no error is detected
	
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/EBF.dat")

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[4].read_data(Data_lane_ana_status)
    test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]
    if test_end == "1":
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.7 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.7 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.8 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.8 result: Pass\n\n\n\n", get_sim_time(units = "ns"))
        
    await stimuli

    Data_read_dl_config_parameters.data = bytearray([0x04, 0x00, 0x40, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli


    # Send an idle frame of 31 words, check that the data are not received on Data_Link_Data_Analyzer models


    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_8_0", 31, 1, 64, 2, 7, seq)


    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[4].read_data(Data_lane_ana_status)
    test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]

    if test_end != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.8.5 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 1.8.5 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli
    
    # Send a data frame, check that the data are received on Data_Link_Data_Analyzer models

    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_9_0", 255, 1, 64, 0, 0, seq, seed = 0x2000)

    seq = (seq+1)%128


    result = await wait_end_test_dl(tb, 4)

    if result != "00000000":
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.8.6 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 1.8.6 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    
    # Send an idle frame of 31 words, check that the data are not received on Data_Link_Data_Analyzer models

    
    # Send an EDF , check that a frame error is detected
    # await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_8_5", 31, 1, 64, 2, 7, seq)

    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/SIF_to_EDF.dat")



    await send_idle_ctrl_word(tb, 1000)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]
    

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '1' or sequence_error != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.9 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.9 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    Data_read_dl_config_parameters.data = bytearray([0x04, 0x00, 0x40, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli


	# Send an idle frame of 31 words, check that the data are not received on Data_Link_Data_Analyzer models
	
    # Send an EBF , check that a frame error is detected
    # await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_8_6", 31, 1, 64, 2, 7, seq)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/SIF_to_EBF.dat")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '1' or sequence_error != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.10 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.10 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    Data_read_dl_config_parameters.data = bytearray([0x04, 0x00, 0x40, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli


    # Send an idle frame of 65 words, check that the data are not received on Data_Link_Data_Analyzer models, check that a frame error is detected
	
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Idle_frame_too_long.dat")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '1' or sequence_error != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.11 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.11 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    Data_read_dl_config_parameters.data = bytearray([0x04, 0x00, 0x40, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli


    # Send a data frame but finish with an EBF, check that the data are not received on Data_Link_Data_Analyzer models, check that a frame error is detected
	
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/SDF_to_EBF.dat")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '1' or sequence_error != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.12 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.12 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    Data_read_dl_config_parameters.data = bytearray([0x04, 0x00, 0x40, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli


    # Start to send a data frame
	# Send a SDF, check that the data are not received on Data_Link_Data_Analyzer models, check that a frame error is detected

    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/SDF_to_SDF.dat")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '1' or sequence_error != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.13 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.13 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    Data_read_dl_config_parameters.data = bytearray([0x04, 0x00, 0x40, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli


	# Start to send a data frame
	# Send a SIF, check that the data are not received on Data_Link_Data_Analyzer models, check that a frame error is detected

    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/SDF_to_SIF.dat")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '1' or sequence_error != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.14 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.14 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    Data_read_dl_config_parameters.data = bytearray([0x04, 0x00, 0x40, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli


	# Send a data frame of 65 words, check that the data are not received on Data_Link_Data_Analyzer models, check that a frame error is detected

    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Data_frame_too_long.dat")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '1' or sequence_error != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.15 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.15 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    Data_read_dl_config_parameters.data = bytearray([0x04, 0x00, 0x40, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli


	# Start to send a data frame
	# Start to send a broadcast frame
	# Send a SDF, check that the data are not received on Data_Link_Data_Analyzer nor  Data_Link_Broadcast_Analyzer models, check that a frame error is detected
    
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/SDF_to_SBF_to_SDF.dat")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '1' or sequence_error != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.16 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.16 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    Data_read_dl_config_parameters.data = bytearray([0x04, 0x00, 0x40, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli


    # Start to send a data frame
	# Start to send a broadcast frame
	# Send a SBF, check that the data are not received on Data_Link_Data_Analyzer nor Data_Link_Broadcast_Analyzer models, check that a frame error is detected
	
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/SDF_to_SBF_to_SBF.dat")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '1' or sequence_error != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.17 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.17 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    Data_read_dl_config_parameters.data = bytearray([0x04, 0x00, 0x40, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli


    # Start to send a data frame
	# Start to send a broadcast frame
	# Send a SIF, check that the data are not received on Data_Link_Data_Analyzer nor Data_Link_Broadcast_Analyzer models, check that a frame error is detected
	
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/SDF_to_SBF_to_SIF.dat")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '1' or sequence_error != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.18 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.18 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    Data_read_dl_config_parameters.data = bytearray([0x04, 0x00, 0x40, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli


    # Start to send a data frame
	# Start to send a broadcast frame
	# Send a EDF, check that the data are not received on Data_Link_Data_Analyzer nor Data_Link_Broadcast_Analyzer models, check that a frame error is detected
	
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/SDF_to_SBF_to_EDF.dat")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '1' or sequence_error != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.19 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.19 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    Data_read_dl_config_parameters.data = bytearray([0x04, 0x00, 0x40, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli


    # Start to send a data frame
	# Send a broadcast frame of 5 words, check that the data are not received on Data_Link_Data_Analyzer nor Data_Link_Broadcast_Analyzer models, check that a frame error is detected
	
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/SDF_to_bc_frame_too_long.dat")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '1' or sequence_error != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.20 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.20 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    Data_read_dl_config_parameters.data = bytearray([0x04, 0x00, 0x40, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli


    # Start to send a data frame
	# Send a broadcast frame of 3 words, check that the data are not received on Data_Link_Data_Analyzer nor Data_Link_Broadcast_Analyzer models, check that a frame error is detected
	
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/SDF_to_bc_frame_too_short.dat")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '1' or sequence_error != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.21 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.21 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    Data_read_dl_config_parameters.data = bytearray([0x04, 0x00, 0x40, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli


    # Start to send a broadcast frame
	# Send a SDF, check that the data are not received on Data_Link_Broadcast_Analyzer models, check that a frame error is detected
	
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/SBF_to_SDF.dat")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '1' or sequence_error != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.22 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.22 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    Data_read_dl_config_parameters.data = bytearray([0x04, 0x00, 0x40, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli


    # Start to send a broadcast frame
	# Send a SBF, check that the data are not received on Data_Link_Broadcast_Analyzer models, check that a frame error is detected
	
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/SBF_to_SBF.dat")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '1' or sequence_error != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.23 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.23 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    Data_read_dl_config_parameters.data = bytearray([0x04, 0x00, 0x40, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli


    # Start to send a broadcast frame
	# Send a SIF, check that the data are not received on Data_Link_Broadcast_Analyzer models, check that a frame error is detected
	
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/SBF_to_SIF.dat")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '1' or sequence_error != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.24 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.24 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    Data_read_dl_config_parameters.data = bytearray([0x04, 0x00, 0x40, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli


    # Start to send a broadcast frame
	# Send a EDF, check that the data are not received on Data_Link_Broadcast_Analyzer models, check that a frame error is detected
	
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/SBF_to_EDF.dat")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '1' or sequence_error != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.25 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.25 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    Data_read_dl_config_parameters.data = bytearray([0x04, 0x00, 0x40, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli


    # Send a broadcast frame of 5 words, check that the data are not received on Data_Link_Broadcast_Analyzer models, check that a frame error is detected
	
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/BC_frame_too_long.dat")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '1' or sequence_error != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.26 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.26 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    Data_read_dl_config_parameters.data = bytearray([0x04, 0x00, 0x40, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli


    # Send a broadcast frame of 3 words, check that the data are not received on Data_Link_Broadcast_Analyzer models, check that a frame error is detected

    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/BC_frame_too_short.dat")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '1' or sequence_error != '0':
        step_1_failed = 1
        tb.logger.error("simulation time %d ns : step 1.27 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 1.27 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    Data_read_dl_config_parameters.data = bytearray([0x04, 0x00, 0x40, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli

    await send_idle_ctrl_word(tb, 300)
    await monitor

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
    ###########        Step 2: Check NACK and ACK reception        ###########
    ##########################################################################
    ##########################################################################
    ##########################################################################
    
    step_2_failed = 0
    

    # Perform initialization procedure
    init =  cocotb.start_soon(initialization_procedure(tb, "reference/spacefibre_serial/monitor_step_2"))
    
    await RisingEdge(tb.dut.spacefibre_instance.RST_TXCLK_N)
    await RisingEdge(tb.dut.RX_POS)
    await Timer(tb.spacefibre_random_generator_data_link.time_per_input//2, units= "fs" )

    fct_monitor = cocotb.start_soon(tb.spacefibre_random_generator_data_link.monitor_FCT(30000))

    await init
    
    # monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_2", number_of_word = 143+66*8+20))

    seq = 0

    #Send first FCT to each virtual channel
    for x in range(8):
        seq += 1
        await send_FCT(tb, x, 0, "0"+ f"{(seq):0>7b}")

    # Assert NACK_RST_en, set NACK_RST_mode to 1

    Data_read_dl_config_parameters.data = bytearray([0x18, 0x00, 0x00, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli


    # Send a data frame, check that the data is received on Data_Link_Data_Analyzer models, check that a ACK request is performed
    
    await configure_model_dl(tb, 4, [0xE1,0x1F,0x00,0x01], [0x10,0x00,0x00,0x00])

    await start_model_dl(tb, 4)


    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_1_" + str(x), 255, 1, 64, 0, 0, seq, seed = 0x10)
    seq = (seq + 1)%128

    


    result = await wait_end_test_dl(tb, 4)

    if result != "00000000":
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.0 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 2.0 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    
    # Send a positive polarity ACK

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
    ACK_counter_1 = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[3:6]
    NACK_counter_1 = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[0:3]

    await stimuli

    await send_ACK(tb, "0" + f"{((seq+15)%128):0>7b}")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.1 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 2.1 result: Pass\n\n\n\n", get_sim_time(units = "ns"))




    #check RX ACK counter
    await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
    ACK_counter = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[3:6]
    NACK_counter = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[0:3]

    if int(ACK_counter, 2) != int(ACK_counter_1, 2) + 1 and NACK_counter == NACK_counter_1:
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.1 result: Failed\nACK_counter: %s  ACK_counter_1 : %s\n\n\n", get_sim_time(units = "ns"), ACK_counter, ACK_counter_1)
    else:
        tb.logger.info("simulation time %d ns : step 2.1 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    #Check ack seq_num rx
    await tb.masters[0].read_data(Data_read_dl_config_err_mngt)
    ACK_seq_num = format(Data_read_dl_config_err_mngt.data[0], '0>8b')
    NACK_seq_num = format(Data_read_dl_config_err_mngt.data[1], '0>8b')
    
    if ACK_seq_num != "0" + f"{((seq+15)%128):0>7b}":
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.1 result: Failed\nACK_seq_num: %s\n\n\n", get_sim_time(units = "ns"), ACK_seq_num)
    else:
        tb.logger.info("simulation time %d ns : step 2.1 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    await stimuli

    # Send a data frame of 16 words, check that the data is received on Data_Link_Data_Analyzer models, check that a ACK request is performed
    
    await configure_model_dl(tb, 4, [0x01,0x08,0x00,0x01], [0x09,0x00,0x00,0x00])

    await start_model_dl(tb, 4)


    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_1_" + str(x), 64, 1, 64, 0, 0, seq, seed = 9)
    seq = (seq + 1)%128


    result = await wait_end_test_dl(tb, 4)

    if result != "00000000":
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.2 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 2.2 result: Pass\n\n\n\n", get_sim_time(units = "ns"))



    # Send a negative polarity ACK


    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
    ACK_counter_1 = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[3:6]
    NACK_counter_1 = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[0:3]

    await stimuli

    await send_ACK(tb, "1" + f"{((seq+18)%128):0>7b}")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.3 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 2.3 result: Pass\n\n\n\n", get_sim_time(units = "ns"))





    await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
    ACK_counter = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[3:6]
    NACK_counter = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[0:3]

    if int(ACK_counter, 2) != int(ACK_counter_1, 2) and NACK_counter == NACK_counter_1:
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.3 result: Failed\nACK_counter: %s  ACK_counter_1 : %s\n\n\n", get_sim_time(units = "ns"), ACK_counter, ACK_counter_1)
    else:
        tb.logger.info("simulation time %d ns : step 2.3 result: Pass\n\n\n\n", get_sim_time(units = "ns"))



    await stimuli

    # Send a negative polarity NACK

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
    ACK_counter_1 = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[3:6]
    NACK_counter_1 = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[0:3]

    await stimuli

    await send_NACK(tb, "1" + f"{((seq+19)%128):0>7b}")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.4 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 2.4 result: Pass\n\n\n\n", get_sim_time(units = "ns"))





    await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
    ACK_counter = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[3:6]
    NACK_counter = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[0:3]

    if int(ACK_counter, 2) != int(ACK_counter_1, 2) and NACK_counter == NACK_counter_1:
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.4 result: Failed\nACK_counter: %s  ACK_counter_1 : %s\n\n\n", get_sim_time(units = "ns"), ACK_counter, ACK_counter_1)
    else:
        tb.logger.info("simulation time %d ns : step 2.4 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    await stimuli



    # Send a data frame, check that the data is received on Data_Link_Data_Analyzer models, check that a ACK request is performed

    await configure_model_dl(tb, 4, [0xE1,0x1F,0x00,0x01], [0x01,0x00,0x00,0x00])

    await start_model_dl(tb, 4)


    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_1_" + str(x), 255, 1, 64, 0, 0, seq, seed = 1)
    seq = (seq + 1)%128


    result = await wait_end_test_dl(tb, 4)

    if result != "00000000":
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.5 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 2.5 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    # Send data frame with a positive polarity NACK within it, check that a Link Reset procedure is performed immediatly

    await configure_model_dl(tb, 4, [0xE1,0x1F,0x00,0x01], [0x02,0x00,0x00,0x00])

    await start_model_dl(tb, 4)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
    ACK_counter_1 = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[3:6]
    NACK_counter_1 = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[0:3]

    await stimuli

    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Data_frame_with_positive_Nack.dat") #NACK seq_num = "01001001"


    await send_idle_ctrl_word(tb,50)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb,10))

    await tb.masters[4].read_data(Data_lane_ana_status)
    test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]

    if test_end != '0':
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.6 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), test_end)
    else:
        tb.logger.info("simulation time %d ns : step 2.6 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.6 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 2.6 result: Pass\n\n\n\n", get_sim_time(units = "ns"))



    await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
    ACK_counter = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[3:6]
    NACK_counter = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[0:3]

    if int(NACK_counter, 2) != int(NACK_counter_1, 2) + 1 and ACK_counter == ACK_counter_1:
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.6 result: Failed\nNACK_counter: %s  NACK_counter_1 : %s\n\n\n", get_sim_time(units = "ns"), NACK_counter, NACK_counter_1)
    else:
        tb.logger.info("simulation time %d ns : step 2.6 result: Pass\n\n\n\n", get_sim_time(units = "ns"))



    await tb.masters[0].read_data(Data_read_dl_config_err_mngt)
    ACK_seq_num = format(Data_read_dl_config_err_mngt.data[0], '0>8b')
    NACK_seq_num = format(Data_read_dl_config_err_mngt.data[1], '0>8b')
    
    if NACK_seq_num != "00000000":
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.6 result: Failed\nNACK_seq_num: %s\n\n\n", get_sim_time(units = "ns"), NACK_seq_num)
    else:
        tb.logger.info("simulation time %d ns : step 2.6 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    await stimuli

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].read_data(Data_read_dl_config_parameters)
    link_rst_asserted = format(Data_read_dl_config_parameters.data[0], '0>8b')[5]

    if link_rst_asserted != '1':
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.6 result: Failed\link_rst_asserted: %s\n\n\n", get_sim_time(units = "ns"), link_rst_asserted)
    else:
        tb.logger.info("simulation time %d ns : step 2.6 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    Data_read_dl_config_parameters.data = bytearray([0x18, 0x00, 0x00, 0x00])


    await tb.masters[0].write_data(Data_read_dl_config_parameters)


    await stimuli

    tb.spacefibre_random_generator_data_link.fct_counter = [0]*8


    await lane_initialization(tb)

    seq = 0

    
    # Send a data frame with a wrong CRC, check that the data is not received on Data_Link_Data_Analyzer models, check that a CRC-16bits error is detected, check that a NACK request is performed
    
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/CRC_16b_error.dat")

    await send_idle_ctrl_word(tb,1000)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb,25))

    await tb.masters[4].read_data(Data_lane_ana_status)
    test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]

    if test_end != '0':
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.7 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), test_end)
    else:
        tb.logger.info("simulation time %d ns : step 2.7 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '1' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.7 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 2.7 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    await stimuli

    Data_read_dl_config_parameters.data = bytearray([0x18, 0x00, 0x40, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli
    
    # Send a data frame, check that the data is received on Data_Link_Data_Analyzer models, check that a ACK request is performed

    #analyzer was started in step 2.6

    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_1_" + str(x), 255, 1, 64, 0, 0, seq, sequence_polarity = 1, seed = 2)
    seq = (seq + 1)%128


    result = await wait_end_test_dl(tb, 4)

    if result != "00000000":
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.8 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 2.8 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    # Send a positive polarity ACK, check that ACK is detected

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
    ACK_counter_1 = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[3:6]
    NACK_counter_1 = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[0:3]

    await stimuli

    await send_ACK(tb, "0" + f"{((seq+50)%128):0>7b}")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.9 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 2.9 result: Pass\n\n\n\n", get_sim_time(units = "ns"))





    await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
    ACK_counter = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[3:6]
    NACK_counter = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[0:3]

    if int(ACK_counter, 2) != int(ACK_counter_1, 2)+1 and NACK_counter == NACK_counter_1:
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.9 result: Failed\nACK_counter: %s  ACK_counter_1 : %s\n\n\n", get_sim_time(units = "ns"), ACK_counter, ACK_counter_1)
    else:
        tb.logger.info("simulation time %d ns : step 2.9 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    

    await tb.masters[0].read_data(Data_read_dl_config_err_mngt)
    ACK_seq_num = format(Data_read_dl_config_err_mngt.data[0], '0>8b')
    NACK_seq_num = format(Data_read_dl_config_err_mngt.data[1], '0>8b')
    
    if ACK_seq_num != "0" + f"{((seq+50)%128):0>7b}":
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.9 result: Failed\nACK_seq_num: %s\nExpected ACK_seq_num: %s\n\n\n", get_sim_time(units = "ns"), ACK_seq_num, "0" + f"{((seq+50)%128):0>7b}")
    else:
        tb.logger.info("simulation time %d ns : step 2.9 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli


    # Send a data frame of 16 words, check that the data is received on Data_Link_Data_Analyzer models, check that a ACK request is performed
    
    await configure_model_dl(tb, 4, [0x01,0x08,0x00,0x01], [0x03,0x00,0x00,0x00])

    await start_model_dl(tb, 4)


    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_1_" + str(x), 64, 1, 64, 0, 0, seq, sequence_polarity = 1, seed = 3)
    seq = (seq + 1)%128


    result = await wait_end_test_dl(tb, 4)

    if result != "00000000":
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.10 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 2.10 result: Pass\n\n\n\n", get_sim_time(units = "ns"))



    # Send a negative polarity ACK


    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
    ACK_counter_1 = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[3:6]
    NACK_counter_1 = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[0:3]

    await stimuli

    await send_ACK(tb, "1" + f"{((seq+25)%128):0>7b}")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.11 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 2.11 result: Pass\n\n\n\n", get_sim_time(units = "ns"))





    await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
    ACK_counter = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[3:6]
    NACK_counter = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[0:3]

    if int(ACK_counter, 2) != int(ACK_counter_1, 2) and NACK_counter == NACK_counter_1:
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.11 result: Failed\nACK_counter: %s  ACK_counter_1 : %s\n\n\n", get_sim_time(units = "ns"), ACK_counter, ACK_counter_1)
    else:
        tb.logger.info("simulation time %d ns : step 2.11 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    await stimuli

    

    # Send a negative polarity NACK, check that nothing happens


    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
    ACK_counter_1 = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[3:6]
    NACK_counter_1 = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[0:3]

    await stimuli

    await send_NACK(tb, "1" + f"{((seq+32)%128):0>7b}")

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await send_idle_ctrl_word(tb, 300)

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.12 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 2.12 result: Pass\n\n\n\n", get_sim_time(units = "ns"))





    await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
    ACK_counter = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[3:6]
    NACK_counter = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[0:3]

    if int(ACK_counter, 2) != int(ACK_counter_1, 2)  and NACK_counter == NACK_counter_1:
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.12 result: Failed\nACK_counter: %s  ACK_counter_1 : %s\n\n\n", get_sim_time(units = "ns"), ACK_counter, ACK_counter_1)
    else:
        tb.logger.info("simulation time %d ns : step 2.12 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    # Send a data frame, check that the data is received on Data_Link_Data_Analyzer models, check that a ACK request is performed
    
    await configure_model_dl(tb, 4, [0xE1,0x1F,0x00,0x01], [0x04,0x00,0x00,0x00])

    await start_model_dl(tb, 4)


    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_1_" + str(x), 255, 1, 64, 0, 0, seq, sequence_polarity = 1, seed = 4)
    seq = (seq + 1)%128


    result = await wait_end_test_dl(tb, 4)

    if result != "00000000":
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.13 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 2.13 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    # Send data frame with a positive polarity NACK within it, check that a Link Reset procedure is performed immediatly

    await configure_model_dl(tb, 4, [0xE1,0x1F,0x00,0x01], [0x00,0x00,0x00,0x00])

    await start_model_dl(tb, 4)


    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
    ACK_counter_1 = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[3:6]
    NACK_counter_1 = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[0:3]

    await stimuli

    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Data_frame_with_positive_Nack.dat") #seq_num = "11110000"


    await send_idle_ctrl_word(tb,50)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb,10))

    await tb.masters[4].read_data(Data_lane_ana_status)
    test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]

    if test_end != '0':
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.14 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 2.14 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 15))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.14 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 2.14 result: Pass\n\n\n\n", get_sim_time(units = "ns"))



    await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
    ACK_counter = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[3:6]
    NACK_counter = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[0:3]

    if int(NACK_counter, 2) != int(NACK_counter_1, 2) + 1 and ACK_counter == ACK_counter_1:
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.14 result: Failed\nNACK_counter: %s  NACK_counter_1 : %s\n\n\n", get_sim_time(units = "ns"), NACK_counter, NACK_counter_1)
    else:
        tb.logger.info("simulation time %d ns : step 2.14 result: Pass\n\n\n\n", get_sim_time(units = "ns"))



    await tb.masters[0].read_data(Data_read_dl_config_err_mngt)
    ACK_seq_num = format(Data_read_dl_config_err_mngt.data[0], '0>8b')
    NACK_seq_num = format(Data_read_dl_config_err_mngt.data[1], '0>8b')
    
    if NACK_seq_num != "00000000":
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.14 result: Failed\nACK_seq_num: %s\n\n\n", get_sim_time(units = "ns"), ACK_seq_num)
    else:
        tb.logger.info("simulation time %d ns : step 2.14 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await tb.masters[0].read_data(Data_read_dl_config_parameters)
    link_rst_asserted = format(Data_read_dl_config_parameters.data[0], '0>8b')[5]

    if link_rst_asserted != '1':
        step_2_failed = 1
        tb.logger.error("simulation time %d ns : step 2.14 result: Failed\nlink_rst_asserted: %s\n\n\n", get_sim_time(units = "ns"), link_rst_asserted)
    else:
        tb.logger.info("simulation time %d ns : step 2.14 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    tb.spacefibre_random_generator_data_link.fct_counter = [0]*8
    await lane_initialization(tb)

    seq = 0


    #######################################################################################################################
    # # Set NACK_RST_mode to 0

    # Data_read_dl_config_parameters.data = bytearray([0x04, 0x00, 0x00, 0x00])

    # stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    # await tb.masters[0].write_data(Data_read_dl_config_parameters)

    # await stimuli

    # # Send a data frame, check that the data is received on Data_Link_Data_Analyzer models, check that a ACK request is performed

    # await configure_model_dl(tb, 4, [0xE1,0x1F,0x00,0x01], [0x00,0x00,0x00,0x00])

    # await start_model_dl(tb, 4)


    # await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_1_" + str(x), 255, 1, 64, 0, 0, seq, sequence_polarity = 1)
    # seq = (seq + 1)%128


    # result = await wait_end_test_dl(tb, 4)

    # if result != "00000000":
    #     step_2_failed = 1
    #     tb.logger.error("simulation time %d ns : step 2.15 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    # else:
    #     tb.logger.info("simulation time %d ns : step 2.15 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    # # Send a data frame with a positive polarity NACK within it, check that a Link Reset procedure is performed at the end of the packet being received
    
    # await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Data_frame_with_positive_Nack_bis.dat")

    # await lane_initialization(tb)

    # seq = 0
    # tb.spacefibre_random_generator_data_link.fct_counter = [0]*8

    # # Send a data frame with a wrong CRC, check that the data is not received on Data_Link_Data_Analyzer models, check that a CRC-16bits error is detected, check that a NACK request is performed
    
    # await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/CRC_16b_error_bis.dat")

    # # Send a data frame, check that the data is received on Data_Link_Data_Analyzer models, check that a ACK request is performed
    
    # await configure_model_dl(tb, 4, [0xE1,0x1F,0x00,0x01], [0x00,0x00,0x00,0x00])

    # await start_model_dl(tb, 4)


    # await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_1_" + str(x), 255, 1, 64, 0, 0, seq, seed = 0, sequence_polarity = 1)
    # seq = (seq + 1)%128


    # result = await wait_end_test_dl(tb, 4)

    # if result != "00000000":
    #     step_2_failed = 1
    #     tb.logger.error("simulation time %d ns : step 2.18 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    # else:
    #     tb.logger.info("simulation time %d ns : step 2.18 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    # # Send a data frame with a negative polarity NACK within it, check that a Link Reset procedure is performed at the end of the packet being received
    
    # await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Data_frame_with_negative_Nack_bis.dat")

    # await lane_initialization(tb)

    # seq = 0
    # tb.spacefibre_random_generator_data_link.fct_counter = [0]*8

    ##################################################################################################
    # De-assert NACK_RST_en
    fix = 0
    if fix == 0:
        await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_1_" + str(x), 255, 1, 64, 0, 0, seq, seed = 0)
        seq = (seq + 1)%128


        result = await wait_end_test_dl(tb, 4)

        if result != "00000000":
            step_2_failed = 1
            tb.logger.error("simulation time %d ns : step 2.22 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
        else:
            tb.logger.info("simulation time %d ns : step 2.22 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    if fix == 1:
        Data_read_dl_config_parameters.data = bytearray([0x00, 0x00, 0x00, 0x00])

        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

        await tb.masters[0].write_data(Data_read_dl_config_parameters)

        await stimuli

        # Send a positive polarity NACK, check that a NACK reception is indicated on the MIB interface

        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

        await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
        ACK_counter_1 = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[3:6]
        NACK_counter_1 = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[0:3]

        await stimuli

        await send_NACK(tb, "0" + f"{((seq+28)%128):0>7b}")

        await send_idle_ctrl_word(tb, 300)

        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

        await tb.masters[0].read_data(Data_read_dl_config_status_2)
        CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
        CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
        frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
        sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

        if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
            step_2_failed = 1
            tb.logger.error("simulation time %d ns : step 2.20 result: Failed\n\n\n", get_sim_time(units = "ns"))
        else:
            tb.logger.info("simulation time %d ns : step 2.20 result: Pass\n\n\n\n", get_sim_time(units = "ns"))




        #check RX ACK counter
        await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
        ACK_counter = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[3:6]
        NACK_counter = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[0:3]

        if int(NACK_counter, 2) != int(NACK_counter_1, 2) + 1 and ACK_counter == ACK_counter_1:
            step_2_failed = 1
            tb.logger.error("simulation time %d ns : step 2.20 result: Failed\nNACK_counter: %s  NACK_counter_1 : %s\n\n\n", get_sim_time(units = "ns"), NACK_counter, NACK_counter_1)
        else:
            tb.logger.info("simulation time %d ns : step 2.20 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


        #Check ack seq_num rx
        await tb.masters[0].read_data(Data_read_dl_config_err_mngt)
        ACK_seq_num = format(Data_read_dl_config_err_mngt.data[0], '0>8b')
        NACK_seq_num = format(Data_read_dl_config_err_mngt.data[1], '0>8b')
        
        if NACK_seq_num != "0" + f"{((seq+28)%128):0>7b}":
            step_2_failed = 1
            tb.logger.error("simulation time %d ns : step 2.20 result: Failed\nNACK_seq_num: %s\n\n\n", get_sim_time(units = "ns"), NACK_seq_num)
        else:
            tb.logger.info("simulation time %d ns : step 2.20 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


        await stimuli

        

        # Send a data frame with a wrong CRC, check that the data is not received on Data_Link_Data_Analyzer models, check that a CRC-16bits error is detected, check that a NACK request is performed
        
        await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/CRC_16b_error_ter.dat")

        await send_idle_ctrl_word(tb,50)

        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb,25))

        await tb.masters[4].read_data(Data_lane_ana_status)
        test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]

        if test_end != '0':
            step_2_failed = 1
            tb.logger.error("simulation time %d ns : step 2.21 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
        else:
            tb.logger.info("simulation time %d ns : step 2.21 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

        await stimuli

        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

        await tb.masters[0].read_data(Data_read_dl_config_status_2)
        CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
        CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
        frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
        sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

        if CRC_long_error != '1' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
            step_2_failed = 1
            tb.logger.error("simulation time %d ns : step 2.21 result: Failed\n\n\n", get_sim_time(units = "ns"))
        else:
            tb.logger.info("simulation time %d ns : step 2.21 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

        Data_read_dl_config_parameters.data = bytearray([0x00, 0x00, 0x40, 0x00])

        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

        await tb.masters[0].write_data(Data_read_dl_config_parameters)

        await stimuli
        
        # Send a data frame, check that the data is received on Data_Link_Data_Analyzer models, check that a ACK request is performed

        # Analyzer was started in step 2.14


        await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_1_" + str(x), 255, 1, 64, 0, 0, seq, seed = 0, sequence_polarity = 1)
        seq = (seq + 1)%128


        result = await wait_end_test_dl(tb, 4)

        if result != "00000000":
            step_2_failed = 1
            tb.logger.error("simulation time %d ns : step 2.22 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
        else:
            tb.logger.info("simulation time %d ns : step 2.22 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

        
        # Send a negative polarity NACK, check that a NACK reception is indicated on the MIB interface


        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

        await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
        ACK_counter_1 = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[3:6]
        NACK_counter_1 = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[0:3]

        await stimuli

        await send_NACK(tb, "1" + f"{((seq+42)%128):0>7b}")

        await send_idle_ctrl_word(tb, 300)

        stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

        await tb.masters[0].read_data(Data_read_dl_config_status_2)
        CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
        CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
        frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
        sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

        if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
            step_2_failed = 1
            tb.logger.error("simulation time %d ns : step 2.23 result: Failed\n\n\n", get_sim_time(units = "ns"))
        else:
            tb.logger.info("simulation time %d ns : step 2.23 result: Pass\n\n\n\n", get_sim_time(units = "ns"))




        #check RX ACK counter
        await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
        ACK_counter = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[3:6]
        NACK_counter = format(Data_read_dl_config_QoS_2.data[1], '0>8b')[0:3]

        if int(NACK_counter, 2) != int(NACK_counter_1, 2) + 1 and ACK_counter == ACK_counter_1:
            step_2_failed = 1
            tb.logger.error("simulation time %d ns : step 2.23 result: Failed\nNACK_counter: %s  NACK_counter_1 : %s\n\n\n", get_sim_time(units = "ns"), NACK_counter, NACK_counter_1)
        else:
            tb.logger.info("simulation time %d ns : step 2.23 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


        #Check ack seq_num rx
        await tb.masters[0].read_data(Data_read_dl_config_err_mngt)
        ACK_seq_num = format(Data_read_dl_config_err_mngt.data[0], '0>8b')
        NACK_seq_num = format(Data_read_dl_config_err_mngt.data[1], '0>8b')
        
        if NACK_seq_num != "1" + f"{((seq+42)%128):0>7b}":
            step_2_failed = 1
            tb.logger.error("simulation time %d ns : step 2.23 result: Failed\nNACK_seq_num: %s\n\n\n", get_sim_time(units = "ns"), NACK_seq_num)
        else:
            tb.logger.info("simulation time %d ns : step 2.23 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


        await stimuli


    await send_idle_ctrl_word(tb, 200)

    await fct_monitor
    tb.spacefibre_random_generator_data_link.fct_counter = [0]*8

    # await monitor

    if step_2_failed == 0:
        tb.logger.info("simulation time %d ns : step 2 result: Pass")
    else:
        test_failed = 1
        tb.logger.error("simulation time %d ns : step 2 result: Failed")

    ##########################################################################
    ##########################################################################
    ##########################################################################
    ###########      Step 3: Check Reception Errors Management     ###########
    ##########################################################################
    ##########################################################################
    ##########################################################################

    step_3_failed = 0

    # monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_3", number_of_word = 2500))
    
    fct_monitor = cocotb.start_soon(tb.spacefibre_random_generator_data_link.monitor_FCT(30000))

    # Perform initialization procedure
    await initialization_procedure(tb, "reference/spacefibre_serial/monitor_step_3")

    seq = 0

    #Send first FCT to each virtual channel
    for x in range(8):
        seq = (seq + 1)%128
        await send_FCT(tb, x, 0, "0"+ f"{(seq):0>7b}")
    
    # Send a valid data frame, check that the data is received on Data_Link_Data_Analyzer models

    await configure_model_dl(tb, 4, [0xE1,0x1F,0x00,0x01], [0x10,0x00,0x00,0x00])

    await start_model_dl(tb, 4)


    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_1_" + str(x), 255, 1, 64, 0, 0, seq, seed = 0x10)
    seq = (seq + 1)%128

    


    result = await wait_end_test_dl(tb, 4)

    if result != "00000000":
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.0 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 3.0 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.0 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 3.0 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    #########################################
    # Send a data frame with an invalid CRC, check that the data are not received on Data_Link_Data_Analyzer models, check that a CRC-16bits is detected
    await configure_model_dl(tb, 4, [0xE1,0x1F,0x00,0x01], [0x20,0x00,0x00,0x00])
    
    await start_model_dl(tb, 4)

    
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/step_3_CRC_16b_error.dat")

    await send_idle_ctrl_word(tb,500)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb,25))

    await tb.masters[4].read_data(Data_lane_ana_status)
    test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]

    if test_end != '0':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.1 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 3.1 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '1' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.1 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 3.1 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    Data_read_dl_config_parameters.data = bytearray([0x00, 0x00, 0x40, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli
    
    #########################################
    # Send a RETRY, check that a RETRY reception is indicated on MIB interface

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
    RETRY_counter_1 = format(Data_read_dl_config_QoS_2.data[2], '0>8b')[0:2]

    await stimuli

    await send_retry(tb)

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
    RETRY_counter = format(Data_read_dl_config_QoS_2.data[2], '0>8b')[0:2]

    await stimuli

    if int(RETRY_counter_1, 2) + 1 != int(RETRY_counter, 2):
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.2 result: Failed\nRETRY_counter : %s\nPrevious RETRY_counter : %s \n byte 3 of Qos2 : %s\n\n\n", get_sim_time(units = "ns"), RETRY_counter, RETRY_counter_1, format(Data_read_dl_config_QoS_2.data[3], '0>8b'))
    else:
        tb.logger.info("simulation time %d ns : step 3.2 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli


    ##########################""
    # Send a valid data frame, check that the data is received on Data_Link_Data_Analyzer models

    #Analyzer was started in step 3.1

    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_1_" + str(x), 255, 1, 64, 0, 0, seq, sequence_polarity = 1, seed = 0x20)
    seq = (seq + 1)%128

    


    result = await wait_end_test_dl(tb, 4)

    if result != "00000000":
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.3 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 3.3 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.3 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 3.3 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    # Send a data frame with an invalid counter SEQ_NUMBER, check that the data are not received on Data_Link_Data_Analyzer models, check that a sequence number is detected
    
    await configure_model_dl(tb, 4, [0xE1,0x1F,0x00,0x01], [0x04,0x00,0x00,0x00])
    
    await start_model_dl(tb, 4)

    
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/step_3_SEQ_Count_error.dat")

    await send_idle_ctrl_word(tb,500)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb,25))

    await tb.masters[4].read_data(Data_lane_ana_status)
    test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]

    if test_end != '0':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.4 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 3.4 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '1':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.4 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 3.4 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    Data_read_dl_config_parameters.data = bytearray([0x00, 0x00, 0x40, 0x00])

    await stimuli

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli



    # Send a valid data frame, check that the data is received on Data_Link_Data_Analyzer models

    #Analyzer was started in step 3.4

    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_1_" + str(x), 255, 1, 64, 0, 0, seq, seed = 4)
    seq = (seq + 1)%128

    


    result = await wait_end_test_dl(tb, 4)

    if result != "00000000":
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.5 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 3.5 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.5 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 3.5 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli


    # Send a data frame with an invalid polarity SEQ_NUMBER, check that the data are not received on Data_Link_Data_Analyzer models, check that a sequence number is detected
    
    await configure_model_dl(tb, 4, [0xE1,0x1F,0x00,0x01], [0x06,0x00,0x00,0x00])
    
    await start_model_dl(tb, 4)

    
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/step_3_SEQ_polarity_error.dat")

    await send_idle_ctrl_word(tb,500)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb,25))

    await tb.masters[4].read_data(Data_lane_ana_status)
    test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]

    if test_end != '0':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.6 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 3.6 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '1':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.6 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 3.6 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    Data_read_dl_config_parameters.data = bytearray([0x00, 0x00, 0x40, 0x00])

    await stimuli

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli



    # Send a valid data frame, check that the data is received on Data_Link_Data_Analyzer models

    #Analyzer was started in step 3.6

    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_1_" + str(x), 255, 1, 64, 0, 0, seq, sequence_polarity = 1, seed = 6)
    seq = (seq + 1)%128

    


    result = await wait_end_test_dl(tb, 4)

    if result != "00000000":
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.7 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 3.7 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.7 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 3.7 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli
    

    # Send a data frame with an RXERR word, check that the data are not received on Data_Link_Data_Analyzer models

    await configure_model_dl(tb, 4, [0xE1,0x1F,0x00,0x01], [0x08,0x00,0x00,0x00])
    
    await start_model_dl(tb, 4)

    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/RXERR_error_1.dat")
    await write_10b_to_Rx(tb, "1101110111", 0)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/RXERR_error_2.dat")

    await send_idle_ctrl_word(tb,500)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb,25))

    await tb.masters[4].read_data(Data_lane_ana_status)
    test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]

    if test_end != '0':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.8 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 3.8 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.8 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 3.8 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    Data_read_dl_config_parameters.data = bytearray([0x00, 0x00, 0x40, 0x00])

    await stimuli

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli



    # Send a valid data frame, check that the data is received on Data_Link_Data_Analyzer models

    #Analyzer was started in step 3.8

    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_1_" + str(x), 255, 1, 64, 0, 0, seq, seed = 8)
    seq = (seq + 1)%128

    


    result = await wait_end_test_dl(tb, 4)

    if result != "00000000":
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.9 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 3.9 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.9 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 3.9 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli


    # Send a FULL, check that an ACK request is generated, check that a FULL reception is indicated on MIB interface

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
    FULL_counter_1 = format(Data_read_dl_config_QoS_2.data[2], '0>8b')[2:4]

    await stimuli

    await send_full(tb, "0" + f"{(seq):0>7b}")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
    FULL_counter = format(Data_read_dl_config_QoS_2.data[2], '0>8b')[2:4]

    await stimuli

    if int(FULL_counter_1, 2) + 1 != int(FULL_counter, 2):
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.10 result: Failed\nFULL_counter : %s\nFULL_counter_1 : %s\nQoS2 byte 3 : %s\n\n\n", get_sim_time(units = "ns"), FULL_counter, FULL_counter_1, format(Data_read_dl_config_QoS_2.data[2], '0>8b'))
    else:
        tb.logger.info("simulation time %d ns : step 3.10 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    # Send a broadcast frame with an invalid CRC, check that a CRC-8bits is detected

    await configure_model_dl(tb, 20, [0x01,0x01,0x00,0x00], [0x00,0x00,0x42,0x00])
    
    await start_model_dl(tb, 20)

    
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/step_3_CRC_8b_error.dat")

    await send_idle_ctrl_word(tb,500)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb,25))

    await tb.masters[20].read_data(Data_lane_ana_status)
    test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]

    if test_end != '0':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.11 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 3.11 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '1' or frame_error != '0' or sequence_error != '0':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.11 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 3.11 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    Data_read_dl_config_parameters.data = bytearray([0x00, 0x00, 0x40, 0x00])

    await stimuli

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli



    # Send a valid broadcast frame, check that the data is received on Data_Link_Data_Analyzer models

    #Analyzer was started in step 3.11

    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_3_0", 0x0042000100420000, 1, 0, 1, 0, seq, delay = 0, invert_polarity = 0, seed = 0x42, sequence_polarity = 1)
    seq = (seq + 1)%128

    


    result = await wait_end_test_dl(tb, 4)

    if result != "00000000":
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.12 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 3.12 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.12 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 3.12 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    # Send a broadcast frame with an invalid SEQ_NUMBER sequence number, check that a sequence number is detected

    await configure_model_dl(tb, 20, [0x01,0x01,0x00,0x00], [0x00,0x00,0x42,0x00])
    
    await start_model_dl(tb, 20)

    
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/step_3_SEQ_count_error_bc.dat")

    await send_idle_ctrl_word(tb,500)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb,25))

    await tb.masters[20].read_data(Data_lane_ana_status)
    test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]

    if test_end != '0':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.13 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 3.13 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '1':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.13 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 3.13 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    Data_read_dl_config_parameters.data = bytearray([0x00, 0x00, 0x40, 0x00])

    await stimuli

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli



    # Send a valid broadcast frame, check that the data is received on Data_Link_Data_Analyzer models

    #Analyzer was started in step 3.13

    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_3_0", 0x0042000100420000, 1, 0, 1, 0, seq, delay = 0, invert_polarity = 0, seed = 0x42)
    seq = (seq + 1)%128

    


    result = await wait_end_test_dl(tb, 4)

    if result != "00000000":
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.14 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 3.14 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.14 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 3.14 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    # Send a broadcast frame with an invalid SEQ_NUMBER polarity, check that a sequence number is detected

    await configure_model_dl(tb, 20, [0x01,0x01,0x00,0x00], [0x00,0x00,0x42,0x00])
    
    await start_model_dl(tb, 20)

    
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/step_3_SEQ_polarity_error_bc.dat")

    await send_idle_ctrl_word(tb,500)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb,25))

    await tb.masters[20].read_data(Data_lane_ana_status)
    test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]

    if test_end != '0':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.15 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 3.15 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '1':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.15 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 3.15 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    Data_read_dl_config_parameters.data = bytearray([0x00, 0x00, 0x40, 0x00])

    await stimuli

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli



    # Send a valid broadcast frame, check that the data is received on Data_Link_Data_Analyzer models

    #Analyzer was started in step 3.15

    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_3_0", 0x0042000100420000, 1, 0, 1, 0, seq, delay = 0, invert_polarity = 0, seed = 0x42, sequence_polarity = 1)
    seq = (seq + 1)%128

    


    result = await wait_end_test_dl(tb, 4)

    if result != "00000000":
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.16 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 3.16 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.16 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 3.16 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    # Send an idle frame with an invalid CRC, check that a CRC-8bits is detected
    
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/step_3_CRC_8b_error_idle.dat")

    await send_idle_ctrl_word(tb,500)


    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '1' or frame_error != '0' or sequence_error != '0':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.17 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 3.17 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    Data_read_dl_config_parameters.data = bytearray([0x00, 0x00, 0x40, 0x00])

    await stimuli

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli

    # Send an idle frame with an invalid SEQ_NUMBER polarity, check that a sequence number is detected

    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/step_3_SEQ_polarity_error_idle.dat")

    await send_idle_ctrl_word(tb,500)


    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '1':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.18 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 3.18 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    Data_read_dl_config_parameters.data = bytearray([0x00, 0x00, 0x40, 0x00])

    await stimuli

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli

    # Send an idle frame with an invalid SEQ_NUMBER sequence number, check that a sequence number is detected

    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/step_3_SEQ_count_error_idle.dat")

    await send_idle_ctrl_word(tb,50)


    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '1':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.19 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 3.19 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    Data_read_dl_config_parameters.data = bytearray([0x00, 0x00, 0x40, 0x00])
    
    await stimuli

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli


    # Send a FULL with a seq num error, check that an ACK request is generated, check that a FULL reception is indicated on MIB interface

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
    FULL_counter_1 = format(Data_read_dl_config_QoS_2.data[2], '0>8b')[2:4]

    await stimuli

    await send_full(tb, "0" + f"{(seq):0>7b}")

    await send_idle_ctrl_word(tb, 300)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].read_data(Data_read_dl_config_QoS_2)
    FULL_counter = format(Data_read_dl_config_QoS_2.data[2], '0>8b')[2:4]

    await stimuli

    if int(FULL_counter_1, 2) != int(FULL_counter, 2):
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.20 result: Failed\nFULL_counter : %s\nFULL_counter_1 : %s\nQoS2 byte 3 : %s\n\n\n", get_sim_time(units = "ns"), FULL_counter, FULL_counter_1, format(Data_read_dl_config_QoS_2.data[2], '0>8b'))
    else:
        tb.logger.info("simulation time %d ns : step 3.20 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '1':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.20 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 3.20 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    Data_read_dl_config_parameters.data = bytearray([0x00, 0x00, 0x40, 0x00])

    await stimuli

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli



    # Send a valid data frame, check that the data is received on Data_Link_Data_Analyzer models

    await configure_model_dl(tb, 4, [0xE1,0x1F,0x00,0x01], [0x42,0x00,0x00,0x00])

    await start_model_dl(tb, 4)


    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_1_1_" + str(x), 255, 1, 64, 0, 0, seq, seed = 0x42, sequence_polarity = 1)
    seq = (seq + 1)%128

    


    result = await wait_end_test_dl(tb, 4)

    if result != "00000000":
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.21 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 3.21 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    CRC_long_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[7]
    CRC_short_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[6]
    frame_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[5]
    sequence_error = format(Data_read_dl_config_status_2.data[0], '0>8b')[4]

    if CRC_long_error != '0' or CRC_short_error != '0' or frame_error != '0' or sequence_error != '0':
        step_3_failed = 1
        tb.logger.error("simulation time %d ns : step 3.21 result: Failed\n\n\n", get_sim_time(units = "ns"))
    else:
        tb.logger.info("simulation time %d ns : step 3.21 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli





    await monitor

    await fct_monitor 
    tb.spacefibre_random_generator_data_link.fct_counter = [0]*8


    if step_3_failed == 0:
        tb.logger.info("simulation time %d ns : step 3 result: Pass")
    else:
        test_failed = 1
        tb.logger.error("simulation time %d ns : step 3 result: Failed")

    ##########################################################################
    ##########################################################################
    ##########################################################################
    ###########      Step 4: Check input buffers flow control      ###########
    ##########################################################################
    ##########################################################################
    ##########################################################################

    step_4_failed = 0

    # monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_3", number_of_word = 2500))
    
    fct_monitor = cocotb.start_soon(tb.spacefibre_random_generator_data_link.monitor_FCT(30000))

    # Perform initialization procedure
    await initialization_procedure(tb, "reference/spacefibre_serial/monitor_step_4")

    #Check that FCT are sent for each virtual buffer

    # Assert and de_assert Link Reset parameter, check that for each input buffer, an FCT emission request is generated
    # Check that the FCTs sent are valid for each input buffer

    Data_read_dl_config_parameters.data = bytearray([0x02, 0x00, 0x00, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli


    Data_read_dl_config_parameters.data = bytearray([0x00, 0x00, 0x00, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli



    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_parameters)
    link_rst_asserted = format(Data_read_dl_config_parameters.data[0], '0>8b')[5]

    if link_rst_asserted != '1':
        step_4_failed = 1
        tb.logger.error("simulation time %d ns : step 4.1 result: Failed\nlink_rst_asserted: %s\n\n\n", get_sim_time(units = "ns"), link_rst_asserted)
    else:
        tb.logger.info("simulation time %d ns : step 4.1 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli



    tb.spacefibre_random_generator_data_link.fct_counter = [0]*8

    await lane_initialization(tb)


    Data_read_dl_config_parameters.data = bytearray([0x00, 0x00, 0x00, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli

    seq = 0

    # Send a data frame of 64 word to each virtual channel

    for x in range (8):
        await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_4_1_" + str(x), 255, 1, 64, 0, x, seq)
        seq = (seq + 1) % 128
    

    # Send two data frames of 32 word to each virtual channel

    for i in range(2):
        for x in range (8):
            await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_4_2_" + str(8*i+x), 128, 1, 64, 0, x, seq, seed = 0x2B)
            seq = (seq + 1) % 128


    # Read 64 words on each virtual channel, check that an FCT request is generated for each virtual channel
    await configure_ana_vc_dl(tb, [0xE1,0x1F,0x00,0x01], [0x2A,0x00,0x00,0x00])

    await start_ana_vc_dl(tb)


    results = await wait_end_test_all_vc_dl(tb)

    for result in results:
        if result != "00000000":
            step_4_failed = 1
            tb.logger.error("simulation time %d ns : step 4.3 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
        else:
            tb.logger.info("simulation time %d ns : step 4.3 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    # Check that the FCTs sent are valid for each virtual channel
    # Read 32 words on each virtual channel, check that no FCT request are generated for each virtual channel

    await configure_ana_vc_dl(tb, [0x01,0x10,0x00,0x01], [0x2B,0x00,0x00,0x00])

    await start_ana_vc_dl(tb)


    results = await wait_end_test_all_vc_dl(tb)

    for result in results:
        if result != "00000000":
            step_4_failed = 1
            tb.logger.error("simulation time %d ns : step 4.4 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
        else:
            tb.logger.info("simulation time %d ns : step 4.4 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    # Read 32 words on each virtual channel, check that an FCT request is generated for each virtual channel

    await configure_ana_vc_dl(tb, [0x01,0x10,0x00,0x01], [0x2B,0x00,0x00,0x00])

    await start_ana_vc_dl(tb)


    results = await wait_end_test_all_vc_dl(tb)

    for result in results:
        if result != "00000000":
            step_4_failed = 1
            tb.logger.error("simulation time %d ns : step 4.5 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
        else:
            tb.logger.info("simulation time %d ns : step 4.5 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    # Check that the FCTs sent are valid for each virtual channel
    # Send two data frames of 64 words to a virtual channel

    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_4_6_" + str(0), 255, 2, 64, 0, 0, seq, seed = 0x2C)
    seq = (seq + 2) % 128
    
    # Send three data frames of 64 words to another virtual channel

    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_4_7_" + str(1), 255, 3, 64, 0, 1, seq, seed = 0x2D)
    seq = (seq + 3) % 128

    # Read 128 data words in first virtual channel, check that two FCTs request were sent and that the FCTs were valid

    await configure_model_dl(tb, 4, [0xE2,0x1F,0x00,0x01], [0x2C,0x00,0x00,0x00])

    await start_model_dl(tb, 4)


    result = await wait_end_test_dl(tb, 4)

    if result != "00000000":
        step_4_failed = 1
        tb.logger.error("simulation time %d ns : step 4.6 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 4.6 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    # Read 192 data words in the second virtual channel, check that three FCTs request were sent and that the FCTs were valid

    await configure_model_dl(tb, 6, [0xE3,0x1F,0x00,0x01], [0x2D,0x00,0x00,0x00])

    await start_model_dl(tb, 6)


    result = await wait_end_test_dl(tb, 6)

    if result != "00000000":
        step_4_failed = 1
        tb.logger.error("simulation time %d ns : step 4.7 result: Failed\nError_count : %s \n\n\n", get_sim_time(units = "ns"), result)
    else:
        tb.logger.info("simulation time %d ns : step 4.7 result: Pass\n\n\n\n", get_sim_time(units = "ns"))


    # Send data frames to a single virtual channel from the Data_Link_Generator python model continuously, check that the input buffer associated is indicated to have overflowed, check that a link reset is performed

    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/random_gen_step_4_8_" + str(0), 255, 6, 64, 0, 0, seq, seed = 0x2F, ignore_fct_monitor = 1)
    seq = (seq + 6) % 128

    await send_idle_ctrl_word (tb, 1000)

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_parameters)
    link_rst_asserted = format(Data_read_dl_config_parameters.data[0], '0>8b')[5]

    if link_rst_asserted != '1':
        step_4_failed = 1
        tb.logger.error("simulation time %d ns : step 4.8 result: Failed\nlink_rst_asserted: %s\n\n\n", get_sim_time(units = "ns"), link_rst_asserted)
    else:
        tb.logger.info("simulation time %d ns : step 4.8 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli




    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 25))

    await tb.masters[0].read_data(Data_read_dl_config_status_2)
    input_buffer_overflow = format(Data_read_dl_config_status_2.data[1], '0>8b')[3:8] + format(Data_read_dl_config_status_2.data[0], '0>8b')[0:3]

    if input_buffer_overflow != '00000001':
        step_4_failed = 1
        tb.logger.error("simulation time %d ns : step 4.9 result: Failed\ninput_buffer_overflow: %s\n\n\n", get_sim_time(units = "ns"), input_buffer_overflow)
    else:
        tb.logger.info("simulation time %d ns : step 4.9 result: Pass\n\n\n\n", get_sim_time(units = "ns"))

    await stimuli




    Data_read_dl_config_parameters.data = bytearray([0x00, 0x00, 0x00, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli

    await send_idle_ctrl_word (tb, 400)

    await fct_monitor
    tb.spacefibre_random_generator_data_link.fct_counter = [0]*8



    if step_4_failed == 0:
        tb.logger.info("simulation time %d ns : step 4 result: Pass")
    else:
        test_failed = 1
        tb.logger.error("simulation time %d ns : step 4 result: Failed")

    



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

    if step_3_failed == 0:
        tb.logger.info("simulation time %d ns : step 3 result: Pass",get_sim_time(units="ns"))
    else:
        tb.logger.error("simulation time %d ns : step 3 result: Failed", get_sim_time(units="ns"))

    if step_4_failed == 0:
        tb.logger.info("simulation time %d ns : step 4 result: Pass",get_sim_time(units="ns"))
    else:
        tb.logger.error("simulation time %d ns : step 4 result: Failed", get_sim_time(units="ns"))

    if test_failed == 1:
        raise TestFailure

