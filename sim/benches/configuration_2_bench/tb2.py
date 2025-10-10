##########################################################################
## COMPANY       : CNES
##########################################################################
## TITLE         : tb2.py
## PROJECT       : SPACE FIBRE LIGHT
##########################################################################
## AUTHOR        : Thomas FAVRE-FELIX
## CREATED       : 05/03/2025
##########################################################################
## DESCRIPTION   : Contains TB class for verification of the SpaceFibre_Light IP
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
from python_model_data_link.SpaceFibre_Random_Generator_Data_Link import SpaceFibre_Random_Generator as Data_Link_SpaceFibre_Random_Generator
from SpaceFibre_Sink import SpaceFibre_Sink
from SpaceFibre_Loopback import SpaceFibre_Loopback

import common
from common import SpaceFibre_IP_freq, SpaceFibre_serial_port_freq, SpaceFibre_IP_period_ns, \
                   SpaceFibre_serial_port_period_ns, SpaceFibre_IP_period_ps_int, SpaceFibre_serial_port_period_ps_int

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
Data_read_general_control = Data.build_empty(0x00, 4)
Data_read_phy_config_parameters= Data.build_empty(0x04, 4)
Data_read_lane_config_parameters= Data.build_empty(0x08, 4)
Data_read_lane_config_status= Data.build_empty(0x0C, 4)
Data_read_dl_config_parameters= Data.build_empty(0x10, 4)
Data_read_dl_config_status_1= Data.build_empty(0x14, 4)
Data_read_dl_config_status_2= Data.build_empty(0x18, 4)
Data_read_dl_config_QoS_1= Data.build_empty(0x1C, 4)
Data_read_dl_config_QoS_2= Data.build_empty(0x20, 4)
Data_read_dl_config_err_mngt= Data.build_empty(0x24, 4)

#Creation of data for read and write request on lane_generator registers
Data_lane_gen_config = Data.build_empty(0x00, 4)
Data_lane_gen_control = Data.build_empty(0x04, 4)
Data_lane_gen_status = Data.build_empty(0x08, 4)
Data_lane_gen_seed = Data.build_empty(0x0C, 4)

#Creation of data for read and write request on lane_analyser register
Data_lane_ana_config = Data.build_empty(0x00, 4)
Data_lane_ana_control = Data.build_empty(0x04, 4)
Data_lane_ana_status = Data.build_empty(0x08, 4)
Data_lane_ana_seed = Data.build_empty(0x0C, 4)

#Testbench implementation
class TB(common.TB):

    def __init__(self, dut):
        super().__init__(dut)
        self.dut = dut
        self.dut_Rx_disparity = [-1]
        self.dut_Tx_disparity = [-1]
        self.spacefibre_random_generator_data_link=Data_Link_SpaceFibre_Random_Generator(dut, self.dut_Rx_disparity, self.dut_Tx_disparity, self.logger, SpaceFibre_serial_port_period_ps_int)

        #building AxiLite
        names = {
                "S_CON_AXI": [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor], 

                "S_GEN_LANE_AXI": [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor], 
                "S_ANA_LANE_AXI": [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor],

                "S_GEN_0_AXI": [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor], 
                "S_ANA_0_AXI": [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor],

                "S_GEN_1_AXI": [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor], 
                "S_ANA_1_AXI": [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor],

                "S_GEN_2_AXI": [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor], 
                "S_ANA_2_AXI": [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor],

                "S_GEN_3_AXI": [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor], 
                "S_ANA_3_AXI": [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor],

                "S_GEN_4_AXI": [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor], 
                "S_ANA_4_AXI": [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor],

                "S_GEN_5_AXI": [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor], 
                "S_ANA_5_AXI": [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor],

                "S_GEN_6_AXI": [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor], 
                "S_ANA_6_AXI": [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor],

                "S_GEN_7_AXI": [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor], 
                "S_ANA_7_AXI": [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor],

                "S_GEN_8_AXI": [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor], 
                "S_ANA_8_AXI": [AxiLiteBus, AxiLiteMaster, AxiLiteMonitor],
                
        }

        
        for name, type in names.items():
            self.bus_in.append(type[0].from_prefix(dut, name))

            self.masters.append(type[1](self.bus_in[-1], dut.CLK, dut.RST_N, reset_active_level = False))


            self.monitors_in.append(type[2](self.bus_in[-1], dut.CLK, dut.RST_N, reset_active_level = False))

    async def reset(self):
        """
        Active reset of the testbench for 10 ns. 
        Release DUT reset.
        """
        await self.reset_global()
        Data_read_general_control.data = bytearray( [0x00,0x00,0x00,0x00])
        await self.masters[0].write_data(Data_read_general_control)
        Data_read_general_control.data = bytearray( [0x01,0x00,0x00,0x00])
        await self.masters[0].write_data(Data_read_general_control)
        self.logger.info("sim_time %d ns: Wait reset completion", get_sim_time(units = 'ns') )
        await RisingEdge(self.dut.spacefibre_instance.RST_TXCLK_N)
        # await RisingEdge(self.dut.spacefibre_instance.gen_inst_phy_plus_lane.inst_phy_plus_lane.RST_TX_DONE)
        self.logger.info("sim_time %d ns: Reset completed", get_sim_time(units = 'ns') )

    async def reset_DUT(self):
        """
        Active reset of the DUT for 10 ns. 
        Release DUT reset.
        """
        Data_read_general_control.data = bytearray( [0x00,0x00,0x00,0x00])
        await self.masters[0].write_data(Data_read_general_control)
        Data_read_general_control.data = bytearray( [0x01,0x00,0x00,0x00])
        await self.masters[0].write_data(Data_read_general_control)
        self.logger.info("sim_time %d ns: Wait reset completion", get_sim_time(units = 'ns') )
        await RisingEdge(self.dut.spacefibre_instance.RST_TXCLK_N)
        # await RisingEdge(self.dut.spacefibre_instance.gen_inst_phy_plus_lane.inst_phy_plus_lane.RST_TX_DONE)
        self.logger.info("sim_time %d ns: Reset completed", get_sim_time(units = 'ns') )

    async def reset_DUT_lane_only(self):
        """
        Active reset of the DUT for 10 ns. 
        Release DUT reset with the Data link 
        disabled and the injector and spy enabled. 
        """
        Data_read_general_control.data = bytearray( [0x06,0x00,0x00,0x00])
        await Timer(4, units = "us")
        await self.masters[0].write_data(Data_read_general_control)
        Data_read_general_control.data = bytearray( [0x07,0x00,0x00,0x00])
        await self.masters[0].write_data(Data_read_general_control)
        self.logger.info("sim_time %d ns: Wait reset completion", get_sim_time(units = 'ns') )
        await RisingEdge(self.dut.spacefibre_instance.RST_TXCLK_N)
        # await RisingEdge(self.dut.spacefibre_instance.gen_inst_phy_plus_lane.inst_phy_plus_lane.RST_TX_DONE)
        self.logger.info("sim_time %d ns: Reset completed", get_sim_time(units = 'ns') )

    
    async def reset_lane_only(self):
        """
        Active reset of the testbench for 10 ns. 
        Release DUT reset with the Data link 
        disabled and the injector and spy enabled. 
        """
        await self.reset_global()
        Data_read_general_control.data = bytearray( [0x06,0x00,0x00,0x00])
        await self.masters[0].write_data(Data_read_general_control)
        Data_read_general_control.data = bytearray( [0x07,0x00,0x00,0x00])
        await self.masters[0].write_data(Data_read_general_control)
        self.logger.info("sim_time %d ns: Wait reset completion", get_sim_time(units = 'ns') )
        await RisingEdge(self.dut.spacefibre_instance.RST_TXCLK_N)
        # await RisingEdge(self.dut.spacefibre_instance.gen_inst_phy_plus_lane.inst_phy_plus_lane.RST_TX_DONE)
        self.logger.info("sim_time %d ns: Reset completed", get_sim_time(units = 'ns') )
         