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
-- Creation date : 24/02/2025
--
-- Description : This module check the CRC validity
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library data_link_lib;
use data_link_lib.data_link_lib.all;

entity data_crc_check is
  port (
    CLK                    : in  std_logic;                                           --! Global clock
    -- data_link_reset (DLRE) interface
    LINK_RESET_DLRE        : in std_logic;                                            --! Link Reset command
    -- data_word_identification (DWI) interface
    DATA_DWI               : in std_logic_vector(C_DATA_LENGTH-1 downto 0);           --! Data parallel from data_word_id_fsm
    VALID_K_CHARAC_DWI     : in std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);   --! K character valid in the 32-bit DATA_DWI vector
    NEW_WORD_DWI           : in std_logic;                                            --! New word Flag from data_word_id_fsm
    END_FRAME_DWI          : in std_logic;                                            --! End frame/control word from data_word_id_fsm
    SEQ_NUM_DWI            : in std_logic_vector(7 downto 0);                         --! SEQ_NUM from data_word_id_fsm
    CRC_16B_DWI            : in std_logic_vector(15 downto 0);                        --! 16-bit CRC (data frame)  from data_word_id_fsm
    CRC_8B_DWI             : in std_logic_vector(7 downto 0);                         --! 8-bit CRC from data_word_id_fsm
    TYPE_FRAME_DWI         : in std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);     --! Current frame/control word type from data_word_id_fsm
    FRAME_ERR_DWI          : in std_logic;                                            --! Frame error flag from data_word_id_fsm
    MULTIPLIER_DWI         : in std_logic_vector(C_MULT_SIZE-1 downto 0);             --! Multiplier value of the current FCT word
		VC_DWI                 : in std_logic_vector(C_CHANNEL_SIZE-1 downto 0);          --! Virtual Channel of the current FCT word
    RXERR_DWI              : in std_logic;                                            --! RXERR flag detection
		RXERR_ALL_DWI          : in std_logic;                                            --! RXERR flag detection during broadcast and data frame status
    RXNOTHING_ACTIVE_DWI   : in std_logic;                                            --! RXNOTHING state of the data_word_id_fsm flag
    -- data_seq_check (DSCHECK) interface
    NEW_WORD_DCCHECK       : out std_logic;                                           --! New word flag associated with DATA_DCCHECK
    DATA_DCCHECK           : out std_logic_vector(C_DATA_LENGTH-1 downto 0);          --! Data parallel to data_seq_check
    VALID_K_CHARAC_DCCHECK : out std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);  --! K character valid in the 32-bit DATA_DCCHECK vector
    END_FRAME_DCCHECK      : out std_logic;                                           --! End frame/control word flag
    TYPE_FRAME_DCCHECK     : out std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);    --! Current frame/control word type
    SEQ_NUM_DCCHECK        : out std_logic_vector(7 downto 0);                        --! SEQ_NUM value
    CRC_ERR_DCCHECK        : out std_logic;                                           --! CRC error flag
    FRAME_ERR_DCCHECK      : out std_logic;                                           --! Frame error flag for the current frame
    MULTIPLIER_DCCHECK     : out std_logic_vector(C_MULT_SIZE-1 downto 0);            --! Multiplier value of the current FCT word
		VC_DCCHECK             : out std_logic_vector(C_CHANNEL_SIZE-1 downto 0);         --! Virtual Channel of the current FCT word
    RXERR_DCCHECK          : out std_logic;                                           --! RXERR flag for the current frame
    RXERR_ALL_DCCHECK      : out std_logic;                                           --! RXERR flag during broadcast and data frame status
    -- MIB
    CRC_LONG_ERR_DCCHECK   : out std_logic;                                           --! CRC 16-bit error flag
    CRC_SHORT_ERR_DCCHECK  : out std_logic                                            --! CRC 8-bit error flag
  );
end data_crc_check;

architecture rtl of data_crc_check is

---------------------------------------------------------
-----                  Signal declaration           -----
---------------------------------------------------------
-- Arrays to identify usefull byte
type int_array      is array (0 to 3) of integer;
type int_array_tier is array (0 to 2) of integer;
type int_array_dem  is array (0 to 1) of integer;
signal indices      : int_array      := (0, 8, 16, 24);
signal indices_tier : int_array_tier := (0, 8, 16);
signal indices_dem  : int_array_dem  := (0, 8);
-- CRC 16 Bits compute
signal crc_reg_16b_comp              : std_logic_vector(16-1 downto 0);
signal crc_long_err                  : std_logic;
-- CRC 8 Bits compute
signal crc_reg_8b_comp               : std_logic_vector(8-1 downto 0);
signal crc_short_err                 : std_logic;

begin

---------------------------------------------------------
-----                     Assignement               -----
---------------------------------------------------------
  CRC_LONG_ERR_DCCHECK  <= crc_long_err;
  CRC_SHORT_ERR_DCCHECK <= crc_short_err;
  CRC_ERR_DCCHECK       <= crc_short_err or crc_long_err;
---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_crc_16b
-- Description: Computes and checks the CRC for a data frame
---------------------------------------------------------
 p_crc_16b: process(CLK)
    variable crc_var : std_logic_vector(15 downto 0); -- variable used to calculate the CRC
    variable crc_in  : std_logic_vector(15 downto 0); -- variable used to reverse the CRC
begin
  if rising_edge(CLK)  then
    if LINK_RESET_DLRE ='1' then
        crc_reg_16b_comp   <= (others => '1'); -- Reset CRC to seed value
        crc_long_err       <= '0';
    else
      crc_var           := crc_reg_16b_comp;
      crc_long_err       <= '0';
      if RXNOTHING_ACTIVE_DWI ='1' or FRAME_ERR_DWI = '1' then
        crc_reg_16b_comp   <= (others => '1'); -- Reset CRC to seed value
      elsif (TYPE_FRAME_DWI = C_DATA_FRM) then
        if END_FRAME_DWI = '1' and NEW_WORD_DWI = '1'then -- Last word
          -- calculates the crc 16-bit byte by byte
          for i in indices_dem'range loop
              crc_var := calculate_crc_16(DATA_DWI(7+ indices_dem(i) downto 0 + indices_dem(i)), crc_var);
          end loop;
          -- Bit-by-bit inversion (CRC Input)
          for i in 0 to 15 loop
            crc_in(i) := CRC_16B_DWI(15 - i);
          end loop;
          -- Checks CRC validity
          if crc_in /= crc_var then
            crc_long_err  <= '1';
          else
            crc_long_err  <= '0';
          end if;
          crc_reg_16b_comp   <= (others => '1'); -- Reset CRC to seed value
        elsif NEW_WORD_DWI = '1' then
          -- calculates the CRC 16-bit byte by byte
          for i in indices'range loop
              crc_var := calculate_crc_16(DATA_DWI(7+ indices(i) downto 0 + indices(i)), crc_var);
          end loop;
            crc_reg_16b_comp <= crc_var;
        end if;
      end if;
    end if;
  end if;
end process p_crc_16b;

---------------------------------------------------------
-- Process: p_crc_8b
-- Description: Computes and checks the CRC for broadcast frame,
--              FCT, ACK, NACK and SIF
---------------------------------------------------------
p_crc_8b: process(CLK)
    variable crc_var : std_logic_vector(7 downto 0); -- variable used to calculate the CRC
    variable crc_in  : std_logic_vector(7 downto 0); -- variable used to reverse the CRC
begin
  if rising_edge(CLK)  then
    if LINK_RESET_DLRE ='1' then
      crc_reg_8b_comp <= (others => '0'); -- Reset CRC to seed value
      crc_short_err   <= '0';
    else
      crc_var       := crc_reg_8b_comp;
      crc_short_err <= '0';
      if RXNOTHING_ACTIVE_DWI ='1' or FRAME_ERR_DWI = '1' then
        crc_reg_8b_comp   <= (others => '0'); -- Reset CRC to seed value
      elsif TYPE_FRAME_DWI /= C_DATA_FRM then
        if END_FRAME_DWI = '1'and NEW_WORD_DWI = '1'then -- Last word
          -- calculates the CRC 8-bit byte by byte
          for i in indices_tier'range loop
            crc_var := calculate_crc_8(DATA_DWI(7+ indices_tier(i) downto 0 + indices_tier(i)), crc_var);
          end loop;
          -- Bit-by-bit inversion
          for i in 0 to 7 loop
            crc_in(i) := CRC_8B_DWI(7 - i);
          end loop;
          -- Checks CRC validity
          if crc_in /= crc_var then
            crc_short_err  <= '1';
          else
            crc_short_err  <= '0';
          end if;
          crc_reg_8b_comp <= (others => '0'); -- Reset CRC to seed value
        elsif NEW_WORD_DWI = '1' then
          -- calculates the CRC 8-bit byte by byte
          for i in indices'range loop
              crc_var := calculate_crc_8(DATA_DWI(7+ indices(i) downto 0 + indices(i)), crc_var);
          end loop;
          crc_reg_8b_comp <= crc_var;
        end if;
      end if;
    end if;
  end if;
end process p_crc_8b;
---------------------------------------------------------
-- Process: p_trans_ctrl_sig
-- Description: Signals transmission for data_seq_check.
---------------------------------------------------------
p_trans_ctrl_sig: process(CLK)
begin
  if rising_edge(CLK)  then
    if LINK_RESET_DLRE ='1' then
      SEQ_NUM_DCCHECK        <= (others => '0');
      NEW_WORD_DCCHECK       <= '0';
      DATA_DCCHECK           <= (others => '0');
      VALID_K_CHARAC_DCCHECK <= (others => '0');
      TYPE_FRAME_DCCHECK     <= (others => '0');
      END_FRAME_DCCHECK      <= '0';
      FRAME_ERR_DCCHECK      <= '0';
      MULTIPLIER_DCCHECK     <= (others => '0');
      VC_DCCHECK             <= (others => '0');
      RXERR_DCCHECK          <= '0';
      RXERR_ALL_DCCHECK      <= '0';
    else
      SEQ_NUM_DCCHECK        <= SEQ_NUM_DWI;
      NEW_WORD_DCCHECK       <= NEW_WORD_DWI;
      END_FRAME_DCCHECK      <= END_FRAME_DWI;
      DATA_DCCHECK           <= DATA_DWI;
      VALID_K_CHARAC_DCCHECK <= VALID_K_CHARAC_DWI;
      TYPE_FRAME_DCCHECK     <= TYPE_FRAME_DWI;
      FRAME_ERR_DCCHECK      <= FRAME_ERR_DWI;
      MULTIPLIER_DCCHECK     <= MULTIPLIER_DWI;
      VC_DCCHECK             <= VC_DWI;
      RXERR_DCCHECK          <= RXERR_DWI;
      RXERR_ALL_DCCHECK      <= RXERR_ALL_DWI;
    end if;
  end if;
end process p_trans_ctrl_sig;

end architecture rtl;