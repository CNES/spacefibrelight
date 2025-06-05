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
-- Author(s) : Y. DAURIAC
--
-- Project : IP SpaceFibreLight
--
-- Creation date : 24/02/2025
--
-- Description : This module interfaces the TX flow of the phy plus lane layer 
--               with the data link layer or injectors
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;



entity mux_tx is
  port (
    RST_N                  : in  std_logic;                          --! Global reset
    CLK                    : in  std_logic;                          --! Global clock
    -- Ctrl signal
    ENABLE_INJ             : in std_logic;                           --! Enable injector command
    -- Injector interface
    DATA_TX_INJ            : in  std_logic_vector(31 downto 00);     --! Data parallel to be send from injector
    CAPABILITY_TX_INJ      : in  std_logic_vector(07 downto 00);     --! Capability send on TX link in INIT3 control word from injector
    NEW_DATA_TX_INJ        : in  std_logic;                          --! Flag to write data in FIFO TX from injetor
    VALID_K_CHARAC_TX_INJ  : in  std_logic_vector(03 downto 00);     --! K charachter valid in the 32-bit DATA_TX_INJ vector
    FIFO_TX_FULL_INJ       : out std_logic;                          --! Fifo TX full flag to Injector
    LANE_RESET_INJ         : in  std_logic;                          --! Lane Reset command from Injector
		-- Data-Link interface
    DATA_TX_DL             : in  std_logic_vector(31 downto 00);     --! Data parallel to be send from Data-Link Layer
    CAPABILITY_TX_DL       : in  std_logic_vector(07 downto 00);     --! Capability send on TX link in INIT3 control word
    NEW_DATA_TX_DL         : in  std_logic;                          --! Flag to write data in FIFO TX
    VALID_K_CHARAC_TX_DL   : in  std_logic_vector(03 downto 00);     --! K charachter valid in the 32-bit DATA_TX_DL vector
    FIFO_TX_FULL_DL        : out std_logic;                          --! Fifo TX full flag to dl
    LANE_RESET_DL          : in  std_logic;                          --! Lane Reset command from dl
    -- Phy Plus Lane interface
    DATA_TX_MUX            : out  std_logic_vector(31 downto 00);    --! Data parallel
    CAPABILITY_TX_MUX      : out  std_logic_vector(07 downto 00);    --! Capability send on TX link in INIT3 control word
    NEW_DATA_TX_MUX        : out  std_logic;                         --! Flag to write data in FIFO TX
    VALID_K_CHARAC_TX_MUX  : out  std_logic_vector(03 downto 00);    --! K charachter valid in the 32-bit DATA_TX_MUX vector
    FIFO_TX_FULL_PPL       : in   std_logic;                         --! Fifo TX full flag from ppl
    LANE_RESET_MUX         : out  std_logic                          --! Lane Reset command to ppl
  );
end mux_tx;

architecture rtl of mux_tx is

begin

---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_mux
-- Description: Multiplex Injector and data_link signals
---------------------------------------------------------
p_mux: process(CLK, RST_N)
begin
	if RST_N = '0' then
	  DATA_TX_MUX             <= (others => '0');
    CAPABILITY_TX_MUX       <= (others => '0');
		NEW_DATA_TX_MUX         <= '0';
		VALID_K_CHARAC_TX_MUX   <= (others => '0');
    FIFO_TX_FULL_DL         <= '0';
    FIFO_TX_FULL_INJ        <= '0';
    LANE_RESET_MUX          <= '0';
	elsif rising_edge(CLK) then
    if ENABLE_INJ ='1' then
      DATA_TX_MUX           <= DATA_TX_INJ;
      CAPABILITY_TX_MUX     <= CAPABILITY_TX_INJ;
      NEW_DATA_TX_MUX       <= NEW_DATA_TX_INJ;
      VALID_K_CHARAC_TX_MUX <= VALID_K_CHARAC_TX_INJ;
      FIFO_TX_FULL_INJ      <= FIFO_TX_FULL_PPL;
      LANE_RESET_MUX        <= LANE_RESET_INJ;
    else
      DATA_TX_MUX           <= DATA_TX_DL;
      CAPABILITY_TX_MUX     <= CAPABILITY_TX_DL;
      NEW_DATA_TX_MUX       <= NEW_DATA_TX_DL;
      VALID_K_CHARAC_TX_MUX <= VALID_K_CHARAC_TX_DL;
      FIFO_TX_FULL_DL       <= FIFO_TX_FULL_PPL;
      LANE_RESET_MUX        <= LANE_RESET_DL;
	  end if;
	end if;
end process p_mux;

end architecture rtl;