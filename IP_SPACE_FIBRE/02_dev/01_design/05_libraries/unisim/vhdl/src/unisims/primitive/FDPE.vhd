-------------------------------------------------------------------------------
-- Copyright (c) 1995/2014 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor      : Xilinx
-- \   \   \/     Version     : 2014.2
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                       D Flip-Flop with Clock Enable and Asynchronous Preset
-- /___/   /\     Filename    : FDPE.vhd
-- \   \  /  \    
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--    03/23/04 - Initial version.
--    11/03/08 - Initial Q. CR49409
--    04/16/13 - PR683925 - add invertible pin support.
--    03/31/14 - Speed improvements
-- End Revision
-------------------------------------------------------------------------------

----- CELL FDPE -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity FDPE is
  generic(
    INIT : bit := '1';
    IS_C_INVERTED : bit := '0';
    IS_D_INVERTED : bit := '0';
    IS_PRE_INVERTED : bit := '0'
    );

  port(
    Q   : out std_ulogic := TO_X01(INIT);
    C   : in std_ulogic;
    CE  : in std_ulogic;
    D   : in std_ulogic;
    PRE : in std_ulogic
    );
end FDPE;

architecture FDPE_V of FDPE is

  constant MODULE_NAME : string := "FDPE";
  constant IN_DELAY : time := 100 ps;
  constant OUT_DELAY : time := 100 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;

-- Parameter encodings and registers

  signal INIT_BIN : std_ulogic := TO_X01(INIT);
  signal IS_C_INVERTED_BIN : std_ulogic := TO_X01(IS_C_INVERTED);
  signal IS_D_INVERTED_BIN : std_ulogic := TO_X01(IS_D_INVERTED);
  signal IS_PRE_INVERTED_BIN : std_ulogic := TO_X01(IS_PRE_INVERTED);

  signal glblGSR   : std_ulogic;
  signal attr_err  : std_ulogic := '0';

-- internal signal declarations
    signal q_out  : std_ulogic := TO_X01(INIT);

-- start behavioral body
begin
  glblGSR <= TO_X01(GSR);
  Q <= q_out;

  FunctionalBehavior         : process(C, PRE, glblGSR)
  begin
    if (glblGSR = '1') then
      q_out <= INIT_BIN after OUT_DELAY;
    elsif ((PRE = '1' and IS_PRE_INVERTED_BIN = '0') or 
           ((PRE = '0' or PRE = 'Z') and IS_PRE_INVERTED_BIN = '1')) then
      q_out <= '1' after OUT_DELAY;
    elsif (C'EVENT and xil_pos_edge_inv(C, IS_C_INVERTED_BIN)) then
      if (CE = '1' or CE = 'Z') then
        q_out <= D xor IS_D_INVERTED_BIN after OUT_DELAY;
      end if;
    end if;
  end process;
end FDPE_V;
