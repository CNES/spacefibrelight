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
--  /   /             3-State Differential Signaling  Buffer with BLVDS_25 I/O Standard (Discontinue in 13.1)
-- /___/   /\     Filename : OBUFTDS_BLVDS_25.vhd
-- \   \  /  \    Timestamp : Mon Aug 16 16:31:08 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/13/10 - Initial version.

----- CELL OBUFTDS_BLVDS_25-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity OBUFTDS_BLVDS_25 is
  port(
    O : out std_ulogic;

    OB : out std_ulogic;

    T : in std_ulogic;

    I : in std_ulogic
    );

end OBUFTDS_BLVDS_25;

architecture OBUFTDS_BLVDS_25_V of OBUFTDS_BLVDS_25 is
begin
    O2 : OBUFTDS
    generic map (
      IOSTANDARD => "BLVDS_25"
    )
    port map (
      O  => O,
      OB => OB,
      T => T,
      I => I
);

end OBUFTDS_BLVDS_25_V;
