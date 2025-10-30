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
--------------------------------------------------------------------------
-- COMPANY       : CNES
--------------------------------------------------------------------------
-- TITLE         : pkg_tb.vhd
-- PROJECT       : SPACE FIBRE LIGHT
--------------------------------------------------------------------------
-- AUTHOR        : Yvan DAURIAC
-- CREATED       : 01/07/2025
--------------------------------------------------------------------------
-- DESCRIPTION   : package for the models testbenchs
--------------------------------------------------------------------------
-- History       : V1.0: Creation of the file
--------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use IEEE.MATH_REAL.ALL;

library std;
use std.textio.all;

library work;

package pkg_simu is
    procedure log_info (msg: string);
    procedure log_error(msg: string; test_failed : inout boolean);
    procedure check_equal(
      signal_name: string;
      expected, actual: std_logic_vector;
      test_failed : inout boolean
      );
    procedure check(
     info        : in    string;
     expected    : in    std_logic;
     result      : in    std_logic;
     test_failed : inout boolean
  );
    procedure log_test_result(test_failed: boolean);

end package pkg_simu;

package body pkg_simu is

  -- Logging procedures
  procedure log_info(msg: string) is
  begin
    report "[INFO] " & msg severity note;
  end procedure;

  procedure log_error(msg: string; test_failed : inout boolean) is
  begin
    test_failed := true;
    report "[ERROR] " & msg severity error;
  end procedure;

  -- Equality check between expected and actual values
  procedure check_equal(signal_name: string; expected, actual: std_logic_vector;  test_failed : inout boolean) is
  begin
    if expected /= actual then
      log_error(signal_name & " mismatch. Expected: " & to_hstring(to_bitvector(expected)) & ", Actual: " & to_hstring(to_bitvector(actual)), test_failed);
    else
      -- log_info(signal_name & " match OK: " & to_hstring(to_bitvector(actual)));
    end if;
  end procedure;
    procedure check(
     info        : in    string;
     expected    : in    std_logic;
     result      : in    std_logic;
     test_failed : inout boolean
  ) is
     variable stdio : line;
  begin
     if (result /= expected) then
         report "### NOT OK ### : " & info & " is false" severity error;
         write(stdio, string'(" expected : ")); write(stdio, expected);
         write(stdio, string'(" but had : ")); write(stdio, result);
         report stdio.all severity error;
         test_failed := true;
     end if;
  end procedure;

  procedure log_test_result(test_failed: boolean) is
    constant LF : character := character'val(10);
    variable msg : string(1 to 81);
  begin
    if test_failed = false then
      msg := LF & "##########################" & LF &
                  "#       TEST PASSED      #" & LF &
                  "##########################";
      report msg severity note;
    else
      msg := LF & "##########################" & LF &
                  "#      TEST FAILED       #" & LF &
                  "##########################";
      report msg severity error;
    end if;
  end procedure;

end package body pkg_simu;