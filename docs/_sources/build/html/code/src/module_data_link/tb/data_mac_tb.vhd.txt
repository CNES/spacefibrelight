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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.data_link_lib.all;

entity tb_data_mac is
end tb_data_mac;

architecture behavioral of tb_data_mac is

  -- Component declaration for the Unit Under Test (UUT)
  component data_mac
    generic(
      G_VC_NUM : integer := 8
    );
    port(
      RST_N              : in  std_logic;
      CLK                : in  std_logic;
      REQ_ACK_DERRM      : in  std_logic;
      REQ_NACK_DERRM     : in  std_logic;
      TRANS_POL_FLG_DERRM: in  std_logic;
      REQ_ACK_DONE_DMAC      : out std_logic;
      REQ_FCT_DIBUF      : in  std_logic_vector(G_VC_NUM-1 downto 0);
      REQ_FCT_DONE_DIBUF  : out std_logic_vector(G_VC_NUM-1 downto 0);   
      VC_READY_DOBUF     : in  std_logic_vector(G_VC_NUM-1 downto 0);
      VC_DATA_DOBUF      : in  vc_data_array(G_VC_NUM-1 downto 0);
      VC_DATA_VALID_DOBUF: in  std_logic_vector(G_VC_NUM-1 downto 0);
      VC_RD_EN_DMAC      : out std_logic_vector(G_VC_NUM-1 downto 0);
      VC_PAUSE_MIB       : in  std_logic_vector(G_VC_NUM-1 downto 0);
      VC_END_EMISSION_MIB: out std_logic_vector(G_VC_NUM-1 downto 0);
      VC_END_PACKET_DOBUF : in  std_logic_vector(G_VC_NUM-1 downto 0);
      VC_RUN_EMISSION_MIB: out std_logic_vector(G_VC_NUM-1 downto 0);
      DATA_DMAC          : out std_logic_vector(C_DATA_LENGTH-1 downto 0);
      NEW_WORD_DMAC      : out std_logic;
      NEW_PACKET_DMAC    : out std_logic;
      END_PACKET_DMAC    : out std_logic;
      TYPE_FRAME_DMAC    : out std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);
      VIRTUAL_CHANNEL_DMAC : out std_logic_vector(G_VC_NUM-1 downto 0);
      BC_TYPE_DMAC       : out std_logic_vector(G_VC_NUM-1 downto 0);
      BC_CHANNEL_DMAC    : out std_logic_vector(G_VC_NUM-1 downto 0);
      BC_STATUS_DMAC     : out std_logic_vector(2-1 downto 0);
      MULT_CHANNEL_DMAC  : out std_logic_vector(G_VC_NUM-1 downto 0);
      TRANS_POL_FLG_DMAC : out std_logic;
      READY_DENC         : in std_logic
    );
  end component;
  constant G_VC_NUM               : integer := 8;

  -- Inputs
  signal RST_N              : std_logic := '0';
  signal CLK                : std_logic := '0';
  signal REQ_ACK_DERRM      : std_logic := '0';
  signal REQ_NACK_DERRM     : std_logic := '0';
  signal TRANS_POL_FLG_DERRM: std_logic := '0';
  signal REQ_FCT_DIBUF      : std_logic_vector(G_VC_NUM-1 downto 0) := (others => '0');
  signal VC_READY_DOBUF     : std_logic_vector(G_VC_NUM-1 downto 0) := (others => '0');
  signal VC_DATA_DOBUF      : vc_data_array(G_VC_NUM-1 downto 0);
  signal VC_DATA_VALID_DOBUF: std_logic_vector(G_VC_NUM-1 downto 0) := (others => '0');
  signal VC_PAUSE_MIB       : std_logic_vector(G_VC_NUM-1 downto 0) := (others => '0');
  signal VC_END_PACKET_DOBUF: std_logic_vector(G_VC_NUM-1 downto 0) := (others => '0');
  signal READY_DENC         : std_logic := '1';

  -- Outputs
  signal REQ_ACK_DONE_DMAC      : std_logic;
  signal VC_RD_EN_DMAC      : std_logic_vector(G_VC_NUM-1 downto 0);
  signal REQ_FCT_DONE_DIBUF      : std_logic_vector(G_VC_NUM-1 downto 0);
  signal VC_END_EMISSION_MIB: std_logic_vector(G_VC_NUM-1 downto 0);
  signal VC_RUN_EMISSION_MIB: std_logic_vector(G_VC_NUM-1 downto 0);
  signal DATA_DMAC          : std_logic_vector(C_DATA_LENGTH-1 downto 0);
  signal NEW_WORD_DMAC      : std_logic;
  signal NEW_PACKET_DMAC    : std_logic;
  signal END_PACKET_DMAC    : std_logic;
  signal TYPE_FRAME_DMAC    : std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);
  signal VIRTUAL_CHANNEL_DMAC : std_logic_vector(G_VC_NUM-1 downto 0);
  signal BC_TYPE_DMAC       : std_logic_vector(G_VC_NUM-1 downto 0);
  signal BC_CHANNEL_DMAC    : std_logic_vector(G_VC_NUM-1 downto 0);
  signal BC_STATUS_DMAC     : std_logic_vector(2-1 downto 0);
  signal MULT_CHANNEL_DMAC  : std_logic_vector(G_VC_NUM-1 downto 0);
  signal TRANS_POL_FLG_DMAC : std_logic;

  -- Clock period definition
  constant CLK_PERIOD : time := 10 ns;

begin

  -- Instantiate the Unit Under Test (UUT)
  uut: data_mac
    generic map(
      G_VC_NUM => 8
    )
    port map(
      RST_N                => RST_N,
      CLK                  => CLK,
      REQ_ACK_DERRM        => REQ_ACK_DERRM,
      REQ_NACK_DERRM       => REQ_NACK_DERRM,
      TRANS_POL_FLG_DERRM  => TRANS_POL_FLG_DERRM,
      REQ_ACK_DONE_DMAC        => REQ_ACK_DONE_DMAC,
      REQ_FCT_DIBUF        => REQ_FCT_DIBUF,
      VC_READY_DOBUF       => VC_READY_DOBUF,
      VC_DATA_DOBUF        => VC_DATA_DOBUF,
      VC_DATA_VALID_DOBUF  => VC_DATA_VALID_DOBUF,
      VC_RD_EN_DMAC        => VC_RD_EN_DMAC,
      VC_PAUSE_MIB         => VC_PAUSE_MIB,
      VC_END_EMISSION_MIB  => VC_END_EMISSION_MIB,
      VC_END_PACKET_DOBUF  => VC_END_PACKET_DOBUF,
      VC_RUN_EMISSION_MIB  => VC_RUN_EMISSION_MIB,
      DATA_DMAC            => DATA_DMAC,
      NEW_WORD_DMAC        => NEW_WORD_DMAC,
      NEW_PACKET_DMAC      => NEW_PACKET_DMAC,
      END_PACKET_DMAC      => END_PACKET_DMAC,
      TYPE_FRAME_DMAC      => TYPE_FRAME_DMAC,
      VIRTUAL_CHANNEL_DMAC => VIRTUAL_CHANNEL_DMAC,
      BC_TYPE_DMAC         => BC_TYPE_DMAC,
      BC_CHANNEL_DMAC      => BC_CHANNEL_DMAC,
      BC_STATUS_DMAC       => BC_STATUS_DMAC,
      MULT_CHANNEL_DMAC    => MULT_CHANNEL_DMAC,
      TRANS_POL_FLG_DMAC   => TRANS_POL_FLG_DMAC,
      READY_DENC           => READY_DENC
    );

  -- Clock process
  clk_process :process
  begin
    CLK <= '0';
    wait for CLK_PERIOD/2;
    CLK <= '1';
    wait for CLK_PERIOD/2;
  end process;

  -- Stimulus process
  stim_proc: process
  begin

    -- Initialize inputs
    RST_N <= '0';
    wait for 2 * CLK_PERIOD;
    RST_N <= '1';
    wait for 30 * CLK_PERIOD;
    VC_READY_DOBUF(0)    <= '1';
    wait for CLK_PERIOD;
    wait for CLK_PERIOD/2;
    REQ_ACK_DERRM <= '0';
    VC_READY_DOBUF(0)    <= '1';
    wait for CLK_PERIOD; 
    wait for CLK_PERIOD;
    VC_DATA_DOBUF(0)     <= std_logic_vector(to_unsigned(1,32));      
    VC_DATA_VALID_DOBUF(0)  <= '1';
    wait for CLK_PERIOD;
    VC_DATA_DOBUF(0)     <= std_logic_vector(to_unsigned(2,32));   
    wait for CLK_PERIOD;
    VC_DATA_DOBUF(0)     <= std_logic_vector(to_unsigned(3,32));   
    wait for CLK_PERIOD;
    VC_DATA_DOBUF(0)     <= std_logic_vector(to_unsigned(4,32));   
    wait for CLK_PERIOD;
    VC_DATA_DOBUF(0)     <= std_logic_vector(to_unsigned(5,32));   
    wait for CLK_PERIOD;
    REQ_ACK_DERRM        <= '1';
    VC_DATA_DOBUF(0)     <= std_logic_vector(to_unsigned(6,32));  
    wait for CLK_PERIOD;
   
    VC_DATA_DOBUF(0)        <= std_logic_vector(to_unsigned(7,32)); 
    wait for CLK_PERIOD;
    VC_DATA_VALID_DOBUF(0)  <= '0';
    wait for CLK_PERIOD;
    VC_DATA_VALID_DOBUF(0)  <= '1';
    VC_DATA_DOBUF(0)     <= std_logic_vector(to_unsigned(8,32));   
    REQ_ACK_DERRM           <= '0';
    wait for CLK_PERIOD;
    VC_DATA_DOBUF(0)     <= std_logic_vector(to_unsigned(9,32));   
    wait for CLK_PERIOD;
    VC_DATA_DOBUF(0)     <= std_logic_vector(to_unsigned(10,32));    
    wait for CLK_PERIOD;
    VC_DATA_VALID_DOBUF(0)  <= '1';
    VC_DATA_DOBUF(0)     <= std_logic_vector(to_unsigned(11,32));   
    wait for CLK_PERIOD;
    VC_DATA_DOBUF(0)       <= std_logic_vector(to_unsigned(12,32));
    VC_END_PACKET_DOBUF(0)  <= '1';  
    wait for CLK_PERIOD;
    VC_DATA_DOBUF(0)     <= std_logic_vector(to_unsigned(13,32));
    VC_DATA_VALID_DOBUF(0)  <= '0';
    VC_END_PACKET_DOBUF(0)  <= '0';  
    wait for CLK_PERIOD;



    -- End simulation
    wait;
  end process;

end behavioral;
