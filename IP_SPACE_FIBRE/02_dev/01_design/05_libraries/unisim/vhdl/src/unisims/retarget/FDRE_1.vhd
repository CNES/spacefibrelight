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
--  /   /                  D Flip-Flop with Synchronous Reset  and Clock Enable and Negative-Edge Clock (Discontinue in 13.1)
-- /___/   /\     Filename : FDRE_1.vhd
-- \   \  /  \    Timestamp : Wed Sep  01 05:14:22 PDT 2010
--  \___\/\___\
--
-- Revision:
--    09/01/10 - Initial version.

----- CELL FDRE_1-----
library IEEE;
use IEEE.STD_LOGIC_1164.all;


library unisim;
use unisim.VPKG.all;
use unisim.VCOMPONENTS.all;

entity FDRE_1 is
  generic(
      INIT  : bit := '0'
    );
  port(
    Q : out std_ulogic;

    C : in std_ulogic;

    CE : in std_ulogic;

    R : in std_ulogic;

    D : in std_ulogic
    );

end FDRE_1;

architecture FDRE_1_V of FDRE_1 is
signal not_C : std_ulogic;
begin
    not_C <= not C;
    F3 : FDRE
    generic map (
      INIT => INIT
    )
    port map (
      Q  => Q,
      C  => not_C,
      CE  => CE,
      R  => R,
      D => D
);

end FDRE_1_V;
