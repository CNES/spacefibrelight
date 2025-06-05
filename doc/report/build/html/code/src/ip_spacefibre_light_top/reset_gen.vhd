-----------------------------------------------------------------------------------
-- #                          Copyright CNES 2025                                 #
-- #                                                                              #
-- # This source describes Open Hardware and is licensed under the CERN-OHL-W v2. #
-- #                                                                              #
-- # You may redistribute and modify this documentation and make products         #
-- # using it under the terms of the CERN-OHL-W v2 (https:/cern.ch/cern-ohl).     #
-- #                                                                              #
-- # This documentation is distributed WITHOUT ANY EXPRESS OR IMPLIED             #
-- # WARRANTY, INCLUDING OF MERCHANTABILITY, SATISFACTORY QUALITY                 #
-- # AND FITNESS FOR A PARTICULAR PURPOSE.                                        #
-- #                                                                              #
-- # Please see the CERN-OHL-W v2 for applicable conditions.                      #
-----------------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Author(s) : J.PIQUEMAL
--
-- Project : IP SpaceFibreLight
--
-- Creation date : 03/09/2024
--
-- Description : This module allows to generate internal reset.
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity reset_gen is
   port(
      RST_N                : in  std_logic;     --! global reset
      CLK                  : in  std_logic;     --! General clock
      RST_TX_DONE          : in  std_logic;     --! Reset tx of IP GTY done flag
      LANE_RESET           : in  std_logic;     --! LANE RESET command
      INTERNAL_SYNC_RST_N  : out std_logic      --! Internal reset resynchronized on 150MHz internal clock
   );
end reset_gen;

architecture rtl of reset_gen is

---------------------------------------------------------
-----                  Signal declaration           -----
---------------------------------------------------------
   signal reset_gen_r_n    : std_logic;         --! internal reset simple resynchro
   signal reset_gen_rr_n   : std_logic;         --! internal reset double resynchro
   signal rst_tx_done_r       : std_logic;      --! internal rst_tx_done simple resynchro

begin
---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
   -- Resynchronized reset on 50MHz internal clock
   p_reset_gen : process(CLK,RST_N)
   begin
      if (RST_N = '0') then  -- Asynchronous activation reset
         reset_gen_r_n  <= '0';
         reset_gen_rr_n <= '0';
         rst_tx_done_r  <= '1';
      elsif rising_edge(CLK) then   -- Synchronous deactivation reset
         if LANE_RESET ='1' then
           reset_gen_r_n  <= '0';
           reset_gen_rr_n <= '0';
           rst_tx_done_r  <= '1';
         else
           if rst_tx_done_r = '0' and RST_TX_DONE = '1'  then
              reset_gen_r_n  <= '1';
           elsif RST_TX_DONE = '1' then
              reset_gen_rr_n <= reset_gen_r_n;
           else
              reset_gen_r_n  <= '0';
              reset_gen_rr_n <= '0';
           end if;
           rst_tx_done_r <= RST_TX_DONE;
         end if;
      end if;
   end process p_reset_gen;

   -- outputs
   INTERNAL_SYNC_RST_N  <= reset_gen_rr_n;

end architecture rtl;
