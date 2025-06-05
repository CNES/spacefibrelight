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
-- Author(s) : Y. DAURIAC
--
-- Project : IP SpaceFibreLight
--
-- Creation date : 12/03/2025
--
-- Description : This module permits to desencapsulate the BROADCAST frame
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library data_link_lib;
use data_link_lib.data_link_lib.all;

entity data_desencapsulation_bc is
  port (
    CLK                      : in  std_logic;                                    --! Global Clock
    -- data_link_reset (DLRE) interface
    LINK_RESET_DLRE        : in std_logic;                                       --! Link Reset command
    -- data_mid_buffer_bc (DMBUFBC)interface
    DATA_DMBUFBC             : in  std_logic_vector(C_DATA_K_WIDTH-1 downto 0);  --! Data parallel (K character + DATA) from data_mid_buffer_bc
    DATA_RD_DDESBC           : out std_logic;                                    --! Read command
    DATA_VALID_DMBUFBC       : in  std_logic;                                    --! Data valid flag associated with DATA_DMBUFBC
    -- data_in_bc_buf (DIBUFBC) interface
    DATA_DDESBC              : out  std_logic_vector(C_DATA_K_WIDTH-1 downto 0); --! Data parallel (K character + DATA) to data_in_bc_buf (BRODACST channel)
    DATA_EN_DDESBC           : out  std_logic                                    --! Data valid flag associated with DATA_DDESBC
  );
end data_desencapsulation_bc;

architecture rtl of data_desencapsulation_bc is
---------------------------------------------------------
-----                  Signal declaration           -----
---------------------------------------------------------
signal broadcast_detected   : std_logic; --high when sbf read

begin
---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_desencapsulation_bc
-- Description: Desencapsulates each broadcast frame
---------------------------------------------------------
p_desencapsulation_bc : process(CLK)
begin
  if rising_edge(CLK)  then
    if LINK_RESET_DLRE ='1' then
      DATA_DDESBC          <= (others => '0');
      DATA_EN_DDESBC       <= '0';
      DATA_RD_DDESBC       <= '0';
      broadcast_detected   <= '0';
    else
      DATA_RD_DDESBC      <= '1';
      if DATA_VALID_DMBUFBC = '1' then
        --                              33 downto 32
        if DATA_DMBUFBC(C_DATA_K_WIDTH - 3 downto C_DATA_K_WIDTH - 4) = "01" then --reading a K character
          --                               15 downto 0
          if DATA_DMBUFBC(C_BYTE_WIDTH*2 - 1 downto 0) =  C_SBF_SYMB & C_K28_7_SYMB then --SBF
            broadcast_detected <= '1';
          --                                7 downto 0
          elsif DATA_DMBUFBC(C_BYTE_WIDTH - 1 downto 0) = C_K28_2_SYMB then --EBF
            broadcast_detected <= '0';
            DATA_EN_DDESBC     <= '0';
          end if;
        elsif broadcast_detected = '1' then -- frame running
              DATA_DDESBC    <= DATA_DMBUFBC(C_DATA_K_WIDTH-1 downto 0);
              DATA_EN_DDESBC <= '1';
        end if;
      else --not valid
        DATA_DDESBC    <= (others => '0');
        DATA_EN_DDESBC <= '0';
      end if;
    end if;
  end if;
end process p_desencapsulation_bc;

end architecture rtl;