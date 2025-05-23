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
--  /   /                  Input Clock Buffer with LVDCI_15 I/O Standard (Discontinue in 13.1)
-- /___/   /\     Filename : IBUFG_LVDCI_15.vhd
-- \   \  /  \    Timestamp : Wed Aug  4 11:25:53 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/28/04 - Initial version.

----- CELL IBUFG_LVDCI_15-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity IBUFG_LVDCI_15 is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end IBUFG_LVDCI_15;

architecture IBUFG_LVDCI_15_V of IBUFG_LVDCI_15 is
begin
    I1 : IBUFG
    generic map (
      IOSTANDARD => "LVDCI_15"
    )
    port map (
      O  => O,
      I => I
);

end IBUFG_LVDCI_15_V;
