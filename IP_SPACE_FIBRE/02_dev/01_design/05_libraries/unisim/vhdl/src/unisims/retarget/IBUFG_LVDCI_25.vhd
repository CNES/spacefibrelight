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
--  /   /                  Input Clock Buffer with LVDCI_25 I/O Standard (Discontinue in 13.1)
-- /___/   /\     Filename : IBUFG_LVDCI_25.vhd
-- \   \  /  \    Timestamp : Wed Aug  4 11:25:54 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/28/04 - Initial version.

----- CELL IBUFG_LVDCI_25-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity IBUFG_LVDCI_25 is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end IBUFG_LVDCI_25;

architecture IBUFG_LVDCI_25_V of IBUFG_LVDCI_25 is
begin
    I1 : IBUFG
    generic map (
      IOSTANDARD => "LVDCI_25"
    )
    port map (
      O  => O,
      I => I
);

end IBUFG_LVDCI_25_V;
