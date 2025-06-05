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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library data_link_lib;
use data_link_lib.data_link_lib.all;

entity subpart_tb is
end subpart_tb;

architecture Behavioral of subpart_tb is
  -- Déclaration des composants
  component data_out_bc_buf is
    port (
      RST_N                 : in  std_logic;
      CLK                   : in  std_logic;
      LINK_RESET_DLRE       : in std_logic;
      S_AXIS_ACLK_NW        : in std_logic;
      S_AXIS_TREADY_DL      : out std_logic;
      S_AXIS_TDATA_NW       : in std_logic_vector(C_DATA_LENGTH-1 downto 0);
      S_AXIS_TUSER_NW       : in std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
      S_AXIS_TLAST_NW       : in std_logic;
      S_AXIS_TVALID_NW      : in std_logic;
      VC_READY_DOBUF        : out  std_logic;
      DATA_DOBUF            : out  std_logic_vector(C_DATA_LENGTH-1 downto 0);
      VALID_K_CHARAC_DOBUF  : out  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
      DATA_VALID_DOBUF      : out  std_logic;
      END_PACKET_DOBUF      : out  std_logic;
      VC_RD_EN_DMAC         : in   std_logic
    );
  end component;

  component data_out_buff is
    port (
      RST_N                 : in  std_logic;
      CLK                   : in  std_logic;
      LINK_RESET_DLRE       : in std_logic;
      S_AXIS_ARSTN_NW	      : in std_logic;
      S_AXIS_ACLK_NW        : in std_logic;
      S_AXIS_TREADY_DL      : out std_logic;
      S_AXIS_TDATA_NW       : in std_logic_vector(C_DATA_LENGTH-1 downto 0);
      S_AXIS_TUSER_NW       : in std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
      S_AXIS_TLAST_NW       : in std_logic;
      S_AXIS_TVALID_NW      : in std_logic;
      VC_READY_DOBUF        : out  std_logic;
      DATA_DOBUF            : out  std_logic_vector(C_DATA_LENGTH-1 downto 0);
      VALID_K_CHARAC_DOBUF  : out  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
      DATA_VALID_DOBUF      : out  std_logic;
      END_PACKET_DOBUF      : out  std_logic;
      VC_RD_EN_DMAC         : in   std_logic;
      M_VAL_DDES            : in std_logic_vector(C_M_SIZE-1 downto 0);
      FCT_FAR_END_DDES      : in std_logic;
      LANE_ACTIVE_ST_PPL    : in std_logic;
      FCT_CC_OVF_DOBUF      : out std_logic;
      CREDIT_VC_DOBUF       : out std_logic;
      VC_CONT_MODE_MIB      : in std_logic
    );
  end component;

  component data_mac is
    generic(
      G_VC_NUM           : integer := 8
    );
    port (
      RST_N                : in  std_logic;
      CLK                  : in  std_logic;
      LANE_ACTIVE_PPL      : in  std_logic;
      REQ_ACK_DERRM        : in  std_logic;
      REQ_NACK_DERRM       : in  std_logic;
      TRANS_POL_FLG_DERRM  : in  std_logic;
      REQ_ACK_DONE_DMAC    : out std_logic;
      REQ_FCT_DONE_DMAC    : out std_logic_vector(G_VC_NUM-1 downto 0);
      REQ_FCT_DIBUF        : in  std_logic_vector(G_VC_NUM-1 downto 0);
      VC_READY_DOBUF       : in  std_logic_vector(G_VC_NUM downto 0);
      VC_DATA_DOBUF        : in  vc_data_array(G_VC_NUM downto 0);
      VC_VALID_K_CHAR_DOBUF: in  vc_k_array(G_VC_NUM downto 0);
      VC_DATA_VALID_DOBUF  : in  std_logic_vector(G_VC_NUM downto 0);
      VC_END_PACKET_DOBUF  : in  std_logic_vector(G_VC_NUM downto 0);
      VC_RD_EN_DMAC        : out  std_logic_vector(G_VC_NUM downto 0);
      VC_PAUSE_MIB         : in  std_logic_vector(G_VC_NUM downto 0);
      VC_END_EMISSION_DMAC : out std_logic_vector(G_VC_NUM downto 0);
      VC_RUN_EMISSION_DMAC : out std_logic_vector(G_VC_NUM downto 0);
      DATA_DMAC            : out std_logic_vector(C_DATA_LENGTH-1 downto 0);
      VALID_K_CHAR_DMAC    : out std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
      NEW_WORD_DMAC        : out std_logic;
      END_PACKET_DMAC      : out std_logic;
      TYPE_FRAME_DMAC      : out std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);
      VIRTUAL_CHANNEL_DMAC : out std_logic_vector(G_VC_NUM-1 downto 0);
      BC_TYPE_DMAC         : out std_logic_vector(G_VC_NUM-1 downto 0);
      BC_CHANNEL_DMAC      : out std_logic_vector(G_VC_NUM-1 downto 0);
      BC_STATUS_DMAC       : out std_logic_vector(2-1 downto 0);
      MULT_CHANNEL_DMAC    : out std_logic_vector(G_VC_NUM-1 downto 0);
      TRANS_POL_FLG_DMAC   : out std_logic
    );
  end component;

  component data_encpasulation is
    generic (
        G_VC_NUM : integer := 8
    );
    port (
      RST_N                 : in  std_logic;
      CLK                   : in  std_logic;
      LANE_ACTIVE_PPL       : in  std_logic;
      DATA_DMAC             : in std_logic_vector(C_DATA_LENGTH-1 downto 0);
      VALID_K_CHAR_DMAC     : in std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
      NEW_WORD_DMAC         : in std_logic;
      END_PACKET_DMAC       : in std_logic;
      TYPE_FRAME_DMAC       : in std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);
      VIRTUAL_CHANNEL_DMAC  : in std_logic_vector(G_VC_NUM-1 downto 0);
      BC_TYPE_DMAC          : in std_logic_vector(G_VC_NUM-1 downto 0);
      BC_CHANNEL_DMAC       : in std_logic_vector(G_VC_NUM-1 downto 0);
      BC_STATUS_DMAC        : in std_logic_vector(2-1 downto 0);
      MULT_CHANNEL_DMAC     : in std_logic_vector(G_VC_NUM-1 downto 0);
      NEW_WORD_DENC         : out std_logic;
      DATA_DENC             : out std_logic_vector(C_DATA_LENGTH-1 downto 0);
      VALID_K_CHARAC_DENC   : out std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
      TYPE_FRAME_DENC       : out std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);
      END_FRAME_DENC        : out std_logic
    );
  end component;

  component data_seq_compute is
    port (
      RST_N                 : in  std_logic;
      CLK                   : in  std_logic;
      LANE_ACTIVE_PPL       : in  std_logic;
      NEW_WORD_DENC         : in  std_logic;
      DATA_DENC             : in  std_logic_vector(C_DATA_LENGTH-1 downto 0);
      VALID_K_CHARAC_DENC   : in  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
      TYPE_FRAME_DENC       : in  std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);
      END_FRAME_DENC        : in  std_logic;
      NEW_WORD_DSCOM        : out  std_logic;
      DATA_DSCOM            : out  std_logic_vector(C_DATA_LENGTH-1 downto 0);
      VALID_K_CHARAC_DSCOM  : out  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
      TYPE_FRAME_DSCOM      : out  std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);
      END_FRAME_DSCOM       : out  std_logic;
      SEQ_NUM_DSCOM         : out std_logic_vector(7 downto 0)
    );
  end component;

  component data_crc_compute is
    port (
      RST_N                 : in  std_logic;
      CLK                   : in  std_logic;
      LANE_ACTIVE_PPL       : in  std_logic;
      NEW_WORD_DSCOM        : in  std_logic;
      DATA_DSCOM            : in  std_logic_vector(C_DATA_LENGTH-1 downto 0);
      VALID_K_CHARAC_DSCOM  : in  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
      TYPE_FRAME_DSCOM      : in  std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);
      END_FRAME_DSCOM       : in  std_logic;
      FIFO_FULL_TX_LANE     : in  std_logic;
      VALID_K_CHARAC_DCCOM  : out  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
      DATA_DCCOM            : out  std_logic_vector(C_DATA_LENGTH-1 downto 0);
      NEW_WORD_DCCOM        : out  std_logic
    );
  end component;

  -- Constants
  constant G_VC_NUM               : integer := 8;

  -- Clock and Reset
  signal CLK     : std_logic := '0';
  signal RST_N   : std_logic := '0';

  -- AXI-Stream interface signals
  signal AXIS_ACLK_TX_NW        : std_logic_vector(G_VC_NUM downto 0);
  signal AXIS_TREADY_TX_DL      : std_logic_vector(G_VC_NUM downto 0);
  signal AXIS_TDATA_TX_NW       : vc_data_array(G_VC_NUM downto 0);
  signal AXIS_TUSER_TX_NW       : vc_k_array(G_VC_NUM downto 0);
  signal AXIS_TLAST_TX_NW       : std_logic_vector(G_VC_NUM downto 0);
  signal AXIS_TVALID_TX_NW      : std_logic_vector(G_VC_NUM downto 0);
  signal S_AXIS_ARSTN_NW      : std_logic_vector(G_VC_NUM downto 0);

  -- MIB interface signals
  signal CONTINUOUS_VC_MIB       : std_logic_vector(G_VC_NUM-1 downto 0);
  signal link_reset_dlre         : std_logic;
  signal VC_PAUSE_MIB            : std_logic_vector(G_VC_NUM downto 0);
  signal VC_END_EMISSION_MIB     : std_logic_vector(G_VC_NUM downto 0);
  signal VC_RUN_EMISSION_MIB     : std_logic_vector(G_VC_NUM downto 0);

  -- DDES interface signals
  signal fct_far_end_ddes        : std_logic_vector(G_VC_NUM-1 downto 0);
  signal m_val_ddes              : vc_m_val_array(G_VC_NUM-1 downto 0);

  -- DOBUF interface signals
  signal vc_ready_dobuf          : std_logic_vector(G_VC_NUM downto 0);
  signal vc_data_dobuf           : vc_data_array(G_VC_NUM downto 0);
  signal vc_valid_k_charac_dobuf : vc_k_array(G_VC_NUM downto 0);
  signal vc_data_valid_dobuf     : std_logic_vector(G_VC_NUM downto 0);
  signal vc_end_packet_dobuf     : std_logic_vector(G_VC_NUM downto 0);

  -- DMAC interface signals
  signal DATA_DMAC               : std_logic_vector(C_DATA_LENGTH-1 downto 0);
  signal NEW_WORD_DMAC           : std_logic;
  signal END_PACKET_DMAC         : std_logic;
  signal TYPE_FRAME_DMAC         : std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);
  signal VIRTUAL_CHANNEL_DMAC    : std_logic_vector(G_VC_NUM-1 downto 0);
  signal BC_TYPE_DMAC            : std_logic_vector(G_VC_NUM-1 downto 0);
  signal BC_CHANNEL_DMAC         : std_logic_vector(G_VC_NUM-1 downto 0);
  signal BC_STATUS_DMAC          : std_logic_vector(2-1 downto 0);
  signal MULT_CHANNEL_DMAC       : std_logic_vector(G_VC_NUM-1 downto 0);
  signal REQ_ACK_DERRM           : std_logic;
  signal REQ_NACK_DERRM          : std_logic;
  signal TRANS_POL_FLG_DERRM     : std_logic;
  signal REQ_ACK_DONE_DMAC       : std_logic;
  signal REQ_FCT_DIBUF           : std_logic_vector(G_VC_NUM-1 downto 0);
  signal REQ_FCT_DONE_DMAC       : std_logic_vector(G_VC_NUM-1 downto 0);
  signal VC_RD_EN_DMAC           : std_logic_vector(G_VC_NUM downto 0);
  signal TRANS_POL_FLG_DMAC      : std_logic;

  -- DENC interface signals
  signal NEW_WORD_DENC           : std_logic;
  signal DATA_DENC               : std_logic_vector(C_DATA_LENGTH-1 downto 0);
  signal VALID_K_CHARAC_DENC     : std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
  signal TYPE_FRAME_DENC         : std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);
  signal END_FRAME_DENC          : std_logic;

  -- DSCOM interface signals
  signal NEW_WORD_DSCOM          : std_logic;
  signal DATA_DSCOM              : std_logic_vector(C_DATA_LENGTH-1 downto 0);
  signal VALID_K_CHARAC_DSCOM    : std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
  signal TYPE_FRAME_DSCOM        : std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);
  signal END_FRAME_DSCOM         : std_logic;

  -- FIFO_TX_LANE interface signals
  signal FIFO_FULL_TX_LANE       : std_logic := '0';
  signal VALID_K_CHARAC_DCCOM    : std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
  signal DATA_DCCOM              : std_logic_vector(C_DATA_LENGTH-1 downto 0);
  signal NEW_WORD_DCCOM          : std_logic;

  -- PHY PLUS LANE layer interface signals
  signal FIFO_RX_DATA_VALID_PPL  : std_logic;
  signal FIFO_RX_RD_EN_PPL       : std_logic;
  signal DATA_RX_PPL             : std_logic_vector(C_DATA_LENGTH-1 downto 0);
  signal VALID_K_CHARAC_RX_PPL   : std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
  signal LINK_RESET              : std_logic;
  signal FRAME_ERR               : std_logic;
  signal SEQ_ERR                 : std_logic;
  signal VALID_K_CHAR_DMAC       :  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);

  -- Clock process definitions
  constant CLOCK_PERIOD : time := 10 ns;
begin

  -- Clock process
  CLK_process :process
  begin
    CLK <= '0';
    wait for CLOCK_PERIOD/2;
    CLK <= '1';
    wait for CLOCK_PERIOD/2;
  end process;

  -- Assign CLK to AXIS_ACLK_TX_NW
  AXIS_ACLK_TX_NW <= (others => CLK);

  main_process: process
  begin
    RST_N               <= '0';
    m_val_ddes          <= (others =>(others => '0'));
    fct_far_end_ddes    <= (others => '0');
    link_reset_dlre     <= '0';
    AXIS_TLAST_TX_NW    <= (others => '0');
    AXIS_TDATA_TX_NW    <= (others =>(others => '0'));
    AXIS_TUSER_TX_NW    <= (others =>(others => '0'));
    AXIS_TLAST_TX_NW    <= (others => '0');
    AXIS_TVALID_TX_NW   <= (others => '0');
    CONTINUOUS_VC_MIB   <= (others => '0');
    REQ_ACK_DERRM       <= '0';
    REQ_NACK_DERRM      <= '0';
    TRANS_POL_FLG_DERRM <= '0';
    REQ_FCT_DIBUF       <= (others => '0');
    VC_PAUSE_MIB        <= (others => '0');
    S_AXIS_ARSTN_NW     <= (others => '0');
    wait for 30 ns;
    S_AXIS_ARSTN_NW     <= (others => '1');
    RST_N               <= '1';
    wait until rising_edge(CLK);
    wait until rising_edge(CLK);
    fct_far_end_ddes(0) <= '1';
    m_val_ddes(0)       <= "0001";
    wait until rising_edge(CLK);
    wait until rising_edge(CLK);
    m_val_ddes          <= (others =>(others => '0'));
    fct_far_end_ddes    <= (others => '0');
    wait until rising_edge(CLK);
    for i in 0 to 65 loop
      AXIS_TDATA_TX_NW(0) <= std_logic_vector(to_unsigned(1+i,32));
      AXIS_TUSER_TX_NW(0) <= "0000";
      AXIS_TLAST_TX_NW(0) <='0';
      AXIS_TVALID_TX_NW(0)<='1';
      wait until rising_edge(CLK);
    end loop;

    --   wait until rising_edge(CLK);
    -- AXIS_TDATA_TX_NW(0) <= C_EOP_SYMB & C_RESERVED_SYMB & C_RESERVED_SYMB & C_RESERVED_SYMB;
    -- AXIS_TUSER_TX_NW(0) <= "1000";
    -- AXIS_TLAST_TX_NW(0) <='1';
    -- AXIS_TVALID_TX_NW(0)<='1';
    wait until rising_edge(CLK);
    AXIS_TDATA_TX_NW    <= (others =>(others => '0'));
    AXIS_TUSER_TX_NW    <= (others =>(others => '0'));
    AXIS_TLAST_TX_NW    <= (others => '0');
    AXIS_TVALID_TX_NW   <= (others => '0');
    wait until rising_edge(CLK);
    wait;
  end process;

  -- Instantiate components
  inst_data_out_bc_buf: data_out_bc_buf
    port map (
      RST_N                 => RST_N,
      CLK                   => CLK,
      LINK_RESET_DLRE       => link_reset_dlre,
      S_AXIS_ACLK_NW        => AXIS_ACLK_TX_NW(G_VC_NUM),
      S_AXIS_TREADY_DL      => AXIS_TREADY_TX_DL(G_VC_NUM),
      S_AXIS_TDATA_NW       => AXIS_TDATA_TX_NW(G_VC_NUM),
      S_AXIS_TUSER_NW       => AXIS_TUSER_TX_NW(G_VC_NUM),
      S_AXIS_TLAST_NW       => AXIS_TLAST_TX_NW(G_VC_NUM),
      S_AXIS_TVALID_NW      => AXIS_TVALID_TX_NW(G_VC_NUM),
      VC_READY_DOBUF        => vc_ready_dobuf(G_VC_NUM),
      DATA_DOBUF            => vc_data_dobuf(G_VC_NUM),
      VALID_K_CHARAC_DOBUF  => vc_valid_k_charac_dobuf(G_VC_NUM),
      DATA_VALID_DOBUF      => vc_data_valid_dobuf(G_VC_NUM),
      END_PACKET_DOBUF      => vc_end_packet_dobuf(G_VC_NUM),
      VC_RD_EN_DMAC         => VC_RD_EN_DMAC(G_VC_NUM)
    );

  gen_data_out_buff: for i in 0 to G_VC_NUM-1 generate
    inst_data_out_buff: data_out_buff
      port map (
        RST_N                 => RST_N,
        CLK                   => CLK,
        LINK_RESET_DLRE       => link_reset_dlre,
        S_AXIS_ARSTN_NW       => S_AXIS_ARSTN_NW(i),
        S_AXIS_ACLK_NW        => AXIS_ACLK_TX_NW(i),
        S_AXIS_TREADY_DL      => AXIS_TREADY_TX_DL(i),
        S_AXIS_TDATA_NW       => AXIS_TDATA_TX_NW(i),
        S_AXIS_TUSER_NW       => AXIS_TUSER_TX_NW(i),
        S_AXIS_TLAST_NW       => AXIS_TLAST_TX_NW(i),
        S_AXIS_TVALID_NW      => AXIS_TVALID_TX_NW(i),
        VC_READY_DOBUF        => vc_ready_dobuf(i),
        DATA_DOBUF            => vc_data_dobuf(i),
        VALID_K_CHARAC_DOBUF  => vc_valid_k_charac_dobuf(i),
        DATA_VALID_DOBUF      => vc_data_valid_dobuf(i),
        END_PACKET_DOBUF      => vc_end_packet_dobuf(i),
        VC_RD_EN_DMAC         => VC_RD_EN_DMAC(i),
        M_VAL_DDES            => m_val_ddes(i),
        FCT_FAR_END_DDES      => fct_far_end_ddes(i),
        LANE_ACTIVE_ST_PPL    => '1',
        FCT_CC_OVF_DOBUF      => open,
        VC_CONT_MODE_MIB      => CONTINUOUS_VC_MIB(i)
      );
  end generate;

  inst_data_mac: data_mac
    generic map (
      G_VC_NUM => G_VC_NUM
    )
    port map (
      RST_N                => RST_N,
      CLK                  => CLK,
      LANE_ACTIVE_PPL      => '1',
      REQ_ACK_DERRM        => REQ_ACK_DERRM,
      REQ_NACK_DERRM       => REQ_NACK_DERRM,
      TRANS_POL_FLG_DERRM  => TRANS_POL_FLG_DERRM,
      REQ_ACK_DONE_DMAC    => REQ_ACK_DONE_DMAC,
      REQ_FCT_DONE_DMAC    => REQ_FCT_DONE_DMAC,
      REQ_FCT_DIBUF        => REQ_FCT_DIBUF,
      VC_READY_DOBUF       => vc_ready_dobuf,
      VC_DATA_DOBUF        => vc_data_dobuf,
      VC_VALID_K_CHAR_DOBUF=> vc_valid_k_charac_dobuf,
      VC_DATA_VALID_DOBUF  => vc_data_valid_dobuf,
      VC_END_PACKET_DOBUF  => vc_end_packet_dobuf,
      VC_RD_EN_DMAC        => VC_RD_EN_DMAC,
      VC_PAUSE_MIB         => VC_PAUSE_MIB,
      VC_END_EMISSION_DMAC  => VC_END_EMISSION_MIB,
      VC_RUN_EMISSION_DMAC  => VC_RUN_EMISSION_MIB,
      DATA_DMAC            => DATA_DMAC,
      VALID_K_CHAR_DMAC    => VALID_K_CHAR_DMAC,
      NEW_WORD_DMAC        => NEW_WORD_DMAC,
      END_PACKET_DMAC      => END_PACKET_DMAC,
      TYPE_FRAME_DMAC      => TYPE_FRAME_DMAC,
      VIRTUAL_CHANNEL_DMAC => VIRTUAL_CHANNEL_DMAC,
      BC_TYPE_DMAC         => BC_TYPE_DMAC,
      BC_CHANNEL_DMAC      => BC_CHANNEL_DMAC,
      BC_STATUS_DMAC       => BC_STATUS_DMAC,
      MULT_CHANNEL_DMAC    => MULT_CHANNEL_DMAC,
      TRANS_POL_FLG_DMAC   => TRANS_POL_FLG_DMAC
    );

  inst_data_encpasulation: data_encpasulation
    generic map (
      G_VC_NUM => G_VC_NUM
    )
    port map (
      RST_N                 => RST_N,
      CLK                   => CLK,
      LANE_ACTIVE_PPL       => '1',
      DATA_DMAC             => DATA_DMAC,
      VALID_K_CHAR_DMAC     => VALID_K_CHAR_DMAC,
      NEW_WORD_DMAC         => NEW_WORD_DMAC,
      END_PACKET_DMAC       => END_PACKET_DMAC,
      TYPE_FRAME_DMAC       => TYPE_FRAME_DMAC,
      VIRTUAL_CHANNEL_DMAC  => VIRTUAL_CHANNEL_DMAC,
      BC_TYPE_DMAC          => BC_TYPE_DMAC,
      BC_CHANNEL_DMAC       => BC_CHANNEL_DMAC,
      BC_STATUS_DMAC        => BC_STATUS_DMAC,
      MULT_CHANNEL_DMAC     => MULT_CHANNEL_DMAC,
      NEW_WORD_DENC         => NEW_WORD_DENC,
      DATA_DENC             => DATA_DENC,
      VALID_K_CHARAC_DENC   => VALID_K_CHARAC_DENC,
      TYPE_FRAME_DENC       => TYPE_FRAME_DENC,
      END_FRAME_DENC        => END_FRAME_DENC
    );

  inst_data_seq_compute: data_seq_compute
    port map (
      RST_N                 => RST_N,
      CLK                   => CLK,
      LANE_ACTIVE_PPL       => '1',
      NEW_WORD_DENC         => NEW_WORD_DENC,
      DATA_DENC             => DATA_DENC,
      VALID_K_CHARAC_DENC   => VALID_K_CHARAC_DENC,
      TYPE_FRAME_DENC       => TYPE_FRAME_DENC,
      END_FRAME_DENC        => END_FRAME_DENC,
      NEW_WORD_DSCOM        => NEW_WORD_DSCOM,
      DATA_DSCOM            => DATA_DSCOM,
      VALID_K_CHARAC_DSCOM  => VALID_K_CHARAC_DSCOM,
      TYPE_FRAME_DSCOM      => TYPE_FRAME_DSCOM,
      END_FRAME_DSCOM       => END_FRAME_DSCOM
    );

  inst_data_crc_compute: data_crc_compute
    port map (
      RST_N                 => RST_N,
      CLK                   => CLK,
      LANE_ACTIVE_PPL       => '1',
      NEW_WORD_DSCOM        => NEW_WORD_DSCOM,
      DATA_DSCOM            => DATA_DSCOM,
      VALID_K_CHARAC_DSCOM  => VALID_K_CHARAC_DSCOM,
      TYPE_FRAME_DSCOM      => TYPE_FRAME_DSCOM,
      END_FRAME_DSCOM       => END_FRAME_DSCOM,
      FIFO_FULL_TX_LANE     => FIFO_FULL_TX_LANE,
      VALID_K_CHARAC_DCCOM  => VALID_K_CHARAC_DCCOM,
      DATA_DCCOM            => DATA_DCCOM,
      NEW_WORD_DCCOM        => NEW_WORD_DCCOM
    );

end Behavioral;
