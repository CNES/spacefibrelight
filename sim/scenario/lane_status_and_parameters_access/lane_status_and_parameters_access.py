##########################################################################
## COMPANY       : CNES
##########################################################################
## TITLE         : lane_status_and_parameters_access.py
## PROJECT       : SPACE FIBRE LIGHT
##########################################################################
## AUTHOR        : Thomas FAVRE-FELIX
## CREATED       : 02/10/2024
##########################################################################
## DESCRIPTION   : Runs tests for verification of the SpaceFibre_Light IP
##                 status and parameters access in configuration 1
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


async def init_to_active(tb):
    """
    Sets the DUT Lane initialisation FSM to Active state
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

    #Check that Lane initialisatiion FSM is in Active State
    await tb.masters[0].read_data(Data_read_lane_config_status)




async def test_register(register_data, tb):
    """
    Read a register, request to write the binary opposite value, then check if it has ben modified or not.
    Return a map of which bits have been modified.
    """

    #Read register value
    await tb.masters[0].read_data(register_data)
    data_1 = register_data.data

    #Create Data to write opposite value
    size = register_data.length
    data_2 = bytearray(size)
    for c in range(len(data_1)):
        data_2[c] = data_1[c] ^ 0xFF
        c+=1
    data_3 = Data(register_data.addr, data_2)

    #Write in register the opposite value
    await tb.masters[0].write_data(data_3)

    #Read new value of the register
    await tb.masters[0].read_data(register_data)
    data_2 = register_data.data

    #Check which bits have been modified
    for c in range(len(data_2)):
        data_2[c] = data_1[c] ^ data_2[c]
    return data_2

@cocotb.test()
async def cocotb_run(dut):

    dir_path = os.path.dirname(os.path.realpath(__file__))
    clean_dir(os.path.join(dir_path,"reference/spacefibre_serial"))

    #Instantiation of the testbench and first reset of the DUT
    tb = TB(dut)
    await Timer( 1 , units = "us")
    await tb.reset_lane_only()

    #Specific variable for the scenario
    global test_failed 
    lane_status_spec = bytearray([0x00, 0x00, 0x00, 0x00])
    lane_parameter_spec = bytearray([0xFF, 0xEF, 0xFF, 0xFF])
    phy_parameter_spec = bytearray([0xFF, 0xFF, 0xFF, 0xFF])
    if target == "VERSAL":
        ##########################################################################
        #Step 1: access lane layer status register
        ##########################################################################

        #Sets DUT lane initialisation FSM to Active
        await init_to_active(tb)
                    
        #test access to lane status register
        lane_status_result = await test_register(Data_read_lane_config_status, tb)

        if lane_status_result == lane_status_spec:
            tb.logger.info("simulation time %d ns : step 1 result: Pass",get_sim_time(units="ns"))
        else:
            test_failed = 1
            tb.logger.error("simulation time %d ns : step 1 result: Failed\nLane_status : %s\nExpected : %s", get_sim_time(units="ns"), lane_status_result, lane_status_spec)

        ##########################################################################
        #Step 2: access lane layer parameters register
        ##########################################################################

        #Sets DUT lane initialisation FSM to Active
        await init_to_active(tb)

        #test access to lane parameter register
        lane_parameter_result = await test_register(Data_read_lane_config_parameters, tb)

        if lane_parameter_result == lane_parameter_spec:
            tb.logger.info("simulation time %d ns : step 2 result: Pass",get_sim_time(units="ns"))
        else:
            test_failed = 1
            tb.logger.error("simulation time %d ns : step 2 result: Failed\nLane_parameters : %s\nExpected : %s", get_sim_time(units="ns"), lane_parameter_result, lane_parameter_spec)

        ##########################################################################
        #Step 3: access phy layer parameters register
        ##########################################################################

        #Sets DUT lane initialisation FSM to Active
        await init_to_active(tb)

        #test access to phy status register
        phy_parameter_result = await test_register(Data_read_phy_config_parameters, tb)
        
        if phy_parameter_result == phy_parameter_spec:
            tb.logger.info("simulation time %d ns : step 3 result: Pass",get_sim_time(units="ns"))
        else:
            test_failed = 1
            tb.logger.error("simulation time %d ns : step 3 result: Failed\nPhy_parameters : %s\nExpected : %s", get_sim_time(units="ns"), phy_parameter_result, phy_parameter_spec)

        #writting the monitors loggers
        tb.write_monitor_data()

        #print results of test
        tb.logger.info("simulation time %d ns : TEST RESULTS :",get_sim_time(units="ns"))
        if lane_status_result == lane_status_spec:
            tb.logger.info("simulation time %d ns : step 1 result: Pass",get_sim_time(units="ns"))
        else:
            tb.logger.error("simulation time %d ns : step 1 result: Failed\nLane_status : %s\nExpected : %s", get_sim_time(units="ns"), lane_status_result, lane_status_spec)

        if lane_parameter_result == lane_parameter_spec:
            tb.logger.info("simulation time %d ns : step 2 result: Pass",get_sim_time(units="ns"))
        else:
            tb.logger.error("simulation time %d ns : step 2 result: Failed\nLane_status : %s\nExpected : %s", get_sim_time(units="ns"), lane_parameter_result, lane_parameter_spec)

        if phy_parameter_result == phy_parameter_spec:
            tb.logger.info("simulation time %d ns : step 3 result: Pass",get_sim_time(units="ns"))
        else:
            tb.logger.error("simulation time %d ns : step 3 result: Failed\nLane_status : %s\nExpected : %s", get_sim_time(units="ns"), phy_parameter_result, phy_parameter_spec)

    elif target == "NG_ULTRA" :
        tb.logger.info("simulation time %d ns : Test lane_status_and_parameters_access is not tested for NG ULTRA target",get_sim_time(units="ns"))


    if test_failed == 1:
        raise TestFailure