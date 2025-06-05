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
-- Creation date : 14/03/2025
--
-- Description : This module describes the management of the ACK, NACK request
--							 and the polarity flags
----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library data_link_lib;
use data_link_lib.data_link_lib.all;

entity data_err_management is
  port (
    CLK                      : in std_logic;                                --! Global Clock
    -- data_link_reset (DLRE) interface
    LINK_RESET_DLRE          : in  std_logic;                               --! Link Reset command
    LINK_RESET_DERRM         : out std_logic;                               --! Link Reset request
    -- data_seq_check (DSCHECK) interface
    TYPE_FRAME_DSCHECK       : in std_logic_vector(3 downto 0);             --! Current frame/control word type from data_seq_check
    END_FRAME_DSCHECK        : in std_logic;                                --! End flag of the current frame/control word from data_seq_check
    SEQ_ERR_DSCHECK          : in std_logic;                                --! SEQ_NUM error for the current frame/control word from data_seq_check
    SEQ_NUM_ACK_DSCHECK      : in std_logic_vector(6 downto 0);             --! SEQ_NUM ACK value from data_seq_check
    FAR_END_RPF_DSCHECK      : in std_logic;                                --! Far-end RPF flag
    NEAR_END_RPF_DERRM       : out std_logic;                               --! Near-end RPF flag
    CRC_ERR_DSCHECK          : in std_logic;                                --! CRC error flag for the current frame/control word from data_seq_check
    FRAME_ERR_DSCHECK        : in std_logic;                                --! Frame error flag for the current frame/control word from data_seq_check
    RXERR_DSCHECK            : in std_logic;                                --! Receive error flag from data_word_interface
    -- data_mac (DMAC) interface
    REQ_ACK_DERRM            : out std_logic;                               --! ACK request to data_mac
    REQ_NACK_DERRM           : out std_logic;                               --! NACK request to data_mac
    TRANS_POL_FLG_DERRM      : out std_logic;                               --! Transmission polarity flag to data_mac
    SEQ_NUM_ACK_DERRM        : out std_logic_vector(7 downto 0);            --! SEQ_NUM ACK value to data_mac
    REQ_ACK_DONE_DMAC        : in std_logic;                                --! Acknowledge done signal from data_mac
    -- MIB  interface
    NACK_RST_EN_MIB          : in std_logic;                                --! Enable automatic link reset on NACK reception
    NACK_RST_MODE_MIB        : in std_logic                                 --! Up for instant link reset on NACK reception, down for link reset at the end of the current received frame on NACK reception
  );
end data_err_management;

architecture Behavioral of data_err_management is
---------------------------------------------------------
-----                  Signal declaration           -----
---------------------------------------------------------
  type state_type is (
		VALID_POSITIVE_ST,  --! Valid Positive State
		VALID_NEGATIVE_ST,  --! Valid Negative State
		ERROR_POSITIVE_ST,  --! Error Positive State
		ERROR_NEGATIVE_ST   --! Error Negative State
	);

  signal state               : state_type;

  signal s_nack_request      : std_logic;
  signal s_ack_request       : std_logic;
  signal nack_request_fsm    : std_logic;
  signal ack_request_fsm     : std_logic;
  signal nack_request_out    : std_logic;
  signal ack_request_out     : std_logic;
  signal s_far_end_rpf       : std_logic;
  signal s_seq_err           : std_logic;
  signal flg_nack_rst_flg    : std_logic;
  signal s_seq_num_request   : std_logic_vector(6 downto 0);
  signal s_seq_num_fsm       : std_logic_vector(6 downto 0);
  signal s_seq_num_out       : std_logic_vector(6 downto 0);
  signal near_end_rpf        : std_logic;
  signal trans_pol_flg       : std_logic;
  signal ack_pol_flg         : std_logic;
begin
	--------------------------------------------------------
	--                  Assignements                     ---
	--------------------------------------------------------
  REQ_NACK_DERRM      <= nack_request_out;
  REQ_ACK_DERRM       <= ack_request_out;
  SEQ_NUM_ACK_DERRM   <= ack_pol_flg & s_seq_num_fsm;
  NEAR_END_RPF_DERRM  <= near_end_rpf;
  TRANS_POL_FLG_DERRM <= trans_pol_flg;
---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_fsm
-- Description: FSM to determine the polarity flags
--							(TPF and RPF)
---------------------------------------------------------
  p_fsm : process (CLK)
  begin
    if rising_edge(CLK)  then
      if LINK_RESET_DLRE ='1' then
        state               <= VALID_POSITIVE_ST;
        near_end_rpf        <= '0';
        nack_request_fsm    <= '0';
        ack_request_fsm     <= '0';
        s_far_end_rpf       <= '0';
        s_seq_err           <= '0';
        s_seq_num_fsm       <= (others => '0');
        ack_pol_flg         <= '0';
      else
        -- Synchronization for the FSM
        s_far_end_rpf    <= FAR_END_RPF_DSCHECK;
        s_seq_err        <= SEQ_ERR_DSCHECK;
        ack_request_fsm  <= s_ack_request;
        nack_request_fsm <= s_nack_request;
        s_seq_num_fsm    <= s_seq_num_request;
        case state is
          when VALID_POSITIVE_ST =>
              									near_end_rpf        <= '0';  -- positive
                                ack_pol_flg         <= '0';  -- positive
              									if s_nack_request = '1' then -- NACK Request
              									    state <= ERROR_NEGATIVE_ST;
              									end if;

          when VALID_NEGATIVE_ST =>
              									near_end_rpf        <= '1';  -- negative
                                ack_pol_flg         <= '1';  -- negative
              									if s_nack_request = '1' then -- NACK Request
              									    state <= ERROR_POSITIVE_ST;
              									end if;

          when ERROR_POSITIVE_ST =>
              									near_end_rpf        <= '0'; -- positive
                                ack_pol_flg         <= '1'; -- negative
              									if s_ack_request = '1' then -- ACK Request
              									    state <= VALID_POSITIVE_ST;
              									elsif s_far_end_rpf = '0' and s_seq_err = '1' then --Invalid Sequence Number received with positive polarity
              									    state <= ERROR_NEGATIVE_ST;
              									end if;

          when ERROR_NEGATIVE_ST  =>
              									near_end_rpf         <= '1'; -- negative
                                ack_pol_flg          <= '0'; -- positive
              									if s_ack_request = '1' then -- ACK Request
              									    state <= VALID_NEGATIVE_ST;
              									elsif s_far_end_rpf = '1' and s_seq_err = '1' then --Invalid Sequence Number received with negative polarity
              									    state <= ERROR_POSITIVE_ST;
              									end if;
        end case;
      end if;
    end if;
  end process p_fsm;
---------------------------------------------------------
-- Process: p_err
-- Description: Error detection, internal request management
---------------------------------------------------------
  p_err : process(CLK)
  begin
    if rising_edge(CLK)  then
      if LINK_RESET_DLRE ='1' then
        s_nack_request    <= '0';
        s_ack_request     <= '0';
        s_seq_num_request <= (others => '0');
      else
        -- Nack requested for broadcast and data frames if rx_err or crc_err
        if RXERR_DSCHECK = '1' and (TYPE_FRAME_DSCHECK = C_DATA_FRM or TYPE_FRAME_DSCHECK = C_BC_FRM) then
          s_nack_request <= '1';
          s_ack_request  <= '0';
        elsif CRC_ERR_DSCHECK = '1' and (TYPE_FRAME_DSCHECK = C_DATA_FRM or TYPE_FRAME_DSCHECK = C_BC_FRM) then
          s_nack_request <= '1';
          s_ack_request  <= '0';
        -- Nack requested for broadcast, data, FCT, and FULL frames if seq_err
        elsif SEQ_ERR_DSCHECK = '1' and  (TYPE_FRAME_DSCHECK = C_DATA_FRM or TYPE_FRAME_DSCHECK = C_BC_FRM) then
          s_nack_request <= '1';
          s_ack_request  <= '0';
        -- Nack requested for broadcast, data, FCT, and FULL frames if seq_err
        elsif SEQ_ERR_DSCHECK = '1' and CRC_ERR_DSCHECK = '0' and  (TYPE_FRAME_DSCHECK = C_IDLE_FRM or TYPE_FRAME_DSCHECK = C_FCT_FRM or TYPE_FRAME_DSCHECK = C_FULL_FRM) then
          s_nack_request <= '1';
          s_ack_request  <= '0';
        -- Ack requested for broadcast, data, FCT, and FULL frames if end of frame without seq_err
        elsif SEQ_ERR_DSCHECK = '0' and END_FRAME_DSCHECK = '1'  and (TYPE_FRAME_DSCHECK = C_DATA_FRM or TYPE_FRAME_DSCHECK = C_BC_FRM or TYPE_FRAME_DSCHECK = C_FCT_FRM or TYPE_FRAME_DSCHECK = C_FULL_FRM) then
          s_ack_request     <= '1';
          s_nack_request    <= '0';
          s_seq_num_request <= SEQ_NUM_ACK_DSCHECK;
        else
          s_ack_request  <= '0';
          s_nack_request <= '0';
        end if;
      end if;
    end if;
  end process p_err;
---------------------------------------------------------
-- Process: p_sync
-- Description: Output request management: priority to
--							the latest, done handling, synchronization
---------------------------------------------------------
  p_sync : process (CLK)
  begin
    if rising_edge(CLK)  then
      if LINK_RESET_DLRE ='1' then
        ack_request_out  <= '0';
        nack_request_out <= '0';
        s_seq_num_out    <= (others =>'0');
      else
        if ack_request_out = '1' then
          -- Ack valid but new Nack request
          if REQ_ACK_DONE_DMAC = '1' and nack_request_fsm = '1' then
            ack_request_out  <= '0';
            nack_request_out <= '1';
          -- Ack valid but new Ack request
          elsif REQ_ACK_DONE_DMAC = '1' and ack_request_fsm = '1' then
            ack_request_out  <= '1';
            nack_request_out <= '0';
            s_seq_num_out    <= s_seq_num_fsm;
          -- Ack valid
          elsif REQ_ACK_DONE_DMAC = '1' then
            ack_request_out  <= '0';
            nack_request_out <= '0';
          -- Priority to the latest request
          elsif nack_request_fsm = '1' then
            ack_request_out  <= '0';
            nack_request_out <= '1';
          end if;
        elsif nack_request_out = '1' then
          -- Nack valid but new Nack request
          if REQ_ACK_DONE_DMAC = '1' and nack_request_fsm = '1' then
            ack_request_out  <= '0';
            nack_request_out <= '1';
          -- Nack valid but new Ack request
          elsif REQ_ACK_DONE_DMAC = '1' and ack_request_fsm = '1' then
            ack_request_out  <= '1';
            nack_request_out <= '0';
            s_seq_num_out    <= s_seq_num_fsm;
          -- Ack valid
          elsif REQ_ACK_DONE_DMAC = '1' then
            ack_request_out  <= '0';
            nack_request_out <= '0';
          -- Priority to the latest request
          elsif ack_request_fsm = '1' then
            ack_request_out  <= '1';
            nack_request_out <= '0';
            s_seq_num_out    <= s_seq_num_fsm;
          end if;
        -- Priority to the latest request
        elsif ack_request_fsm = '1' then
          ack_request_out  <= '1';
          nack_request_out <= '0';
          s_seq_num_out    <= s_seq_num_fsm;
        elsif nack_request_fsm = '1' then
          ack_request_out  <= '0';
          nack_request_out <= '1';
        end if;
      end if;
    end if;
  end process p_sync;
---------------------------------------------------------
-- Process: p_tpf
-- Description: Transmit polarity flag management
---------------------------------------------------------
p_tpf : process(CLK)
begin
  if rising_edge(CLK)  then
    if LINK_RESET_DLRE ='1' then
      trans_pol_flg <= '0';
    else
      if (TYPE_FRAME_DSCHECK = C_NACK_FRM) and END_FRAME_DSCHECK = '1' and CRC_ERR_DSCHECK ='0' and SEQ_ERR_DSCHECK = '0' then
        trans_pol_flg <= not(trans_pol_flg);
      end if;
    end if;
  end if;
end process p_tpf;
---------------------------------------------------------
-- Process: p_nack_rst_strat
-- Description: NACK reset strategy
---------------------------------------------------------
p_nack_rst_strat : process(CLK)
begin
  if rising_edge(CLK)  then
    if LINK_RESET_DLRE ='1' then
      LINK_RESET_DERRM <= '0';
      flg_nack_rst_flg <='0';
    else
      if NACK_RST_EN_MIB = '1' then
        if NACK_RST_MODE_MIB = '1' then
          if FRAME_ERR_DSCHECK = '0' and SEQ_ERR_DSCHECK = '0' and CRC_ERR_DSCHECK = '0' and (TYPE_FRAME_DSCHECK = C_NACK_FRM) and END_FRAME_DSCHECK = '1' then
            LINK_RESET_DERRM <= '1';
          else
            LINK_RESET_DERRM <= '0';
          end if;
        -- else
          -- if FRAME_ERR_DSCHECK = '0' and (TYPE_FRAME_DSCHECK = C_NACK_FRM) and END_FRAME_DSCHECK = '1' then
          --   flg_nack_rst_flg <= '1';
          --   LINK_RESET_DERRM <= '0';
          -- elsif (TYPE_FRAME_DSCHECK = C_DATA_FRM or TYPE_FRAME_DSCHECK = C_BC_FRM) and END_FRAME_DSCHECK = '1' and FRAME_ERR_DSCHECK = '0' and flg_nack_rst_flg = '1' then
          --   LINK_RESET_DERRM <= '1';
          -- else
          --   LINK_RESET_DERRM <= '0';
          -- end if;
        end if;
      else
        LINK_RESET_DERRM <= '0';
      end if;
    end if;
  end if;
end process p_nack_rst_strat;

end Behavioral;
