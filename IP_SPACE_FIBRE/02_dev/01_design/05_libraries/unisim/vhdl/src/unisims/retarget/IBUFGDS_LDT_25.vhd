-- $Header:  $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 12.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /             Differential Signaling  Input Clock Buffer with LDT_25 I/O Standard (Discontinue in 13.1)
-- /___/   /\     Filename : IBUFGDS_LDT_25.vhd
-- \   \  /  \    Timestamp : Wed Aug  4 12:54:55 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/28/04 - Initial version.

----- CELL IBUFGDS_LDT_25-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity IBUFGDS_LDT_25 is
  port(
    O : out std_ulogic;

    IB : in std_ulogic;

    I : in std_ulogic
    );

end IBUFGDS_LDT_25;

architecture IBUFGDS_LDT_25_V of IBUFGDS_LDT_25 is
begin
    I2 : IBUFGDS
    generic map (
      IOSTANDARD => "LDT_25"
    )
    port map (
      O  => O,
      IB => IB,
      I => I
);

end IBUFGDS_LDT_25_V;
