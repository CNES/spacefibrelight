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
--  /   /                  Output Buffer with GTLP I/O Standard  (Discontinue in 13.1)
-- /___/   /\     Filename : OBUF_GTLP.vhd
-- \   \  /  \    Timestamp : Thu Aug 12 15:08:21 PDT 2010

--  \___\/\___\
--
-- Revision:
--    08/12/10 - Initial version.

----- CELL OBUF_GTLP-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity OBUF_GTLP is
  port(
    O : out std_ulogic;

    I : in std_ulogic
    );

end OBUF_GTLP;

architecture OBUF_GTLP_V of OBUF_GTLP is
begin
    O4 : OBUF
    generic map (
      IOSTANDARD => "GTLP"
      
      
    )
    port map (
      O  => O,
      I => I
);

end OBUF_GTLP_V;
