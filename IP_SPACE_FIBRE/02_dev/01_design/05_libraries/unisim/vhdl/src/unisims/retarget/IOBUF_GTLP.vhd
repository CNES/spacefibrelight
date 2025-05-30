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
--  /   /                  Bi-Directional Buffer with GTLP I/O Standard   (Discontinue in 13.1)
-- /___/   /\     Filename : IOBUF_GTLP.vhd
-- \   \  /  \    Timestamp : Thu Aug  5 16:18:23 PDT 2010

--  \___\/\___\
--
-- Revision:
--    05/28/04 - Initial version.

----- CELL IOBUF_GTLP-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity IOBUF_GTLP is
  port(
    O : out std_ulogic;

    IO : inout std_ulogic;

    T : in std_ulogic;

    I : in std_ulogic
    );

end IOBUF_GTLP;

architecture IOBUF_GTLP_V of IOBUF_GTLP is
begin
    O1 : OBUFT
    generic map (
      IOSTANDARD => "GTLP"
      
      
    )
    port map (
      O  => IO,
      T  => T,
      I => I
);
    I0 : IBUF
    generic map (
      IOSTANDARD => "DEFAULT"
    )
    port map (
      O  => O,
      I => IO
);

end IOBUF_GTLP_V;
