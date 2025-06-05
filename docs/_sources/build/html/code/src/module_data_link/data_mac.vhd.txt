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
-- Description : This module describe the Medim Access Controller
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library data_link_lib;
use data_link_lib.data_link_lib.all;

entity data_mac is
  generic(
    G_VC_NUM             : integer := 8                                            --! Number of virtual channel
    );
  port (
    CLK                  : in  std_logic;                                          --! Global Clock
    -- data_link_reset (DLRE) interface
    LINK_RESET_DLRE        :in  std_logic;                                         --! Link Reset command
    -- phy_plus_lane (PPL) interface
    LANE_ACTIVE_PPL      : in  std_logic;                                          --! Lane Active flag for the DATA Link Layer
    -- data_err_management (DERRM) interface
    REQ_ACK_DERRM        : in  std_logic;                                          --! ACK request from data_err_management
    REQ_NACK_DERRM       : in  std_logic;                                          --! NACK request from data_err_management
    TRANS_POL_FLG_DERRM  : in  std_logic;                                          --! Transmission polarity flag from data_err_management
    REQ_ACK_DONE_DMAC    : out std_logic;                                          --! Acknowledge done signal to data_err_management
    SEQ_NUM_ACK_DERRM    : in  std_logic_vector(7 downto 0);                       --! SEQ_NUM ACK value from data_err_management
    -- data_in_buf (DIBUF) interface
    REQ_FCT_DIBUF        : in  std_logic_vector(G_VC_NUM-1 downto 0);              --! FCT request from data_in_buf
    REQ_FCT_DONE_DMAC    : out std_logic_vector(G_VC_NUM-1 downto 0);              --! FCT request done flag to data_in_buf
    -- data_out_buff (DOBUF) interface
    VC_READY_DOBUF       : in  std_logic_vector(G_VC_NUM downto 0);                --! Virtual Channel ready flag vector
    VC_DATA_DOBUF        : in  vc_data_array(G_VC_NUM downto 0);                   --! Array of data vector for each Virtual Channel
    VC_VALID_K_CHAR_DOBUF: in  vc_k_array(G_VC_NUM downto 0);                      --! Array of K character valid in the 32-bit VC_DATA_DOBUF
    VC_DATA_VALID_DOBUF  : in  std_logic_vector(G_VC_NUM downto 0);                --! Data valid flag associated with VC_DATA_DOBUF
    VC_END_PACKET_DOBUF  : in  std_logic_vector(G_VC_NUM downto 0);                --! End packet flag vector for each Virtual Channel
    VC_RD_EN_DMAC        : out  std_logic_vector(G_VC_NUM downto 0);               --! Read command vector for each Virtual Channel
    -- MIB interface
    VC_PAUSE_MIB         : in  std_logic_vector(G_VC_NUM downto 0);                --! Pause the corresponding virtual channel after the end of current transmission
    VC_END_EMISSION_DMAC : out std_logic_vector(G_VC_NUM downto 0);                --! Indicates that corresponding channel finished emitting a frame
    VC_RUN_EMISSION_DMAC : out std_logic_vector(G_VC_NUM downto 0);                --! Indicates that corresponding channel is emitting a frame
    DATA_COUNTER_TX_DMAC : out std_logic_vector(6 downto 0);                       --! Indicate the number of data transmitted in last frame emitted
    ACK_COUNTER_TX_DMAC  : out  std_logic_vector(2 downto 0);                      --! ACK counter TX
    NACK_COUNTER_TX_DMAC : out  std_logic_vector(2 downto 0);                      --! NACK counter TX
    FCT_COUNTER_TX_DMAC  : out  std_logic_vector(3 downto 0);                      --! FCT counter TX
    -- data_encapsulation (DENC) interface
    DATA_DMAC            : out std_logic_vector(C_DATA_LENGTH-1 downto 0);         --! Data parallel to data_encapsulation
    VALID_K_CHAR_DMAC    : out std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0); --! K charachter valid in the 32-bit DATA_DMAC vector
    NEW_WORD_DMAC        : out std_logic;                                          --! New word Flag to data_encapsulation
    END_PACKET_DMAC      : out std_logic;                                          --! End frame/control word to data_encapsulation
    TYPE_FRAME_DMAC      : out std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);   --! Type of the frame associated with DATA_DMAC
    VIRTUAL_CHANNEL_DMAC : out std_logic_vector(G_VC_NUM-1 downto 0);              --! Virtual channel of the frame associated with DATA_DMAC
    BC_TYPE_DMAC         : out std_logic_vector(G_VC_NUM-1 downto 0);              --! BROADCAST Type
    BC_CHANNEL_DMAC      : out std_logic_vector(G_VC_NUM-1 downto 0);              --! BROADCAST Channel (one channel in this implementation)
    BC_STATUS_DMAC       : out std_logic_vector(2-1 downto 0);                     --! BOADCAST status
    MULT_CHANNEL_DMAC    : out std_logic_vector(G_VC_NUM-1 downto 0);              --! Multiplier and Channel field for FCT word
    TRANS_POL_FLG_DMAC   : out std_logic;                                          --! Transmission polarity flag
    SEQ_NUM_ACK_DMAC     : out std_logic_vector(7 downto 0)                        --! SEQ_NUM ACK value
  );
end data_mac;

architecture rtl of data_mac is

---------------------------------------------------------
-----                  Signal declaration           -----
---------------------------------------------------------
type data_dmac_fsm is (
  IDLE_ST,         --! Idle state: wait Virtual Channel ready or request
  START_ENCAPS_ST, --! Start encapsulation state
  TRANSFER_ST,     --! Data/broadcast transfer state
  END_ST,          --! End data/broadcast transfer state
  REQ_ST           --! Request treatment state
  );

  signal current_state_vc  : data_dmac_fsm;
  signal current_state_req : data_dmac_fsm;

  signal type_frame      : std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);

  signal idle_data       : unsigned(C_DATA_LENGTH-1 downto 0);
  signal idle_cnt        : unsigned(6-1 downto 0);

  signal ack_counter     : unsigned(2 downto 0);          --! ACK counter TX
  signal nack_counter    : unsigned(2 downto 0);          --! NACK counter TX
  signal fct_counter     : unsigned(3 downto 0);          --! FCT counter TX
  signal data_counter    : unsigned(6 downto 0);          --! FCT counter TX
  signal req_ack_done    : std_logic;
  signal cnt_wait_ack    : unsigned(3 downto 0);
  signal cnt_wait        : std_logic;

  signal current_channel : integer range 0 to G_VC_NUM; -- Index of the current channel
begin
---------------------------------------------------------
-----                     Assignements              -----
---------------------------------------------------------
  DATA_COUNTER_TX_DMAC <= std_logic_vector(data_counter);
  ACK_COUNTER_TX_DMAC  <= std_logic_vector(ack_counter);
  NACK_COUNTER_TX_DMAC <= std_logic_vector(nack_counter);
  FCT_COUNTER_TX_DMAC  <= std_logic_vector(fct_counter);
  REQ_ACK_DONE_DMAC    <= req_ack_done;
  TYPE_FRAME_DMAC      <= type_frame;
---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_arbiter
-- Description: Transmits data of virtual channels
--              and manages request
---------------------------------------------------------
p_arbiter: process(CLK)
begin
  if rising_edge(CLK)  then
    if LINK_RESET_DLRE ='1' then
      VC_RD_EN_DMAC        <= (others => '0');
      type_frame           <= (others => '0');
      current_state_vc     <= IDLE_ST;
      current_state_req    <= IDLE_ST;
      idle_data            <= (others => '1');
      idle_cnt             <= (others => '0');
      ack_counter          <= (others => '0');
      nack_counter         <= (others => '0');
      fct_counter          <= (others => '0');
      current_channel      <= 0;
      data_counter         <= (others => '0');
      req_ack_done         <= '0';
      cnt_wait             <= '1';
      VC_END_EMISSION_DMAC <= (others => '0');
      VC_RUN_EMISSION_DMAC <= (others => '0');
      DATA_DMAC            <= (others => '0');
      VALID_K_CHAR_DMAC    <= (others => '0');
      NEW_WORD_DMAC        <= '0';
      END_PACKET_DMAC      <= '0';
      VIRTUAL_CHANNEL_DMAC <= (others => '0');
      BC_TYPE_DMAC         <= (others => '0');
      BC_CHANNEL_DMAC      <= (others => '0');
      BC_STATUS_DMAC       <= (others => '0');
      MULT_CHANNEL_DMAC    <= (others => '0');
      REQ_FCT_DONE_DMAC    <= (others => '0');
      TRANS_POL_FLG_DMAC   <= '0';
      SEQ_NUM_ACK_DMAC     <= (others => '0');
    elsif LANE_ACTIVE_PPL= '1' then
      END_PACKET_DMAC    <= '0';
      NEW_WORD_DMAC      <= '0';
      VC_RD_EN_DMAC      <= (others => '0');
      REQ_FCT_DONE_DMAC  <= (others => '0');
      TRANS_POL_FLG_DMAC <= TRANS_POL_FLG_DERRM;
      SEQ_NUM_ACK_DMAC   <= SEQ_NUM_ACK_DERRM;
      req_ack_done       <= '0';
      cnt_wait           <= '1';
      case current_state_vc is
        when IDLE_ST =>
          current_state_req    <= IDLE_ST;
          type_frame           <= C_IDLE_FRM;
          VC_RUN_EMISSION_DMAC <= (others => '0');
          DATA_DMAC            <= std_logic_vector(idle_data);
          VALID_K_CHAR_DMAC    <= (others => '0');
          -- Idle
          if idle_cnt= 63 then -- Last Idle data of the frames
            END_PACKET_DMAC <= '1';
            idle_data       <= idle_data -1;
            idle_cnt        <= (others => '0');
          else
            idle_data <= idle_data -1;
            idle_cnt  <= idle_cnt +1;
          end if;
          -- Req or Channel ready
          if (((REQ_ACK_DERRM = '1' or REQ_NACK_DERRM = '1' ) and cnt_wait_ack = 15) or REQ_FCT_DIBUF /= std_logic_vector(to_unsigned(0,G_VC_NUM))) and type_frame /= C_BC_FRM and cnt_wait = '1' then -- Pending request
            current_state_vc <= REQ_ST;
          elsif VC_READY_DOBUF(current_channel) = '1' and VC_PAUSE_MIB(current_channel) = '0' then -- Channel ready
            current_state_vc               <= START_ENCAPS_ST;
            VC_RD_EN_DMAC(current_channel) <= '1';
          elsif (VC_READY_DOBUF and not(VC_PAUSE_MIB)) /= std_logic_vector(to_unsigned(0, G_VC_NUM+1)) then
            current_channel <= (current_channel + 1) mod (G_VC_NUM+1);
            NEW_WORD_DMAC   <= '1';
          else
            NEW_WORD_DMAC <= '1';
          end if;

        when START_ENCAPS_ST => -- Start data transfer
            VC_RD_EN_DMAC(current_channel)        <= '1';
            VIRTUAL_CHANNEL_DMAC                  <= std_logic_vector(to_unsigned(current_channel,VIRTUAL_CHANNEL_DMAC'length));
            NEW_WORD_DMAC                         <= '1';
            VC_RUN_EMISSION_DMAC(current_channel) <= '1';
            if current_channel = G_VC_NUM then
              type_frame <= C_BC_FRM;
            else
              type_frame <= C_DATA_FRM;
            end if;
            current_state_vc <= TRANSFER_ST;

        when TRANSFER_ST => -- Data transfer in progress
          VC_RD_EN_DMAC(current_channel) <= '1';
          if current_channel = G_VC_NUM then
            type_frame <= C_BC_FRM;
          else
            type_frame <= C_DATA_FRM;
          end if;
          if VC_DATA_VALID_DOBUF(current_channel)='1'  then
            if VC_END_PACKET_DOBUF(current_channel) = '1' then -- Last data of a transfer
              DATA_DMAC                      <= VC_DATA_DOBUF(current_channel);
              VALID_K_CHAR_DMAC              <= VC_VALID_K_CHAR_DOBUF(current_channel);
              NEW_WORD_DMAC                  <= VC_DATA_VALID_DOBUF(current_channel);
              END_PACKET_DMAC                <= VC_END_PACKET_DOBUF(current_channel);
              data_counter                   <= data_counter + 1;
              VC_RD_EN_DMAC(current_channel) <= '0';
              current_state_vc               <= END_ST;
            elsif (((REQ_ACK_DERRM = '1' or REQ_NACK_DERRM = '1' ) and cnt_wait_ack = 15) or REQ_FCT_DIBUF /= std_logic_vector(to_unsigned(0,G_VC_NUM))) and type_frame /= C_BC_FRM and cnt_wait = '1' then -- Pending request
              DATA_DMAC         <= VC_DATA_DOBUF(current_channel);
              VALID_K_CHAR_DMAC <= VC_VALID_K_CHAR_DOBUF(current_channel);
              NEW_WORD_DMAC     <= VC_DATA_VALID_DOBUF(current_channel);
              data_counter      <= data_counter + 1;
              current_state_vc  <= REQ_ST;
            else
              DATA_DMAC         <= VC_DATA_DOBUF(current_channel);
              VALID_K_CHAR_DMAC <= VC_VALID_K_CHAR_DOBUF(current_channel);
              NEW_WORD_DMAC     <= VC_DATA_VALID_DOBUF(current_channel);
              data_counter      <= data_counter + 1;
              current_state_req <= TRANSFER_ST;
            end if;
          elsif (((REQ_ACK_DERRM = '1' or REQ_NACK_DERRM = '1' ) and cnt_wait_ack = 15) or REQ_FCT_DIBUF /= std_logic_vector(to_unsigned(0,G_VC_NUM))) and type_frame /= C_BC_FRM and cnt_wait = '1' then -- Pending request
            current_state_vc <= REQ_ST;
          end if;
        when END_ST => -- End of data transfer
          if current_channel = G_VC_NUM then
            type_frame <= C_BC_FRM;
          else
            type_frame <= C_DATA_FRM;
          end if;
          VC_END_EMISSION_DMAC(current_channel) <= '1';
          current_state_vc                      <= IDLE_ST;
          current_channel                       <= (current_channel + 1) mod (G_VC_NUM+1);

        when REQ_ST =>
          if VC_END_PACKET_DOBUF(current_channel) = '1' and VC_DATA_VALID_DOBUF(current_channel)='1' then -- Last data of a transfer
            DATA_DMAC                      <= VC_DATA_DOBUF(current_channel);
            VALID_K_CHAR_DMAC              <= VC_VALID_K_CHAR_DOBUF(current_channel);
            NEW_WORD_DMAC                  <= VC_DATA_VALID_DOBUF(current_channel);
            END_PACKET_DMAC                <= VC_END_PACKET_DOBUF(current_channel);
            data_counter                   <= data_counter + 1;
            VC_RD_EN_DMAC(current_channel) <= '0';
            current_state_vc               <= END_ST;
          elsif VC_DATA_VALID_DOBUF(current_channel)='1' then -- Classic data transfer
            DATA_DMAC         <= VC_DATA_DOBUF(current_channel);
            VALID_K_CHAR_DMAC <= VC_VALID_K_CHAR_DOBUF(current_channel);
            NEW_WORD_DMAC     <= VC_DATA_VALID_DOBUF(current_channel);
            data_counter      <= data_counter + 1;
            current_state_req <= TRANSFER_ST;
          else
            current_state_vc  <= current_state_req; -- context reminder
            cnt_wait          <= '0';
            if REQ_ACK_DERRM = '1' and cnt_wait_ack = 15 then -- ACK Request
              NEW_WORD_DMAC   <= '1';
              END_PACKET_DMAC <= '1';
              ack_counter     <= ack_counter + 1;
              req_ack_done    <= '1';
              type_frame      <= C_ACK_FRM;
            elsif REQ_NACK_DERRM = '1' and cnt_wait_ack = 15  then -- NACK Request
              NEW_WORD_DMAC   <= '1';
              END_PACKET_DMAC <= '1';
              nack_counter    <= nack_counter + 1;
              req_ack_done    <= '1';
              type_frame      <= C_NACK_FRM;
            elsif REQ_FCT_DIBUF /= std_logic_vector(to_unsigned(0,G_VC_NUM)) then -- FCT Request
              NEW_WORD_DMAC   <= '1';
              END_PACKET_DMAC <= '1';
              fct_counter     <= fct_counter +1;
              type_frame      <= C_FCT_FRM;
              if REQ_FCT_DIBUF(0) ='1' then
                REQ_FCT_DONE_DMAC(0) <= '1';
                MULT_CHANNEL_DMAC    <= std_logic_vector(to_unsigned(0,MULT_CHANNEL_DMAC'length));
              elsif REQ_FCT_DIBUF(1) ='1' then
                REQ_FCT_DONE_DMAC(1) <= '1';
                MULT_CHANNEL_DMAC    <= std_logic_vector(to_unsigned(1,MULT_CHANNEL_DMAC'length));
              elsif REQ_FCT_DIBUF(2) ='1' then
                REQ_FCT_DONE_DMAC(2) <= '1';
                MULT_CHANNEL_DMAC    <= std_logic_vector(to_unsigned(2,MULT_CHANNEL_DMAC'length));
              elsif REQ_FCT_DIBUF(3) ='1' then
                REQ_FCT_DONE_DMAC(3) <= '1';
                MULT_CHANNEL_DMAC    <= std_logic_vector(to_unsigned(3,MULT_CHANNEL_DMAC'length));
              elsif REQ_FCT_DIBUF(4) ='1' then
                REQ_FCT_DONE_DMAC(4) <= '1';
                MULT_CHANNEL_DMAC    <= std_logic_vector(to_unsigned(4,MULT_CHANNEL_DMAC'length));
              elsif REQ_FCT_DIBUF(5) ='1' then
                REQ_FCT_DONE_DMAC(5) <= '1';
                MULT_CHANNEL_DMAC    <= std_logic_vector(to_unsigned(5,MULT_CHANNEL_DMAC'length));
              elsif REQ_FCT_DIBUF(6) ='1' then
                REQ_FCT_DONE_DMAC(6) <= '1';
                MULT_CHANNEL_DMAC    <= std_logic_vector(to_unsigned(6,MULT_CHANNEL_DMAC'length));
              elsif REQ_FCT_DIBUF(7) ='1' then
                REQ_FCT_DONE_DMAC(7) <= '1';
                MULT_CHANNEL_DMAC    <= std_logic_vector(to_unsigned(7,MULT_CHANNEL_DMAC'length));
              end if;
            end if;
          end if;
      end case;
    end if;
  end if;
end process p_arbiter;

---------------------------------------------------------
-- Process: p_cnt_wait_ack
-- Description: Ensures 15 words minimum beetween 2 ACK or NACK
---------------------------------------------------------
p_cnt_wait_ack: process(CLK)
begin
  if rising_edge(CLK)  then
    if LINK_RESET_DLRE ='1' then
      cnt_wait_ack <= (others => '0');
    else
      if req_ack_done = '1' then
        cnt_wait_ack <= (others => '0');
      elsif cnt_wait_ack < 15 then
        cnt_wait_ack <= cnt_wait_ack + 1;
      end if;
    end if;
  end if;
end process p_cnt_wait_ack;

end architecture rtl;

