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
--  /   /                  Input Clock Buffer with HSTL_II I/O Standard (Discontinue in 13.1)
-- /___/   /\     Filename : IBUFG_HSTL_II.vhd
-- \   \  /  \    Timestamp : Wed Aug  4 11:25:33 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/28/04 - Initial version.

----- CELL IBUFG_HSTL_II-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity IBUFG_HSTL_II is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end IBUFG_HSTL_II;

architecture IBUFG_HSTL_II_V of IBUFG_HSTL_II is
begin
    I1 : IBUFG
    generic map (
      IOSTANDARD => "HSTL_II"
    )
    port map (
      O  => O,
      I => I
);

end IBUFG_HSTL_II_V;
