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
--  /   /                  2-input NAND Gate (Discontinue in 13.1)
-- /___/   /\     Filename : NAND2.vhd
-- \   \  /  \    Timestamp : Mon May 24 11:41:16 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/24/10 - Initial version.

----- CELL NAND2 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity NAND2 is
  port(
    O : out std_ulogic;

    I0 : in std_ulogic;
    I1 : in std_ulogic
    );
end NAND2;

architecture NAND2_V of NAND2 is
begin
    L2 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      O  => O,
      I0 => I0,
      I1 => I1
);
end NAND2_V;


