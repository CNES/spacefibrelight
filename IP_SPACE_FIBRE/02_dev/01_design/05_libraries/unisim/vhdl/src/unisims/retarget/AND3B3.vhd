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
--  /   /                  3-input AND Gate (Discontinue in 13.1)
-- /___/   /\     Filename : AND3B3.vhd
-- \   \  /  \    Timestamp : Fri May 21 15:49:03 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/21/10 - Initial version.

----- CELL AND3B3 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity AND3B3 is
  port(
    O : out std_ulogic;

    I0 : in std_ulogic;
    I1 : in std_ulogic;
    I2 : in std_ulogic
    );
end AND3B3;

architecture AND3B3_V of AND3B3 is
begin
    L3 : LUT3
     generic map(
      INIT => X"01"
    )
     port map (
      O  => O,
      I0 => I0,
      I1 => I1,
      I2 => I2
);
end AND3B3_V;


