##########################################################################
## COMPANY       : CNES
##########################################################################
## TITLE         : SpaceFibre_Loopback.py
## PROJECT       : SPACE FIBRE LIGHT
##########################################################################
## AUTHOR        : Thomas FAVRE-FELIX
## CREATED       : 20/09/2024
##########################################################################
## DESCRIPTION   : Contains SpaceFibre_Loopback class for serial port
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


class SpaceFibre_Loopback:

    def __init__(self, dut, dut_Rx_disparity, dut_Tx_disparity, logger, period_ps):
        self.dut = dut
        self.dut_Rx_disparity = dut_Rx_disparity
        self.dut_Tx_disparity = dut_Tx_disparity
        self.logger = logger
        self.time_per_input = period_ps

    async def loopback(self, nb_of_symbole, invert_polarity = 0):
        """
        Send the bit received on the Tx port of the SpaceFibre IP directly to the Rx port of the SpaceFibre IP
        This is realised for nb_of_symbole symboles
        """
        time_per_input = self.time_per_input
        for i in range(nb_of_symbole):
            data = ""
            variation = random.randint(0, 2)
            if variation > 0:
                variation = 1
            for j in range(10):
                data = self.dut.TX_POS.value.binstr + data
                for k in range(5):
                    if invert_polarity == 0:
                        self.dut.RX_POS.value = self.dut.TX_POS.value
                        self.dut.RX_NEG.value = self.dut.TX_NEG.value
                    else:
                        self.dut.RX_NEG.value = self.dut.TX_POS.value
                        self.dut.RX_POS.value = self.dut.TX_NEG.value
                    await Timer(time_per_input//5, units = "fs")
                await Timer(time_per_input%5 + variation, units = "fs")
            ls_encoded_data = data[0:6]
            ms_encoded_data = data[6:10]
            disparity_1 = 0
            disparity_2 = 0

            for a in ls_encoded_data:
                if a != "Z" and a != "X":
                    disparity_1 += int(a)
            for a in ms_encoded_data:
                if a != "Z" and a != "X":
                    disparity_2 += int(a)

            if disparity_1 > 3:
                # self.dut_Tx_disparity[0] += 2
                self.dut_Rx_disparity[0] += 2
            elif disparity_1 < 3:
                # self.dut_Tx_disparity[0] -= 2
                self.dut_Rx_disparity[0] -= 2
            else:
                if ls_encoded_data == "000111" :
                    # self.dut_Tx_disparity -= 2
                    self.dut_Rx_disparity[0] -= 2
                elif ls_encoded_data == "111000" :
                    # self.dut_Tx_disparity += 2
                    self.dut_Rx_disparity[0] += 2
            


            if disparity_2 > 2:
                # self.dut_Tx_disparity[0] += 2
                self.dut_Rx_disparity[0] += 2
            elif disparity_2 < 2:
                # self.dut_Tx_disparity[0] -= 2
                self.dut_Rx_disparity[0] -= 2
            else:
                if ms_encoded_data == "0011" :
                    # self.dut_Tx_disparity[0] -= 2
                    self.dut_Rx_disparity[0] -= 2
                elif ms_encoded_data == "1100" :
                    # self.dut_Tx_disparity[0] += 2
                    self.dut_Rx_disparity[0] += 2