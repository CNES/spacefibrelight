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
-- Projet : IP SpaceFibre_Light
--
-- Date de creation : 19/06/2025
--
-- Description : This module implements the Physical and Lane layers of a 
-- SpaceFibre Light IP.
-- The Physical layer is provided by a NanoXplore IP.
-- The Lane layer is implemented by the owner's code and a NanoXplore IP.
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library phy_plus_lane_64_lib;

package pkg_phy_plus_lane_64b is

   constant C_DATA_WIDTH          : integer                        := 64;     --! Data width
   constant C_K_CHAR_WIDTH        : integer                        := 8;      --! K character width
   -- SYMBOLS
   constant C_K28_5_SYMB          : std_logic_vector(07 downto 00) := x"BC";  --! K28.5
   constant C_K28_7_SYMB          : std_logic_vector(07 downto 00) := x"FC";  --! K28.7
   constant C_LOST_SIG_SYMB       : std_logic_vector(07 downto 00) := x"64";  --! D04.3
   constant C_INIT1_SYMB          : std_logic_vector(07 downto 00) := x"46";  --! D06.2
   constant C_I_INIT1_SYMB        : std_logic_vector(07 downto 00) := x"B9";  --! D25.5
   constant C_INIT2_SYMB          : std_logic_vector(07 downto 00) := x"A6";  --! D06.5
   constant C_I_INIT2_SYMB        : std_logic_vector(07 downto 00) := x"59";  --! D25.2
   constant C_INIT3_SYMB          : std_logic_vector(07 downto 00) := x"38";  --! D24.1
   constant C_LLCW_SYMB           : std_logic_vector(07 downto 00) := x"CE";  --! D14.6
   constant C_I_LLCW_SYMB         : std_logic_vector(07 downto 00) := x"31";  --! D17.1
   constant C_STANDBY_SYMB        : std_logic_vector(07 downto 00) := x"7E";  --! D30.3
   constant C_SKIP_SYMB           : std_logic_vector(07 downto 00) := x"7F";  --! D31.3
   constant C_IDLE_SYMB           : std_logic_vector(07 downto 00) := x"CF";  --! D15.6
   constant C_RXERR_SYMB          : std_logic_vector(07 downto 00) := x"00";  --! K00.0 and D00.0
   -- LANE CONTROL WORDS
   constant C_SKIP_WORD           : std_logic_vector(31 downto 00) := C_SKIP_SYMB & C_SKIP_SYMB & C_LLCW_SYMB & C_K28_7_SYMB;
   constant C_IDLE_WORD           : std_logic_vector(31 downto 00) := C_IDLE_SYMB & C_IDLE_SYMB & C_LLCW_SYMB & C_K28_7_SYMB;
   constant C_INIT1_WORD          : std_logic_vector(31 downto 00) := C_INIT1_SYMB & C_INIT1_SYMB & C_LLCW_SYMB & C_K28_5_SYMB;
   constant C_INIT2_WORD          : std_logic_vector(31 downto 00) := C_INIT2_SYMB & C_INIT2_SYMB & C_LLCW_SYMB & C_K28_5_SYMB;
   constant C_INIT3_WORD          : std_logic_vector(23 downto 00) := C_INIT3_SYMB & C_LLCW_SYMB & C_K28_5_SYMB;                        --! bits 31 downto 24 = Capability field
   constant C_I_INIT1_WORD        : std_logic_vector(31 downto 00) := C_I_INIT1_SYMB & C_I_INIT1_SYMB & C_I_LLCW_SYMB & C_K28_5_SYMB;
   constant C_I_INIT2_WORD        : std_logic_vector(31 downto 00) := C_I_INIT2_SYMB & C_I_INIT2_SYMB & C_I_LLCW_SYMB & C_K28_5_SYMB;
   constant C_STANDBY_WORD        : std_logic_vector(23 downto 00) := C_STANDBY_SYMB & C_LLCW_SYMB & C_K28_7_SYMB;                      --! bits 31 downto 24 = Reason field
   constant C_LOST_SIG_WORD       : std_logic_vector(23 downto 00) := C_LOST_SIG_SYMB & C_LLCW_SYMB & C_K28_7_SYMB;                     --! bits 31 downto 24 = Reason field
   constant C_RXERR_WORD          : std_logic_vector(31 downto 00) := C_RXERR_SYMB & C_RXERR_SYMB & C_RXERR_SYMB & C_RXERR_SYMB;
   -- Counters max value
   constant C_PRBS_COUNTER_64     : unsigned(31 downto 00)         := to_unsigned(66,32);                  --! 66 = 2 to 65 values. Max value of PRBS counter for INIT1/2/3 control words
   constant C_X32_SIGNAL          : unsigned(04 downto 00)         := "11111";                             --! 32 = 0 to 31 values
   constant C_5000_WORDS          : unsigned(12 downto 00)         := to_unsigned(4998,13);                --! 4999 = 0 to 4998 values
   constant C_SYMB_X5             : unsigned(02 downto 00)         := "100";                               --! 5 = 0 to 4 values
   -- FIFO sizes
   constant C_RDY_WORD            : integer                        := 2;                                   --! 2 words by data bus
   constant C_DWIDTH              : integer                        := C_DATA_WIDTH + C_K_CHAR_WIDTH;       --! data + k character
   constant C_AWIDTH_TX           : integer                        := 5;                                   --! 2^5 x 72 = 288 B
   constant C_AWIDTH_RX           : integer                        := 12;                                  --! 2^12 x 72 = 36 kB
   constant C_DWIDTH_CTRL_TX      : integer                        := 9;                                   --! CAPABILITY_TX + LANE_RESET_DL
   constant C_AWIDTH_CTRL_TX      : integer                        := 3;                                   --! 2^3 x 9 = 9 B
   constant C_DWIDTH_CTRL_RX      : integer                        := 9;                                   --! FAR_END_CAPA + LANE_ACTIVE
   constant C_AWIDTH_CTRL_RX      : integer                        := 3;                                   --! 2^3 x 9 = 9 B

end package pkg_phy_plus_lane_64b;
