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

entity tb_data_out_buff is
end tb_data_out_buff;

architecture behavioral of tb_data_out_buff is

  -- Component declaration
  component data_out_buff
    port (
      RST_N                 : in  std_logic;
      CLK                   : in  std_logic;
      LINK_RESET            : in  std_logic;
      S_AXIS_ACLK           : in  std_logic;
      S_AXIS_TREADY         : out std_logic;
      S_AXIS_TDATA          : in  std_logic_vector(C_DATA_LENGTH-1 downto 0);
      S_AXIS_TUSER          : in  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
      S_AXIS_TLAST          : in  std_logic;
      S_AXIS_TVALID         : in  std_logic;
      VC_READY_DOBUF        : out std_logic;
      DATA_DOBUF            : out std_logic_vector(C_DATA_LENGTH-1 downto 0);
      VALID_K_CHARAC_DOBUF  : out std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
      DATA_VALID_DOBUF      : out std_logic;
      END_PACKET_DOBUF      : out std_logic;
      VC_RD_EN_DMAC         : in  std_logic;
      M_VAL_DDES            : in  std_logic_vector(C_M_SIZE-1 downto 0);
      FCT_FAR_END_DDES      : in  std_logic;
      LANE_ACTIVE_ST_PPL    : in  std_logic;
      FCT_CC_OVF_DOBUF      : out std_logic;
      VC_CONT_MODE_MIB      : in  std_logic
    );
  end component;

  -- Signals
  signal RST_N                 : std_logic;
  signal CLK                   : std_logic;
  signal LINK_RESET            : std_logic;
  signal S_AXIS_ACLK           : std_logic;
  signal S_AXIS_TREADY         : std_logic;
  signal S_AXIS_TDATA          : std_logic_vector(C_DATA_LENGTH-1 downto 0);
  signal S_AXIS_TUSER          : std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
  signal S_AXIS_TLAST          : std_logic;
  signal S_AXIS_TVALID         : std_logic;
  signal VC_READY_DOBUF        : std_logic;
  signal DATA_DOBUF            : std_logic_vector(C_DATA_LENGTH-1 downto 0);
  signal VALID_K_CHARAC_DOBUF  : std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
  signal DATA_VALID_DOBUF      : std_logic;
  signal END_PACKET_DOBUF      : std_logic;
  signal VC_RD_EN_DMAC         : std_logic;
  signal M_VAL_DDES            : std_logic_vector(C_M_SIZE-1 downto 0);
  signal FCT_FAR_END_DDES      : std_logic;
  signal LANE_ACTIVE_ST_PPL    : std_logic;
  signal FCT_CC_OVF_DOBUF      : std_logic;
  signal VC_CONT_MODE_MIB      : std_logic;

begin

  -- Instantiate the Unit Under Test (UUT)
  uut: data_out_buff
    port map (
      RST_N                 => RST_N,
      CLK                   => CLK,
      LINK_RESET            => LINK_RESET,
      S_AXIS_ACLK           => CLK,
      S_AXIS_TREADY         => S_AXIS_TREADY,
      S_AXIS_TDATA          => S_AXIS_TDATA,
      S_AXIS_TUSER          => S_AXIS_TUSER,
      S_AXIS_TLAST          => S_AXIS_TLAST,
      S_AXIS_TVALID         => S_AXIS_TVALID,
      VC_READY_DOBUF        => VC_READY_DOBUF,
      DATA_DOBUF            => DATA_DOBUF,
      VALID_K_CHARAC_DOBUF  => VALID_K_CHARAC_DOBUF,
      DATA_VALID_DOBUF      => DATA_VALID_DOBUF,
      END_PACKET_DOBUF      => END_PACKET_DOBUF,
      VC_RD_EN_DMAC         => VC_RD_EN_DMAC,
      M_VAL_DDES            => M_VAL_DDES,
      FCT_FAR_END_DDES      => FCT_FAR_END_DDES,
      LANE_ACTIVE_ST_PPL    => LANE_ACTIVE_ST_PPL,
      FCT_CC_OVF_DOBUF      => FCT_CC_OVF_DOBUF,
      VC_CONT_MODE_MIB      => VC_CONT_MODE_MIB
    );

  -- Clock process
  clk_process :process
  begin
    CLK <= '0';
    wait for 5 ns;
    CLK <= '1';
    wait for 5 ns;
  end process;

  -- Stimulus process
  stim_proc: process
  begin
    -- Initialize inputs
    RST_N <= '0';
    LINK_RESET <= '0';
    S_AXIS_ACLK <= '0';
    S_AXIS_TDATA <= (others => '0');
    S_AXIS_TUSER <= (others => '0');
    S_AXIS_TLAST <= '0';
    S_AXIS_TVALID <= '0';
    VC_RD_EN_DMAC <= '0';
    M_VAL_DDES <= (others => '0');
    FCT_FAR_END_DDES <= '0';
    LANE_ACTIVE_ST_PPL <= '1';
    VC_CONT_MODE_MIB <= '0';

    wait for 20 ns;

    -- Release reset
    RST_N <= '1';
    wait for 20 ns;
    wait until rising_edge(CLK);
    -- Apply test vectors
    for i in 0 to 62 loop 
      S_AXIS_TDATA  <= std_logic_vector(to_unsigned(1+i, S_AXIS_TDATA'length));
      S_AXIS_TUSER  <= x"0";
      S_AXIS_TLAST  <= '0';
      S_AXIS_TVALID <= '1';
      wait until rising_edge(CLK);
    end loop;

    S_AXIS_TDATA <= std_logic_vector(to_unsigned(666, S_AXIS_TDATA'length));
    S_AXIS_TUSER <= "0001";
    S_AXIS_TLAST <= '1';
    S_AXIS_TVALID <= '1';
    wait until rising_edge(CLK);
    S_AXIS_TUSER <= "0000";
    S_AXIS_TLAST <= '0';
    S_AXIS_TVALID <= '0';
    for i in 0 to 63 loop
      wait until rising_edge(CLK);
      VC_RD_EN_DMAC <= '1';
    end loop;
    wait until rising_edge(CLK);
    wait until rising_edge(CLK);
    wait until rising_edge(CLK);
    VC_RD_EN_DMAC <= '0';
    wait for 20 ns;

    -- Add more test vectors as needed

    -- End simulation
    wait;
  end process;

end behavioral;
