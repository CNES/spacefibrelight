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

entity tb_data_in_buf is
end tb_data_in_buf;

library work;
use work.data_link_lib.all;

architecture testbench of tb_data_in_buf is

  -- Component declaration
  component data_in_buf
    port (
      RST_N                  : in  std_logic;
      CLK                    : in  std_logic;
      LINK_RESET             : in  std_logic;
      M_AXIS_ACLK_IBUF       : in  std_logic;
      M_AXIS_TVALID_IBUF     : out std_logic;
      M_AXIS_TDATA_IBUF      : out std_logic_vector(C_DATA_LENGTH-1 downto 0);
      M_AXIS_TLAST_IBUF      : out std_logic;
      M_AXIS_TREADY_IBUF     : in  std_logic;
      M_AXIS_TUSER_IBUF      : out std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
      DATA_DDES              : in  std_logic_vector(C_DATA_LENGTH+C_BYTE_BY_WORD_LENGTH-1 downto 0);
      DATA_EN_DDES           : in  std_logic;
      REQ_FCT_DIBUF          : out std_logic;
      REQ_FCT_DONE_DMAC      : in  std_logic;
      FCT_CREDIT_OVERFLOW_DL : out std_logic
    );
  end component;

  -- Signal declarations
  signal RST_N                  : std_logic := '1';
  signal CLK                    : std_logic := '0';
  signal LINK_RESET             : std_logic := '0';
  signal M_AXIS_ACLK_IBUF       : std_logic := '0';
  signal M_AXIS_TVALID_IBUF     : std_logic;
  signal M_AXIS_TDATA_IBUF      : std_logic_vector(C_DATA_LENGTH-1 downto 0);
  signal M_AXIS_TLAST_IBUF      : std_logic;
  signal M_AXIS_TREADY_IBUF     : std_logic := '0';
  signal M_AXIS_TUSER_IBUF      : std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
  signal DATA_DDES              : std_logic_vector(C_DATA_LENGTH+C_BYTE_BY_WORD_LENGTH-1 downto 0);
  signal DATA_EN_DDES           : std_logic := '0';
  signal REQ_FCT_DIBUF          : std_logic;
  signal REQ_FCT_DONE_DMAC      : std_logic := '0';
  signal FCT_CREDIT_OVERFLOW_DL : std_logic;

begin

  -- Instantiate the Unit Under Test (UUT)
  uut: data_in_buf
    port map (
      RST_N                  => RST_N,
      CLK                    => CLK,
      LINK_RESET             => LINK_RESET,
      M_AXIS_ACLK_IBUF       => CLK,
      M_AXIS_TVALID_IBUF     => M_AXIS_TVALID_IBUF,
      M_AXIS_TDATA_IBUF      => M_AXIS_TDATA_IBUF,
      M_AXIS_TLAST_IBUF      => M_AXIS_TLAST_IBUF,
      M_AXIS_TREADY_IBUF     => M_AXIS_TREADY_IBUF,
      M_AXIS_TUSER_IBUF      => M_AXIS_TUSER_IBUF,
      DATA_DDES              => DATA_DDES,
      DATA_EN_DDES           => DATA_EN_DDES,
      REQ_FCT_DIBUF          => REQ_FCT_DIBUF,
      REQ_FCT_DONE_DMAC      => REQ_FCT_DONE_DMAC,
      FCT_CREDIT_OVERFLOW_DL => FCT_CREDIT_OVERFLOW_DL
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
    wait for 20 ns;
    RST_N <= '1';
    wait until rising_edge(CLK);
    -- Test sequence
    -- Example: Apply test vectors
    wait for 100 ns;
    for i in 0 to 10  loop
      DATA_DDES    <= std_logic_vector(to_unsigned(i+1, DATA_DDES'length));
      DATA_EN_DDES <= '1';
      wait until rising_edge(CLK);
    end loop; --
    DATA_DDES    <= std_logic_vector(to_unsigned(0, DATA_DDES'length));
    DATA_EN_DDES <= '0';
    wait until rising_edge(CLK);
    M_AXIS_TREADY_IBUF <='1';
     wait until rising_edge(CLK);
      wait until rising_edge(CLK);
       wait until rising_edge(CLK);
        wait until rising_edge(CLK);
        wait until rising_edge(CLK);
        M_AXIS_TREADY_IBUF <='0';
      
    -- Add more test vectors as needed

    -- End simulation
    wait;
  end process;

end architecture testbench;
