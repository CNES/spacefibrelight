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
-- Description : This module describes the Output Buffer & Flow control
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library data_link_lib;
use data_link_lib.data_link_lib.all;


entity data_out_buff is
  port (
    RST_N                 : in  std_logic;                                          --! Global reset (Active-low)
    CLK                   : in  std_logic;                                          --! Global Clock
    -- phy_plus_lane (PPL) interface
    LANE_ACTIVE_ST_PPL    : in  std_logic;                                          --! Lane Active state flag
    -- data_link_reset (DLRE) interface
    LINK_RESET_DLRE        :in  std_logic;                                          --! Link Reset command
    -- AXI-Stream interface
    S_AXIS_ARSTN_NW	      : in  std_logic;                                          --! Active-low asynchronous reset signal for the AXI-Stream i
		S_AXIS_ACLK_NW	      : in  std_logic;                                          --! Clock signal for the AXI-Stream interface
		S_AXIS_TREADY_DL      : out std_logic;                                          --! Ready signal from the slave indicating it can accept data
		S_AXIS_TDATA_NW       : in  std_logic_vector(C_DATA_LENGTH-1 downto 0);         --! Data bus carrying the actual payload
		S_AXIS_TUSER_NW       : in  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0); --! User-defined sideband information (optional)
		S_AXIS_TLAST_NW       : in  std_logic;                                          --! Signal indicating the last transfer in a packet
		S_AXIS_TVALID_NW      : in  std_logic;                                          --! Valid signal indicating that the data on TDATA is valid
    -- data_mac (DMAC) interface
    VC_READY_DOBUF        : out std_logic;                                          --! Virtual Channel ready flag
    DATA_DOBUF            : out std_logic_vector(C_DATA_LENGTH-1 downto 0);         --! Data parallel to data_mac
    VALID_K_CHARAC_DOBUF  : out std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0); --! K character valid in the 32-bit DATA_DOBUF vector
    DATA_VALID_DOBUF      : out std_logic;                                          --! Data valid flag associated with DATA_DOBUF
    END_PACKET_DOBUF      : out std_logic;                                          --! End packet flag
    VC_RD_EN_DMAC         : in  std_logic;                                          --! Read command from data_mac
    --DSCHECK interface
    M_VAL_DSCHECK         : in  std_logic_vector(C_M_SIZE-1 downto 0);              --! M value associated with FCT_FAR_END_DSCHECK
    FCT_FAR_END_DSCHECK   : in  std_logic;                                          --! FCT Fare-end received flag
    --MIB Interface
    FCT_CC_OVF_DOBUF      : out std_logic;                                          --! FCT credit counter overflow flag
    CREDIT_VC_DOBUF       : out std_logic;                                          --! Has credit flag (crdit counter > 0)
    VC_CONT_MODE_MIB      : in  std_logic                                           --! Continuous mode command
  );
end data_out_buff;

architecture rtl of data_out_buff is
---------------------------------------------------------
-----                  Module declaration           -----
---------------------------------------------------------
  component FIFO_DC_AXIS_S is
  	generic (
  		-- Users to add parameters here
      G_DWIDTH                : integer := 36;                                 -- Data bus fifo length
      G_AWIDTH                : integer := 10;                                 -- Address bus fifo length
      G_THRESHOLD_HIGH        : integer := 2**10;                              -- high threshold
      G_THRESHOLD_LOW         : integer := 0;                                  -- low threshold
      -- User parameters ends
      S_AXIS_TDATA_WIDTH	    : integer := 32;                                 -- Data AXIS length
  		S_AXIS_TUSER_WIDTH	    : integer := 4                                   -- User AXIS length
  	);
  	port (
  		-- Users to add ports here
  		aresetn      	        : in std_logic;
  		-- Custom interface master (rd)
  		RD_CLK                  : in  std_logic;                                -- Clock
      RD_DATA                 : out std_logic_vector(G_DWIDTH-1 downto 0);    -- Data read bus
      RD_DATA_EN              : in  std_logic;                                -- Read command
      RD_DATA_VLD             : out std_logic;                                -- Data valid
  		-- STATUS FIFO
      cmd_flush               : in  std_logic;                                -- Fifo flush
      STATUS_BUSY_FLUSH       : out std_logic;                                -- Fifo is flushing
      STATUS_THRESHOLD_HIGH   : out std_logic;                                -- Threshold high reached flag (on WR_CLK)
      STATUS_THRESHOLD_LOW    : out std_logic;                                -- Threshold low reached flag (on RD_CLK)
      STATUS_FULL             : out std_logic;                                -- Full fifo flag (on WR_CLK)
      STATUS_EMPTY            : out std_logic;                                -- Empty fifo flag (on RD_CLK)
      STATUS_LEVEL_WR         : out std_logic_vector(G_AWIDTH-1 downto 0);    -- FIFO fill level (on WR_CLK)
      STATUS_LEVEL_RD         : out std_logic_vector(G_AWIDTH-1 downto 0) ;   -- FIFO fill level (on RD_CLK)
      -- User ports ends
  		-- Do not modify the ports beyond this line
  		-- Ports of Axi SLAVE Bus Interface S00_AXIS
  		S_AXIS_ACLK             : in std_logic;
  		S_AXIS_TREADY         	: out std_logic;
  		S_AXIS_TDATA          	: in std_logic_vector(C_DATA_LENGTH-1 downto 0);
  		S_AXIS_TUSER          	: in std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
  		S_AXIS_TLAST          	: in std_logic;
  		S_AXIS_TVALID         	: in std_logic
  	);
  end component;
---------------------------------------------------------
-----                  Signal declaration           -----
---------------------------------------------------------

type data_in_fsm is (
  INIT_ST,           --! Initialization State
  IDLE_ST,           --! Idle State
  WAIT_END_FLUSH_ST, --! Waiting for the end of fifo flush State
  ADD_EEP_ST,        --! EEP injection State
  WAIT_EIP_ST        --! EOP or EEP waiting State
  );

  signal current_state          : data_in_fsm;
  --Fifo signals
  signal rd_data                : std_logic_vector(C_DATA_LENGTH + C_BYTE_BY_WORD_LENGTH-1 downto 0);
  signal rd_data_vld            : std_logic;
  signal status_busy_flush      : std_logic;
  signal status_threshold_high  : std_logic;
  signal status_threshold_low   : std_logic;
  signal status_full            : std_logic;
  signal status_empty           : std_logic;

  signal s_axis_tdata_i         : std_logic_vector(C_DATA_LENGTH-1 downto 0);
  signal s_axis_tuser_i         : std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
  signal s_axis_tlast_i         : std_logic;
  signal s_axis_tvalid_i        : std_logic;
  signal s_axis_tready_i        : std_logic;
  signal s_axis_tready_r        : std_logic;
  -- continuous mode
  signal cont_mode_flg          : std_logic;
  signal last_k_char            : std_logic;
  signal cmd_flush              : std_logic;
  signal cmd_flush_reg1         : std_logic;
  signal cmd_flush_sync         : std_logic;
  --Flow control signals
  signal fct_credit_cnt         : unsigned(C_FCT_CC_SIZE-1 downto 0);
  signal eip_out                : std_logic;
  signal eip_in_req             : std_logic;
  signal eip_in_req_reg1        : std_logic;
  signal eip_in_req_reg2        : std_logic;
  signal eip_out_ack            : std_logic;
  signal cnt_eip                : unsigned(6-1 downto 0);     -- cnt_word sent, max= 64
  signal cnt_eip_out            : unsigned(6-1 downto 0);     -- cnt_word sent, max= 64
  signal cnt_eip_out_reg        : unsigned(6-1 downto 0);     -- cnt_word sent, max= 64
  signal data_out               : std_logic_vector(C_DATA_LENGTH-1 downto 0);
  signal valid_k_char_out       : std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
  signal cnt_word_sent          : unsigned(7-1 downto 0);     -- cnt_word sent, max= 64
  signal status_level_rd        : std_logic_vector(C_OUT_BUF_SIZE-1 downto 0);
  signal m_value_for_credit     : std_logic_vector(C_M_SIZE + 5 downto 0);
  signal fct_credit_cnt_low     : std_logic;
  signal vc_ready               : std_logic;
  signal rd_en                  : std_logic;
  signal link_reset_dlre_reg1   : std_logic;
  signal link_reset_dlre_sync   : std_logic;
  signal flag_last_data         : std_logic;
    -- Fifo
  signal rst_n_fifo             : std_logic;
begin
---------------------------------------------------------
-----                     Assignements              -----
---------------------------------------------------------

  data_out             <= rd_data(C_DATA_LENGTH-1 downto 0);
  valid_k_char_out     <= rd_data(C_DATA_LENGTH+C_BYTE_BY_WORD_LENGTH-1 downto C_DATA_LENGTH);

  DATA_DOBUF           <= rd_data(C_DATA_LENGTH-1 downto 0);
  VALID_K_CHARAC_DOBUF <= rd_data(C_DATA_LENGTH+C_BYTE_BY_WORD_LENGTH-1 downto C_DATA_LENGTH);
  DATA_VALID_DOBUF     <= rd_data_vld;
  END_PACKET_DOBUF     <= rd_data_vld and (status_threshold_low or fct_credit_cnt_low) when (cnt_word_sent<63) else rd_data_vld;
  m_value_for_credit   <= M_VAL_DSCHECK & "000000";
  S_AXIS_TREADY_DL     <= s_axis_tready_i when(VC_CONT_MODE_MIB = '0') else '1';  -- Tready at '1' in continuous mode
  rd_en                <= VC_RD_EN_DMAC and not(rd_data_vld and fct_credit_cnt_low) when (cnt_word_sent<63) else flag_last_data;
  VC_READY_DOBUF       <= vc_ready;
---------------------------------------------------------
-----                     Instantiation             -----
---------------------------------------------------------
  -- FIFO_DC_AXIS_S Instantiation
  ints_fifo_dc_axis_s: FIFO_DC_AXIS_S
  generic map (
    G_DWIDTH              => C_DATA_LENGTH + C_BYTE_BY_WORD_LENGTH,
    G_AWIDTH              => C_OUT_BUF_SIZE,
    G_THRESHOLD_HIGH      => (2**C_OUT_BUF_SIZE)-3,
    G_THRESHOLD_LOW       => 1,
    S_AXIS_TDATA_WIDTH    => C_DATA_LENGTH,
    S_AXIS_TUSER_WIDTH    => C_BYTE_BY_WORD_LENGTH
  )
  port map (
    aresetn               => rst_n_fifo,
    RD_CLK                => CLK,
    RD_DATA               => rd_data,
    RD_DATA_EN            => rd_en,
    RD_DATA_VLD           => rd_data_vld,
    cmd_flush             => cmd_flush,
    STATUS_BUSY_FLUSH     => status_busy_flush,
    STATUS_THRESHOLD_HIGH => status_threshold_high,
    STATUS_THRESHOLD_LOW  => status_threshold_low,
    STATUS_FULL           => status_full,
    STATUS_EMPTY          => status_empty,
    STATUS_LEVEL_WR       => open,
    STATUS_LEVEL_RD       => status_level_rd,
    S_AXIS_ACLK           => S_AXIS_ACLK_NW,
    S_AXIS_TREADY         => s_axis_tready_i,
    S_AXIS_TDATA          => s_axis_tdata_i,
    S_AXIS_TUSER          => s_axis_tuser_i,
    S_AXIS_TLAST          => s_axis_tlast_i,
    S_AXIS_TVALID         => s_axis_tvalid_i
  );
---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_rst_fifo
-- Description: Manages the reset signal of the FiFo
---------------------------------------------------------
p_rst_fifo: process(CLK, RST_N, S_AXIS_ARSTN_NW)
begin
  if RST_N = '0' or  S_AXIS_ARSTN_NW = '0' then
    rst_n_fifo <= '0';
  elsif rising_edge(CLK) then
    rst_n_fifo <= '1';
  end if;
end process p_rst_fifo;
---------------------------------------------------------
-- Process: p_continuous_mode
-- Description: Manages continuous mode procedure trigger
---------------------------------------------------------
p_continuous_mode: process(S_AXIS_ACLK_NW, RST_N, S_AXIS_ARSTN_NW)
begin
  if S_AXIS_ARSTN_NW = '0' or RST_N='0' then
    cont_mode_flg <= '0';
  elsif rising_edge(S_AXIS_ACLK_NW) then
    cont_mode_flg  <= '0';
    if VC_CONT_MODE_MIB = '1' and (status_threshold_high ='1' or LANE_ACTIVE_ST_PPL ='0') then
        cont_mode_flg  <= '1';
    end if;
  end if;
end process p_continuous_mode;
---------------------------------------------------------
-- Process: p_cmd_flush_resync
-- Description: cmd_flush resynchronisation in CLK domain
---------------------------------------------------------
p_cmd_flush_resync: process(CLK, RST_N)
begin
  if RST_N = '0' then
    cmd_flush_reg1 <= '0';
    cmd_flush_sync <= '0';
  elsif rising_edge(CLK) then
    cmd_flush_reg1 <= cmd_flush;
    cmd_flush_sync <= cmd_flush_reg1;
  end if;
end process p_cmd_flush_resync;
---------------------------------------------------------
-- Process: p_data_in_fifo
-- Description: Manages the data written into the fifo
---------------------------------------------------------
p_data_in_fifo: process(S_AXIS_ARSTN_NW, S_AXIS_ACLK_NW, RST_N)
begin
  if S_AXIS_ARSTN_NW = '0' or RST_N='0' then
    s_axis_tdata_i       <= (others => '0');
    s_axis_tuser_i       <= (others => '0');
    s_axis_tlast_i       <= '0';
    s_axis_tvalid_i      <= '0';
    s_axis_tready_r      <= '0';
    cmd_flush            <= '0';
    current_state        <= INIT_ST;
    link_reset_dlre_reg1 <= '1';
    link_reset_dlre_sync <= '1';
  elsif rising_edge(S_AXIS_ACLK_NW) then
    link_reset_dlre_reg1 <= LINK_RESET_DLRE;
    link_reset_dlre_sync <= link_reset_dlre_reg1;
    s_axis_tready_r      <= s_axis_tready_i;
    cmd_flush            <= '0';
    case current_state is
      when INIT_ST =>
                        if link_reset_dlre_sync ='0' and LINK_RESET_DLRE = '0' then
                          current_state <= IDLE_ST;
                        end if;

      when IDLE_ST =>
                                  s_axis_tdata_i  <= S_AXIS_TDATA_NW;
                                  s_axis_tuser_i  <= S_AXIS_TUSER_NW;
                                  s_axis_tlast_i  <= S_AXIS_TLAST_NW;
                                  s_axis_tvalid_i <= S_AXIS_TVALID_NW;
                                  if link_reset_dlre_sync = '1' then
                                    cmd_flush <= '1';
                                    if last_k_char = '1' then
                                      current_state   <= WAIT_END_FLUSH_ST;
                                    else
                                      current_state   <= WAIT_EIP_ST;
                                    end if;
                                  elsif cont_mode_flg  = '1' then
                                    cmd_flush       <= '1';
                                    current_state   <= ADD_EEP_ST;
                                    s_axis_tdata_i  <= (others => '0');
                                    s_axis_tuser_i  <= (others => '0');
                                    s_axis_tlast_i  <= '0';
                                    s_axis_tvalid_i <= '0';
                                  end if;

        when WAIT_END_FLUSH_ST =>
                                  if s_axis_tready_i = '1' then
                                    current_state <= IDLE_ST;
                                  end if;

        when ADD_EEP_ST =>        if s_axis_tready_i = '1' and s_axis_tready_r = '1' then
                                    s_axis_tdata_i  <= C_FILL_SYMB & C_FILL_SYMB & C_FILL_SYMB & C_EEP_SYMB;
                                    s_axis_tuser_i  <= "1111";
                                    s_axis_tlast_i  <= '1';
                                    s_axis_tvalid_i <= '1';
                                    if S_AXIS_TUSER_NW(C_BYTE_BY_WORD_LENGTH-1)='1' and S_AXIS_TVALID_NW='1' then
                                      current_state   <= IDLE_ST;
                                    else
                                      current_state   <= WAIT_EIP_ST;
                                    end if;
                                  end if;

        when WAIT_EIP_ST =>     if S_AXIS_TVALID_NW='1' then
                                  if S_AXIS_TUSER_NW(0)='1' and (S_AXIS_TDATA_NW(7 downto 0) = C_EEP_SYMB or S_AXIS_TDATA_NW(7 downto 0) = C_EOP_SYMB) then
                                    s_axis_tdata_i  <= S_AXIS_TDATA_NW(31 downto 8) & C_FILL_SYMB;
                                    s_axis_tuser_i  <= S_AXIS_TUSER_NW(3 downto 1) & '1';
                                    s_axis_tlast_i  <= '0';
                                    s_axis_tvalid_i <= '1';
                                    current_state   <= IDLE_ST;
                                  elsif S_AXIS_TUSER_NW(1)='1' and (S_AXIS_TDATA_NW(15 downto 8) = C_EEP_SYMB or S_AXIS_TDATA_NW(15 downto 8) = C_EOP_SYMB) then
                                    s_axis_tdata_i  <= S_AXIS_TDATA_NW(31 downto 16) & C_FILL_SYMB & C_FILL_SYMB;
                                    s_axis_tuser_i  <= S_AXIS_TUSER_NW(3 downto 2) & "11";
                                    s_axis_tlast_i  <= '0';
                                    s_axis_tvalid_i <= '1';
                                    current_state   <= IDLE_ST;
                                  elsif S_AXIS_TUSER_NW(2)='1' and (S_AXIS_TDATA_NW(23 downto 16) = C_EEP_SYMB or S_AXIS_TDATA_NW(23 downto 16) = C_EOP_SYMB) then
                                    s_axis_tdata_i  <= S_AXIS_TDATA_NW(31 downto 24) & C_FILL_SYMB & C_FILL_SYMB & C_FILL_SYMB;
                                    s_axis_tuser_i  <= S_AXIS_TUSER_NW(3) & "111";
                                    s_axis_tlast_i  <= '0';
                                    s_axis_tvalid_i <= '1';
                                    current_state   <= IDLE_ST;
                                  elsif S_AXIS_TUSER_NW(3)='1' and (S_AXIS_TDATA_NW(31 downto 24) = C_EEP_SYMB or S_AXIS_TDATA_NW(31 downto 24) = C_EOP_SYMB) then
                                    s_axis_tdata_i  <= (others => '0');
                                    s_axis_tuser_i  <= (others => '0');
                                    s_axis_tlast_i  <= '0';
                                    s_axis_tvalid_i <= '0';
                                    current_state   <= IDLE_ST;
                                  else
                                    s_axis_tdata_i  <= (others => '0');
                                    s_axis_tuser_i  <= (others => '0');
                                    s_axis_tlast_i  <= '0';
                                    s_axis_tvalid_i <= '0';
                                  end if;
                                else
                                  s_axis_tdata_i       <= (others => '0');
                                  s_axis_tuser_i       <= (others => '0');
                                  s_axis_tlast_i       <= '0';
                                  s_axis_tvalid_i      <= '0';
                                end if;
    end case;
  end if;
end process p_data_in_fifo;
---------------------------------------------------------
-- Process: p_last_char_written
-- Description: Analyses if the last character written into
--              the fifo was an EOP, EEP or Fill
---------------------------------------------------------
p_last_char_written: process(S_AXIS_ARSTN_NW, S_AXIS_ACLK_NW, RST_N)
begin
  if S_AXIS_ARSTN_NW = '0' or RST_N='0'  then
    last_k_char <= '0';
  elsif rising_edge(S_AXIS_ACLK_NW) then
    if S_AXIS_TUSER_NW(C_BYTE_BY_WORD_LENGTH-1)='1' and S_AXIS_TVALID_NW='1' and s_axis_tready_i ='1' then
      last_k_char <= '1';
    elsif S_AXIS_TVALID_NW='1' and s_axis_tready_i ='1' then
      last_k_char <= '0';
    end if;
  end if;
end process p_last_char_written;
---------------------------------------------------------
-- Process: p_fct_ccnt_low
-- Description: Indicates when fct credit counter is almost 0
---------------------------------------------------------
p_fct_ccnt_low: process(CLK, RST_N)
begin
  if RST_N = '0' then
    fct_credit_cnt_low <= '0';
  elsif rising_edge(CLK) then
    if fct_credit_cnt  <= 2 and rd_data_vld = '1' then
      fct_credit_cnt_low <= '1';
    elsif fct_credit_cnt  > 1 then
      fct_credit_cnt_low <= '0';
    end if;
  end if;
end process p_fct_ccnt_low;
---------------------------------------------------------
-- Process: p_has_credit
-- Description: Indicates if far end input buffer has credit
---------------------------------------------------------
p_has_credit: process(CLK, RST_N)
begin
  if RST_N = '0' then
    CREDIT_VC_DOBUF <= '0';
  elsif rising_edge(CLK) then
    if fct_credit_cnt > 0 then
      CREDIT_VC_DOBUF <= '1';
    else
      CREDIT_VC_DOBUF <= '0';
    end if;
  end if;
end process p_has_credit;
---------------------------------------------------------
-- Process: p_fct_credit_cnt
-- Description: Manages the FCT credit counter
---------------------------------------------------------
  p_fct_credit_cnt: process(CLK, RST_N)
  begin
    if RST_N = '0' then
      fct_credit_cnt   <= (others => '0');
      FCT_CC_OVF_DOBUF <= '0';
    elsif rising_edge(CLK) then
      FCT_CC_OVF_DOBUF <= '0';
      if LINK_RESET_DLRE = '1' then
        fct_credit_cnt <= (others => '0');
      else
        if FCT_FAR_END_DSCHECK = '1' and rd_data_vld = '1' then -- FCT received and packet sent
          if C_FCT_CC_MAX > (fct_credit_cnt + unsigned(m_value_for_credit) - 1) then -- FCT credit counter will not overflow
            fct_credit_cnt <= fct_credit_cnt + (unsigned(M_VAL_DSCHECK)*64) - 1;
          else
            FCT_CC_OVF_DOBUF <= '1';
            fct_credit_cnt   <= C_FCT_CC_MAX;
          end if;
        elsif rd_data_vld = '1' then -- Packet sent
          if fct_credit_cnt > 1 then -- FCT credit counter will not be negative
            fct_credit_cnt <= fct_credit_cnt - 1;
          else
            fct_credit_cnt <= (others => '0');
          end if;
        elsif FCT_FAR_END_DSCHECK = '1' then -- FCT received
          if C_FCT_CC_MAX > fct_credit_cnt + unsigned(m_value_for_credit) then -- FCT credit counter will not overflow
            fct_credit_cnt <= fct_credit_cnt + unsigned(m_value_for_credit(C_FCT_CC_SIZE-1 downto 0));
          else
            FCT_CC_OVF_DOBUF <= '1';
            fct_credit_cnt   <= C_FCT_CC_MAX;
          end if;
        end if;
      end if;
    end if;
  end process p_fct_credit_cnt;
---------------------------------------------------------
-- Process: p_cnt_word
-- Description: Count the number of word sent
---------------------------------------------------------
p_cnt_word: process(CLK, RST_N)
begin
  if RST_N = '0' then
    cnt_word_sent <= (others =>'0');
  elsif rising_edge(CLK) then
    if LINK_RESET_DLRE = '1' then
      cnt_word_sent <= (others =>'0');
    elsif status_threshold_low = '1' and rd_data_vld='1' then
      cnt_word_sent  <= (others =>'0');
    elsif cnt_word_sent >= 63  and rd_data_vld = '1' then
      cnt_word_sent <= (others =>'0');
    elsif rd_data_vld = '1' then
      cnt_word_sent <= cnt_word_sent +1;
    elsif fct_credit_cnt = 0 then
      cnt_word_sent  <= (others =>'0');
    end if;
  end if;
end process p_cnt_word;

---------------------------------------------------------
-- Process: p_flag_last_data
-- Description: Raise a flag if last data was not sent
---------------------------------------------------------
p_flag_last_data: process(CLK, RST_N)
begin
  if RST_N = '0' then
    flag_last_data <= '0';
  elsif rising_edge(CLK) then
    if cnt_word_sent = 62 and rd_data_vld = '1' and VC_RD_EN_DMAC = '0' and status_threshold_low = '0' and fct_credit_cnt_low = '0'then
      flag_last_data <= '1';
    elsif cnt_word_sent = 63 and VC_RD_EN_DMAC = '1' then
      flag_last_data <= '0';
    elsif cnt_word_sent < 62 then
      flag_last_data <= '0';
    end if;
  end if;
end process p_flag_last_data;
---------------------------------------------------------
-- Process: p_detect_eip_out
-- Description: EIP output detection
---------------------------------------------------------
p_detect_eip_out: process(CLK, RST_N)
begin
  if RST_N = '0' then
    eip_out <= '0';
  elsif rising_edge(CLK) then
    if valid_k_char_out(0)='1' and (data_out(7 downto 0) = C_EEP_SYMB or data_out(7 downto 0) = C_EOP_SYMB) and  rd_data_vld='1' then
      eip_out <= '1';
    elsif valid_k_char_out(1)='1' and (data_out(15 downto 8) = C_EEP_SYMB or data_out(15 downto 8) = C_EOP_SYMB) and  rd_data_vld='1' then
      eip_out <= '1';
    elsif valid_k_char_out(2)='1' and (data_out(23 downto 16) = C_EEP_SYMB or data_out(23 downto 16) = C_EOP_SYMB) and  rd_data_vld='1' then
      eip_out <= '1';
    elsif valid_k_char_out(3)='1' and (data_out(31 downto 24) = C_EEP_SYMB or data_out(31 downto 24) = C_EOP_SYMB) and  rd_data_vld='1' then
      eip_out <= '1';
    else
      eip_out <= '0';
    end if;
  end if;
end process p_detect_eip_out;
---------------------------------------------------------
-- Process: p_eip_in
-- Description: Detection of EIP in the buffer
---------------------------------------------------------
p_eip_in: process(S_AXIS_ARSTN_NW, S_AXIS_ACLK_NW, RST_N)
begin
  if S_AXIS_ARSTN_NW = '0' or RST_N='0'  then
    eip_in_req      <= '0';
  elsif rising_edge(S_AXIS_ACLK_NW) then
    if s_axis_tlast_i = '1' and s_axis_tvalid_i= '1' and (s_axis_tready_i= '1' or s_axis_tready_r ='1') then
      eip_in_req <= '1';
    else
      eip_in_req <= '0';
    end if;
  end if;
end process p_eip_in;
---------------------------------------------------------
-- Process: p_eip_cnt_out
-- Description: Counter of EIP output from fifo
---------------------------------------------------------
p_eip_cnt_out: process(CLK, RST_N)
begin
  if RST_N = '0' then
    cnt_eip_out      <= (others =>'0');
    cnt_eip_out_reg  <= (others =>'0');
  elsif rising_edge(CLK) then
    cnt_eip_out_reg <= cnt_eip_out;
    if cmd_flush_sync ='1' then
      cnt_eip_out      <= (others =>'0');
      cnt_eip_out_reg  <= (others =>'0');
    elsif eip_out = '1' and eip_out_ack='1'  then
      cnt_eip_out    <= to_unsigned(1,cnt_eip_out'length);
    elsif eip_out_ack='1' then
      cnt_eip_out   <= (others =>'0');
    elsif eip_out = '1' then
      cnt_eip_out <= cnt_eip_out+1;
    end if;
  end if;
end process p_eip_cnt_out;
---------------------------------------------------------
-- Process: p_eip_cnt
-- Description: Counter of EIP in the FiFO
---------------------------------------------------------
p_eip_cnt: process(CLK, RST_N)
begin
  if RST_N = '0' then
    cnt_eip     <= (others =>'0');
    eip_in_req_reg1  <= '0';
    eip_in_req_reg2  <= '0';
    eip_out_ack <= '0';
  elsif rising_edge(CLK) then
    eip_in_req_reg1 <= eip_in_req;
    eip_in_req_reg2 <= eip_in_req_reg1;
    eip_out_ack <= '0';
    if cmd_flush_sync ='1' then
      cnt_eip     <= (others =>'0');
      eip_in_req_reg1  <= '0';
      eip_in_req_reg2  <= '0';
      eip_out_ack <= '0';
    elsif eip_in_req_reg2 = '1' then
      cnt_eip     <= cnt_eip + 1;
    elsif cnt_eip_out > 0 and eip_out_ack = '0' then
      cnt_eip     <= cnt_eip - cnt_eip_out;
      eip_out_ack <= '1';
    end if;
  end if;
end process p_eip_cnt;
---------------------------------------------------------
-- Process: p_vc_ready
-- Description: Manages the virtual channel ready signal
---------------------------------------------------------
  p_vc_ready: process(CLK, RST_N)
  begin
    if RST_N = '0' then
      vc_ready <= '0';
    elsif rising_edge(CLK) then
      if VC_RD_EN_DMAC='0' then
        if fct_credit_cnt > 0 and ((unsigned(status_level_rd) > 63 or status_full  = '1') or cnt_eip > 0) then
          vc_ready <= '1';
        else
          vc_ready <= '0';
        end if;
      end if;
    end if;
  end process p_vc_ready;
end architecture rtl;