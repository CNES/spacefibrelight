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
-- Author(s) : Y.DAURIAC
--
-- Project : IP SpaceFibreLight
--
-- Creation date : 30/07/2025
--
-- Description : This module splits the data bus of 64 bits to 32 bits
--               and capability bus from 8 bits to 16 bits
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library phy_plus_lane_64_lib;
  use phy_plus_lane_64_lib.pkg_phy_plus_lane_64b.all;

entity ppl_64_bus_split_rx is
   port (
      RST_N                        : in  std_logic;                                   --! global reset
      CLK                          : in  std_logic;                                   --! Clock synchronous of the Data-link layer
      -- Data-link layer interface
      FIFO_RX_RD_EN_DL             : in  std_logic;                                   --! FIFO RX read enable flag from the Data-link layer
      DATA_RX_PLBSR                : out std_logic_vector(31 downto 0);               --! 32-bit Data parallel
      FIFO_RX_DATA_VALID_PLBSR     : out std_logic;                                   --! Flag new data
      VALID_K_CHARAC_RX_PLBSR      : out std_logic_vector(3 downto 0);                --! 4-bit valid K character
      FAR_END_CAPA_PLBSR           : out std_logic_vector(7 downto 0);                --! Capability field received in INIT3 control word
      LANE_ACTIVE_PLBSR            : out std_logic;                                   --! Lane Active flag
      -- fifo_rx_data (PLFRD) interface
      FIFO_RX_RD_EN_PLBSR          : out std_logic;                                   --! FIFO RX read enable flag
      DATA_RX_PLFRD                : in  std_logic_vector(C_DATA_WIDTH-1  downto 0);  --! 64-bit Data parallel
      FIFO_RX_DATA_VALID_PLFRD     : in  std_logic;                                   --! Flag new data
      FIFO_RX_EMPTY_PLFRD          : in  std_logic;                                   --! Flag FIFO Empty
      VALID_K_CHARAC_RX_PLFRD      : in  std_logic_vector(C_K_CHAR_WIDTH-1 downto 0); --! 8-bit valid K character flags
      DATA_RDY_RX_PLFRD            : in  std_logic_vector(1 downto 0);                --! Data valid flag
      -- ppl_64_ctrl_fifo_rx (PLCFR) interface
      FAR_END_CAPA_PLFRC           : in std_logic_vector(7 downto 0);                 --! Capability field received in INIT3 control word
      LANE_ACTIVE_PLFRC            : in std_logic                                     --! Lane Active flag
   );
end ppl_64_bus_split_rx;

architecture rtl of ppl_64_bus_split_rx is
---------------------------------------------------------
-----                  Signal declaration           -----
---------------------------------------------------------
type split_bus_fsm_type is (
  IDLE_ST,               --! Wait until FIFO RX is not empty before reading
  EMPTY_BUFFER,         --! Handle data from FIFO RX and split it
  HALF_FULL_BUFFER, --! Wait until FIFO_RX_RD_EN_DL is active to enable FIFO_RX_DATA_VALID_PLBSR flag
  FULL_BUFFER,    	--! Wait until FIFO_RX_RD_EN_DL is active to send the buffered data
  FULL_FULL_BUFFER
  );

-- data path
signal current_state         : split_bus_fsm_type;
signal buffer_data_96        : std_logic_vector(95 downto 0);
signal buffer_k_char_12      : std_logic_vector(11 downto 0);
signal fifo_rx_rd_en_plbsr_i : std_logic;
begin



FIFO_RX_RD_EN_PLBSR <= fifo_rx_rd_en_plbsr_i;
---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_split_data
-- Description: Splits data bus of 2 words of 32 bits in a data bus of 1 word of 32 bits
---------------------------------------------------------
p_split_data: process(CLK, RST_N)
begin
  if RST_N ='0' then
    DATA_RX_PLBSR            <= (others=>'0');
    fifo_rx_rd_en_plbsr_i    <= '0';
    VALID_K_CHARAC_RX_PLBSR  <= (others=>'0');
    FIFO_RX_DATA_VALID_PLBSR <= '0';
    current_state            <= IDLE_ST;
    buffer_data_96           <= (others => '0');
    buffer_k_char_12         <= (others => '0');
  elsif rising_edge(CLK)  then
    FIFO_RX_DATA_VALID_PLBSR <= '0';
    fifo_rx_rd_en_plbsr_i    <= '0';
    case current_state is
      when IDLE_ST                =>
                                    if FIFO_RX_EMPTY_PLFRD = '0' then
                                      fifo_rx_rd_en_plbsr_i <= '1';
                                      current_state       <= EMPTY_BUFFER;
                                    end if;

      when EMPTY_BUFFER           =>---------------------------------
                                    --       2 words received      --
                                    ---------------------------------
                                    if FIFO_RX_DATA_VALID_PLFRD = '1' and DATA_RDY_RX_PLFRD ="11" then
                                      if FIFO_RX_RD_EN_DL = '1' then
                                        -- Send word 1 & word 2 saved
                                        DATA_RX_PLBSR                 <= DATA_RX_PLFRD(31 downto 0);
                                        VALID_K_CHARAC_RX_PLBSR       <= VALID_K_CHARAC_RX_PLFRD(3 downto 0);
                                        buffer_data_96(31 downto 0)   <= DATA_RX_PLFRD(63 downto 32);
                                        buffer_k_char_12(3 downto 0)  <= VALID_K_CHARAC_RX_PLFRD(7 downto 4);
                                        FIFO_RX_DATA_VALID_PLBSR      <= '1';
                                        current_state                 <= HALF_FULL_BUFFER;
                                      else
                                        -- Word 1 & word 2 saved
                                        buffer_data_96(63 downto 0)   <= DATA_RX_PLFRD;
                                        buffer_k_char_12(7 downto 0)  <= VALID_K_CHARAC_RX_PLFRD;
                                        current_state                 <= FULL_BUFFER;
                                      end if;
                                    ----------------------------------
                                    -- Second word (only) received  --
                                    ----------------------------------
                                    elsif FIFO_RX_DATA_VALID_PLFRD = '1' and DATA_RDY_RX_PLFRD ="10"then
                                      -- Word 2 saved
                                      buffer_data_96(31 downto 0)  <= DATA_RX_PLFRD(63 downto 32);
                                      buffer_k_char_12(3 downto 0) <= VALID_K_CHARAC_RX_PLFRD(7 downto 4);
                                      if FIFO_RX_RD_EN_DL = '1' then
                                        -- Send word 2
                                        DATA_RX_PLBSR            <= DATA_RX_PLFRD(63 downto 32);
                                        VALID_K_CHARAC_RX_PLBSR  <= VALID_K_CHARAC_RX_PLFRD(7 downto 4);
                                        FIFO_RX_DATA_VALID_PLBSR <= '1';
                                        current_state            <= EMPTY_BUFFER;
                                        fifo_rx_rd_en_plbsr_i    <= '1';
                                      else
                                        current_state <= HALF_FULL_BUFFER;
                                      end if;
                                    ---------------------------------
                                    -- First word (only) received  --
                                    ---------------------------------
                                    elsif FIFO_RX_DATA_VALID_PLFRD = '1' and DATA_RDY_RX_PLFRD ="01"then
                                      -- Word 1 saved
                                      buffer_data_96(31 downto 0)  <= DATA_RX_PLFRD(31 downto 0);
                                      buffer_k_char_12(3 downto 0) <= VALID_K_CHARAC_RX_PLFRD(3 downto 0);
                                      if FIFO_RX_RD_EN_DL = '1' then
                                        -- Send word 1
                                        DATA_RX_PLBSR            <= DATA_RX_PLFRD(31 downto 0);
                                        VALID_K_CHARAC_RX_PLBSR  <= VALID_K_CHARAC_RX_PLFRD(3 downto 0);
                                        FIFO_RX_DATA_VALID_PLBSR <= '1';
                                        current_state            <= EMPTY_BUFFER;
                                        fifo_rx_rd_en_plbsr_i    <= '1';
                                      else
                                        current_state <= HALF_FULL_BUFFER;
                                      end if;
                                    else
                                      current_state          <= EMPTY_BUFFER;
                                      fifo_rx_rd_en_plbsr_i  <= not(fifo_rx_rd_en_plbsr_i);
                                    end if;

      when HALF_FULL_BUFFER         =>--------------------------------------
                                    --          2 words received          --
                                    --------------------------------------
                                    if FIFO_RX_DATA_VALID_PLFRD = '1' and DATA_RDY_RX_PLFRD ="11" then
                                      if FIFO_RX_RD_EN_DL = '1' then
                                        -- Send word bufferized / word 1 & word 2 saved
                                        DATA_RX_PLBSR                <= buffer_data_96(31 downto 0);
                                        VALID_K_CHARAC_RX_PLBSR      <= buffer_k_char_12(3 downto 0);
                                        FIFO_RX_DATA_VALID_PLBSR     <= '1';
                                        buffer_data_96(63 downto 0)  <= DATA_RX_PLFRD;
                                        buffer_k_char_12(7 downto 0) <= VALID_K_CHARAC_RX_PLFRD;
                                        current_state <= FULL_BUFFER;
                                      else
                                        buffer_data_96(95 downto 32)  <= DATA_RX_PLFRD;
                                        buffer_k_char_12(11 downto 4) <= VALID_K_CHARAC_RX_PLFRD;
                                        current_state                 <= FULL_FULL_BUFFER;
                                      end if;
                                    ----------------------------------
                                    -- Second word (only) received  --
                                    ----------------------------------
                                    elsif FIFO_RX_DATA_VALID_PLFRD = '1' and DATA_RDY_RX_PLFRD ="10"then
                                      if FIFO_RX_RD_EN_DL = '1' then
                                        -- Send word bufferized / word 2 saved
                                        buffer_data_96(31 downto 0)  <= DATA_RX_PLFRD(63 downto 32);
                                        buffer_k_char_12(3 downto 0) <= VALID_K_CHARAC_RX_PLFRD(7 downto 4);
                                        DATA_RX_PLBSR                <= buffer_data_96(31 downto 0);
                                        VALID_K_CHARAC_RX_PLBSR      <= buffer_k_char_12(3 downto 0);
                                        FIFO_RX_DATA_VALID_PLBSR     <= '1';
                                        current_state                <= HALF_FULL_BUFFER;
                                        fifo_rx_rd_en_plbsr_i        <= '1';
                                      else
                                        -- Word 2 saved
                                        buffer_data_96(63 downto 32) <= DATA_RX_PLFRD(63 downto 32);
                                        buffer_k_char_12(7 downto 4) <= VALID_K_CHARAC_RX_PLFRD(7 downto 4);
                                        current_state                <= FULL_BUFFER;
                                      end if;
                                    ---------------------------------
                                    -- First word (only) received  --
                                    ---------------------------------
                                    elsif FIFO_RX_DATA_VALID_PLFRD = '1' and DATA_RDY_RX_PLFRD ="01"then
                                      -- Word 1 saved
                                      buffer_data_96(63 downto 32)  <= DATA_RX_PLFRD(31 downto 0);
                                      buffer_k_char_12(7 downto 4)  <= VALID_K_CHARAC_RX_PLFRD(3 downto 0);
                                      if FIFO_RX_RD_EN_DL = '1' then
                                        -- Send word bufferized / word 1 saved
                                        DATA_RX_PLBSR                 <= buffer_data_96(31 downto 0);
                                        VALID_K_CHARAC_RX_PLBSR       <= buffer_k_char_12(3 downto 0);
                                        buffer_data_96(31 downto 0)   <= DATA_RX_PLFRD(31 downto 0);
                                        buffer_k_char_12(3 downto 0)  <= VALID_K_CHARAC_RX_PLFRD(3 downto 0);
                                        FIFO_RX_DATA_VALID_PLBSR      <= '1';
                                        current_state                 <= HALF_FULL_BUFFER;
                                        fifo_rx_rd_en_plbsr_i         <= '1';
                                      else
                                        -- Word 1 saved
                                        buffer_data_96(63 downto 32)  <= DATA_RX_PLFRD(31 downto 0);
                                        buffer_k_char_12(7 downto 4)  <= VALID_K_CHARAC_RX_PLFRD(3 downto 0);
                                        current_state                 <= FULL_BUFFER;
                                      end if;
                                    else
                                      if FIFO_RX_RD_EN_DL = '1' then
                                        -- Send word 1
                                        DATA_RX_PLBSR            <= buffer_data_96(31 downto 0);
                                        VALID_K_CHARAC_RX_PLBSR  <= buffer_k_char_12(3 downto 0);
                                        FIFO_RX_DATA_VALID_PLBSR <= '1';
                                        current_state            <= EMPTY_BUFFER;
                                        fifo_rx_rd_en_plbsr_i    <= not(fifo_rx_rd_en_plbsr_i);
                                      else
                                        current_state <= HALF_FULL_BUFFER;
                                      end if;
                                      fifo_rx_rd_en_plbsr_i  <= not(fifo_rx_rd_en_plbsr_i);
                                    end if;

      when FULL_BUFFER         =>   --------------------------------------
                                    --  Second word saved management    --
                                    --------------------------------------
                                    if FIFO_RX_RD_EN_DL = '1' then
                                      -- Send second word saved
                                      DATA_RX_PLBSR                <= buffer_data_96(31 downto 0);
                                      VALID_K_CHARAC_RX_PLBSR      <= buffer_k_char_12(3 downto 0);
                                      buffer_data_96(63 downto 0)  <= buffer_data_96(95 downto 32);
                                      buffer_k_char_12(7 downto 0) <= buffer_k_char_12(11 downto 4);
                                      FIFO_RX_DATA_VALID_PLBSR     <= '1';
                                      fifo_rx_rd_en_plbsr_i        <= '1';
                                      current_state                <= HALF_FULL_BUFFER;
                                    else
                                      current_state <= FULL_BUFFER;
                                    end if;
      when FULL_FULL_BUFFER         =>--------------------------------------
                                    --  Third word saved management       --
                                    ----------------------------------------
                                    if FIFO_RX_RD_EN_DL = '1' then
                                      -- Send third word saved
                                      DATA_RX_PLBSR                 <= buffer_data_96(31 downto 0);
                                      VALID_K_CHARAC_RX_PLBSR       <= buffer_k_char_12(3 downto 0);
                                      buffer_data_96(63 downto 0)   <= buffer_data_96(95 downto 32);
                                      buffer_k_char_12(7 downto 0)  <= buffer_k_char_12(11 downto 4);
                                      FIFO_RX_DATA_VALID_PLBSR      <= '1';
                                      current_state                 <= FULL_BUFFER;
                                    else
                                      current_state <= FULL_FULL_BUFFER;
                                    end if;

      when others                 =>
                                    current_state            <= IDLE_ST;
    end case;
  end if;
end process p_split_data;
---------------------------------------------------------
-- Process: p_concat_ctrl
--! Splits one 16-bit bus into two 8-bit words
---------------------------------------------------------
p_concat_ctrl: process(CLK, RST_N)
begin
  if RST_N ='0' then
    FAR_END_CAPA_PLBSR <= (others=>'0');
    LANE_ACTIVE_PLBSR   <= '0';
  elsif rising_edge(CLK)  then
    LANE_ACTIVE_PLBSR  <= LANE_ACTIVE_PLFRC;
    FAR_END_CAPA_PLBSR <= FAR_END_CAPA_PLFRC;
  end if;
end process p_concat_ctrl;

end architecture rtl;