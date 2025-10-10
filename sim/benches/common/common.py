##########################################################################
## COMPANY       : CNES
##########################################################################
## TITLE         : common.py
## PROJECT       : SPACE FIBRE LIGHT
##########################################################################
## AUTHOR        : Thomas FAVRE-FELIX
## CREATED       : 03/10/2024
##########################################################################
## DESCRIPTION   : Contains TB base class for verification of the SpaceFibre_Light IP
##########################################################################
## History       :	V1.0: Creation of the file
##########################################################################

import logging
import random
import os
from pathlib import Path
import cocotb
import cocotbext
from cocotb.clock import Clock
from cocotb.triggers import Edge, RisingEdge, FallingEdge, Timer, Join, Combine
from cocotb.utils import get_sim_time
from cocotbext.axi import AxiStreamBus, AxiLiteBus

from framework import   AxiStreamSource, AxiStreamSink, AxiStreamMonitor, AxiBus, \
                        AxiMaster, AxiLiteMaster, AxiRam, AxiLiteRam, \
                        AxiMonitor, AxiLiteMonitor, Data

from SpaceFibre_Driver import SpaceFibre_Driver
from SpaceFibre_Random_Generator import SpaceFibre_Random_Generator
from SpaceFibre_Sink import SpaceFibre_Sink
from SpaceFibre_Loopback import SpaceFibre_Loopback

target = os.environ.get('HARDWARE_TARGET')

#Frequency definition
if target == "VERSAL" :
    SpaceFibre_IP_freq = 150_000_000
    SpaceFibre_serial_port_freq = 6_000_000_000

    SpaceFibre_IP_period_ns = 1_000_000_000/150_000_000
    SpaceFibre_serial_port_period_ns = 1_000_000_000/6_000_000_000


    SpaceFibre_IP_period_ps_int = int(1_000_000_000_000_000/150_000_000)
    SpaceFibre_serial_port_period_ps_int = int(1_000_000_000_000_000/6_000_000_000)

    SpaceFibre_GTY_period_ps_int = int(1_000_000_000_000_000/100_000_000)

elif target == "NG_ULTRA" :
    SpaceFibre_IP_freq = 78_125_000
    SpaceFibre_serial_port_freq = 6_250_000_000

    SpaceFibre_IP_period_ns = 1_000_000_000/78_125_000
    SpaceFibre_serial_port_period_ns = 1_000_000_000/6_250_000_000


    SpaceFibre_IP_period_ps_int = int(1_000_000_000_000_000/78_125_000)
    SpaceFibre_serial_port_period_ps_int = int(1_000_000_000_000_000/6_250_000_000)

    SpaceFibre_GTY_period_ps_int = int(1_000_000_000_000_000/156_250_000)
else :
    print ("\n\nno valid hardware target\n\n target specified is ", target, "\n\n")

#Lane initialisation state machine state encoding
CLEARLINE="0000"
DISABLED="0001"
WAIT="0010"
STARTED="0011"
INVERTRXPOLARITY="0100"
CONNECTING="0101"
CONNECTED="0110"
ACTIVE="0111"
PREPARESTANDBY="1000"
LOSSOFSIGNAL="1001"

#Creation of data for read request on configurator registers
Data_read_phy_config_parameters= Data.build_empty(0x00, 4)
Data_read_lane_config_parameters= Data.build_empty(0x04, 4)
Data_read_lane_config_status= Data.build_empty(0x08, 4)

#Testbench implementation
class TB:

    def __init__(self, dut):
        self.dut = dut
        self.dut_Rx_disparity = [-1]
        self.dut_Tx_disparity = [-1]

        #building clock
        self.clock = Clock(dut.CLK, SpaceFibre_IP_period_ps_int, units = "fs")
        cocotb.start_soon(self.clock.start(start_high = False))

        self.clock_gty_p = Clock(dut.CLK_HSSL_P, SpaceFibre_GTY_period_ps_int, units = "fs")
        cocotb.start_soon(self.clock_gty_p.start(start_high = True))

        self.clock_gty_n = Clock(dut.CLK_HSSL_N, SpaceFibre_GTY_period_ps_int, units = "fs")
        cocotb.start_soon(self.clock_gty_n.start(start_high = False))

        #building Axi, AxiLite and AxiStream environments
        self.bus_in = []
        self.masters = []
        self.monitors_in = []

        #logger instantiation
        self.logger = logging.getLogger('Testbench')
        self.logger.setLevel(logging.INFO)

        ch = logging.StreamHandler()
        ch.setLevel(logging.INFO)

        #logging format, message must include simulation time by calling get_sim_time(units = 'ns') 
        formatter = logging.Formatter('%(filename)s at line %(lineno)s - %(levelname)s - %(message)s')

        ch.setFormatter(formatter)

        self.logger.addHandler(ch)

        self.spacefibre_sink = SpaceFibre_Sink(dut, self.dut_Rx_disparity, self.dut_Tx_disparity, self.logger, SpaceFibre_serial_port_period_ps_int)
        self.spacefibre_driver = SpaceFibre_Driver(dut, self.dut_Rx_disparity, self.dut_Tx_disparity, self.logger, SpaceFibre_serial_port_period_ps_int)
        self.spacefibre_random_generator = SpaceFibre_Random_Generator(dut, self.dut_Rx_disparity, self.dut_Tx_disparity, self.logger, SpaceFibre_serial_port_period_ps_int)
        self.spacefibre_loopback = SpaceFibre_Loopback(dut, self.dut_Rx_disparity, self.dut_Tx_disparity, self.logger, SpaceFibre_serial_port_period_ps_int)
    
    async def reset_global(self):
        """
        Active reset of the testbench for 10 ns.
        """
        self.logger.info("sim_time %d ns: Reset is active for 40 ns", get_sim_time(units = 'ns') )
        self.dut.RST_N.value = 0
        await Timer(40, units="ns")
        self.dut.RST_N.value = 1


    async def init_phy_layer(self):
        """
        Await full initialisation process of the physical layer of the IP.
        """
        self.dut.RX_POS.value = cocotb.types.Logic("Z")
        self.dut.RX_NEG.value = cocotb.types.Logic("Z")
        await self.reset()
    

    def write_monitor_data(self):
        """
        Writes the data of all the stimuli loggers to their assigned directory.
        To call at the end of the simulation (or in the middle for an update if needed).
        """
        self.logger.info("sim_time %d ns: Write logger to directory", get_sim_time(units = 'ns') )
        for m_in in self.monitors_in:
            m_in.default_stimuli_logger.write_to_dir()