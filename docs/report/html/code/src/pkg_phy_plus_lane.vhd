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
-- Auteur(s) : J.PIQUEMAL
--
-- Projet : IP SpaceFibre_Light Versal target
--
-- Date de creation : 03/09/2024
--
-- Description : This module implement the Physical and Lane layer of an IP
-- SpaceFibre Light.
-- The Physical layer is carried by an Xilinx IP
-- The Lane layer is carried by owner's code and an Xilinx IP
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library phy_plus_lane_lib;

package pkg_phy_plus_lane is
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
   constant C_RXERR_SYMB          : std_logic_vector(07 downto 00) := x"00";  --! K00.0 et D00.0
   -- LANE CONTROL WORDS
   constant C_SKIP_WORD           : std_logic_vector(31 downto 00) := C_SKIP_SYMB & C_SKIP_SYMB & C_LLCW_SYMB & C_K28_7_SYMB;
   constant C_IDLE_WORD           : std_logic_vector(31 downto 00) := C_IDLE_SYMB & C_IDLE_SYMB & C_LLCW_SYMB & C_K28_7_SYMB;
   constant C_INIT1_WORD          : std_logic_vector(31 downto 00) := C_INIT1_SYMB & C_INIT1_SYMB & C_LLCW_SYMB & C_K28_5_SYMB;
   constant C_INIT2_WORD          : std_logic_vector(31 downto 00) := C_INIT2_SYMB & C_INIT2_SYMB & C_LLCW_SYMB & C_K28_5_SYMB;
   constant C_INIT3_WORD          : std_logic_vector(23 downto 00) := C_INIT3_SYMB & C_LLCW_SYMB & C_K28_5_SYMB;                        -- bits 31 downto 24 = Capability field
   constant C_I_INIT1_WORD        : std_logic_vector(31 downto 00) := C_I_INIT1_SYMB & C_I_INIT1_SYMB & C_I_LLCW_SYMB & C_K28_5_SYMB;
   constant C_I_INIT2_WORD        : std_logic_vector(31 downto 00) := C_I_INIT2_SYMB & C_I_INIT2_SYMB & C_I_LLCW_SYMB & C_K28_5_SYMB;
   constant C_STANDBY_WORD        : std_logic_vector(23 downto 00) := C_STANDBY_SYMB & C_LLCW_SYMB & C_K28_7_SYMB;                      -- bits 31 downto 24 = Reason field
   constant C_LOST_SIG_WORD       : std_logic_vector(23 downto 00) := C_LOST_SIG_SYMB & C_LLCW_SYMB & C_K28_7_SYMB;                     -- bits 31 downto 24 = Reason field
   constant C_RXERR_WORD          : std_logic_vector(31 downto 00) := C_RXERR_SYMB & C_RXERR_SYMB & C_RXERR_SYMB & C_RXERR_SYMB;

   -- Counters max value
   constant C_PRBS_COUNTER_64     : unsigned(31 downto 00) := x"0000003F";  -- 64 = 0 to 63 values Max value of PRBS counter for INIT1/2/3 control words
   constant C_X32_SIGNAL          : unsigned(04 downto 00) := "11111";      -- 32 = 0 to 31 values
   constant C_5000_WORDS          : unsigned(12 downto 00) := "1" & x"387";      -- 5000 = 0 to 4999 values
   --constant C_5000_WORDS         : unsigned(12 downto 00) := "0" & x"00A";      -- 10 for test
   constant C_SYMB_X5             : unsigned(02 downto 00) := "100";          -- 5 = 0 to 4 values
   --FIFOs size
   constant C_DWIDTH              : integer := 36;
   constant C_AWIDTH              : integer := 10; -- Nb of bit
   constant C_DWIDTH_CTRL_TX      : integer := 9;
   constant C_AWIDTH_CTRL_TX      : integer := 3;
   constant C_DWIDTH_CTRL_RX      : integer := 9;
   constant C_AWIDTH_CTRL_RX      : integer := 3;   
end package pkg_phy_plus_lane;
