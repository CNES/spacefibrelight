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
--  /   /                  Output Buffer with SLOW Slew 6 ma Drive (Discontinue in 13.1)
-- /___/   /\     Filename : OBUF_S_6.vhd
-- \   \  /  \    Timestamp : Thu Aug 12 15:09:41 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/12/10 - Initial version.

----- CELL OBUF_S_6-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity OBUF_S_6 is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end OBUF_S_6;

architecture OBUF_S_6_V of OBUF_S_6 is
begin
    O4 : OBUF
    generic map (
      
      SLEW => "SLOW",
      DRIVE => 6
    )
    port map (
      O  => O,
      I => I
);

end OBUF_S_6_V;
