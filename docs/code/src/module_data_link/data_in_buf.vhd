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
-- Description : This module describes the Input Buffer & Flow Control for
--               one Virtual Channel
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library data_link_lib;
use data_link_lib.data_link_lib.all;

entity data_in_buf is
  port (
    RST_N                  : in  std_logic;                                          --! Global reset (Active-low)
    CLK                    : in  std_logic;                                          --! Global Clock
    -- data_link_reset (DLRE) interface
    LINK_RESET_DLRE        : in  std_logic;                                          --! Link Reset command
    LINK_RESET_DIBUF       : out std_logic;                                          --! Link Reset request to data_link_reset
    -- AXI-Stream interface
    M_AXIS_ARSTN_NW       : in   std_logic;                                          --! Active-low asynchronous reset for the AXI-Stream interface
    M_AXIS_ACLK_NW        : in   std_logic;                                          --! Clock signal for the AXI-Stream interface
    M_AXIS_TVALID_DIBUF   : out  std_logic;                                          --! Indicates that TDATA, TUSER, and TLAST are valid
    M_AXIS_TDATA_DIBUF    : out  std_logic_vector(C_DATA_LENGTH-1 downto 0);         --! AXI-Stream data bus
    M_AXIS_TLAST_DIBUF    : out  std_logic;                                          --! Indicates the end of a data packet
    M_AXIS_TREADY_NW      : in   std_logic;                                          --! Receiver ready signal (slave is ready to accept data)
    M_AXIS_TUSER_DIBUF    : out  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0); --! AXI-Stream user-defined sideband signal
    -- data_desencapsulation (DDES) interface
    DATA_DDES              : in  std_logic_vector(C_DATA_K_WIDTH-1 downto 0);        --! Data parallel (K character + DATA) from data_desencapsulation
    DATA_EN_DDES           : in  std_logic;                                          --! Data valid flag associated with DATA_DDES
    -- data_mac (DMAC) interface
    REQ_FCT_DIBUF          : out std_logic;                                          --! FCT request to data_mac
    REQ_FCT_DONE_DMAC      : in  std_logic;                                          --! FCT request done flag from data_mac
    --MIB interface
    INPUT_BUF_OVF_DIBUF    : out std_logic                                           --! Input buffer oveflow flag
  );
end data_in_buf;

architecture rtl of data_in_buf is
---------------------------------------------------------
-----                  Module declaration           -----
---------------------------------------------------------
   component FIFO_DC_AXIS_M is
    generic (
      -- Users to add parameters here
      G_DWIDTH                 : integer := 36;                                 -- FIFO data bus width
      G_AWIDTH                 : integer := 10;                                 -- Address bus fifo length
      G_THRESHOLD_HIGH         : integer := 2**10;                              -- High threshold
      G_THRESHOLD_LOW          : integer := 0;                                  -- Low threshold
      -- User parameters ends
      M_AXIS_TDATA_WIDTH       : integer := 32;                                 -- Data AXIS length
      M_AXIS_TUSER_WIDTH       : integer := 4                                   -- User AXIS length
    );
    port (
      -- Users to add ports here
      aresetn      	          : in std_logic;
      -- Custom interface (slave)
      WR_CLK                  : in  std_logic;                                -- Clock
      WR_DATA                 : in  std_logic_vector(G_DWIDTH-1 downto 0);    -- Data write bus
      WR_DATA_EN              : in  std_logic;                                -- Write command
      -- STATUS FIFO
      CMD_FLUSH               : in  std_logic;                                -- Fifo flush
      STATUS_BUSY_FLUSH       : out std_logic;                                -- Fifo is flushing
      STATUS_THRESHOLD_HIGH   : out std_logic;                                -- Threshold high reached flag (on WR_CLK)
      STATUS_THRESHOLD_LOW    : out std_logic;                                -- Threshold low reached flag (on RD_CLK)
      STATUS_FULL             : out std_logic;                                -- Full fifo flag (on WR_CLK)
      STATUS_EMPTY            : out std_logic;                                -- Empty fifo flag (on RD_CLK)
      STATUS_LEVEL_WR         : out std_logic_vector(G_AWIDTH-1 downto 0);    -- FIFO fill level (on WR_CLK)
      STATUS_LEVEL_RD         : out std_logic_vector(G_AWIDTH-1 downto 0) ;   -- FIFO fill level (on RD_CLK)
      -- User ports ends
      -- Do not modify the ports beyond this line
      -- Ports of Axi Master Bus Interface M00_AXIS
      M_AXIS_ACLK	            : in  std_logic;
      M_AXIS_TVALID	          : out std_logic;
      M_AXIS_TDATA	          : out std_logic_vector(M_AXIS_TDATA_WIDTH-1 downto 0);
      M_AXIS_TLAST	          : out std_logic;
      M_AXIS_TREADY	          : in  std_logic;
      M_AXIS_TUSER            : out std_logic_vector(M_AXIS_TUSER_WIDTH-1 downto 0)
    );
  end component;

---------------------------------------------------------
-----                  Signal declaration           -----
---------------------------------------------------------
  type data_in_fsm is (
    INIT_ST,       --! Initialization State
    IDLE_ST,       --! Idle State
    LINK_RESET_ST, --! Link Reset State
    ADD_EEP_ST     --! EEP Injection State
  );

  type req_fct_fsm is (
    INIT_ST,       --! Initialization State
    IDLE_ST        --! Idle State
  );

  signal current_state          : data_in_fsm;
  signal current_state_fct      : req_fct_fsm;
  signal status_busy_flush      : std_logic;
  signal status_full            : std_logic;
  signal cmd_flush              : std_logic;
  signal last_k_char            : std_logic;
  signal last_k_char_reg1       : std_logic;
  signal last_k_char_reg2       : std_logic;
  signal data_in                : std_logic_vector(C_DATA_LENGTH+C_BYTE_BY_WORD_LENGTH-1 downto 0);
  signal data_in_en             : std_logic;
  signal cnt_word_sent          : unsigned (7 downto 0);
  signal cnt_req_fct            : unsigned (2 downto 0);
  -- AXIS Stream
  signal m_axis_tvalid	        : std_logic;
  signal m_axis_tdata	          : std_logic_vector(C_DATA_LENGTH-1 downto 0);
  signal m_axis_tlast	          : std_logic;
  signal m_axis_tready	        : std_logic;
  signal m_axis_tuser           : std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
  -- FCT
  signal req_fct_i              : std_logic;
  signal axis_data_valid        : std_logic;
  signal axis_data_valid_reg1   : std_logic;
  signal axis_data_valid_reg2   : std_logic;
  signal link_reset_dlre_r      : std_logic;
  signal fct_send_counter       : unsigned(1 downto 0);
  signal rst_n_fifo             : std_logic;

begin
---------------------------------------------------------
-----                     Assignements              -----
---------------------------------------------------------
M_AXIS_TVALID_DIBUF  <= m_axis_tvalid;
M_AXIS_TDATA_DIBUF	 <= m_axis_tdata;
M_AXIS_TLAST_DIBUF	 <= m_axis_tlast;
m_axis_tready        <= M_AXIS_TREADY_NW;
M_AXIS_TUSER_DIBUF   <= m_axis_tuser;
---------------------------------------------------------
-----                     Instantiation             -----
---------------------------------------------------------
  -- FIFO_DC_AXIS_S Instantiation
  ints_fifo_dc_axis_m : FIFO_DC_AXIS_M
  generic map (
      G_DWIDTH                => C_DATA_LENGTH + C_BYTE_BY_WORD_LENGTH,
      G_AWIDTH                => C_IN_BUF_SIZE,
      M_AXIS_TDATA_WIDTH      => C_DATA_LENGTH,
      M_AXIS_TUSER_WIDTH      => C_BYTE_BY_WORD_LENGTH
  )
  port map (
      aresetn                => rst_n_fifo,
      WR_CLK                 => CLK,
      WR_DATA                => data_in,
      WR_DATA_EN             => data_in_en,
      CMD_FLUSH              => cmd_flush,
      STATUS_BUSY_FLUSH      => status_busy_flush,
      STATUS_THRESHOLD_HIGH  => open,
      STATUS_THRESHOLD_LOW   => open,
      STATUS_FULL            => status_full,
      STATUS_EMPTY           => open,
      STATUS_LEVEL_WR        => open,
      STATUS_LEVEL_RD        => open,
      M_AXIS_ACLK            => M_AXIS_ACLK_NW,
      M_AXIS_TVALID          => m_axis_tvalid,
      M_AXIS_TDATA           => m_axis_tdata,
      M_AXIS_TLAST           => m_axis_tlast,
      M_AXIS_TREADY          => M_AXIS_TREADY,
      M_AXIS_TUSER           => m_axis_tuser
  );

---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_rst_fifo
-- Description: Manages the reset signal of the FiFo
---------------------------------------------------------
p_rst_fifo: process(M_AXIS_ACLK_NW, RST_N, M_AXIS_ARSTN_NW)
begin
  if RST_N = '0' or M_AXIS_ARSTN_NW = '0' then
    rst_n_fifo <= '0';
  elsif rising_edge(M_AXIS_ACLK_NW) then
    rst_n_fifo <= '1';
  end if;
end process p_rst_fifo;
---------------------------------------------------------
-- Process: p_buffer_full
-- Description: Handles the full status of the FIFO
---------------------------------------------------------
p_buffer_full: process(CLK, RST_N)
begin
  if RST_N = '0' then
    LINK_RESET_DIBUF    <= '0';
    INPUT_BUF_OVF_DIBUF <= '0';
  elsif rising_edge(CLK) then
    if status_full = '1' and DATA_EN_DDES ='1' then
      LINK_RESET_DIBUF    <= '1';
      INPUT_BUF_OVF_DIBUF <= '1';
    else
      LINK_RESET_DIBUF    <= '0';
      INPUT_BUF_OVF_DIBUF <= '0';
    end if;
  end if;
end process p_buffer_full;
---------------------------------------------------------
-- Process: p_data_in_fifo
-- Description: Handles the data written into the FIFO
---------------------------------------------------------
p_data_in_fifo: process(CLK, RST_N)
begin
  if RST_N = '0' then
    cmd_flush         <= '0';
    current_state     <= INIT_ST;
    data_in           <= (others =>'0');
    data_in_en        <= '0';
    link_reset_dlre_r <= '1';
  elsif rising_edge(CLK) then
    last_k_char_reg1  <= last_k_char;
    last_k_char_reg2  <= last_k_char_reg1;
    cmd_flush         <= '0';
    link_reset_dlre_r <= LINK_RESET_DLRE;

    case current_state is
      when INIT_ST =>
                              if LINK_RESET_DLRE = '0' and link_reset_dlre_r = '0' then
                                current_state <= IDLE_ST;
                              end if;

      when IDLE_ST =>
                              if LINK_RESET_DLRE = '1' then
                                cmd_flush <= '1';
                                current_state <= LINK_RESET_ST;
                              else
                                data_in    <= DATA_DDES;
                                data_in_en <= DATA_EN_DDES;
                              end if;

        when LINK_RESET_ST =>
                              if LINK_RESET_DLRE = '0' then
                                if last_k_char_reg2 = '1' then
                                  current_state <= IDLE_ST;
                                else
                                  current_state <= ADD_EEP_ST;
                                end if;
                              end if;
        when ADD_EEP_ST =>
                              if status_busy_flush= '0' and LINK_RESET_DLRE = '0' then
                                current_state <= IDLE_ST;
                                data_in       <= "1111" & C_FILL_SYMB & C_FILL_SYMB & C_FILL_SYMB & C_EEP_SYMB;
                                data_in_en    <= '1';
                              end if;
    end case;
  end if;
end process p_data_in_fifo;
---------------------------------------------------------
-- Process: p_last_char_read
-- Description: Determines if the last character written into
--              the FIFO was an EOP, EEP, or Fill character
---------------------------------------------------------
p_last_char_read: process(M_AXIS_ACLK_NW, M_AXIS_ARSTN_NW)
begin
  if M_AXIS_ARSTN_NW = '0' then
    last_k_char      <= '0';
    axis_data_valid  <= '0';
  elsif rising_edge(M_AXIS_ACLK_NW) then
    if m_axis_tvalid = '1' and m_axis_tready ='1' then
      axis_data_valid  <= '1';
      if m_axis_tuser(C_BYTE_BY_WORD_LENGTH-1)='1' then
        last_k_char <= '1';
      else
        last_k_char <= '0';
      end if;
    else
      axis_data_valid  <= '0';
    end if;
  end if;
end process p_last_char_read;
---------------------------------------------------------
-- Process: p_cnt_word
-- Description: Counts the number of words sent
---------------------------------------------------------
p_cnt_word: process(CLK, RST_N)
begin
  if RST_N = '0' then
    cnt_word_sent        <= (others =>'0');
    req_fct_i            <= '0';
    axis_data_valid_reg1 <= '0';
    axis_data_valid_reg2 <= '0';
  elsif rising_edge(CLK) then
    if LINK_RESET_DLRE = '1' then
      cnt_word_sent        <= (others =>'0');
      req_fct_i            <= '0';
      axis_data_valid_reg1 <= '0';
      axis_data_valid_reg2 <= '0';
    else
      axis_data_valid_reg1 <= axis_data_valid;
      axis_data_valid_reg2 <= axis_data_valid_reg1;
      if axis_data_valid_reg2 = '1' then
        if REQ_FCT_DONE_DMAC ='1' then
          req_fct_i     <= '0';
          if cnt_word_sent > 62 then
            cnt_word_sent <= cnt_word_sent - 63;
          else
            cnt_word_sent <= (others =>'0');
          end if;
        elsif cnt_word_sent > 62 then
          req_fct_i     <= '1';
          cnt_word_sent <= cnt_word_sent + 1;
        else
          cnt_word_sent <= cnt_word_sent + 1;
        end if;
      elsif REQ_FCT_DONE_DMAC ='1' then
        req_fct_i     <= '0';
        if cnt_word_sent > 63 then
          cnt_word_sent <= cnt_word_sent - 64;
        else
          cnt_word_sent <= (others =>'0');
        end if;
      elsif cnt_word_sent > 62 then
        req_fct_i     <= '1';
      end if;
    end if;
  end if;
end process p_cnt_word;
---------------------------------------------------------
-- Process: p_req_fct
-- Description: Manages FCT requests
---------------------------------------------------------
p_req_fct: process(CLK, RST_N)
begin
  if RST_N = '0' then
    current_state_fct <= INIT_ST;
    REQ_FCT_DIBUF     <= '0';
    fct_send_counter  <= (others =>'0');
  elsif rising_edge(CLK) then
    case current_state_fct is
      when INIT_ST =>
                          if LINK_RESET_DLRE = '0' then
                            REQ_FCT_DIBUF   <= '1';
                            if fct_send_counter = 3 and REQ_FCT_DONE_DMAC = '1' then
                              REQ_FCT_DIBUF     <= '0';
                              current_state_fct <= IDLE_ST;
                              fct_send_counter  <= (others =>'0');
                            elsif REQ_FCT_DONE_DMAC = '1' then
                              fct_send_counter  <= fct_send_counter + 1;
                            end if;
                          end if;
      when IDLE_ST =>
                           if LINK_RESET_DLRE = '1' then
                             current_state_fct   <= INIT_ST;
                            elsif REQ_FCT_DONE_DMAC = '1' then
                              REQ_FCT_DIBUF   <= '0';
                            elsif req_fct_i ='1' then
                              REQ_FCT_DIBUF   <= '1';
                           end if;
    end case;
  end if;
end process p_req_fct;

end architecture rtl;