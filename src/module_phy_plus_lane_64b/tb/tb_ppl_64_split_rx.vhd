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
-- Creation date : 04/07/2025
--
-- Description : This is the testbench of the ppl_64_rx_sync_fsm module
----------------------------------------------------------------------------
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library phy_plus_lane_64_lib;
   use phy_plus_lane_64_lib.pkg_phy_plus_lane_64b.all;

library work;
use work.pkg_simu.all;

entity tb_ppl_64_bus_split_rx is
end entity;

architecture tb of tb_ppl_64_bus_split_rx is
  component ppl_64_bus_split_rx is
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
   end component;

  component FIFO_DC is
  generic (
      G_DWIDTH                : integer := 8;                                 -- Data bus fifo length
      G_AWIDTH                : integer := 8;                                 -- Address bus fifo length
      G_THRESHOLD_HIGH        : integer := 2**8;                              -- high threshold
      G_THRESHOLD_LOW         : integer := 0                                  -- low threshold
  );
  port (
      RST_N                   : in  std_logic;
      -- Writing port
      WR_CLK                  : in  std_logic;                                -- Clock
      WR_DATA                 : in  std_logic_vector(G_DWIDTH-1 downto 0);    -- Data write bus
      WR_DATA_EN              : in  std_logic;                                -- Write command

      -- Reading port
      RD_CLK                  : in  std_logic;                                -- Clock
      RD_DATA                 : out std_logic_vector(G_DWIDTH-1 downto 0);    -- Data read bus
      RD_DATA_EN              : in  std_logic;                                -- Read command
      RD_DATA_VLD             : out std_logic;                                -- Data valid

      -- Command port
      CMD_FLUSH               : in  std_logic;                                -- fifo flush
      STATUS_BUSY_FLUSH       : out std_logic;                                -- fifo is flushing

      -- Status port
      STATUS_THRESHOLD_HIGH   : out std_logic;                                -- threshold high reached flag (sur WR_CLK)
      STATUS_THRESHOLD_LOW    : out std_logic;                                -- threshold low reached flag (sur RD_CLK)
      STATUS_FULL             : out std_logic;                                -- full fifo flag (sur WR_CLK)
      STATUS_EMPTY            : out std_logic;                                -- empty fifo flag (sur RD_CLK)
      STATUS_LEVEL_WR         : out std_logic_vector(G_AWIDTH-1 downto 0);    -- Niveau de remplissage de la FIFO (sur WR_CLK)
      STATUS_LEVEL_RD         : out std_logic_vector(G_AWIDTH-1 downto 0)     -- Niveau de remplissage de la FIFO (sur RD_CLK)
  );
  end component;


---------------------------------------------------------
-----                  Signal declaration           -----
---------------------------------------------------------
constant periode                    : time := 13.334 ns;

signal RST_N                        : std_logic := '0';
signal CLK                          : std_logic := '0';
-- Data-link layer interface
signal FIFO_RX_RD_EN_DL             : std_logic:= '0';
signal DATA_RX_PLBSR                : std_logic_vector(31 downto 0);
signal FIFO_RX_DATA_VALID_PLBSR     : std_logic;
signal VALID_K_CHARAC_RX_PLBSR      : std_logic_vector(3 downto 0);
signal FAR_END_CAPA_PLBSR           : std_logic_vector(7 downto 0);
signal LANE_ACTIVE_PLBSR            : std_logic;
-- ppl_64_data_fifo_rx (PLDFR) interface
signal FIFO_RX_RD_EN_PLBSR          : std_logic;
signal DATA_RX_PLFRD                : std_logic_vector(C_DATA_WIDTH-1  downto 0);
signal FIFO_RX_DATA_VALID_PLFRD     : std_logic;
signal FIFO_RX_EMPTY_PLFRD          : std_logic;
signal VALID_K_CHARAC_RX_PLFRD      : std_logic_vector(C_K_CHAR_WIDTH-1 downto 0);
signal DATA_RDY_RX_PLFRD            : std_logic_vector(1 downto 0)                  := "11";
-- ppl_64_ctrl_fifo_rx (PLCFR) interface
signal FAR_END_CAPA_PLFRC           : std_logic_vector(7 downto 0):= (others => '0');
signal LANE_ACTIVE_PLFRC            : std_logic :='0';
-- fifo
signal FIFO_WRITE_0_wr_data         : std_logic_vector(71 downto 00) := (others => '0');
signal FIFO_WRITE_0_wr_en           : std_logic := '0';
signal FIFO_READ_0_rd_data          : std_logic_vector(71 downto 00);

---------------------------------------------------------
-----                  Procedure                    -----
---------------------------------------------------------
    procedure init(
        signal clk     : out std_logic;
        signal rst     : out std_logic;
        signal start   : out std_logic;
        signal data_in : out std_logic_vector(7 downto 0)
    ) is
    begin
        -- Valeurs initiales
        clk     <= '0';
        rst     <= '1';
        start   <= '0';
        data_in <= (others => '0');

        -- Pulse reset
        wait for 20 ns;
        rst <= '0';
        wait for 20 ns;
        rst <= '1';
        wait for 20 ns;
        rst <= '0';
    end procedure;

begin
----------------------------------------------------------------------------
-- Instantiation
----------------------------------------------------------------------------
DUT : ppl_64_bus_split_rx
   port map (
      RST_N                       => RST_N,
      CLK                         => CLK,
      FIFO_RX_RD_EN_DL            => FIFO_RX_RD_EN_DL,
      DATA_RX_PLBSR               => DATA_RX_PLBSR,
      FIFO_RX_DATA_VALID_PLBSR    => FIFO_RX_DATA_VALID_PLBSR,
      VALID_K_CHARAC_RX_PLBSR     => VALID_K_CHARAC_RX_PLBSR,
      FAR_END_CAPA_PLBSR          => FAR_END_CAPA_PLBSR,
      LANE_ACTIVE_PLBSR           => LANE_ACTIVE_PLBSR,
      FIFO_RX_RD_EN_PLBSR         => FIFO_RX_RD_EN_PLBSR,
      DATA_RX_PLFRD               => DATA_RX_PLFRD,
      FIFO_RX_DATA_VALID_PLFRD    => FIFO_RX_DATA_VALID_PLFRD,
      FIFO_RX_EMPTY_PLFRD         => FIFO_RX_EMPTY_PLFRD,
      VALID_K_CHARAC_RX_PLFRD     => VALID_K_CHARAC_RX_PLFRD,
      DATA_RDY_RX_PLFRD           => DATA_RDY_RX_PLFRD,
      FAR_END_CAPA_PLFRC          => FAR_END_CAPA_PLFRC,
      LANE_ACTIVE_PLFRC           => LANE_ACTIVE_PLFRC
   );

DUT_FIFO_DC : FIFO_DC
  generic map(
       G_DWIDTH                => 72,
       G_AWIDTH                => 8,
       G_THRESHOLD_HIGH        => 2**8,
       G_THRESHOLD_LOW         => 0
   )
   port map(
       RST_N                   => RST_N,
       -- Writing port
       WR_CLK                  => CLK,
       WR_DATA                 => FIFO_WRITE_0_wr_data,
       WR_DATA_EN              => FIFO_WRITE_0_wr_en,
       -- Reading port
       RD_CLK                  => CLK,
       RD_DATA                 => FIFO_READ_0_rd_data,
       RD_DATA_EN              => FIFO_RX_RD_EN_PLBSR,
       RD_DATA_VLD             => FIFO_RX_DATA_VALID_PLFRD,
       -- Command port
       CMD_FLUSH               => '0',
       STATUS_BUSY_FLUSH       => open,
       -- Status port
       STATUS_THRESHOLD_HIGH   => open,
       STATUS_THRESHOLD_LOW    => open,
       STATUS_FULL             => open,
       STATUS_EMPTY            => FIFO_RX_EMPTY_PLFRD,
       STATUS_LEVEL_WR         => open,
       STATUS_LEVEL_RD         => open
   );
----------------------------------------------------------------------------
-- Assignement
----------------------------------------------------------------------------
   VALID_K_CHARAC_RX_PLFRD <= FIFO_READ_0_rd_data(71 downto 64);
   DATA_RX_PLFRD           <= FIFO_READ_0_rd_data(63 downto 0);
-- generate clock 75 MHz
horloge : process
begin
   CLK   <= not CLK;
   wait for periode/2;
end process;
----------------------------------------------------------------------------
-- Scenario
----------------------------------------------------------------------------
scenario : process
  variable test_failed : boolean := false;
  procedure init is
    begin
      RST_N <= '0';
      wait for 10 us;
      wait until rising_edge(CLK);
      RST_N <= '1';
      wait for 20 us;
      wait until rising_edge(CLK);
      wait until rising_edge(CLK);
      FIFO_WRITE_0_wr_data <= x"2" & x"1" & x"55555555" & x"23456789";
      FIFO_WRITE_0_wr_en   <= '1';
      wait until rising_edge(CLK);
      FIFO_WRITE_0_wr_data <= x"4" & x"3" & x"77777777" & x"66666666";
      wait until rising_edge(CLK);
      FIFO_WRITE_0_wr_data <= x"6" & x"5" & x"99999999" & x"88888888";
      wait until rising_edge(CLK);
      FIFO_WRITE_0_wr_data <= x"8" & x"7" & x"BBBBBBBB" & x"AAAAAAAA";
      wait until rising_edge(CLK);
      FIFO_WRITE_0_wr_data <= x"A" & x"9" & x"DDDDDDDD" & x"CCCCCCCC";
      wait until rising_edge(CLK);
      FIFO_WRITE_0_wr_data <= x"C" & x"B" & x"FFFFFFFF" & x"EEEEEEEE";
      wait until rising_edge(CLK);
      FIFO_WRITE_0_wr_data <= x"E" & x"D" & x"22222222" & x"11111111";
      wait until rising_edge(CLK);
      FIFO_WRITE_0_wr_en <= '0';
    end procedure;
begin
  --------------------------------------------------------------
  -- TEST 0: FIFO not empty and FIFO_RX_RD_EN_DL='1' after init          --
  --------------------------------------------------------------
  init;
  FIFO_RX_RD_EN_DL   <= '1';
  wait until falling_edge(CLK);
  wait until falling_edge(CLK);
  -- First Word 1 check
  check_equal("Test 0.1: First Word 1: DATA_RX_PLBSR",            x"23456789", DATA_RX_PLBSR,            test_failed);
  check_equal("Test 0.1: First Word 1: VALID_K_CHARAC_RX_PLBSR",  x"1",        VALID_K_CHARAC_RX_PLBSR,  test_failed);
  check      ("Test 0.1: First Word 1: FIFO_RX_DATA_VALID_PLBSR", '1',         FIFO_RX_DATA_VALID_PLBSR, test_failed);
  wait until falling_edge(CLK);
  -- Second Word 1 check
  check_equal("Test 0.1: Second Word 1: DATA_RX_PLBSR",            x"55555555", DATA_RX_PLBSR,            test_failed);
  check_equal("Test 0.1: Second Word 1: VALID_K_CHARAC_RX_PLBSR",  x"2",        VALID_K_CHARAC_RX_PLBSR,  test_failed);
  check      ("Test 0.1: Second Word 1: FIFO_RX_DATA_VALID_PLBSR", '1',         FIFO_RX_DATA_VALID_PLBSR, test_failed);
  wait until falling_edge(CLK);
  -- First Word 2 check
  check_equal("Test 0.2: First Word 2: DATA_RX_PLBSR",            x"66666666", DATA_RX_PLBSR,            test_failed);
  check_equal("Test 0.2: First Word 2: VALID_K_CHARAC_RX_PLBSR",  x"3",        VALID_K_CHARAC_RX_PLBSR,  test_failed);
  check      ("Test 0.2: First Word 2: FIFO_RX_DATA_VALID_PLBSR", '1',         FIFO_RX_DATA_VALID_PLBSR, test_failed);
  wait until falling_edge(CLK);
  -- Second Word 2 check
  check_equal("Test 0.2: Second Word 2: DATA_RX_PLBSR",            x"77777777", DATA_RX_PLBSR,            test_failed);
  check_equal("Test 0.2: Second Word 2: VALID_K_CHARAC_RX_PLBSR",  x"4",        VALID_K_CHARAC_RX_PLBSR,  test_failed);
  check      ("Test 0.2: Second Word 1: FIFO_RX_DATA_VALID_PLBSR", '1',         FIFO_RX_DATA_VALID_PLBSR, test_failed);
  FIFO_RX_RD_EN_DL   <= '0';
  -----------------------------------------------------------------------
  -- TEST 1: FIFO not empty and FIFO_RX_RD_EN_DL='0' on the first word --
  ------------------------------------------------------------------------
  init;
  wait until falling_edge(CLK);
  FIFO_RX_RD_EN_DL   <= '1';
  wait until falling_edge(CLK);
  FIFO_RX_RD_EN_DL <= '0';
  -- First Word 1 check
  check_equal("Test 1.1: First Word 1: DATA_RX_PLBSR",            x"23456789", DATA_RX_PLBSR,            test_failed);
  check_equal("Test 1.1: First Word 1: VALID_K_CHARAC_RX_PLBSR",  x"1",        VALID_K_CHARAC_RX_PLBSR,  test_failed);
  check      ("Test 1.1: First Word 1: FIFO_RX_DATA_VALID_PLBSR", '1',         FIFO_RX_DATA_VALID_PLBSR, test_failed);
  wait until falling_edge(CLK);
  -- No second word check
  FIFO_RX_RD_EN_DL <= '1';
  check      ("Test 1.2: No Second Word 1: FIFO_RX_DATA_VALID_PLBSR", '0',         FIFO_RX_DATA_VALID_PLBSR, test_failed);
  wait until falling_edge(CLK);
  -- Second Word 1 check
  check_equal("Test 1.3: Second Word 1: DATA_RX_PLBSR",            x"55555555", DATA_RX_PLBSR,            test_failed);
  check_equal("Test 1.3: Second Word 1: VALID_K_CHARAC_RX_PLBSR",  x"2",        VALID_K_CHARAC_RX_PLBSR,  test_failed);
  check      ("Test 1.3: Second Word 1: FIFO_RX_DATA_VALID_PLBSR", '1',         FIFO_RX_DATA_VALID_PLBSR, test_failed);
  wait until falling_edge(CLK);
  -- First Word 2 check
  check_equal("Test 1.4: First Word 2: DATA_RX_PLBSR",            x"66666666", DATA_RX_PLBSR,            test_failed);
  check_equal("Test 1.4: First Word 2: VALID_K_CHARAC_RX_PLBSR",  x"3",        VALID_K_CHARAC_RX_PLBSR,  test_failed);
  check      ("Test 1.4: First Word 2: FIFO_RX_DATA_VALID_PLBSR", '1',         FIFO_RX_DATA_VALID_PLBSR, test_failed);
  wait until falling_edge(CLK);
  -- Second Word 2 check
  check_equal("Test 1.5: Second Word 2: DATA_RX_PLBSR",            x"77777777", DATA_RX_PLBSR,            test_failed);
  check_equal("Test 1.5: Second Word 2: VALID_K_CHARAC_RX_PLBSR",  x"4",        VALID_K_CHARAC_RX_PLBSR,  test_failed);
  check      ("Test 1.5: Second Word 1: FIFO_RX_DATA_VALID_PLBSR", '1',         FIFO_RX_DATA_VALID_PLBSR, test_failed);
------------------------------------------------------------
--                       END TEST                         --
------------------------------------------------------------
log_test_result(test_failed);
wait;

end process;

end tb;