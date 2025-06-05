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
-- Description : This module interfaces the RX flow of the phy plus lane
--               layer with the data link layer or spyware.
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;



entity demux_rx is
  port (
    RST_N                  : in  std_logic; --! Global reset
    CLK                    : in  std_logic; --! Global Clock
    -- Ctrl signal
    ENABLE_SPY             : in std_logic;  --! Enable Spy read command
    -- Data-Link interface
    FIFO_RX_RD_EN_DL       : in  std_logic; --! Flag to read data in FIFO RX from Data-Link
		-- SPY interface
    FIFO_RX_RD_EN_SPY      : in  std_logic; --! Flag to read data in FIFO RX from Spy
    -- Phy Plus Lane interface
    FIFO_RX_RD_EN_DEMUX    : out std_logic  --! Flag to read data in FIFO RX to PPL
  );
end demux_rx;

architecture rtl of demux_rx is
begin

---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_demux
-- Description: Demultiplex phy_plus_lane signals
---------------------------------------------------------
p_demux: process(CLK, RST_N)
begin
	if RST_N = '0' then
	  FIFO_RX_RD_EN_DEMUX             <= '0';
	elsif rising_edge(CLK) then
    if ENABLE_SPY ='1' then
      FIFO_RX_RD_EN_DEMUX           <= FIFO_RX_RD_EN_SPY;
    else
      FIFO_RX_RD_EN_DEMUX           <= FIFO_RX_RD_EN_DL;
	  end if;
	end if;
end process p_demux;

end architecture rtl;