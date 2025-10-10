##########################################################################
## COMPANY       : CNES
##########################################################################
## TITLE         : SpaceFibre_Random_Generator.py
## PROJECT       : SPACE FIBRE LIGHT
##########################################################################
## AUTHOR        : Thomas FAVRE-FELIX
## CREATED       : 20/09/2024
##########################################################################
## DESCRIPTION   : Contains SpaceFibre_Random_Generator class for serial port
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


target = os.environ.get('HARDWARE_TARGET')


def ceil(number):
    """return first int above or equal to number"""
    if number == int(number):
        return int(number)
    else :
        return int(number) +  1
class SpaceFibre_Random_Generator:

    def __init__(self, dut, dut_Rx_disparity, dut_Tx_disparity, logger, period_ps):
        self.dut = dut
        self.dut_Rx_disparity = dut_Rx_disparity
        self.dut_Tx_disparity = dut_Tx_disparity
        self.logger = logger
        self.time_per_input = period_ps
        self.time_per_output = period_ps
        self.fct_counter = [0]*8
        self.disable_disparity_control = 0
        if target == "NG_ULTRA":
            self.precision = "fs"
        elif target == "VERSAL":
            self.precision = "fs"


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


    async def monitor_FCT(self, number_of_word):
        """check for number_of_word period of time if an FCT is received, and modify the FCT counters accordingly"""
        data_received = ""
        buffer = ""
        previous_buffer = ""
        for i in range(number_of_word):
            word = ""
            word_bin = ""
            word_10b = ""
            k_encoded_word = ""
            j = 0
            buffer = previous_buffer
            while j < 4:
                (data, k_encoded), buffer, realigned = await self.read_from_Tx(previous_buffer = buffer)
                
                if realigned == 1 and j != 0:
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
                j += 1
            previous_buffer = buffer
            data_received = f"{int(word, base = 2):0>8X}"
            if data_received[6:8] == "7C" and k_encoded_word == "0001":
                channel = int(f"{(int(data_received[4:6], base = 16)):0>8b}"[3:8], base = 2)
                mult = int(f"{(int(data_received[4:6], base = 16)):0>8b}"[0:3], base = 2)
                if 0 <= channel < 8: 
                    self.fct_counter[channel] += 64 * (mult+1)
                    self.logger.info("sim_time %d ns: fct monitor \nmult: %d \nchannel: %d\nFull word : %s", get_sim_time(units = 'ns'), mult, channel, data_received)
                    self.logger.debug("sim_time %d ns: fct monitor: new FCT counter for channel %d: %d \n", get_sim_time(units = "ns"), channel, self.fct_counter[channel])
                else :
                    self.logger.warning("sim_time %d ns: fct monitor wrong channel \nmult: %d \nchannel: %d\nFull word : %s", get_sim_time(units = 'ns'), mult, channel, data_received)
        self.logger.info("sim_time %d ns: end of task fct monitor\n", get_sim_time(units = "ns"))

                



    def invert(self, encoded_data):
        """
        Take in input a encoded data as a string of bits of 0 or 1, and convert them to a list of integer,
        starting from lowest significant bit
        """
        inverted_data = []
        for x in range(len(encoded_data)):
            inverted_data = inverted_data + [int(encoded_data[x])]
        return inverted_data
    
    def invert_string(self, string):
        """
        Take in input a a string and return the same string read from the last character to the first.
        """
        inverted_data = ""
        for x in (string):
            inverted_data = x + inverted_data 
        return inverted_data
    
    def compute_crc_16(self, byte_input, crc_16 = "1111111111111111"):
        """
        Return the CRC-16bit after the byte_input has been taken into acount
        """
        for i in range(8):
            input = int(byte_input[7-i])
            input = int(crc_16[0]) ^ input
            crc_16 = crc_16[1 : 16] + "0"
            crc_16 = crc_16[0 : 3] + str(input^int(crc_16[3]))+crc_16[4:10] + str(input^int(crc_16[10])) + crc_16[11:15] + str(input)
        #####
        # generate debug file
        #####
        # output_file_bin = open("CRC_16_compute_step.debug", "a")
        # output_file_bin.write(f"{int(crc_16, base = 2):0>4X}" + "_" + str(get_sim_time(units = "ns")) + "\n")  
        # output_file_bin.close()
        return crc_16
    
    def compute_crc_8(self, byte_input, crc_8 = "00000000"):
        """
        Return the CRC-8bit after the byte_input has been taken into acount
        """
        for i in range(8):
            input = int(byte_input[7-i])
            input = int(crc_8[0]) ^ input
            crc_8 = crc_8[1 : 8] + "0"
            crc_8 = crc_8[0 : 5] + str(input^int(crc_8[5])) + str(input^int(crc_8[6])) + str(input)

        #####
        # generate debug file
        #####
        # output_file_bin = open("CRC_8_compute_step.debug", "a")
        # output_file_bin.write(f"{int(crc_8, base = 2):0>2X}" + "_" + str(get_sim_time(units = "ns")) + "\n")  
        # output_file_bin.close()
        return crc_8
    
    async def write_to_Rx(self, data, delay, k_encoding = 0, invert_polarity = 0):
        """
        Writes the given data encoded on 8bits to the Rx port of the SpaceFibreLight IP after
        encoding it to 10bits and serializing the data.
        """
        time_per_input = self.time_per_input
        self.logger.debug("sim_time %d ns: Data not encoded to be sent : %d", get_sim_time(units = "ns"), data)
        encoded_data = self.encode(data, k_encoding)
        self.logger.debug("sim_time %d ns: Data encoded to be sent : %d", get_sim_time(units = "ns"), encoded_data)
        serialized_data = self.invert(encoded_data)
        variation = random.randint(0, 2)
        if variation > 0:
            variation = 1
        if delay != 0:
            await Timer(delay, units=self.precision)
        for d in range(len(serialized_data)):
            if invert_polarity == 0:
                self.dut.RX_POS.value = serialized_data[d]
                self.dut.RX_NEG.value = serialized_data[d]^1
            else :
                self.dut.RX_POS.value = serialized_data[d]^1
                self.dut.RX_NEG.value = serialized_data[d]
            await Timer(time_per_input + variation, units=self.precision)
        self.logger.debug("sim_time %d ns: Data encoded sent : %d", get_sim_time(units = "ns"), encoded_data)
        return encoded_data, k_encoding

    async def write_random_inputs(self, file_path, packet_size, packet_number, frame_size, frame_type, target, sequence, sequence_polarity = 0, delay = 0, invert_polarity = 0, seed = 42, ignore_fct_monitor = 0):
        """
        Writes the given number of inputs data randomly generated based on the given seed to the Rx port
        of the SpaceFibreLight IP. A log file at file_path is created to record the generated data.
        """
        
        #assert that word have to be sent
        if packet_size != None:
            number_of_words = ceil((packet_number * packet_size)/4)

            assert number_of_words > 0, "Error : number of inputs must be greater than 0"
        assert self.time_per_input > 0, "Error : time per input must be greater than 0"
        
        
        self.logger.info("sim_time %d ns: Creating file %s to receive hexa format data from random generator", get_sim_time(units = "ns"), file_path)
        log_file = open(file_path, "w")

        log_file_10b = open(file_path+"_10b", "w")
        
        #initialize pseudo random generation with given seed
        word_binary = f"{seed:0>32b}"
        if delay != 0:
            await Timer(delay, units="ps")


        #send idle word 10 times for simu
        for i in range(10):
            data_to_log = ""
            k_encoded_to_log = ""

            data_10b, k_encoded = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            data_10b, k_encoded = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            data_10b, k_encoded = await self.write_to_Rx("11001111", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            data_10b, k_encoded = await self.write_to_Rx("11001111", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
            log_file.write("32;CFCFCEFC;0;0001;\n")

        word_counter_for_skip = 5000
        #check if skip needed
        if  word_counter_for_skip >= 5000:
            data_to_log = ""
            k_encoded_to_log = ""

            data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
            log_file.write("32;7F7FCEFC;0;0001;\n")
            word_counter_for_skip = 0
        current_frame_size = 0
        current_packet_size = 0
        target_num = target
        target = f"{(target):0>8b}"
        if frame_type==0: #if Data Frame

            while self.fct_counter[target_num] <= 0 and ignore_fct_monitor == 0:
                if word_counter_for_skip>= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0
                else :
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded = await self.write_to_Rx("11001111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded = await self.write_to_Rx("11001111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                    log_file.write("32;CFCFCEFC;0;0001;\n")
                    word_counter_for_skip += 1

            #send first SDF
            data_to_log = ""
            k_encoded_to_log = ""

            data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log
            crc_16 = self.compute_crc_16("11111100")

            data_10b, k_encoded  = await self.write_to_Rx("01010000", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log
            crc_16 = self.compute_crc_16("01010000", crc_16)

            data_10b, k_encoded  = await self.write_to_Rx(target, 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log
            crc_16 = self.compute_crc_16(target, crc_16)

            data_10b, k_encoded  = await self.write_to_Rx("00000000", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log
            crc_16 = self.compute_crc_16("00000000", crc_16)

            log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
            log_file.write("32;00"+f"{(int(target, 2)):0>2X}"+"50FC;0;0001;\n")
            word_counter_for_skip += 1
            current_packet_size = 0
            #send the number of packet needed
            for i in range(number_of_words-1):
                

                #check if skip needed
                if  word_counter_for_skip >= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0

                #check if EDF and SDF to be sent
                if current_frame_size == frame_size:
                    current_frame_size = 1
                    data_to_log = ""
                    k_encoded_to_log = ""
                    sequence += 1
                    
                    while self.fct_counter[target_num] <= 0 and ignore_fct_monitor == 0:
                        if word_counter_for_skip>= 5000:
                            data_to_log = ""
                            k_encoded_to_log = ""

                            data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                            data_to_log = data_10b + "_" + data_to_log
                            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                            data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                            data_to_log = data_10b + "_" + data_to_log
                            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                            data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                            data_to_log = data_10b + "_" + data_to_log
                            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                            data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                            data_to_log = data_10b + "_" + data_to_log
                            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                            log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                            log_file.write("32;7F7FCEFC;0;0001;\n")
                            word_counter_for_skip = 0
                        else :
                            data_to_log = ""
                            k_encoded_to_log = ""

                            data_10b, k_encoded = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                            data_to_log = data_10b + "_" + data_to_log
                            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                            data_10b, k_encoded = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                            data_to_log = data_10b + "_" + data_to_log
                            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                            data_10b, k_encoded = await self.write_to_Rx("11001111", 0, 0, invert_polarity = invert_polarity)
                            data_to_log = data_10b + "_" + data_to_log
                            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                            data_10b, k_encoded = await self.write_to_Rx("11001111", 0, 0, invert_polarity = invert_polarity)
                            data_to_log = data_10b + "_" + data_to_log
                            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                            log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                            log_file.write("32;CFCFCEFC;0;0001;\n")
                            word_counter_for_skip += 1

                    #Send EDF
                    data_10b, k_encoded  = await self.write_to_Rx("00011100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_16 = self.compute_crc_16("00011100", crc_16)

                    data_10b, k_encoded  = await self.write_to_Rx(str(sequence_polarity) + f"{(sequence%128):0>7b}", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_16 = self.compute_crc_16(str(sequence_polarity) + f"{(sequence%128):0>7b}", crc_16)

                    crc_16 = self.invert_string(crc_16)

                    data_10b, k_encoded  = await self.write_to_Rx(crc_16[8:16], 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx(crc_16[0:8], 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                    log_file.write("32;"+f"{(int(crc_16, 2)):0>4X}"+f"{(sequence%128 + 128 * sequence_polarity):0>2X}" + "1C;0;0001;\n")

                    word_counter_for_skip += 1
                
                    #check if skip needed
                    if  word_counter_for_skip >= 5000:
                        data_to_log = ""
                        k_encoded_to_log = ""

                        data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                        log_file.write("32;7F7FCEFC;0;0001;\n")
                        word_counter_for_skip = 0
                    

                    while self.fct_counter[target_num] <= 0 and ignore_fct_monitor == 0:
                        if word_counter_for_skip>= 5000:
                            data_to_log = ""
                            k_encoded_to_log = ""

                            data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                            data_to_log = data_10b + "_" + data_to_log
                            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                            data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                            data_to_log = data_10b + "_" + data_to_log
                            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                            data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                            data_to_log = data_10b + "_" + data_to_log
                            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                            data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                            data_to_log = data_10b + "_" + data_to_log
                            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                            log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                            log_file.write("32;7F7FCEFC;0;0001;\n")
                            word_counter_for_skip = 0
                        else :
                            data_to_log = ""
                            k_encoded_to_log = ""

                            data_10b, k_encoded = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                            data_to_log = data_10b + "_" + data_to_log
                            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                            data_10b, k_encoded = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                            data_to_log = data_10b + "_" + data_to_log
                            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                            data_10b, k_encoded = await self.write_to_Rx("11001111", 0, 0, invert_polarity = invert_polarity)
                            data_to_log = data_10b + "_" + data_to_log
                            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                            data_10b, k_encoded = await self.write_to_Rx("11001111", 0, 0, invert_polarity = invert_polarity)
                            data_to_log = data_10b + "_" + data_to_log
                            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                            log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                            log_file.write("32;CFCFCEFC;0;0001;\n")
                            word_counter_for_skip += 1

                    #send SDF
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_16 = self.compute_crc_16("11111100")

                    data_10b, k_encoded  = await self.write_to_Rx("01010000", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_16 = self.compute_crc_16("01010000", crc_16)

                    data_10b, k_encoded  = await self.write_to_Rx(target, 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_16 = self.compute_crc_16(target, crc_16)

                    data_10b, k_encoded  = await self.write_to_Rx("00000000", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_16 = self.compute_crc_16("00000000", crc_16)

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                    log_file.write("32;00"+f"{(int(target, 2)):0>2X}"+"50FC;0;0001;\n")

                    word_counter_for_skip += 1

                    #check if skip needed
                    if  word_counter_for_skip >= 5000:
                        data_to_log = ""
                        k_encoded_to_log = ""

                        data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                        log_file.write("32;7F7FCEFC;0;0001;\n")
                        word_counter_for_skip = 0
                else :
                    current_frame_size +=1


                while self.fct_counter[target_num] <= 0 and ignore_fct_monitor == 0:
                    if word_counter_for_skip>= 5000:
                        data_to_log = ""
                        k_encoded_to_log = ""

                        data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                        log_file.write("32;7F7FCEFC;0;0001;\n")
                        word_counter_for_skip = 0
                    else :
                        data_to_log = ""
                        k_encoded_to_log = ""

                        data_10b, k_encoded = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded = await self.write_to_Rx("11001111", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded = await self.write_to_Rx("11001111", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                        log_file.write("32;CFCFCEFC;0;0001;\n")
                        word_counter_for_skip += 1
                #send Data
                for n in range(4):
                    if current_packet_size==packet_size-1:
                        current_packet_size = 0
                        #send EOP at the end of a packet
                        data_10b, k_encoded  = await self.write_to_Rx("11111101", 0, 1, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                        crc_16 = self.compute_crc_16("11111101", crc_16)
                    else:
                        current_packet_size += 1
                        #send EOP at the end of a packet
                        data_10b, k_encoded  = await self.write_to_Rx(word_binary[32-8*(n+1):32-8*n], 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                        crc_16 = self.compute_crc_16(word_binary[32-8*(n+1):32-8*n], crc_16)
                log_file.write("32;" + f"{(int(word_binary, 2)):0>8X}" + ";0;0000;\n")
                log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                
                self.fct_counter[target_num] -= 1
                word_counter_for_skip += 1

                word_binary = word_binary[1:32] + str(int(word_binary[0])^int(word_binary[1])^int(word_binary[3])^int(word_binary[4])) 
                
                #check if skip needed
                if  word_counter_for_skip >= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0
    
            #check if EDF and SDF to be sent
            if current_frame_size == frame_size:
                current_frame_size = 1
                data_to_log = ""
                k_encoded_to_log = ""
                sequence += 1
                
                while self.fct_counter[target_num] <= 0 and ignore_fct_monitor == 0:
                    if word_counter_for_skip>= 5000:
                        data_to_log = ""
                        k_encoded_to_log = ""

                        data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                        log_file.write("32;7F7FCEFC;0;0001;\n")
                        word_counter_for_skip = 0
                    else :
                        data_to_log = ""
                        k_encoded_to_log = ""

                        data_10b, k_encoded = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded = await self.write_to_Rx("11001111", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded = await self.write_to_Rx("11001111", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                        log_file.write("32;CFCFCEFC;0;0001;\n")
                        word_counter_for_skip += 1

                #Send EDF
                data_10b, k_encoded  = await self.write_to_Rx("00011100", 0, 1, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_16 = self.compute_crc_16("00011100", crc_16)

                data_10b, k_encoded  = await self.write_to_Rx(str(sequence_polarity) + f"{(sequence%128):0>7b}", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_16 = self.compute_crc_16(str(sequence_polarity) + f"{(sequence%128):0>7b}", crc_16)

                crc_16 = self.invert_string(crc_16)

                data_10b, k_encoded  = await self.write_to_Rx(crc_16[8:16], 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                data_10b, k_encoded  = await self.write_to_Rx(crc_16[0:8], 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                log_file.write("32;00" + f"{(int(crc_16, 2)):0>4X}" + f"{(sequence%128 + 128 * sequence_polarity):0>2X}" + "1C;0;0001;\n")

                word_counter_for_skip += 1
            
                #check if skip needed
                if  word_counter_for_skip >= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0
                

                while self.fct_counter[target_num] <= 0 and ignore_fct_monitor == 0:
                    if word_counter_for_skip>= 5000:
                        data_to_log = ""
                        k_encoded_to_log = ""

                        data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                        log_file.write("32;7F7FCEFC;0;0001;\n")
                        word_counter_for_skip = 0
                    else :
                        data_to_log = ""
                        k_encoded_to_log = ""

                        data_10b, k_encoded = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded = await self.write_to_Rx("11001111", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded = await self.write_to_Rx("11001111", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                        log_file.write("32;CFCFCEFC;0;0001;\n")
                        word_counter_for_skip += 1


                #send SDF
                data_to_log = ""
                k_encoded_to_log = ""

                data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_16 = self.compute_crc_16("11111100")

                data_10b, k_encoded  = await self.write_to_Rx("01010000", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_16 = self.compute_crc_16("01010000", crc_16)

                data_10b, k_encoded  = await self.write_to_Rx(target, 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_16 = self.compute_crc_16(target, crc_16)

                data_10b, k_encoded  = await self.write_to_Rx("00000000", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_16 = self.compute_crc_16("00000000", crc_16)

                log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                log_file.write("32;00"+f"{(int(target, 2)):0>2X}"+"50FC;0;0001;\n")

                word_counter_for_skip += 1

                #check if skip needed
                if  word_counter_for_skip >= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0
            else :
                current_frame_size += 1


            while self.fct_counter[target_num] <= 0 and ignore_fct_monitor == 0:
                if word_counter_for_skip>= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0
                else :
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded = await self.write_to_Rx("11001111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded = await self.write_to_Rx("11001111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                    log_file.write("32;CFCFCEFC;0;0001;\n")
                    word_counter_for_skip += 1
            #Send last data_word
            last_packet_sent = (packet_number * packet_size-1)%4
            for n in range(4):
                if current_packet_size==packet_size-1:
                    current_packet_size = 0
                    #send EOP at the end of a packet
                    data_10b, k_encoded  = await self.write_to_Rx("11111101", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_16 = self.compute_crc_16("11111101", crc_16)
                elif n <= last_packet_sent:
                    current_packet_size += 1
                    #send EOP at the end of a packet
                    data_10b, k_encoded  = await self.write_to_Rx(word_binary[32-8*(n+1):32-8*n], 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_16 = self.compute_crc_16(word_binary[32-8*(n+1):32-8*n], crc_16)
                else :
                    #send FILL 
                    data_10b, k_encoded  = await self.write_to_Rx("11111011", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_16 = self.compute_crc_16("11111011", crc_16)
            log_file.write("32;" + f"{(int(word_binary, 2)):0>8X}" + ";0;0000;\n")
            log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                
            #check if skip needed
            if  word_counter_for_skip >= 5000:
                data_to_log = ""
                k_encoded_to_log = ""

                data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                log_file.write("32;7F7FCEFC;0;0001;\n")
                word_counter_for_skip = 0
            
            #Send last EDF
            sequence += 1

            data_10b, k_encoded  = await self.write_to_Rx("00011100", 0, 1, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log
            crc_16 = self.compute_crc_16("00011100", crc_16)

            data_10b, k_encoded  = await self.write_to_Rx(str(sequence_polarity) + f"{(sequence%128):0>7b}", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log
            crc_16 = self.compute_crc_16(str(sequence_polarity) + f"{(sequence%128):0>7b}", crc_16)

            crc_16 = self.invert_string(crc_16)

            data_10b, k_encoded  = await self.write_to_Rx(crc_16[8:16], 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            data_10b, k_encoded  = await self.write_to_Rx(crc_16[0:8], 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
            log_file.write("32;00"+f"{(int(crc_16, 2)):0>4X}"+ f"{(sequence%128 + 128 * sequence_polarity):0>2X}" + "1C;0;0001;\n")

            word_counter_for_skip += 1
        
            #check if skip needed
            if  word_counter_for_skip >= 5000:
                data_to_log = ""
                k_encoded_to_log = ""

                data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                log_file.write("32;7F7FCEFC;0;0001;\n")
                word_counter_for_skip = 0

        elif frame_type==1: #if Broadcast Frame
            for j in range(packet_number):

                #check if skip needed
                data_to_log = ""
                k_encoded_to_log = ""
                if  word_counter_for_skip >= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    
                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0

                #Send SBF
                data_to_log = ""
                k_encoded_to_log = ""
                data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_8 = self.compute_crc_8("11111100")

                data_10b, k_encoded  = await self.write_to_Rx("01011101", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_8 = self.compute_crc_8("01011101", crc_8)

                data_10b, k_encoded  = await self.write_to_Rx(target, 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_8 = self.compute_crc_8(target, crc_8)

                data_10b, k_encoded  = await self.write_to_Rx("00101010", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_8 = self.compute_crc_8("00101010", crc_8)

                log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                log_file.write("32;2A"+f"{(int(target, 2)):0>2X}"+"5DFC;0;0001;\n")
                
                word_counter_for_skip += 1

                #check if skip needed
                data_to_log = ""
                k_encoded_to_log = ""
                if  word_counter_for_skip >= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0

                #Send first broadcast data
                data_to_log = ""
                k_encoded_to_log = ""
                for n in range(4):
                    if packet_size != None:
                        data_10b, k_encoded  = await self.write_to_Rx(f"{(packet_size):0>64b}"[64-8*(n+1):64-8*n], 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                        crc_8 = self.compute_crc_8(f"{(packet_size):0>64b}"[64-8*(n+1):64-8*n], crc_8)
                    else:
                        data_10b, k_encoded  = await self.write_to_Rx(word_binary[32-8*(n+1):32-8*n], 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                        crc_8 = self.compute_crc_8(word_binary[32-8*(n+1):32-8*n], crc_8)

                if packet_size != None:
                    log_file.write("32;" + f"{(packet_size):0>16X}"[8:16] + ";0;0000;\n")
                else:    
                    log_file.write("32;" + f"{(int(word_binary, 2)):0>8X}" + ";0;0000;\n")
                log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")

                word_binary = word_binary[1:32] + str(int(word_binary[0])^int(word_binary[1])^int(word_binary[3])^int(word_binary[4]))

                word_counter_for_skip += 1

                #check if skip needed
                data_to_log = ""
                k_encoded_to_log = ""
                if  word_counter_for_skip >= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0

                #Send last broadcast data
                data_to_log = ""
                k_encoded_to_log = ""
                for n in range(3):
                    if packet_size != None:
                        data_10b, k_encoded  = await self.write_to_Rx(f"{(packet_size):0>64b}"[32-8*(n+1):32-8*n], 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                        crc_8 = self.compute_crc_8(f"{(packet_size):0>64b}"[32-8*(n+1):32-8*n], crc_8)
                    else:
                        data_10b, k_encoded  = await self.write_to_Rx(word_binary[32-8*(n+1):32-8*n], 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                        crc_8 = self.compute_crc_8(word_binary[32-8*(n+1):32-8*n], crc_8)

                data_10b, k_encoded  = await self.write_to_Rx("11111101", 0, 1, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_8 = self.compute_crc_8("11111101", crc_8)
                    
                if packet_size != None:
                    log_file.write("32;FD" + f"{(packet_size):0>16X}"[2:8] + ";0;0000;\n")
                else:    
                    log_file.write("32;FD" + f"{(int(word_binary, 2)):0>8X}"[2:8] + ";0;0000;\n")
                log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")

                word_binary = word_binary[1:32] + str(int(word_binary[0])^int(word_binary[1])^int(word_binary[3])^int(word_binary[4]))

                word_counter_for_skip += 1

                #check if skip needed
                if  word_counter_for_skip >= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0
                
                #Send EBF
                sequence += 1
                data_to_log = ""
                k_encoded_to_log = ""

                data_10b, k_encoded  = await self.write_to_Rx("01011100", 0, 1, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_8 = self.compute_crc_8("01011100", crc_8)

                data_10b, k_encoded  = await self.write_to_Rx("00000000", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_8 = self.compute_crc_8("00000000", crc_8)

                data_10b, k_encoded  = await self.write_to_Rx(str(sequence_polarity) + f"{(sequence%128):0>7b}", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_8 = self.compute_crc_8(str(sequence_polarity) + f"{(sequence%128):0>7b}", crc_8)

                crc_8 = self.invert_string(crc_8)

                data_10b, k_encoded  = await self.write_to_Rx(crc_8, 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                log_file.write("32;" + f"{(int(crc_8,2)):0>2X}" + f"{(sequence%128 + 128 * sequence_polarity):0>2X}" + "005C;0;0001;\n")

                word_counter_for_skip += 1

                #check if skip needed
                if  word_counter_for_skip >= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0

        elif frame_type==2: #if Idle Frame
            current_frame_size = 0

            #send SIF

            data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log
            crc_8 = self.compute_crc_8("11111100")

            data_10b, k_encoded  = await self.write_to_Rx("10000100", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log
            crc_8 = self.compute_crc_8("10000100", crc_8)

            data_10b, k_encoded  = await self.write_to_Rx(str(sequence_polarity) + f"{(sequence%128):0>7b}", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log
            crc_8 = self.compute_crc_8(str(sequence_polarity) + f"{(sequence%128):0>7b}", crc_8)

            crc_8 = self.invert_string(crc_8)

            data_10b, k_encoded  = await self.write_to_Rx(crc_8[0:8], 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
            log_file.write("32;" + f"{(int(crc_8[0:8],2)):0>2X}" + f"{(sequence%128 +128 * sequence_polarity):0>2X}" + "84FC;0;0001;\n")

            word_counter_for_skip += 1
            
            for j in range(packet_size):
                #check if skip needed
                if  word_counter_for_skip >= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0
                #check if SIF needed
                if current_frame_size == 64:
                    current_frame_size =0
                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_8 = self.compute_crc_8("11111100")

                    data_10b, k_encoded  = await self.write_to_Rx("01000100", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_8 = self.compute_crc_8("01000100", crc_8)

                    data_10b, k_encoded  = await self.write_to_Rx(str(sequence_polarity) + f"{(sequence%128):0>7b}", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_8 = self.compute_crc_8(str(sequence_polarity) + f"{(sequence%128):0>7b}", crc_8)

                    crc_8 = self.invert_string(crc_8)

                    data_10b, k_encoded  = await self.write_to_Rx(crc_8[0:8], 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                    log_file.write("32;" + f"{(int(crc_8[0:8],2)):0>2X}" + f"{(sequence%128 + sequence_polarity*128):0>2X}" + "005C;0;0001;\n")

                    word_counter_for_skip += 1
                
 

                #check if skip needed
                if  word_counter_for_skip >= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0
                    
                current_frame_size += 1
                for n in range(4):
                    data_10b, k_encoded  = await self.write_to_Rx(word_binary[32-8*(n+1):32-8*n], 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    
                log_file.write("32;" + f"{(int(word_binary, 2)):0>8X}" + ";0;0000;\n")
                log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")

                word_binary = word_binary[1:32] + str(int(word_binary[0])^int(word_binary[1])^int(word_binary[3])^int(word_binary[4]))

                word_counter_for_skip += 1


            
        #send idle word ten times for simu
        for i in range(10):
            data_to_log = ""
            k_encoded_to_log = ""

            data_10b, k_encoded = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            data_10b, k_encoded = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            data_10b, k_encoded = await self.write_to_Rx("11001111", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            data_10b, k_encoded = await self.write_to_Rx("11001111", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = self.precision)) + "\n")
            log_file.write("32;CFCFCEFC;0;0001;\n")

        self.dut.RX_POS.value = cocotb.types.Logic("Z")
        self.dut.RX_NEG.value = cocotb.types.Logic("Z")  
        log_file.close()
        log_file_10b.close()

    def encode(self, data, k_encoding = 0):
        """
        encode data from 8bits to 10bits, depending of the disparity of the current link
        """

        self.logger.debug("sim_time %d ns: Encoding of a new symbol. Data value : %s D/K flag: %s", get_sim_time(units = "ns"), data, k_encoding)
        #separation of 5 least-significant bits and 3 most-significant bits
        ls_data = data[3:8]
        ms_data = data[0:3]

        self.logger.debug("sim_time %d ns: Data separation %s_%s", ms_data, ls_data)

        #boolean to decide wether to use primary encoding of Dx.7 or use the alternate encoding
        primary = 1

        #encoding of the 5b/6b
        if ls_data == "00000":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "011000"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "100111"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "00001":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "100010"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "011101"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "00010":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "010010"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "101101"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "00011":
            ls_encoded_data = "110001"

        elif ls_data == "00100":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "001010"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "110101"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "00101":
            ls_encoded_data = "101001"
        elif ls_data == "00110":
            ls_encoded_data = "011001"
        elif ls_data == "00111":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "000111"
            else:
                ls_encoded_data = "111000"
        elif ls_data == "01000":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "000110"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "111001"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "01001":
            ls_encoded_data = "100101"
        elif ls_data == "01010":
            ls_encoded_data = "010101"
        elif ls_data == "01011":
            ls_encoded_data = "110100"
            if self.dut_Rx_disparity[0] >= 0:
                primary = 0
        elif ls_data == "01100":
            ls_encoded_data = "001101"
        elif ls_data == "01101":
            ls_encoded_data = "101100"
            if self.dut_Rx_disparity[0] >= 0:
                primary = 0
        elif ls_data == "01110":
            ls_encoded_data = "011100"
            if self.dut_Rx_disparity[0] >= 0:
                primary = 0
        elif ls_data == "01111":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "101000"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "010111"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "10000":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "100100"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "011011"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "10001":
            ls_encoded_data = "100011"
            if self.dut_Rx_disparity[0] <= 0:
                primary = 0
        elif ls_data == "10010":
            ls_encoded_data = "010011"
            if self.dut_Rx_disparity[0] <= 0:
                primary = 0
        elif ls_data == "10011":
            ls_encoded_data = "110010"
        elif ls_data == "10100":
            ls_encoded_data = "001011"
            if self.dut_Rx_disparity[0] <= 0:
                primary = 0
        elif ls_data == "10101":
            ls_encoded_data = "101010"
        elif ls_data == "10110":
            ls_encoded_data = "011010"
        elif ls_data == "10111":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "000101"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "111010"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "11000":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "001100"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "110011"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "11001":
            ls_encoded_data = "100110"
        elif ls_data == "11010":
            ls_encoded_data = "010110"
        elif ls_data == "11011":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "001001"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "110110"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "11100":
            if k_encoding == 0:
                ls_encoded_data = "001110"
            else:
                if self.dut_Rx_disparity[0] >= 0:
                    ls_encoded_data = "110000"
                    self.dut_Rx_disparity[0] -= 2
                else:
                    ls_encoded_data = "001111"
                    self.dut_Rx_disparity[0] += 2
        elif ls_data == "11101":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "010001"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "101110"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "11110":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "100001"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "011110"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "11111":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "010100"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "101011"
                self.dut_Rx_disparity[0] += 2
        else :
            self.logger.warning("sim_time %s ns : No valid encoding input on 5b/6b sub-block", get_sim_time(units = 'ns'))
            self.logger.debug("sim_time %d ns: Error, no valid encoding for input : %s ; Disparity is : %s", get_sim_time(units = "ns"), ls_data, self.dut_Rx_disparity[0])
            ls_encoded_data = "000000"


        #encoding of the 3b/4b
        if ms_data == "000":
            if self.dut_Rx_disparity[0] >= 0:
                ms_encoded_data = "0100"
                self.dut_Rx_disparity[0] -= 2
            else:
                ms_encoded_data = "1011"
                self.dut_Rx_disparity[0] += 2
        elif ms_data == "001":
            if k_encoding == 0:
                ms_encoded_data = "1001"
            else:
                if self.dut_Rx_disparity[0] >= 0:
                    ms_encoded_data = "1001"
                else:
                    ms_encoded_data = "0110"
        elif ms_data == "010":
            if k_encoding == 0:
                ms_encoded_data = "0101"
            else:
                if self.dut_Rx_disparity[0] >= 0:
                    ms_encoded_data = "0101"
                else:
                    ms_encoded_data = "1010"
        elif ms_data == "011":
            if self.dut_Rx_disparity[0] >= 0:
                ms_encoded_data = "0011"
            else:
                ms_encoded_data = "1100"
        elif ms_data == "100":
            if self.dut_Rx_disparity[0] >= 0:
                ms_encoded_data = "0010"
                self.dut_Rx_disparity[0] -= 2
            else:
                ms_encoded_data = "1101"
                self.dut_Rx_disparity[0] += 2
        elif ms_data == "101":
            if k_encoding == 0:
                ms_encoded_data = "1010"
            else:
                if self.dut_Rx_disparity[0] >= 0:
                    ms_encoded_data = "1010"
                else:
                    ms_encoded_data = "0101"
        elif ms_data == "110":
            if k_encoding == 0:
                ms_encoded_data = "0110"
            else:
                if self.dut_Rx_disparity[0] >= 0:
                    ms_encoded_data = "0110"
                else:
                    ms_encoded_data = "1001"
        elif ms_data == "111":
            if k_encoding == 0:
                if self.dut_Rx_disparity[0] >= 0:
                    if primary == 1:
                        ms_encoded_data = "0001"
                        self.dut_Rx_disparity[0] -= 2
                    else:
                        ms_encoded_data = "1000"
                        self.dut_Rx_disparity[0] -= 2
                else:
                    if primary == 1:
                        ms_encoded_data = "1110"
                        self.dut_Rx_disparity[0] += 2
                    else:
                        ms_encoded_data = "0111"
                        self.dut_Rx_disparity[0] += 2
            else:
                if self.dut_Rx_disparity[0] >= 0:
                    ms_encoded_data = "1000"
                    self.dut_Rx_disparity[0] -= 2
                else:
                    ms_encoded_data = "0111"
                    self.dut_Rx_disparity[0] += 2
        else :
            self.logger.warning("sim_time %s ns : No valid encoding input on 3b/4b sub-block", get_sim_time(units = 'ns'))
            self.logger.debug("sim_time %d ns: Error, no valid encoding for input : %s ; Disparity is : %s", get_sim_time(units = "ns"), ms_data, self.dut_Rx_disparity[0])
            ms_encoded_data = "0000"

        return ls_encoded_data + ms_encoded_data



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
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] +=2
        elif ls_encoded_data == "011000" :
            ls_decoded_data = "00000"
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] -=2
        elif ls_encoded_data == "011101" :
            ls_decoded_data = "00001"
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] +=2
        elif ls_encoded_data == "100010" :
            ls_decoded_data = "00001"
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] -=2
        elif ls_encoded_data == "101101" :
            ls_decoded_data = "00010"
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] +=2
        elif ls_encoded_data == "010010" :
            ls_decoded_data = "00010"
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] -=2
        elif ls_encoded_data == "110001" :
            ls_decoded_data = "00011"
        elif ls_encoded_data == "110101" :
            ls_decoded_data = "00100"
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] +=2
        elif ls_encoded_data == "001010" :
            ls_decoded_data = "00100"
            if self.disable_disparity_control == 0:
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
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] +=2
        elif ls_encoded_data == "000110" :
            ls_decoded_data = "01000"
            if self.disable_disparity_control == 0:
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
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] +=2
        elif ls_encoded_data == "101000" :
            ls_decoded_data = "01111"
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] -=2
        elif ls_encoded_data == "011011" :
            ls_decoded_data = "10000"
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] +=2
        elif ls_encoded_data == "100100" :
            ls_decoded_data = "10000"
            if self.disable_disparity_control == 0:
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
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] +=2
            k_encoded = -1
        elif ls_encoded_data == "000101" :
            ls_decoded_data = "10111"
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] -=2
            k_encoded = -1
        elif ls_encoded_data == "110011" :
            ls_decoded_data = "11000"
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] +=2
        elif ls_encoded_data == "001100" :
            ls_decoded_data = "11000"
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] -=2
        elif ls_encoded_data == "100110" :
            ls_decoded_data = "11001"
        elif ls_encoded_data == "010110" :
            ls_decoded_data = "11010"
        elif ls_encoded_data == "110110" :
            ls_decoded_data = "11011"
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] +=2
            k_encoded = -1
        elif ls_encoded_data == "001001" :
            ls_decoded_data = "11011"
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] -=2
            k_encoded = -1
        elif ls_encoded_data == "001110" :
            ls_decoded_data = "11100"
        elif ls_encoded_data == "101110" :
            ls_decoded_data = "11101"
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] +=2
            k_encoded = -1
        elif ls_encoded_data == "010001" :
            ls_decoded_data = "11101"
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] -=2
            k_encoded = -1
        elif ls_encoded_data == "011110" :
            ls_decoded_data = "11110"
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] +=2
            k_encoded = -1
        elif ls_encoded_data == "100001" :
            ls_decoded_data = "11110"
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] -=2
            k_encoded = -1
        elif ls_encoded_data == "101011" :
            ls_decoded_data = "11111"
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] +=2
        elif ls_encoded_data == "010100" :
            ls_decoded_data = "11111"
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] -=2
        elif ls_encoded_data == "001111" :
            ls_decoded_data = "11100"
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] +=2
            k_encoded = 1
        elif ls_encoded_data == "110000" :
            ls_decoded_data = "11100"
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] -=2
            k_encoded = 1
        else:
            ls_decoded_data = "00000"
            self.logger.warning("sim_time %s ns : Invalid symbole on sub-block 5b/6b. Sub-block : %s", get_sim_time(units = 'ns'), ls_encoded_data)
            return "00000000" , 1

        #check disparity

        if not self.dut_Tx_disparity[0] <= 1:
            self.logger.warning("sim_time %s ns : Disparity on Tx port is too high after 5b/6b sub-block. Sub-block : %s\tdisparity : %d", get_sim_time(units = 'ns'), ls_encoded_data, self.dut_Tx_disparity[0])
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] = 1
        if not self.dut_Tx_disparity[0] >= -1:
            self.logger.warning("sim_time %s ns : Disparity on Tx port is too low after 5b/6b sub-block. Sub-block : %s\tdisparity : %d", get_sim_time(units = 'ns'), ls_encoded_data, self.dut_Tx_disparity[0])
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] = -1

        #decode 3b/4b

        if ms_encoded_data == "1011" :
            ms_decoded_data = "000"
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] +=2
        elif ms_encoded_data == "0100" :
            ms_decoded_data = "000"
            if self.disable_disparity_control == 0:
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
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] +=2
        elif ms_encoded_data == "0010" :
            ms_decoded_data = "100"
            if self.disable_disparity_control == 0:
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
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] +=2
        elif ms_encoded_data == "0001" :
            ms_decoded_data = "111"
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] -=2
        elif ms_encoded_data == "0111" :
            if k_encoded == -1 or k_encoded == 1:
                ms_decoded_data = "111"
                if self.disable_disparity_control == 0:
                    self.dut_Tx_disparity[0] +=2
                k_encoded = 1
            else:
                ms_decoded_data = "111"
                if self.disable_disparity_control == 0:
                    self.dut_Tx_disparity[0] +=2
                if not primary == 0:
                    self.logger.error("sim_tim %s ns: Error K1: Alternative encoding of D.x.7 when uneeded. Sub block : %s", get_sim_time(units = 'ns'), ms_encoded_data)
        elif ms_encoded_data == "1000" :
            if k_encoded == -1 or k_encoded == 1:
                ms_decoded_data = "111"
                if self.disable_disparity_control == 0:
                    self.dut_Tx_disparity[0] -=2
                k_encoded = 1
            else:
                ms_decoded_data = "111"
                if self.disable_disparity_control == 0:
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
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] = 1
        if not self.dut_Tx_disparity[0] >= -1:
            self.logger.warning("sim_time %s ns : Disparity on Tx port is too low after 3b/4b sub-block. Sub-block : %s\tdisparity : %d", get_sim_time(units = 'ns'), ms_encoded_data, self.dut_Tx_disparity[0])
            if self.disable_disparity_control == 0:
                self.dut_Tx_disparity[0] = -1
        return ms_decoded_data + ls_decoded_data , k_encoded
