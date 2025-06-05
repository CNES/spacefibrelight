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
-- Description : This module permits to desencapsulate the DATA frame
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library data_link_lib;
use data_link_lib.data_link_lib.all;

entity data_desencapsulation is
  generic (
    G_VC_NUM               : integer := 8                                     --! Number of virtual channels
  );
  port (
    CLK                    : in  std_logic;                                   --! Global Clock
    -- data_link_reset (DLRE) interface
    LINK_RESET_DLRE        : in std_logic;                                    --! Link Reset command
    -- data_mid_buffer (DMBUF)interface
    DATA_DMBUF             : in  std_logic_vector(C_DATA_K_WIDTH-1 downto 0); --! Data parallel (K character + DATA) from data_mid_buffer
    DATA_RD_DDES           : out std_logic;                                   --! Read command
    DATA_VALID_DMBUF       : in  std_logic;                                   --! Data valid flag associated with DATA_DMBUF
    -- data_in_buf (DIBUF) interface
    DATA_DDES              : out  vc_data_k_array(G_VC_NUM-1 downto 0);       --! Data parallel (K character + DATA) to each data_in_buf (1 per VC)
    DATA_EN_DDES           : out  std_logic_vector(G_VC_NUM-1 downto 0)       --! Data valid flag associated with DATA_DDES
  );
end data_desencapsulation;

architecture rtl of data_desencapsulation is
---------------------------------------------------------
-----                  Signal declaration           -----
---------------------------------------------------------
signal data_detected        : std_logic; --high when sdf read
signal vc_nb                : unsigned(7 downto 0);

begin
---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_desencapsulation
-- Description: Desencapsulates each frame
---------------------------------------------------------
p_desencapsulation : process(CLK)
begin
  if rising_edge(CLK)  then
    if LINK_RESET_DLRE ='1' then
      DATA_DDES          <= (others =>(others => '0'));
      DATA_EN_DDES       <= (others => '0');
      DATA_RD_DDES       <= '0';
      data_detected      <= '0';
      vc_nb              <= (others => '0');
    else
      DATA_RD_DDES      <= '1';
      if DATA_VALID_DMBUF = '1' then
        --                            33 downto 32
        if DATA_DMBUF(C_DATA_K_WIDTH - 3 downto C_DATA_K_WIDTH - 4) = "01" then --reading a K character
          --                            15 downto 0
          if DATA_DMBUF(C_BYTE_WIDTH*2 - 1 downto 0) =  C_SDF_SYMB & C_K28_7_SYMB  then -- SDF
            data_detected <= '1';
            vc_nb         <= unsigned(DATA_DMBUF(C_BYTE_WIDTH*3 -1 downto C_BYTE_WIDTH*2));
          --                              7 downto 0   
          elsif DATA_DMBUF(C_BYTE_WIDTH - 1 downto 0) = C_K28_0_SYMB then --EDF
            data_detected <= '0';
            DATA_EN_DDES  <= (others => '0');
          end if;
        elsif data_detected = '1' then -- frame running
          DATA_DDES(to_integer(vc_nb))    <= DATA_DMBUF(C_DATA_K_WIDTH-1 downto 0);
          DATA_EN_DDES(to_integer(vc_nb)) <= '1';
        end if;
      else --not valid
        DATA_DDES        <= (others =>(others => '0'));
        DATA_EN_DDES     <= (others => '0');
      end if;
    end if;
  end if;
end process p_desencapsulation;

end architecture rtl;