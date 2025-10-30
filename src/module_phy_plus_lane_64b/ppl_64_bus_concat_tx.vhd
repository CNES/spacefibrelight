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
-- Author(s) : Y.DAURIAC
--
-- Project : IP SpaceFibreLight
--
-- Creation date : 30/07/2025
--
-- Description : This module concatenates the data bus from 32 bits to 64 bits
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library phy_plus_lane_64_lib;
  use phy_plus_lane_64_lib.pkg_phy_plus_lane_64b.all;

entity ppl_64_bus_concat_tx is
  port (
    RST_N                        : in  std_logic;                                   --! global reset
    CLK                          : in  std_logic;                                   --! Clock synchronous with the Data-Link Layer
    -- Data-link layer interface
    DATA_TX_DL                   : in  std_logic_vector(31 downto 0);               --! 32-bit data parallel to be sent from Data-Link Layer
    NEW_DATA_TX_DL               : in  std_logic;                                   --! New data flag
    VALID_K_CHARAC_TX_DL         : in  std_logic_vector(3 downto 0);                --! 4-bit valid K character flags from Data-link layer
    CAPABILITY_TX_DL             : in  std_logic_vector(7 downto 0);                --! Capability field sent in INIT3 control word
    LANE_RESET_DL                : in  std_logic;                                   --! Lane reset command from Data-Link Layer
    -- ppl_64_data_fifo_tx (PLDFT) interface
    DATA_TX_PLBCT                : out std_logic_vector(C_DATA_WIDTH-1  downto 0);  --! 64-bit Data parallel to be sent
    NEW_DATA_TX_PLBCT            : out std_logic;                                   --! New data flag
    VALID_K_CHARAC_TX_PLBCT      : out std_logic_vector(C_K_CHAR_WIDTH-1 downto 0); --! 8-bit valid K character flags
    -- ppl_64_ctrl_fifo_tx (PLCFT) interface
    CAPABILITY_TX_PLBCT          : out std_logic_vector(7 downto 0);                --! Capability field sent in INIT3 control word
    LANE_RESET_PLBCT             : out std_logic                                    --! Lane reset command
  );
end ppl_64_bus_concat_tx;

architecture rtl of ppl_64_bus_concat_tx is
---------------------------------------------------------
-----                  Signal declaration           -----
---------------------------------------------------------
signal toggle_data     : std_logic;
signal buffer_data_32  : std_logic_vector(31 downto 0);
signal buffer_k_char_4 : std_logic_vector(3 downto 0);

begin
---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_concat_data
--! Concatenates two 32-bit words into one 64-bit data bus
---------------------------------------------------------
p_concat_data: process(CLK, RST_N)
begin
  if RST_N ='0' then
    DATA_TX_PLBCT           <= (others=>'0');
    NEW_DATA_TX_PLBCT       <= '0';
    VALID_K_CHARAC_TX_PLBCT <= (others=>'0');
    toggle_data             <= '0';
    buffer_data_32          <= (others=>'0');
    buffer_k_char_4         <= (others=>'0');
  elsif rising_edge(CLK)  then
    NEW_DATA_TX_PLBCT <= '0';
    -- First word saved
    if toggle_data = '0' then
      if  NEW_DATA_TX_DL = '1' then
        buffer_data_32  <= DATA_TX_DL;
        buffer_k_char_4 <= VALID_K_CHARAC_TX_DL;
        toggle_data     <= '1';
      end if;
    --First word & Second word sent
    elsif NEW_DATA_TX_DL ='1' then
      DATA_TX_PLBCT           <= DATA_TX_DL & buffer_data_32;
      VALID_K_CHARAC_TX_PLBCT <= VALID_K_CHARAC_TX_DL & buffer_k_char_4;
      NEW_DATA_TX_PLBCT       <= '1';
      toggle_data             <= '0';
    else
      DATA_TX_PLBCT           <= C_IDLE_WORD & buffer_data_32;
      VALID_K_CHARAC_TX_PLBCT <= "0001" & buffer_k_char_4;
      NEW_DATA_TX_PLBCT       <= '1';
      toggle_data             <= '0';
    end if;
  end if;
end process p_concat_data;
---------------------------------------------------------
-- Process: p_ctrl_sync
--! Transmits capability field and lane reset command
---------------------------------------------------------
p_ctrl_sync: process(CLK, RST_N)
begin
  if RST_N ='0' then
    CAPABILITY_TX_PLBCT <= (others=>'0');
    LANE_RESET_PLBCT    <= '0';
  elsif rising_edge(CLK)  then
    LANE_RESET_PLBCT    <= LANE_RESET_DL;
    CAPABILITY_TX_PLBCT <= CAPABILITY_TX_DL;
  end if;
end process p_ctrl_sync;

end architecture rtl;