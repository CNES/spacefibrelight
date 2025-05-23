-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  3-State Diffential Signaling I/O Buffer
-- /___/   /\     Filename : IOBUFDS_DIFF_OUT.vhd
-- \   \  /  \    Timestamp :  Jan 23 15:09:49 PST 2009
--  \___\/\___\
--
-- Revision:
--    01/23/09 - Initial version.
--    06/02/09 - CR 523083 -- Added attribute IBUF_LOW_PWR.
--    10/26/09 - CR 537358 -- Fixed OB output
-- End Revision


----- CELL IOBUFDS_DIFF_OUT -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity IOBUFDS_DIFF_OUT is
  generic(
    DIFF_TERM : boolean  := FALSE;
    DQS_BIAS : string := "FALSE";
    IBUF_LOW_PWR : boolean :=  TRUE;
    IOSTANDARD  : string  := "DEFAULT"
    );

  port(
    O  : out std_ulogic;
    OB : out std_ulogic;

    IO  : inout std_ulogic;
    IOB : inout std_ulogic;

    I  : in std_ulogic;
    TM : in std_ulogic;
    TS : in std_ulogic
    );
end IOBUFDS_DIFF_OUT;

architecture IOBUFDS_DIFF_OUT_V of IOBUFDS_DIFF_OUT is
 signal DQS_BIAS_BINARY        : std_ulogic := '0';

begin

  prcs_init             : process
    variable FIRST_TIME : boolean := true;
  begin
     If(FIRST_TIME = true) then

        if((DIFF_TERM = TRUE) or
           (DIFF_TERM = FALSE)) then
           FIRST_TIME := false;
        else
           assert false
           report "Attribute Syntax Error: The Legal values for DIFF_TERM are TRUE or FALSE"
           severity Failure;
        end if;
     end if;

--
        if((IBUF_LOW_PWR = TRUE) or
           (IBUF_LOW_PWR = FALSE)) then
           FIRST_TIME := false;
        else
           assert false
           report "Attribute Syntax Error: The Legal values for IBUF_LOW_PWR are TRUE or FALSE"
           severity Failure;
        end if;
        if (DQS_BIAS = "TRUE") then
           FIRST_TIME := false;
        elsif (DQS_BIAS = "FALSE") then
           FIRST_TIME := false;
        else
         assert FALSE report "Attribute Syntax Error : The Legal values for DQS_BIAS are FALSE or TRUE." severity Failure;
        end if;

--
    wait;
  end process prcs_init;
    DQS_BIAS_BINARY <=
    '0' when (DQS_BIAS = "FALSE") else
    '1' when (DQS_BIAS = "TRUE") else
    '0';

  VPKGBehavior : process (IO, IOB, I, TM, TS,DQS_BIAS_BINARY)
  begin

    if ((IO = '1' or IO = 'H') and  (IOB = '0' or IOB = 'L') ) then
       O  <= '1';  
       OB <= '0'; 
    elsif ((IO = '0' or IO = 'L') and  (IOB = '1' or IOB = 'H') ) then
       O  <= '0';  
       OB <= '1'; 
    elsif ((IO = 'Z' or IO = '0' or IO = 'L') and (IOB = 'Z' or IOB = '1' or IOB = 'H')) then
          if (DQS_BIAS_BINARY = '1') then
            O <= '0';
            OB <= '1';
          else
            O <= 'X';
            OB <= 'X';
          end if;
    elsif ((IO = 'X' or IO = 'U') and (IOB = 'X' or IOB = 'U')) then
       O  <= 'X';  
       OB <= 'X'; 
    elsif (IO /= IOB ) then
      O <= TO_X01(IO);
      OB <= NOT (TO_X01(IO));
    end if;

    if ((TM = '1') or (TM = 'H')) then
      IO <= 'Z';
    elsif ((TM = '0') or (TM = 'L')) then
      if ((I = '1') or (I = 'H')) then
        IO <= '1';
      elsif ((I = '0') or (I = 'L')) then
        IO <= '0';
      elsif (I = 'U') then
        IO <= 'U';
      else
        IO <= 'X';  
      end if;
    elsif (TM = 'U') then
      IO <= 'U';          
    else                                      
      IO <= 'X';  
    end if;

    if ((TS = '1') or (TS = 'H')) then
      IOB <= 'Z';
    elsif ((TS = '0') or (TS = 'L')) then
      if (((not I) = '1') or ((not I) = 'H')) then
        IOB <= '1';
      elsif (((not I) = '0') or ((not I) = 'L')) then
        IOB <= '0';
      elsif ((not I) = 'U') then
        IOB <= 'U';
      else
        IOB <= 'X';  
      end if;
    elsif (TS = 'U') then
      IOB <= 'U';          
    else                                      
      IOB <= 'X';  
    end if;        
  end process;


end IOBUFDS_DIFF_OUT_V;
