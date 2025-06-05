-----------------------------------------------------------------------------------
-- #                          Copyright CNES 2025                                 #
-- #                                                                              #
-- # This source describes Open Hardware and is licensed under the CERN-OHL-W v2. #
-- #                                                                              #
-- # You may redistribute and modify this documentation and make products         #
-- # using it under the terms of the CERN-OHL-W v2 (https:/cern.ch/cern-ohl).     #
-- #                                                                              #
-- # This documentation is distributed WITHOUT ANY EXPRESS OR IMPLIED             #
-- # WARRANTY, INCLUDING OF MERCHANTABILITY, SATISFACTORY QUALITY                 #
-- # AND FITNESS FOR A PARTICULAR PURPOSE.                                        #
-- #                                                                              #
-- # Please see the CERN-OHL-W v2 for applicable conditions.                      #
-----------------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Auteur(s) : Y.DAURIAC
--
-- Projet : IP SpaceFibre_Light Versal target
--
-- Date de creation : 03/03/2025
--
-- Description : This is a package of constant and functions for the Data-Link layer
----------------------------------------------------------------------------


library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library data_link_lib;

package data_link_lib is
  -- Lane CAPABILITY
  constant C_CAPA_LINK_RST       : integer := 0;                  --! Link Reset bitfield in lane capability vector
  constant C_CAPA_LANE_START     : integer := 1;                  --! Lane Start bitfield in lane capability vector
  constant C_CAPA_DATA_SCRAM     : integer := 2;                  --! Data Scrambled bitfield in lane capability vector
  constant C_CAPA_MULTI_LANE     : integer := 3;                  --! Multi-Lane bitfield in lane capability vector
  constant C_CAPA_ROUTING_SW     : integer := 4;                  --! Routing Switch bitfield in lane capability vector
  -- Number of Virtual Channel
  constant C_VC_NUM              : integer              := 8;     --! Number of Virtual Channels
  -- Output Buffer
  constant C_OUT_BUF_SIZE        : integer              := 7;     --! fifo depth = 2**7= 128 words of 32 bits
  constant C_FCT_CC_SIZE         : integer              := 8;     --! FCT credit counter size: 4x64xM = 256
  constant C_FCT_CC_MAX          : unsigned             := to_unsigned(255, C_FCT_CC_SIZE);  --! FCT credit counter size: 4x64xM = 256
  constant C_M_SIZE              : integer              := 4;     --! Size of M which is multiplier +1
  constant C_MULT_SIZE           : integer              := 3;     --! Size of multiplier
  constant C_CHANNEL_SIZE        : integer              := 5;     --! Channel number field
  -- Middle Buffer
  constant C_MID_BUF_SIZE        : integer              := 7;     --! fifo depth = 2**7= 128 words of 32 bits for the middle buffer (data)
  constant C_MID_BUF_BC_SIZE     : integer              := 3;     --! fifo depth = 2**3= 8 words of 32 bits for the middle buffer (broadcast)
  -- Input Buffer
  constant C_IN_BUF_SIZE         : integer              := 8;     --! fifo depth = 2**8= 256 words of 32 bits for the input buffer
  -- DATA LENGTH
  constant C_DATA_LENGTH         : integer              := 32;                                   --! Data width
  constant C_BYTE_BY_WORD_LENGTH : integer              := 4;                                    --! Number of byte in a word
  constant C_DATA_K_WIDTH        : integer              := C_DATA_LENGTH +C_BYTE_BY_WORD_LENGTH; --! Data + k character width
  constant C_TYPE_FRAME_LENGTH   : integer              := 4;                                    --! Type of frame vector width
  constant C_MAX_DATA_FRAME      : unsigned(7 downto 0) := to_unsigned(65, 8);                   --! Maximum number of words in a Data frame
  constant C_MAX_IDLE_FRAME      : unsigned(7 downto 0) := to_unsigned(64, 8);                   --! Maximum number of words in an Idle frame
  constant C_WORD_BC_FRAME       : unsigned(1 downto 0) := to_unsigned(2, 2);                    --! Number of words in a Broadcast frame
  constant C_BYTE_WIDTH          : integer              := 8;                                    --! Byte width
  -- DATA-LINK TYPE OF FRAME
  constant C_DATA_FRM  :std_logic_vector(3 downto 0):= "0001"; --! DATA Frame
  constant C_BC_FRM    :std_logic_vector(3 downto 0):= "0010"; --! BROADCAST Frame
  constant C_IDLE_FRM  :std_logic_vector(3 downto 0):= "0011"; --! IDLE Frame
  constant C_FCT_FRM   :std_logic_vector(3 downto 0):= "0100"; --! FCT Frame
  constant C_ACK_FRM   :std_logic_vector(3 downto 0):= "0101"; --! ACK Frame
  constant C_NACK_FRM  :std_logic_vector(3 downto 0):= "0110"; --! NACK Frame
  constant C_FULL_FRM  :std_logic_vector(3 downto 0):= "0111"; --! FULL Frame
  constant C_RETRY_FRM :std_logic_vector(3 downto 0):= "1000"; --! RETRY Frame
  -- SYMBOLS
  constant C_EEP_SYMB            : std_logic_vector(07 downto 00) := x"FE";  --! K30.7 EEP
  constant C_EOP_SYMB            : std_logic_vector(07 downto 00) := x"FD";  --! K29.7 EOP
  constant C_K28_7_SYMB          : std_logic_vector(07 downto 00) := x"FC";  --! K28.7 Comma
  constant C_K28_3_SYMB          : std_logic_vector(07 downto 00) := x"7C";  --! K28.3 FCT
  constant C_K28_2_SYMB          : std_logic_vector(07 downto 00) := x"5C";  --! K28.2 EBF
  constant C_K28_0_SYMB          : std_logic_vector(07 downto 00) := x"1C";  --! K28.0 EDF
  constant C_FILL_SYMB           : std_logic_vector(07 downto 00) := x"FB";  --! K27.7
  constant C_SBF_SYMB            : std_logic_vector(07 downto 00) := x"5D";  --! D29.2 SBF
  constant C_NACK_SYMB           : std_logic_vector(07 downto 00) := x"BB";  --! D27.5
  constant C_SDF_SYMB            : std_logic_vector(07 downto 00) := x"50";  --! D16.2
  constant C_FULL_SYMB           : std_logic_vector(07 downto 00) := x"6F";  --! D15.3
  constant C_RETRY_SYMB          : std_logic_vector(07 downto 00) := x"87";  --! D7.4
  constant C_SIF_SYMB            : std_logic_vector(07 downto 00) := x"84";  --! D4.2 SIF
  constant C_ACK_SYMB            : std_logic_vector(07 downto 00) := x"A2";  --! D2.5
  constant C_RESERVED_SYMB       : std_logic_vector(07 downto 00) := x"00";  --! D0.0
  -- DATA-LINK CONTROL WORDS
  constant C_SDF_WORD           : std_logic_vector(15 downto 00) := C_SDF_SYMB & C_K28_7_SYMB;   --! 2 first bytes of a Start of Data Frame word
  constant C_SBF_WORD           : std_logic_vector(15 downto 00) := C_SBF_SYMB & C_K28_7_SYMB;   --! 2 first bytes of a Start of Broadcast Frame word
  constant C_SIF_WORD           : std_logic_vector(15 downto 00) := C_SIF_SYMB & C_K28_7_SYMB;   --! 2 first bytes of a Start of Idle Frame word
  constant C_ACK_WORD           : std_logic_vector(15 downto 00) := C_ACK_SYMB & C_K28_7_SYMB;   --! 2 first bytes of a ACK word
  constant C_NACK_WORD          : std_logic_vector(15 downto 00) := C_NACK_SYMB & C_K28_7_SYMB;  --! 2 first bytes of a NACK word
  constant C_FULL_WORD          : std_logic_vector(15 downto 00) := C_FULL_SYMB & C_K28_7_SYMB;  --! 2 first bytes of a FULL word
  constant C_RETRY_WORD         : std_logic_vector               := C_RESERVED_SYMB & C_RESERVED_SYMB & C_RETRY_SYMB & C_K28_7_SYMB; --! Retry word
  constant C_RXERR_WORD         : std_logic_vector               := C_RESERVED_SYMB & C_RESERVED_SYMB & C_RESERVED_SYMB & C_RESERVED_SYMB; --! RXERR word
  -- #####################################################################
  -- # Type
  -- #####################################################################
  type int_array is array (natural range <>) of integer;
  type vc_data_array is array (natural range <>) of std_logic_vector(C_DATA_LENGTH-1 downto 0);
  type vc_k_array is array (natural range <>) of std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
  type vc_data_k_array is array (natural range <>) of std_logic_vector(C_DATA_LENGTH+C_BYTE_BY_WORD_LENGTH-1 downto 0);
  type vc_m_val_array is array (natural range <>) of std_logic_vector(C_M_SIZE-1 downto 0);
  -- #####################################################################
  -- # INIT functions
  -- #####################################################################
  function calculate_crc_16(data : STD_LOGIC_VECTOR(7 downto 0); crc_init : STD_LOGIC_VECTOR(15 downto 0)) return STD_LOGIC_VECTOR;  --! Calcluates the crc 16 bits
  function calculate_crc_8(data : STD_LOGIC_VECTOR(7 downto 0); crc_init : STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR;    --! Calcluates the crc 8 bits
  function calculate_idle(data_idle : STD_LOGIC_VECTOR(15 downto 0)) return STD_LOGIC_VECTOR;                                        --! Calcluates Idle data
end package data_link_lib;

package body data_link_lib is

function calculate_crc_16(data : STD_LOGIC_VECTOR(7 downto 0); crc_init : STD_LOGIC_VECTOR(15 downto 0)) return STD_LOGIC_VECTOR is
  variable crc : std_logic_vector(15 downto 0) := crc_init;
  variable feedback : std_logic;
begin
-- Process every bit from LSB to MSB
  for i in 0 to data'length - 1 loop
      feedback := crc(15) xor data(i); -- XOR of input bit with CRC MSB

      --Left offset
      crc := crc(14 downto 0) & '0';

      -- Application of the polynomial 0x1021 (x^12 and x^5)
      crc(12) := crc(12) xor feedback;
      crc(5)  := crc(5) xor feedback;
      crc(0)  := feedback;
  end loop;

  return crc;
end function;

function calculate_crc_8(data : STD_LOGIC_VECTOR(7 downto 0); crc_init : STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR is
  variable crc : std_logic_vector(7 downto 0) := crc_init;
  variable feedback : std_logic;
begin
-- Process every bit from LSB to MSB
  for i in 0 to data'length - 1 loop
      feedback := crc(7) xor data(i); -- XOR of input bit with CRC MSB

      -- Left offset
      crc := crc(6 downto 0) & '0';

      -- Application of the polynomial x^2 and x^1
      crc(2) := crc(2) xor feedback;
      crc(1)  := crc(1) xor feedback;
      crc(0)  := feedback;
  end loop;
  return crc;
end function;

function calculate_idle(data_idle : STD_LOGIC_VECTOR(15 downto 0)) return STD_LOGIC_VECTOR is
  variable data_idle_i : std_logic_vector(15 downto 0) := x"ffff";
  variable feedback : std_logic;
begin
  -- Process every bit from LSB to MSB
  data_idle_i:= data_idle;
      feedback := data_idle_i(15); -- XOR of input bit with CRC MSB

      -- Left offset
      data_idle_i := data_idle_i(14 downto 0) & '0';

      -- Application of the polynomial x^4, x^3 and x^2
      data_idle_i(4) := data_idle_i(4) xor feedback;
      data_idle_i(3)  := data_idle_i(3) xor feedback;
      data_idle_i(2)  := data_idle_i(2) xor feedback;
      data_idle_i(0)  := feedback;

  return data_idle_i;
end function;

end package body data_link_lib;