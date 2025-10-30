##########################################################################
## COMPANY       : CNES
##########################################################################
## TITLE         : data_link_transmission.py
## PROJECT       : SPACE FIBRE LIGHT
##########################################################################
## AUTHOR        : Thomas FAVRE-FELIX
## CREATED       : 14/03/2025
##########################################################################
## DESCRIPTION   : Runs tests for verification of the SpaceFibre_Light IP
##                 transmission chain processes of the data link layer
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
                    Data_read_general_control, Data_read_dl_config_parameters, Data_read_dl_config_status_1, \
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

    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/50_IDLE.dat", file_format = 16))

    #Check that Lane initialisatiion FSM is in Active State
    await tb.masters[0].read_data(Data_read_lane_config_status)

    await monitor

    await stimuli
    if format(Data_read_lane_config_status.data[0], '0>8b')[4:8] != ACTIVE:
        global test_failed 
        test_failed = 1

async def wait_end_test_dl(tb, channel):
    """
    Wait for test end to be raised by the selected analyzer.
    Return the Error counter of the selected analyzer.
    """
    await tb.masters[2*channel].read_data(Data_lane_ana_status)
    test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]
    timer = 0
    while test_end != '1' and timer < 1000:
        await tb.masters[2*channel].read_data(Data_lane_ana_status)
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
        x = await wait_end_test_dl(tb, channel)
        result += [x]
    return result

async def wait_end_test_all_vc_dl(tb):
    """
    Wait for test end to be raised by all analyzer except for broadcast.
    Return the Error counter of all analyzer as a list.
    """
    result = []
    for channel in range(2, 10):
        x = await wait_end_test_dl(tb, channel)
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
    Start test on all data link analyzer and all data link generator except for broadcast.
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
    Configure test on all data link analyzer and all data link generator except for broadcast.
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
    Start test on all data link generators except for broadcast.
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
    Configure test on all data link generators except for broadcast..
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

async def configure_model_dl(tb, model, conf, seed):
    """
    Configure test on specified model.
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
    Start test on specified model.
    """
    Data_lane_gen_control.data = bytearray([0x01,0x00,0x00,0x00])
    # Start model
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    await tb.masters[model].write_data(Data_lane_gen_control)
    await stimuli


async def write_10b_to_Rx(tb, encoded_data, delay = 0, invert_polarity = 0):
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

async def send_full(tb, seq_num):
    """
    Send a FULL control word to the RX port of the SpaceFibreLight IP
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

def check_CRC(tb, path):
    """
    check all CRC values in a log file
    """
    assert os.path.exists(path), "Source file doesn't exist"
    
    tb.logger.info("sim_time %d ns: Source file %s to check does exist, open in read mode", get_sim_time(units = "ns"), path)
    file = open(path, "r")

    error_cnt = 0
    ack_cnt = 0
    nack_cnt = 0
    fct_cnt = 0
    sif_cnt = 0
    data_frame_cnt = 0
    bc_frame_cnt = 0

    ack_cnt_vld = 0
    nack_cnt_vld = 0
    fct_cnt_vld = 0
    sif_cnt_vld = 0
    data_frame_cnt_vld = 0
    bc_frame_cnt_vld = 0

    in_data_frame = 0
    in_bc_frame = 0
    crc_8 = "00000000"
    crc_16 = "1111111111111111"
    error_list = ""
    line_cnt = 0
    seq_num = None
    for line in file:
        line_cnt +=1
        input_splitted = line.split(';')
        if input_splitted[-1] == "\n":
            input_splitted.remove("\n")
        elif '\n' in input_splitted[-1]:
            input_splitted[-1] = input_splitted[-1].replace("\n", "")

        
        if len(input_splitted) == 4:
            if len(input_splitted[0]) == 8:
        
                if in_data_frame == 1 and in_bc_frame == 0 and ((input_splitted[0][6:8] != "1C" and input_splitted[0][6:8] != "7C" and input_splitted[0][4:8] != "A2FC" and input_splitted[0][4:8] != "BBFC" and input_splitted[0][0:8] != "CFCFCEFC" and input_splitted[0][0:8] != "7F7FCEFC") or input_splitted[1] != "0001"):
                    crc_16 = tb.spacefibre_random_generator_data_link.compute_crc_16(f"{int(input_splitted[0][6:8], base = 16):0>8b}", crc_16)
                    crc_16 = tb.spacefibre_random_generator_data_link.compute_crc_16(f"{int(input_splitted[0][4:6], base = 16):0>8b}", crc_16)
                    crc_16 = tb.spacefibre_random_generator_data_link.compute_crc_16(f"{int(input_splitted[0][2:4], base = 16):0>8b}", crc_16)
                    crc_16 = tb.spacefibre_random_generator_data_link.compute_crc_16(f"{int(input_splitted[0][0:2], base = 16):0>8b}", crc_16)

                if in_bc_frame == 1 and ((input_splitted[0][6:8] != "5C"and input_splitted[0][6:8] != "7C" and input_splitted[0][4:8] != "A2FC" and input_splitted[0][4:8] != "BBFC" and input_splitted[0][0:8] != "CFCFCEFC" and input_splitted[0][0:8] != "7F7FCEFC") or input_splitted[1] != "0001"):
                    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{int(input_splitted[0][6:8], base = 16):0>8b}", crc_8)
                    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{int(input_splitted[0][4:6], base = 16):0>8b}", crc_8)
                    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{int(input_splitted[0][2:4], base = 16):0>8b}", crc_8)
                    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{int(input_splitted[0][0:2], base = 16):0>8b}", crc_8)
                
                #ACK
                if input_splitted[0][4:8] == "A2FC" and input_splitted[1] == "0001":
                    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{int(input_splitted[0][6:8], base = 16):0>8b}")
                    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{int(input_splitted[0][4:6], base = 16):0>8b}", crc_8)
                    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{int(input_splitted[0][2:4], base = 16):0>8b}", crc_8)
                    crc_8 = tb.spacefibre_random_generator_data_link.invert_string(crc_8)
                    if f"{int(input_splitted[0][0:2], base = 16):0>8b}" != crc_8:
                        ack_cnt += 1
                        error_cnt += 1
                        error_list += "\t" + str(line_cnt) + "\tcrc valid : " + crc_8 + "\n"
                    else :
                        ack_cnt_vld += 1


                #NACK
                if input_splitted[0][4:8] == "BBFC" and input_splitted[1] == "0001":
                    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{int(input_splitted[0][6:8], base = 16):0>8b}")
                    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{int(input_splitted[0][4:6], base = 16):0>8b}", crc_8)
                    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{int(input_splitted[0][2:4], base = 16):0>8b}", crc_8)
                    crc_8 = tb.spacefibre_random_generator_data_link.invert_string(crc_8)
                    if f"{int(input_splitted[0][0:2], base = 16):0>8b}" != crc_8:
                        nack_cnt += 1
                        error_cnt += 1
                        error_list += "\t" + str(line_cnt) + "\tcrc valid : " + crc_8 + "\n"
                    else :
                        nack_cnt_vld += 1

                #FCT
                if input_splitted[0][6:8] == "7C" and input_splitted[1] == "0001":
                    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{int(input_splitted[0][6:8], base = 16):0>8b}")
                    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{int(input_splitted[0][4:6], base = 16):0>8b}", crc_8)
                    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{int(input_splitted[0][2:4], base = 16):0>8b}", crc_8)
                    crc_8 = tb.spacefibre_random_generator_data_link.invert_string(crc_8)
                    if f"{int(input_splitted[0][0:2], base = 16):0>8b}" != crc_8:
                        fct_cnt += 1
                        error_cnt += 1
                        error_list += "\t" + str(line_cnt) + "\tcrc valid : " + crc_8 + "\n"
                    else :
                        fct_cnt_vld += 1
                    if seq_num == None:
                        seq_num = input_splitted[0][2:4]

                #SIF
                if input_splitted[0][4:8] == "84FC" and input_splitted[1] == "0001":
                    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{int(input_splitted[0][6:8], base = 16):0>8b}")
                    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{int(input_splitted[0][4:6], base = 16):0>8b}", crc_8)
                    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{int(input_splitted[0][2:4], base = 16):0>8b}", crc_8)
                    crc_8 = tb.spacefibre_random_generator_data_link.invert_string(crc_8)
                    in_data_frame = 0
                    in_bc_frame = 0
                    if f"{int(input_splitted[0][0:2], base = 16):0>8b}" != crc_8:
                        sif_cnt += 1
                        error_cnt += 1
                        error_list += "\t" + str(line_cnt) + "\tcrc valid : " + crc_8 + "\n"
                    else:
                        sif_cnt_vld += 1

                #SDF
                if input_splitted[0][4:8] == "50FC" and input_splitted[1] == "0001":
                    crc_16 = tb.spacefibre_random_generator_data_link.compute_crc_16(f"{int(input_splitted[0][6:8], base = 16):0>8b}")
                    crc_16 = tb.spacefibre_random_generator_data_link.compute_crc_16(f"{int(input_splitted[0][4:6], base = 16):0>8b}", crc_16)
                    crc_16 = tb.spacefibre_random_generator_data_link.compute_crc_16(f"{int(input_splitted[0][2:4], base = 16):0>8b}", crc_16)
                    crc_16 = tb.spacefibre_random_generator_data_link.compute_crc_16(f"{int(input_splitted[0][0:2], base = 16):0>8b}", crc_16)
                    in_data_frame = 1

                #EDF
                if input_splitted[0][6:8] == "1C" and input_splitted[1] == "0001" and in_data_frame == 1:
                    crc_16 = tb.spacefibre_random_generator_data_link.compute_crc_16(f"{int(input_splitted[0][6:8], base = 16):0>8b}", crc_16)
                    crc_16 = tb.spacefibre_random_generator_data_link.compute_crc_16(f"{int(input_splitted[0][4:6], base = 16):0>8b}", crc_16)
                    crc_16 = tb.spacefibre_random_generator_data_link.invert_string(crc_16)
                    in_data_frame = 0
                    if f"{int(input_splitted[0][0:4], base = 16):0>16b}" != crc_16:
                        data_frame_cnt += 1
                        error_cnt += 1
                        error_list += "\t" + str(line_cnt) + "\tcrc valid : " + crc_16 + "\n"
                    else:
                        data_frame_cnt_vld += 1

                #SBF
                if input_splitted[0][4:8] == "5DFC" and input_splitted[1] == "0001":
                    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{int(input_splitted[0][6:8], base = 16):0>8b}")
                    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{int(input_splitted[0][4:6], base = 16):0>8b}", crc_8)
                    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{int(input_splitted[0][2:4], base = 16):0>8b}", crc_8)
                    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{int(input_splitted[0][0:2], base = 16):0>8b}", crc_8)
                    in_bc_frame = 1

                #EBF
                if (input_splitted[0][6:8] == "5C" or input_splitted[0][6:8] == "BC") and input_splitted[1] == "0001" and in_bc_frame == 1:
                    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8("01011100", crc_8)
                    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{int(input_splitted[0][4:6], base = 16):0>8b}", crc_8)
                    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{int(input_splitted[0][2:4], base = 16):0>8b}", crc_8)
                    crc_8 = tb.spacefibre_random_generator_data_link.invert_string(crc_8)
                    in_bc_frame = 0
                    if f"{int(input_splitted[0][0:2], base = 16):0>8b}" != crc_8:
                        bc_frame_cnt += 1
                        error_cnt += 1
                        error_list += "\t" + str(line_cnt) + "\tcrc valid : " + crc_8 +"\n"
                    else:
                        bc_frame_cnt_vld += 1
        

    file.close()
    if error_cnt > 0:
        tb.logger.error("sim_time %d ns: %d CRC error in %s" \
        "\n\t%d ACK error" \
        "\n\t%d NACK error" \
        "\n\t%d FCT error" \
        "\n\t%d SIF error" \
        "\n\t%d EDF error" \
        "\n\t%d EBF error" \
        "\nlist of erronated line:\n%s", get_sim_time(units = "ns"), error_cnt, path, ack_cnt, nack_cnt, fct_cnt, sif_cnt, data_frame_cnt, bc_frame_cnt, error_list)
        return 1
    else:
        tb.logger.info("sim_time %d ns: no CRC error in %s" \
        "\n\t%d ACK valid" \
        "\n\t%d NACK valid" \
        "\n\t%d FCT valid" \
        "\n\t%d SIF valid" \
        "\n\t%d EDF valid" \
        "\n\t%d EBF valid", get_sim_time(units = "ns"), path, ack_cnt_vld, nack_cnt_vld, fct_cnt_vld, sif_cnt_vld, data_frame_cnt_vld, bc_frame_cnt_vld)
        return 0



async def send_idle_ctrl_word(tb, number_of_words):
    """
    Send number_of_words IDLE control word to the RX port of the SpaceFibreLight IP
    """
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
    ### Step 1: Check transmission of frame and insertion of control words ###
    ##########################################################################
    ##########################################################################
    ##########################################################################

    step_1_failed = 0
    #Sets DUT lane initialisation FSM to Active

    fct_monitor = cocotb.start_soon(tb.spacefibre_random_generator_data_link.monitor_FCT(20000))

    await initialization_procedure(tb, "reference/spacefibre_serial/monitor_step_1")

    monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_1", number_of_word = 20+66*8+23))

    #Send first FCT to each virtual channel
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+1):0>7b}")


    #Send a packet of 255 bytes on each virtual channel
    await configure_gen_vc_dl(tb, [0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])

    await start_gen_vc_dl(tb)

    #Maintain RX link alive
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/100_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/100_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/100_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/100_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/100_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/3_IDLE.dat", file_format = 16)

    await (monitor)

    monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_1", number_of_word = 5000))


    #Send FCT to each virtual channel
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+9):0>7b}")

    #Send a pseudo-random number of packet of pseudo-random size on each virtual channel
    await configure_model_dl(tb, 3, [0x08,0x04,0x00,0x00], [0x00,0x00,0x00,0x01])
    await configure_model_dl(tb, 5, [0x04,0x08,0x00,0x00], [0x00,0x00,0x00,0x02])
    await configure_model_dl(tb, 7, [0x02,0x10,0x00,0x00], [0x00,0x00,0x00,0x03])
    await configure_model_dl(tb, 9, [0x10,0x02,0x00,0x00], [0x00,0x00,0x00,0x04])
    await configure_model_dl(tb, 11, [0x08,0x04,0x00,0x00], [0x00,0x00,0x00,0x05])
    await configure_model_dl(tb, 13, [0x04,0x08,0x00,0x00], [0x00,0x00,0x00,0x06])
    await configure_model_dl(tb, 15, [0x02,0x10,0x00,0x00], [0x00,0x00,0x00,0x07])
    await configure_model_dl(tb, 17, [0x10,0x02,0x00,0x00], [0x00,0x00,0x00,0x08])

    await start_gen_vc_dl(tb)

    #Maintain RX link alive
    await send_idle_ctrl_word(tb, 1000)


    #Send a broadcast frame on TX
    await configure_model_dl(tb, 19, [0x01,0x01,0x00,0x00], [0x00,0x00,0x00,0x42])
    await start_model_dl(tb, 19)

    await send_idle_ctrl_word(tb, 100)



    #Send FCT to each virtual channel
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+17):0>7b}")


    #Send a broadcast frame on TX during a data frame
    await configure_model_dl(tb, 3, [0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])
    await start_model_dl(tb, 3)


    await configure_model_dl(tb, 19, [0x01,0x01,0x00,0x00], [0x00,0x00,0x00,0x43])
    await start_model_dl(tb, 19)
    
    #Maintain RX link alive
    await send_idle_ctrl_word(tb, 200)



    #Send FCT to each virtual channel
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+25):0>7b}")

    #wait for idle frame (100 words)
    await send_idle_ctrl_word(tb, 200)




    #Send a broadcast frame on TX
    await configure_model_dl(tb, 19, [0x01,0x01,0x00,0x00], [0x00,0x00,0x00,0x42])
    await start_model_dl(tb, 19)

    #wait for idle frame (32 words)
    #Maintain RX link alive
    await send_idle_ctrl_word(tb, 200)

    


    #Send a data frame on TX
    await configure_gen_vc_dl(tb, [0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])

    await start_gen_vc_dl(tb)

    #Maintain RX link alive
    await send_idle_ctrl_word(tb, 2000)


    await monitor

    await fct_monitor 

    tb.spacefibre_random_generator_data_link.fct_counter = [0]*8
    
    if step_1_failed == 0:
        tb.logger.info("simulation time %d ns : step 1 result: Pass", get_sim_time(units = 'ns'))
    else:
        test_failed = 1
        tb.logger.error("simulation time %d ns : step 1 result: Failed", get_sim_time(units = 'ns'))


    ##########################################################################
    ##########################################################################
    ##########################################################################
    ###########        Step 2: Check NACK and ACK insertion        ###########
    ##########################################################################
    ##########################################################################
    ##########################################################################
    
    step_2_failed = 0

    fct_monitor = cocotb.start_soon(tb.spacefibre_random_generator_data_link.monitor_FCT(30000))
    
    await initialization_procedure(tb, "reference/spacefibre_serial/monitor_step_2")

    monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_2", number_of_word = 13000))

    #Send first FCT to each virtual channel
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+1):0>7b}")

    #send 64 word on each virtual buffer on TX
    await configure_gen_vc_dl(tb, [0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])

    #Receive 1 packet of 64 word on each virtual buffer on RX
    for model in range(8):
        await configure_model_dl(tb, 4+2*model, [0xE1,0x1F,0x00,0x01], [0x2A,0x00,0x00,0x00])
        await start_model_dl(tb, 4+2*model)

    await start_gen_vc_dl(tb)

    #Send 1 packet of 64 word in frames of 64 word on each virtual buffer to RX
    for target in range(8):
        await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/step_2_1_" + str(target), 255, 1, 64, 0, target, target + 8, delay = 0, invert_polarity = 0, seed = 42)

    await send_idle_ctrl_word(tb, 20)


    # Check ACK Request

    #Send FCT
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+17):0>7b}")

    #send 64 word on each virtual buffer on TX
    await configure_gen_vc_dl(tb,[0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])


    #Receive 3 packet of 30 word on each virtual buffer on RX
    for model in range(8):
        await configure_model_dl(tb, 4+2*model, [0x03,0x0F,0x00,0x01], [0x2B,0x00,0x00,0x00])
        await start_model_dl(tb, 4+2*model)

    await start_gen_vc_dl(tb)

    #Send 3 packet of 30 word in frames of 5 words on each virtual buffer to RX
    for target in range(8):
        await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/step_2_2_" + str(target), 120, 3, 5, 0, target, (18*target + 24)%128, delay = 0, invert_polarity = 0, seed = 43)


    await send_idle_ctrl_word(tb, 20)

    
    #Check ACK Request (every 15 word)

    #Send FCT
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{((x+169)%128):0>7b}")

    #Receive 3 packet of 30 word on each virtual buffer on RX
    for model in range(8):
        await configure_model_dl(tb, 4+2*model, [0x03,0x0F,0x00,0x01], [0x2B,0x00,0x00,0x00])
        await start_model_dl(tb, 4+2*model)



    #Send 3 packet of 30 word in frames of 5 words on each virtual buffer to RX
    for target in range(8):
        await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/step_2_3_" + str(target), 120, 3, 5, 0, target, (18*target + 176)%128, delay = 0, invert_polarity = 0, seed = 43)


    await send_idle_ctrl_word(tb, 20)

    #Check ACK Request (every 15 word)


    #Receive 1 packet of 25 words on virtual channel 0 on RX 
    await configure_model_dl(tb, 4, [0x21,0x03,0x00,0x01], [0x2D,0x00,0x00,0x00])
    await start_model_dl(tb, 4)

    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/step_2_4_" + str(0), 100, 1, 5, 0, 0, 320%128, delay = 0, invert_polarity = 0, seed = 45)

    #Check ACK Request (every 15 word)

    #Send FCT
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{((x+326)%128):0>7b}")

    #Send a data frame with a wrong CRC    
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/CRC_error.dat")

    #Check NACK request

    #Receive 1 packet of 30 words on virtual channel 0 on RX
    await configure_model_dl(tb, 4, [0x01,0x0F,0x00,0x01], [0x2E,0x00,0x00,0x00])
    await start_model_dl(tb, 4)

    #Send 1 packet of 30 word in frames of 3 words on virtual channel 0 to RX
    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/step_2_5_" + str(0), 120, 1, 3, 0, 0, 333%128, sequence_polarity = 1, delay = 0, invert_polarity = 0, seed = 46)

    #Check ACK

    #Send FCT
    for x in range(8):
        await send_FCT(tb, x, 0, "1"+ f"{(x+344%128):0>7b}")

    #Send a data frame with a wrong SEQ_NUM
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/SEQ_NUM_error.dat")

    #Check NACK

    await configure_model_dl(tb, 4, [0x01,0x0F,0x00,0x01], [0x2F,0x00,0x00,0x00])
    await start_model_dl(tb, 4)

    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/step_2_6_" + str(0), 120, 1, 3, 0, 0, 351%128, delay = 0, invert_polarity = 0, seed = 47)

    #Check ACK

    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+362%128):0>7b}")

    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/RXERR_error_1.dat")
    await write_10b_to_Rx(tb, "1101110111")
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/RXERR_error_2.dat")

    #Check NACK

    await configure_model_dl(tb, 4, [0x01,0x0F,0x00,0x01], [0x2F,0x00,0x00,0x00])
    await start_model_dl(tb, 4)

    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/step_2_7_" + str(0), 120, 1, 3, 0, 0, 369%128, sequence_polarity = 1, delay = 0, invert_polarity = 0, seed = 47)

    #Check ACK

    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Pos_seq_error.dat")

    #Check NACK

    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Neg_seq_error.dat")

    #Check NACK

    await configure_model_dl(tb, 20, [0x01,0x02,0x00,0x00], [0x2F,0x00,0x00,0x00])
    await start_model_dl(tb, 20)

    #Send Broadcast Frame
    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/step_2_8_" + str(0), 0x000000300000002F, 1, 0, 1, 0, 379%128, sequence_polarity = 0, delay = 0, invert_polarity = 0, seed = 47)

    #Check ACK

    #Send FULL controle word
    await send_full(tb, "1"+ f"{(380%128):0>7b}")

    #Check ACK

    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/100_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/100_IDLE.dat", file_format = 16)
    
    await send_idle_ctrl_word(tb, 8000)

    await monitor
    await fct_monitor 
    tb.spacefibre_random_generator_data_link.fct_counter = [0]*8



    if step_2_failed == 0:
        tb.logger.info("simulation time %d ns : step 2 result: Pass", get_sim_time(units = 'ns'))
    else:
        test_failed = 1
        tb.logger.error("simulation time %d ns : step 2 result: Failed", get_sim_time(units = 'ns'))

    ##########################################################################
    ##########################################################################
    ##########################################################################
    ###########     Step 3: Check CRC and SEQ_NUMBER generation    ###########
    ##########################################################################
    ##########################################################################
    ##########################################################################

    step_3_failed = 0

    # monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_3", number_of_word = 2500))
    fct_monitor = cocotb.start_soon(tb.spacefibre_random_generator_data_link.monitor_FCT(20000))

    await initialization_procedure(tb, "reference/spacefibre_serial/monitor_step_3_init")
    
    #artificial fix of sink limitation
    await Timer(15, units = 'fs')
    
    monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_3", number_of_word = 2500))
    #Send first FCT to each virtual channel
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+1):0>7b}")
    
    #Check FCT and SEQ NUM and CRC

    await configure_gen_vc_dl(tb, [0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])

    await start_gen_vc_dl(tb)

    await send_idle_ctrl_word(tb, 64*8+20)

    #Check data frame SEQ NUM and CRC

    await configure_model_dl(tb, 19, [0x01,0x01,0x00,0x00], [0x2E,0x00,0x00,0x00])
    await start_model_dl(tb, 19)

    await send_idle_ctrl_word(tb, 24)

    #Check broadcast frame SEQ NUM and CRC

    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+9):0>7b}")
    
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/CRC_error_bis.dat")


    #Check NACK SEQ NUM and CRC

    await configure_model_dl(tb, 3, [0xE1,0x1F,0x00,0x01], [0x2E,0x00,0x00,0x00])
    await start_model_dl(tb, 3)

    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/step_3_1_" + str(0), 255, 1, 64, 0, 0, 16, sequence_polarity = 1, delay = 0, invert_polarity = 0, seed = 0x2E)

    await send_idle_ctrl_word(tb, 20)

    #Check ACK SEQ NUM and CRC

    for x in range(8):
        await send_FCT(tb, x, 0, "1"+ f"{(x+19):0>7b}")


    await configure_gen_vc_dl(tb,[0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])

    await start_gen_vc_dl(tb)

    await send_idle_ctrl_word(tb, 64*8+20)

    #Check data frame SEQ NUM and CRC

    await configure_model_dl(tb, 19, [0x01,0x01,0x00,0x01], [0x2E,0x00,0x00,0x00])
    await start_model_dl(tb, 19)

    await send_idle_ctrl_word(tb, 24)

    #Check broadcast frame SEQ NUM and CRC

    await send_idle_ctrl_word(tb, 4000)

    
    await monitor


    result = check_CRC(tb, "reference/spacefibre_serial/monitor_step_3_hexa.dat")

    await fct_monitor
    tb.spacefibre_random_generator_data_link.fct_counter = [0]*8


    if result == 1:
        step_3_failed = 1

    if step_3_failed == 0:
        tb.logger.info("simulation time %d ns : step 3 result: Pass", get_sim_time(units = 'ns'))
    else:
        test_failed = 1
        tb.logger.error("simulation time %d ns : step 3 result: Failed", get_sim_time(units = 'ns'))

    ##########################################################################
    ##########################################################################
    ##########################################################################
    ###########     Step 4: Check output buffers flow control      ###########
    ##########################################################################
    ##########################################################################
    ##########################################################################

    step_4_failed = 0

    fct_monitor = cocotb.start_soon(tb.spacefibre_random_generator_data_link.monitor_FCT(20000))


    await initialization_procedure(tb, "reference/spacefibre_serial/monitor_step_4")

    monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_4", number_of_word = 15000+64*80))

    #Check that FCT are sent for each virtual buffer

    await configure_gen_vc_dl(tb,[0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])

    await start_gen_vc_dl(tb)

    await send_idle_ctrl_word(tb, 1000)

    #Check transmission of idle frame

    #Send first FCT to each virtual channel
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+1):0>7b}")

    await send_idle_ctrl_word(tb, 64*8+50)
    #Check transmission of data frame

    #Send two packets of 64 word to each buffer
    await configure_gen_vc_dl(tb,[0xE2,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])

    await start_gen_vc_dl(tb)

    await send_idle_ctrl_word(tb, 1000)
    #Check transmission of idle frame

    #Send first FCT to each virtual channel
    for x in range(4):
        await send_FCT(tb, 2*x, 0, "0"+ f"{(x+9):0>7b}")

    await send_idle_ctrl_word(tb, 64*4+500)
    #Check transmission of 1 out of 2 data frame on half the channels

    for x in range(4):
        await send_FCT(tb, 2*x+1, 0, "0"+ f"{(x+13):0>7b}")

    #Check transmission of 1 out of 2 data frame on other half the channels

    await send_idle_ctrl_word(tb, 64*4+500)

    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+17):0>7b}")

    #Check transmission of remaining frames on all channels

    await send_idle_ctrl_word(tb, 64*8+500)


    #Send a packets of 32 word to each buffer
    await configure_gen_vc_dl(tb,[0xE1,0x0F,0x00,0x00], [0x00,0x00,0x00,0x00])

    await start_gen_vc_dl(tb)

    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+25):0>7b}")
    
    await send_idle_ctrl_word(tb, 32*8+500)
    #Check reception of a frame of 32 word on each channel
    
    #Send 3 packets of 32 word to each buffer
    await configure_gen_vc_dl(tb,[0xE3,0x0F,0x00,0x00], [0x00,0x00,0x00,0x00])

    await start_gen_vc_dl(tb)

    await send_idle_ctrl_word(tb, 32*8+500)

    #Check reception of a frame of 32 word on each channel

    await send_idle_ctrl_word(tb, 200)

    #Send FCT to each buffer
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+33):0>7b}")

    await send_idle_ctrl_word(tb, 64*8+500)

    #Check reception of a frame of 64 word on each channel


    #Send two FCT to each buffer
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+41):0>7b}")

    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+49):0>7b}")
    
    #Send two packets of 64 word to each buffer
    await configure_gen_vc_dl(tb,[0xE2,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])

    await start_gen_vc_dl(tb)

    await send_idle_ctrl_word(tb, 64*16 + 500)
    #Check reception of two frame of 64 word on each channel


    #Send a FCT of multiplier value 1 to each buffer
    for x in range(8):
        await send_FCT(tb, x, 1, "0"+ f"{(x+57):0>7b}")
    
    #Send two packets of 64 word to each buffer
    await configure_gen_vc_dl(tb,[0xE2,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])

    await start_gen_vc_dl(tb)

    await send_idle_ctrl_word(tb, 64*16 + 500)
    #Check reception of two frame of 64 word on each channel

    await send_idle_ctrl_word(tb, 6200)

    await fct_monitor 
    tb.spacefibre_random_generator_data_link.fct_counter = [0]*8

    if step_4_failed == 0:
        tb.logger.info("simulation time %d ns : step 4 result: Pass", get_sim_time(units = 'ns'))
    else:
        test_failed = 1
        tb.logger.error("simulation time %d ns : step 4 result: Failed", get_sim_time(units = 'ns'))

    ##########################################################################
    ##########################################################################
    ##########################################################################
    ###########       Step 5: Check output buffers competiton      ###########
    ##########################################################################
    ##########################################################################
    ##########################################################################


    step_5_failed = 0

    fct_monitor = cocotb.start_soon(tb.spacefibre_random_generator_data_link.monitor_FCT(10000))

    await initialization_procedure(tb, "reference/spacefibre_serial/monitor_step_5")
    
    monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_5", number_of_word = 300+64*16+8+100))
    
    #Send first FCT to each virtual channel
    
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+1):0>7b}")

    #Check that FCT are sent for each virtual buffer

    await configure_gen_vc_dl(tb, [0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])

    await configure_model_dl(tb, 19, [0x01,0x02,0x00,0x01], [0x2E,0x00,0x00,0x00])

    x = [cocotb.start_soon(start_model_dl(tb, 19))]

    x += [cocotb.start_soon(start_gen_vc_dl(tb))]

    await Combine(*x)

    await send_idle_ctrl_word(tb, 64*8+4+50)

    #Check transmission data and broadcast frame, check order of virtual

    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+9):0>7b}")

    await configure_model_dl(tb, 3, [0x08,0x04,0x00,0x00], [0x00,0x00,0x00,0x03])
    await configure_model_dl(tb, 7, [0x02,0x10,0x00,0x00], [0x00,0x00,0x00,0x07])
    await configure_model_dl(tb, 11, [0x08,0x04,0x00,0x00], [0x00,0x00,0x00,0x11])
    await configure_model_dl(tb, 15, [0x02,0x10,0x00,0x00], [0x00,0x00,0x00,0x15])
    await configure_model_dl(tb, 19, [0x01,0x02,0x00,0x01], [0x3E,0x00,0x00,0x00])

    await start_model_dl(tb, 3)
    await start_model_dl(tb, 7)
    await start_model_dl(tb, 11)
    await start_model_dl(tb, 15)
    await start_model_dl(tb, 19)

    await send_idle_ctrl_word(tb, 64*4+4+50)
    #Check transmission data, check order of virtual
    
    await send_idle_ctrl_word(tb, 6000)

    await monitor

    await fct_monitor
    tb.spacefibre_random_generator_data_link.fct_counter = [0]*8

    if step_5_failed == 0:
        tb.logger.info("simulation time %d ns : step 5 result: Pass", get_sim_time(units = 'ns'))
    else:
        test_failed = 1
        tb.logger.error("simulation time %d ns : step 5 result: Failed", get_sim_time(units = 'ns'))


    ##########################################################################
    ##########################################################################
    ##########################################################################
    ###########     Step 6: Check continuous mode output buffers   ###########
    ##########################################################################
    ##########################################################################
    ##########################################################################

    step_6_failed = 0

    fct_monitor = cocotb.start_soon(tb.spacefibre_random_generator_data_link.monitor_FCT(10000))

    await initialization_procedure(tb, "reference/spacefibre_serial/monitor_step_6")
    
    monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_6", number_of_word = 13000+200+31*64+7*16*64+100+16*64+100))

    #Enable Continuous mode on virtual channel 0
    Data_read_dl_config_parameters.data = bytearray([0x04, 0x40, 0x00, 0x00])

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    #Send data continuously on virtual channel 0
    await configure_model_dl(tb, 3, [0xF0,0x1F,0x00,0x00], [0x00,0x00,0x00,0x2A])
    await start_model_dl(tb, 3)
    
    # Maintain RX link alive
    for x in range (16):
        await send_FCT(tb,0,0,"0" + f"{(x+1):0>7b}")
        await send_idle_ctrl_word(tb, 64)

    await send_idle_ctrl_word(tb, 2000)


    Data_read_dl_config_parameters.data = bytearray([0x24, 0x40, 0x00, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)
    
    await stimuli 

    for x in range(8):
        await configure_model_dl(tb, 3, [0x90,0x00,0x00,0x00], [0x00,0x00,0x2A,0x00])
        await start_model_dl(tb, 3)
        await send_idle_ctrl_word(tb, 16)
    
    await send_idle_ctrl_word(tb, 10)

    for x in range (16):
        await send_FCT(tb,0,0,"0" + f"{(x+17):0>7b}")
        await send_idle_ctrl_word(tb, 64)

    await send_idle_ctrl_word(tb, 4000)


    Data_read_dl_config_parameters.data = bytearray([0x04, 0x40, 0x00, 0x00])

    stimuli = cocotb.start_soon(send_idle_ctrl_word(tb, 10))

    await tb.masters[0].write_data(Data_read_dl_config_parameters)

    await stimuli

    #Check that Data Frame are received

    await configure_gen_vc_dl(tb, [0xF0,0x1F,0x00,0x01], [0x00,0x00,0x00,0x00])
    await configure_model_dl(tb, 3, [0xFF,0x1F,0x00,0x00], [0x00,0x00,0x00,0x2A])
    await configure_model_dl(tb, 5, [0xF0,0x1F,0x00,0x00], [0x00,0x00,0xFF,0x00])
    await start_gen_vc_dl(tb)

    for x in range (16):
        for y in range (8):
            await send_FCT(tb,y,0,"0" + f"{((8*x+y+33)%128):0>7b}")
        await send_idle_ctrl_word(tb, 64*8)


    for x in range(15):
        await send_FCT(tb,0,0,"0" + f"{((x+8*16+33)%128):0>7b}")
        await send_idle_ctrl_word(tb, 64)
    await send_idle_ctrl_word(tb, 100)
    
    #Check EEP insertion

    await send_idle_ctrl_word(tb, 8000)
    tb.spacefibre_random_generator_data_link.fct_counter = [0]*8

    await fct_monitor 

    if step_6_failed == 0:
        tb.logger.info("simulation time %d ns : step 6 result: Pass", get_sim_time(units = 'ns'))
    else:
        test_failed = 1
        tb.logger.error("simulation time %d ns : step 6 result: Failed", get_sim_time(units = 'ns'))

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

    if step_3_failed == 0:
        tb.logger.info("simulation time %d ns : step 3 result: Pass",get_sim_time(units="ns"))
    else:
        tb.logger.error("simulation time %d ns : step 3 result: Failed", get_sim_time(units="ns"))

    if step_4_failed == 0:
        tb.logger.info("simulation time %d ns : step 4 result: Pass",get_sim_time(units="ns"))
    else:
        tb.logger.error("simulation time %d ns : step 4 result: Failed", get_sim_time(units="ns"))

    if step_5_failed == 0:
        tb.logger.info("simulation time %d ns : step 5 result: Pass",get_sim_time(units="ns"))
    else:
        tb.logger.error("simulation time %d ns : step 5 result: Failed", get_sim_time(units="ns"))

    if step_6_failed == 0:
        tb.logger.info("simulation time %d ns : step 6 result: Pass",get_sim_time(units="ns"))
    else:
        tb.logger.error("simulation time %d ns : step 6 result: Failed", get_sim_time(units="ns"))

    if test_failed == 1:
        raise TestFailure

