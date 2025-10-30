##########################################################################
## COMPANY       : CNES
##########################################################################
## TITLE         : SpaceFibre_Sink.py
## PROJECT       : SPACE FIBRE LIGHT
##########################################################################
## AUTHOR        : Thomas FAVRE-FELIX
## CREATED       : 20/09/2024
##########################################################################
## DESCRIPTION   : Contains SpaceFibre_Sink class for serial port
##########################################################################
## History       :	V1.0: Creation of the file
##########################################################################

import logging
import random
import os
from pathlib import Path
import asyncio
import cocotb
import cocotbext
from cocotb.clock import Clock
from cocotb.triggers import Edge, RisingEdge, FallingEdge, Timer, Join, Combine
from cocotb.utils import get_sim_time
from cocotbext.axi import AxiStreamBus, AxiLiteBus

from framework import   AxiStreamSource, AxiStreamSink, AxiStreamMonitor, AxiBus, \
                        AxiMaster, AxiLiteMaster, AxiRam, AxiLiteRam, \
                        AxiMonitor, AxiLiteMonitor, Data


target = os.environ.get("HARDWARE_TARGET")

class SpaceFibre_Sink:

    def __init__(self, dut, dut_Rx_disparity, dut_Tx_disparity, logger, period_ps):
        self.dut = dut
        self.dut_Rx_disparity = dut_Rx_disparity
        self.dut_Tx_disparity = dut_Tx_disparity
        self.logger = logger
        self.time_per_output = period_ps

    
    async def read_from_Tx(self, previous_buffer = ""):
        """
        Read data received on the Tx port of the SpaceFibreLight IP encoded
        on 10bits and return it after deserializing and deencoding it to 8bits.
        """
        time_per_output = self.time_per_output
        data = previous_buffer
        realigned = 0
        variation = random.randint(0, 2)
        if variation > 0:
            variation = 1
        if target == "NG_ULTRA":
            variation = 0
        for t in range(10):
            if not self.dut.TX_POS.value.binstr == "Z" and self.dut.TX_NEG.value.binstr == "Z":
                if not self.dut.TX_POS.value == (self.dut.TX_NEG.value^1):
                    self.logger.error("sim_time %d ns: Tx+ and Tx- are not of opposite value", get_sim_time(units = 'ns'))
            # data = self.dut.TX_POS.value.binstr + data
            data = data + self.dut.TX_POS.value.binstr


            if len(data) > 10:
                data = data[1:]
                # data = data[:-1]
            await Timer(time_per_output + variation, units="fs")

            #realignement procedure
            pos_comma_index = data.find("0011111")
            neg_comma_index = data.find("1100000")
            
            if neg_comma_index == 0 and len(data) >= 10:
                realigned = 1
                break  
            if pos_comma_index == 0 and len(data) >= 10:
                realigned = 1
                break  

        self.logger.debug("sim_time %d ns: Read result before decoder is %s", get_sim_time(units = "ns"), data)
        if not "Z" in data:
            decoded_data = self.decode(data)
            self.logger.debug("sim_time %d ns: Read result after decoder is %s", get_sim_time(units = "ns"), decoded_data)
        else :
            self.logger.debug("sim_time %d ns: No decoder since High Impedance detected", get_sim_time(units = "ns"))
            decoded_data = ("00000000", 1)
        return decoded_data, data, realigned
        
    async def read_to_file(self, file_path, number_of_word, previous_buffer = ""):
        """
        Read data from the Tx port and write the input to two files which path is 'file_path'_bin.dat and 'file_path'_hexa.dat
        """
        time_per_output = self.time_per_output
        file_path_bin= file_path + "_bin.dat"
        if os.path.exists(file_path_bin):
            self.logger.info("sim_time %d ns: Source file %s for binary format already exist, open in append mode for sink", get_sim_time(units = "ns"), file_path_bin)
            output_file_bin = open(file_path_bin, "a")
        else:
            self.logger.info("sim_time %d ns: Creating file %s to receive binary format data from sink", get_sim_time(units = "ns"), file_path_bin)
            output_file_bin = open(file_path_bin, "a")

        file_path_hexa= file_path + "_hexa.dat"
        if os.path.exists(file_path_hexa):
            self.logger.info("sim_time %d ns: Source file %s for hexa format already exist, open in append mode for sink", get_sim_time(units = "ns"), file_path_hexa)
            output_file_hexa = open(file_path_hexa, "a")
        else:
            self.logger.info("sim_time %d ns: Creating file %s to receive hexa format data from sink", get_sim_time(units = "ns"), file_path_hexa)
            output_file_hexa = open(file_path_hexa, "a")

        file_path_10b= file_path + "_10b.dat"  
        if os.path.exists(file_path_10b):
            self.logger.info("sim_time %d ns: Source file %s for binary format already exist, open in append mode for sink", get_sim_time(units = "ns"), file_path_10b)
            output_file_10b = open(file_path_10b, "a")
        else:
            self.logger.info("sim_time %d ns: Creating file %s to receive binary format data from sink", get_sim_time(units = "ns"), file_path_10b)
            output_file_10b = open(file_path_10b, "a")
        for i in range(number_of_word):
            try :
                word = ""
                word_bin = ""
                word_10b = ""
                k_encoded_word = ""
                j = 0
                word_realigned = 0
                buffer = previous_buffer
                while j < 4:
                    (data, k_encoded), buffer, realigned = await self.read_from_Tx(previous_buffer = buffer)
                    
                    if realigned == 1 and j != 0:
                        output_file_bin.write((word_bin + ";" + k_encoded_word + ";" + str(time_per_output) + ";" + str(word_realigned) + "\n"))
                        output_file_10b.write((word_10b + ";" + k_encoded_word + ";" + str(time_per_output) + ";" + str(word_realigned) + ";" + str(get_sim_time(units = "ns")) + "\n"))
                        if len(k_encoded_word) == 3:
                            output_file_hexa.write((f"{int(word, base = 2):0>6X}" + ";" + k_encoded_word + ";" + str(time_per_output) + ";" + str(word_realigned) + "\n"))
                        if len(k_encoded_word) == 2:
                            output_file_hexa.write((f"{int(word, base = 2):0>4X}" + ";" + k_encoded_word + ";" + str(time_per_output) + ";" + str(word_realigned) + "\n"))
                        if len(k_encoded_word) == 1:
                            output_file_hexa.write((f"{int(word, base = 2):0>2X}" + ";" + k_encoded_word + ";" + str(time_per_output) + ";" + str(word_realigned) + "\n"))
                        word = data
                        word_bin = data
                        word_10b = buffer
                        k_encoded_word = str(k_encoded)
                        j = 0
                    else:
                        word = data + word
                        word_bin = data + "_" + word_bin
                        word_10b = buffer + "_" + word_10b
                        k_encoded_word = str(k_encoded) + k_encoded_word
                    if realigned == 1 :
                        word_realigned = 1
                    j += 1
                previous_buffer = buffer
                output_file_bin.write((word_bin + ";" + k_encoded_word + ";" + str(time_per_output) + ";" + str(word_realigned) + "\n"))
                output_file_10b.write((word_10b + ";" + k_encoded_word + ";" + str(time_per_output) + ";" + str(word_realigned) + ";" + str(get_sim_time(units = "ns")) + "\n"))
                output_file_hexa.write((f"{int(word, base = 2):0>8X}" + ";" + k_encoded_word + ";" + str(time_per_output) + ";" + str(word_realigned) + "\n"))
                output_file_bin.flush()
                output_file_10b.flush()
                output_file_hexa.flush()
            except asyncio.CancelledError:
                output_file_hexa.close()
                output_file_bin.close()
                output_file_10b.close()
                return buffer


        output_file_bin.close()
        output_file_10b.close()
        output_file_hexa.close()
        return buffer

    def decode(self, data):
        """
        Receive a 10bits symbole and decode it to 8bits character using 8b/10b encoding,
        indicating if it was a control word aswell
        """
        
        #separate the 5b/6b part to the 3b/4b
        ls_encoded_data = data[0:6]
        ms_encoded_data = data[6:10]

        #boolean, inform if character was a control word symbole
        k_encoded = 0

        primary = 1

        #decode 5b/6b
        if ls_encoded_data == "100111" :
            ls_decoded_data = "00000"
            self.dut_Tx_disparity[0] +=2
        elif ls_encoded_data == "011000" :
            ls_decoded_data = "00000"
            self.dut_Tx_disparity[0] -=2
        elif ls_encoded_data == "011101" :
            ls_decoded_data = "00001"
            self.dut_Tx_disparity[0] +=2
        elif ls_encoded_data == "100010" :
            ls_decoded_data = "00001"
            self.dut_Tx_disparity[0] -=2
        elif ls_encoded_data == "101101" :
            ls_decoded_data = "00010"
            self.dut_Tx_disparity[0] +=2
        elif ls_encoded_data == "010010" :
            ls_decoded_data = "00010"
            self.dut_Tx_disparity[0] -=2
        elif ls_encoded_data == "110001" :
            ls_decoded_data = "00011"
        elif ls_encoded_data == "110101" :
            ls_decoded_data = "00100"
            self.dut_Tx_disparity[0] +=2
        elif ls_encoded_data == "001010" :
            ls_decoded_data = "00100"
            self.dut_Tx_disparity[0] -=2
        elif ls_encoded_data == "101001" :
            ls_decoded_data = "00101"
        elif ls_encoded_data == "011001" :
            ls_decoded_data = "00110"
        elif ls_encoded_data == "111000" :
            ls_decoded_data = "00111"
        elif ls_encoded_data == "000111" :
            ls_decoded_data = "00111"
        elif ls_encoded_data == "111001" :
            ls_decoded_data = "01000"
            self.dut_Tx_disparity[0] +=2
        elif ls_encoded_data == "000110" :
            ls_decoded_data = "01000"
            self.dut_Tx_disparity[0] -=2
        elif ls_encoded_data == "100101" :
            ls_decoded_data = "01001"
        elif ls_encoded_data == "010101" :
            ls_decoded_data = "01010"
        elif ls_encoded_data == "110100" :
            ls_decoded_data = "01011"
            if self.dut_Tx_disparity[0] > 0:
                primary = 0
        elif ls_encoded_data == "001101" :
            ls_decoded_data = "01100"
        elif ls_encoded_data == "101100" :
            ls_decoded_data = "01101"
            if self.dut_Tx_disparity[0] > 0:
                primary = 0
        elif ls_encoded_data == "011100" :
            ls_decoded_data = "01110"
            if self.dut_Tx_disparity[0] > 0:
                primary = 0
        elif ls_encoded_data == "010111" :
            ls_decoded_data = "01111"
            self.dut_Tx_disparity[0] +=2
        elif ls_encoded_data == "101000" :
            ls_decoded_data = "01111"
            self.dut_Tx_disparity[0] -=2
        elif ls_encoded_data == "011011" :
            ls_decoded_data = "10000"
            self.dut_Tx_disparity[0] +=2
        elif ls_encoded_data == "100100" :
            ls_decoded_data = "10000"
            self.dut_Tx_disparity[0] -=2
        elif ls_encoded_data == "100011" :
            ls_decoded_data = "10001"
            if self.dut_Tx_disparity[0] < 0:
                primary = 0
        elif ls_encoded_data == "010011" :
            ls_decoded_data = "10010"
            if self.dut_Tx_disparity[0] < 0:
                primary = 0
        elif ls_encoded_data == "110010" :
            ls_decoded_data = "10011"
        elif ls_encoded_data == "001011" :
            ls_decoded_data = "10100"
            if self.dut_Tx_disparity[0] < 0:
                primary = 0
        elif ls_encoded_data == "101010" :
            ls_decoded_data = "10101"
        elif ls_encoded_data == "011010" :
            ls_decoded_data = "10110"
        elif ls_encoded_data == "111010" :
            ls_decoded_data = "10111"
            self.dut_Tx_disparity[0] +=2
            k_encoded = -1
        elif ls_encoded_data == "000101" :
            ls_decoded_data = "10111"
            self.dut_Tx_disparity[0] -=2
            k_encoded = -1
        elif ls_encoded_data == "110011" :
            ls_decoded_data = "11000"
            self.dut_Tx_disparity[0] +=2
        elif ls_encoded_data == "001100" :
            ls_decoded_data = "11000"
            self.dut_Tx_disparity[0] -=2
        elif ls_encoded_data == "100110" :
            ls_decoded_data = "11001"
        elif ls_encoded_data == "010110" :
            ls_decoded_data = "11010"
        elif ls_encoded_data == "110110" :
            ls_decoded_data = "11011"
            self.dut_Tx_disparity[0] +=2
            k_encoded = -1
        elif ls_encoded_data == "001001" :
            ls_decoded_data = "11011"
            self.dut_Tx_disparity[0] -=2
            k_encoded = -1
        elif ls_encoded_data == "001110" :
            ls_decoded_data = "11100"
        elif ls_encoded_data == "101110" :
            ls_decoded_data = "11101"
            self.dut_Tx_disparity[0] +=2
            k_encoded = -1
        elif ls_encoded_data == "010001" :
            ls_decoded_data = "11101"
            self.dut_Tx_disparity[0] -=2
            k_encoded = -1
        elif ls_encoded_data == "011110" :
            ls_decoded_data = "11110"
            self.dut_Tx_disparity[0] +=2
            k_encoded = -1
        elif ls_encoded_data == "100001" :
            ls_decoded_data = "11110"
            self.dut_Tx_disparity[0] -=2
            k_encoded = -1
        elif ls_encoded_data == "101011" :
            ls_decoded_data = "11111"
            self.dut_Tx_disparity[0] +=2
        elif ls_encoded_data == "010100" :
            ls_decoded_data = "11111"
            self.dut_Tx_disparity[0] -=2
        elif ls_encoded_data == "001111" :
            ls_decoded_data = "11100"
            self.dut_Tx_disparity[0] +=2
            k_encoded = 1
        elif ls_encoded_data == "110000" :
            ls_decoded_data = "11100"
            self.dut_Tx_disparity[0] -=2
            k_encoded = 1
        else:
            ls_decoded_data = "00000"
            self.logger.warning("sim_time %s ns : Invalid symbole on sub-block 5b/6b. Sub-block : %s", get_sim_time(units = 'ns'), ls_encoded_data)
            return "00000000" , 1

        #check disparity

        if not self.dut_Tx_disparity[0] <= 1:
            self.logger.warning("sim_time %s ns : Disparity on Tx port is too high after 5b/6b sub-block. Sub-block : %s\tdisparity : %d", get_sim_time(units = 'ns'), ls_encoded_data, self.dut_Tx_disparity[0])
            self.dut_Tx_disparity[0] = 1
        if not self.dut_Tx_disparity[0] >= -1:
            self.logger.warning("sim_time %s ns : Disparity on Tx port is too low after 5b/6b sub-block. Sub-block : %s\tdisparity : %d", get_sim_time(units = 'ns'), ls_encoded_data, self.dut_Tx_disparity[0])
            self.dut_Tx_disparity[0] = -1

        #decode 3b/4b

        if ms_encoded_data == "1011" :
            ms_decoded_data = "000"
            self.dut_Tx_disparity[0] +=2
        elif ms_encoded_data == "0100" :
            ms_decoded_data = "000"
            self.dut_Tx_disparity[0] -=2
        elif ms_encoded_data == "1001" :
            if k_encoded == 1 :
                if self.dut_Tx_disparity[0] >= 0 :
                    ms_decoded_data = "110"
                else :
                    ms_decoded_data = "001"
            else :
                ms_decoded_data = "001"
        elif ms_encoded_data == "0101" :
            if k_encoded == 1 :
                if self.dut_Tx_disparity[0] <= 0 :
                    ms_decoded_data = "101"
                else :
                    ms_decoded_data = "010"
            else :
                ms_decoded_data = "010"
        elif ms_encoded_data == "1100" :
            ms_decoded_data = "011"
        elif ms_encoded_data == "0011" :
            ms_decoded_data = "011"
        elif ms_encoded_data == "1101" :
            ms_decoded_data = "100"
            self.dut_Tx_disparity[0] +=2
        elif ms_encoded_data == "0010" :
            ms_decoded_data = "100"
            self.dut_Tx_disparity[0] -=2
        elif ms_encoded_data == "1010" :
            if k_encoded == 1 :
                if self.dut_Tx_disparity[0] >= 0 :
                    ms_decoded_data = "101"
                else :
                    ms_decoded_data = "010"
            else :
                ms_decoded_data = "101"
        elif ms_encoded_data == "0110" :
            if k_encoded == 1 :
                if self.dut_Tx_disparity[0] >= 0 :
                    ms_decoded_data = "001"
                else :
                    ms_decoded_data = "110"
            else : 
                ms_decoded_data = "110"
        elif ms_encoded_data == "1110" :
            ms_decoded_data = "111"
            self.dut_Tx_disparity[0] +=2
        elif ms_encoded_data == "0001" :
            ms_decoded_data = "111"
            self.dut_Tx_disparity[0] -=2
        elif ms_encoded_data == "0111" :
            if k_encoded == -1 or k_encoded == 1:
                ms_decoded_data = "111"
                self.dut_Tx_disparity[0] +=2
                k_encoded = 1
            else:
                ms_decoded_data = "111"
                self.dut_Tx_disparity[0] +=2
                if not primary == 0:
                    self.logger.error("sim_tim %s ns: Error K1: Alternative encoding of D.x.7 when uneeded. Sub block : %s", get_sim_time(units = 'ns'), ms_encoded_data)
        elif ms_encoded_data == "1000" :
            if k_encoded == -1 or k_encoded == 1:
                ms_decoded_data = "111"
                self.dut_Tx_disparity[0] -=2
                k_encoded = 1
            else:
                ms_decoded_data = "111"
                self.dut_Tx_disparity[0] -=2
                if not primary == 0:
                    self.logger.error("sim_time %s ns : Error K2: Alternative encoding of D.x.7 when uneeded. Sub block : %s", get_sim_time(units = 'ns'), ms_encoded_data)

        else :
            ms_decoded_data = "000"
            self.logger.warning("sim_time %s ns : Invalid symbole on sub-block 3b/4b. Sub block : %s", get_sim_time(units = 'ns'), ms_encoded_data)
            return "00000000" , 1

        if k_encoded == -1 :
            k_encoded = 0

        #check disparity
        if not self.dut_Tx_disparity[0] <= 1:
            self.logger.warning("sim_time %s ns : Disparity on Tx port is too high after 3b/4b sub-block. Sub-block : %s\tdisparity : %d", get_sim_time(units = 'ns'), ms_encoded_data, self.dut_Tx_disparity[0])
            self.dut_Tx_disparity[0] = 1
        if not self.dut_Tx_disparity[0] >= -1:
            self.logger.warning("sim_time %s ns : Disparity on Tx port is too low after 3b/4b sub-block. Sub-block : %s\tdisparity : %d", get_sim_time(units = 'ns'), ms_encoded_data, self.dut_Tx_disparity[0])
            self.dut_Tx_disparity[0] = -1
        return ms_decoded_data + ls_decoded_data , k_encoded
