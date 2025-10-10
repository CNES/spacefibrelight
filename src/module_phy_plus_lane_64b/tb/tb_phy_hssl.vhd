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
-- Creation date : 02/07/2025
--
-- Description : This is the testbench of the PHY layer
----------------------------------------------------------------------------
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

library phy_plus_lane_64_lib;
  use phy_plus_lane_64_lib.pkg_phy_plus_lane_64b.all;

library work;

entity tb_phy_hssl is
end entity;

architecture sim of tb_phy_hssl is

---------------------------------------------------------
-----               Component declaration           -----
---------------------------------------------------------
  component SpaceFibre_64b
    port (
      HSSL_CLOCK_I                  : in  std_logic_vector(3 downto 0);
      RX0N                          : in  std_logic;
      RX0P                          : in  std_logic;
      RX1N                          : in  std_logic;
      RX1P                          : in  std_logic;
      RX2N                          : in  std_logic;
      RX2P                          : in  std_logic;
      RX3N                          : in  std_logic;
      RX3P                          : in  std_logic;
      TX0N                          : out std_logic;
      TX0P                          : out std_logic;
      TX1N                          : out std_logic;
      TX1P                          : out std_logic;
      TX2N                          : out std_logic;
      TX2P                          : out std_logic;
      TX3N                          : out std_logic;
      TX3P                          : out std_logic;
      CKREFN                        : in  std_logic;
      CKREFP                        : in  std_logic;
      CLOCK_O                       : out std_logic;
      DYN_CFG_EN_I                  : in  std_logic;
      DYN_ADDR_I                    : in  std_logic_vector(3 downto 0);
      DYN_CALIBRATION_CS_N_I        : in  std_logic;
      DYN_LANE_CS_N_I               : in  std_logic_vector(3 downto 0);
      DYN_WDATA_I                   : in  std_logic_vector(11 downto 0);
      DYN_WDATA_SEL_I               : in  std_logic;
      DYN_WE_N_I                    : in  std_logic;
      PLL_PMA_LOCK_ANALOG           : out std_logic;
      PLL_PMA_PWR_UP_I              : in  std_logic;
      PLL_PMA_RST_N_I               : in  std_logic;
      PLL_LOCK                      : out std_logic;
      TX0_BUSY_O                    : out std_logic;
      TX0_CLK_ENA_I                 : in  std_logic;
      TX0_CLK_O                     : out std_logic;
      TX0_DATA_I                    : in  std_logic_vector(63 downto 0); -- préciser la taille
      TX0_CTRL_DRIVER_PWRDWN_N_I    : in  std_logic;
      TX0_RST_N_I                   : in  std_logic;
      TX0_CTRL_CHAR_IS_K_I          : in  std_logic_vector(7 downto 0);
      RX0_BUSY_O                    : out std_logic;
      RX0_CTRL_EL_BUFF_STAT_O       : out std_logic_vector (7 downto 0);
      RX0_CTRL_CHAR_IS_ALIGNED_O    : out std_logic;
      RX0_CTRL_CHAR_IS_COMMA_O      : out std_logic_vector(7 downto 0);
      RX0_CTRL_CHAR_IS_F_O          : out std_logic_vector(7 downto 0);
      RX0_CTRL_CHAR_IS_K_O          : out std_logic_vector(7 downto 0);
      RX0_CTRL_DISP_ERR_O           : out std_logic_vector(7 downto 0);
      RX0_CTRL_NOT_IN_TABLE_O       : out std_logic_vector(7 downto 0);
      RX0_CTRL_VALID_REALIGN_O      : out std_logic;
      RX0_DATA_O                    : out std_logic_vector(63 downto 0); -- préciser la taille
      RX0_OVS_BIT_SEL_I             : in  std_logic_vector(1 downto 0);
      RX0_EYE_RST_I                 : in  std_logic;
      RX0_PMA_LL_FAST_LOCKED_O      : out std_logic;
      RX0_PMA_LL_SLOW_LOCKED_O      : out std_logic;
      RX0_PMA_LOSS_OF_SIGNAL_O      : out std_logic;
      RX0_PMA_PLL_LOCK_O            : out std_logic;
      RX0_PMA_PLL_LOCK_TRACK_O      : out std_logic;
      RX0_PMA_RST_N_I               : in  std_logic;
      RX0_PMA_PWR_UP_I              : in  std_logic;
      RX0_RST_N_I                   : in  std_logic;
      RX0_TEST_O                    : out std_logic_vector (7 downto 0);
      RX0_REPLACE_EN_I              : in  std_logic;
      RX0_ALIGN_SYNC_I              : in  std_logic;
      RX0_EL_BUFF_RST_I             : in  std_logic
    );
  end component;

  component ppl_64_init_hssl
    port (
      RST_N                            : in  std_logic;
      CLK                              : in  std_logic;
      RECEIVER_DISABLED_PLIF           : in std_logic;
      CDR_PLIF                         : in std_logic;
      TRANSMITTER_DISABLED_PLIF        : in std_logic;
      PLL_PMA_PWR_UP_PLIH              : out std_logic;
      TX_DRIVER_PWRDWN_N_PLIH          : out std_logic;
      PLL_PMA_RST_N_PLIH               : out std_logic;
      PLL_PMA_LOCK_ANALOG_HSSL         : in  std_logic;
      TX_RST_N_PLIH                    : out std_logic;
      TX_BUSY_HSSL                     : in  std_logic;
      RX_PMA_PWR_UP_PLIH               : out std_logic;
      RX_PMA_RST_N_PLIH                : out std_logic;
      RX_PMA_LL_SLOW_LOCKED_HSSL       : in  std_logic;
      RX_RST_N_PLIH                    : out std_logic;
      RX_BUSY_HSSL                     : in  std_logic;
      HSSL_RESET_DONE_PLIH             : out std_logic
    );
  end component;

  component ppl_64_skip_insertion
   port (
      RST_N                   : in  std_logic;                                          --! global reset
      CLK                     : in  std_logic;                                          --! Clock generated by GTY IP
      -- ppl_64_lane_ctrl_word_insert (PLCWI) Interface
      NEW_DATA_PLCWI          : in  std_logic;                                          --! New data Flag
      DATA_TX_PLCWI           : in  std_logic_vector(C_DATA_WIDTH-1 downto 0);         --! Data 64-bit receive from DATA_LINK layer
      VALID_K_CHARAC_PLCWI    : in  std_logic_vector(C_K_CHAR_WIDTH-1 downto 0); --! Flags indicates which byte is a K character from DATA-LINK layer
      WAIT_SEND_DATA_PLSI      : out std_logic;                                          --! Flag to indicates that the lane_ctrl_word_insert send a SKIP control word
      -- HSSL Interface
      DATA_TX_PLSI             : out std_logic_vector(C_DATA_WIDTH-1 downto 0);         --! Data 64-bit send to manufacturer IP
      VALID_K_CHARAC_PLSI      : out std_logic_vector(C_K_CHAR_WIDTH-1 downto 0); --! Flags indicates which byte is a K character
      -- ppl_64_lane_init_fsm
      ENABLE_TRANSM_DATA_PLIF : in  std_logic                                           --! Flag to enable to send data
   );
  end component;

  component ppl_64_rx_sync_fsm is
  port(
      RST_N                         : in  std_logic;                                            --! global reset
      CLK                           : in  std_logic;                                            --! Clock generated by GTY IP
      -- FROM Data-link layer
      LANE_RESET_DL                 : in  std_logic;                                            --! Lane reset command from Data-Link Layer.
      -- TO lane_ctrl_word_detection
      DATA_RX_PLRSF                 : out std_logic_vector(C_DATA_WIDTH-1  downto 0);          --! 32-bit data to lane_ctrl_word_detect
      VALID_K_CHARAC_PLRSF          : out std_logic_vector(C_K_CHAR_WIDTH-1  downto 0);  --! 4-bit valid K character flags to lane_ctrl_word_detect
      DATA_RDY_PLRSF                : out std_logic;                                            --! Data valid flag to lane_ctrl_word_detect
      -- FROM MANUFACTURER IP
      DATA_RX_PLWA                  : in  std_logic_vector(C_DATA_WIDTH-1  downto 0);          --! 32-bit data from GTY IP
      VALID_K_CHARAC_PLWA           : in  std_logic_vector(C_K_CHAR_WIDTH-1  downto 0);  --! 4-bit valid K character flags from GTY IP
      INVALID_CHAR_PLWA             : in  std_logic_vector(C_K_CHAR_WIDTH-1  downto 0);  --! Invalid character flags from GTY IP
      DISPARITY_ERR_PLWA            : in  std_logic_vector(C_K_CHAR_WIDTH-1  downto 0);  --! Disparity error flags from GTY IP
      RX_WORD_IS_ALIGNED_PLWA         : in  std_logic;                                            --! RX word realign from GTY IP
      COMMA_DET_PLWA                : in  std_logic_vector(C_K_CHAR_WIDTH-1  downto 0);  --! Flag indicates that a comma is detected on the word receive
      -- PARAMETERS
      LANE_RESET                    : in  std_logic                                             --! Asserts or de-asserts LaneReset for the lane
  );
  end component;

  component ppl_64_word_alignment is
  port (
    RST_N                   : in  std_logic;                                          --! global reset
    CLK                     : in  std_logic;                                          --! Clock generated by HSSL IP
    -- ppm64_rx_sync_fsm (PLRSF) interface
    DATA_RX_PLWA            : out std_logic_vector(C_DATA_WIDTH-1 downto 0);         --! 64-bit data to lane_ctrl_word_detect
    VALID_K_CHARAC_PLWA     : out std_logic_vector(C_K_CHAR_WIDTH-1 downto 0); --! 8-bit valid K character flags to lane_ctrl_word_detect
    DATA_RDY_PLWA           : out std_logic;                                          --! Data valid flag to lane_ctrl_word_detect
    INVALID_CHAR_PLWA       : out std_logic_vector(C_K_CHAR_WIDTH-1 downto 0); --! Invalid character flags from PLWA
    DISPARITY_ERR_PLWA      : out std_logic_vector(C_K_CHAR_WIDTH-1 downto 0); --! Disparity error flags from PLWA
    RX_WORD_IS_ALIGNED_PLWA : out std_logic;                                          --! RX word is aligned from PLWA
    COMMA_DET_PLWA          : out std_logic_vector(C_K_CHAR_WIDTH-1 downto 0); --! Flag indicates that a comma is detected on the word receive from PLWA
    -- HSSL IP interface
    DATA_RX_HSSL            : in  std_logic_vector(C_DATA_WIDTH-1 downto 0);         --! 64-bit data from HSSL IP
    VALID_K_CHARAC_HSSL     : in  std_logic_vector(C_K_CHAR_WIDTH-1 downto 0); --! 8-bit valid K character flags from HSSL IP
    INVALID_CHAR_HSSL       : in  std_logic_vector(C_K_CHAR_WIDTH-1 downto 0); --! Invalid character flags from HSSL IP
    DISPARITY_ERR_HSSL      : in  std_logic_vector(C_K_CHAR_WIDTH-1 downto 0); --! Disparity error flags from HSSL IP
    RX_WORD_IS_ALIGNED_HSSL : in  std_logic;                                          --! RX word is aligned from HSSL IP
    COMMA_DET_HSSL          : in  std_logic_vector(C_K_CHAR_WIDTH-1 downto 0)  --! Flag indicates that a comma is detected on the word receive
   );
end component;

---------------------------------------------------------
-----                  Signal declaration           -----
---------------------------------------------------------
  -- Global
signal RST_N                        : std_logic;
signal CLK_SYS                      : std_logic;

-- inst_SpaceFibre_64b
-- TX
signal HSSL_CLOCK_I                 : std_logic_vector(3 downto 0):= (others =>'0');
signal LANE_TX0N                    : std_logic;
signal LANE_TX0P                    : std_logic;
signal TB_CKREF_IN                  : std_logic;
signal TB_CKREF_IN_N                : std_logic;
signal CLK_HSSL                     : std_logic;
signal PLL_PMA_LOCK_ANALOG_HSSL     : std_logic;
signal TX_BUSY_HSSL                 : std_logic;
-- RX
signal LANE_RX0N                    : std_logic;
signal LANE_RX0P                    : std_logic;
signal RX_PMA_LL_SLOW_LOCKED_HSSL   : std_logic;
signal RX_PMA_LOSS_OF_SIGNAL_HSSL   : std_logic;
signal RX_BUSY_HSSL                 : std_logic;
signal DATA_RX_HSSL                 : std_logic_vector(C_DATA_WIDTH-1 downto 0);
signal VALID_K_CHARAC_HSSL          : std_logic_vector(C_K_CHAR_WIDTH-1 downto 0);
signal INVALID_CHAR_HSSL            : std_logic_vector(C_K_CHAR_WIDTH-1  downto 0);
signal DISPARITY_ERR_HSSL           : std_logic_vector(C_K_CHAR_WIDTH-1  downto 0);
signal RX_WORD_IS_ALIGNED_HSSL      : std_logic;
signal COMMA_DET_HSSL               : std_logic_vector(C_K_CHAR_WIDTH-1 downto 0);
signal RX_ALIGN_SYNC                : std_logic :='1';

-- inst_ppl_64_init_hssl
signal RECEIVER_DISABLED_PLIF       : std_logic := '1';
signal CDR_PLIF                     : std_logic := '0';
signal TRANSMITTER_DISABLED_PLIF    : std_logic := '1';
signal PLL_PMA_PWR_UP_PLIH          : std_logic;
signal TX_DRIVER_PWRDWN_N_PLIH      : std_logic;
signal PLL_PMA_RST_N_PLIH           : std_logic;
signal TX_RST_N_PLIH                : std_logic;
signal RX_PMA_PWR_UP_PLIH           : std_logic;
signal RX_PMA_RST_N_PLIH            : std_logic;
signal RX_RST_N_PLIH                : std_logic;
signal HSSL_RESET_DONE_PLIH         : std_logic;

-- inst_ppl_64_skip_insertion
signal NEW_DATA_PLCWI               : std_logic                                          := '0';
signal DATA_TX_PLCWI                : std_logic_vector(C_DATA_WIDTH-1 downto 0)         := (others => '0');
signal VALID_K_CHARAC_PLCWI         : std_logic_vector(C_K_CHAR_WIDTH-1 downto 0) := (others => '0');
signal WAIT_SEND_DATA_PLSI          : std_logic;
signal DATA_TX_PLSI                  : std_logic_vector(C_DATA_WIDTH-1 downto 0);
signal VALID_K_CHARAC_PLSI           : std_logic_vector(C_K_CHAR_WIDTH-1 downto 0);

-- inst_ppl_64_rx_sync_fsm
signal LANE_RESET_DL                : std_logic := '0';
signal DATA_RX_PLRSF                : std_logic_vector(C_DATA_WIDTH-1 downto 0);
signal VALID_K_CHARAC_PLRSF         : std_logic_vector(C_K_CHAR_WIDTH-1 downto 0);
signal DATA_RDY_PLRSF               : std_logic;
signal LANE_RESET                   : std_logic:= '0';

-- inst_ppl_64_word_alignment
signal DATA_RX_PLWA                 : std_logic_vector(C_DATA_WIDTH-1 downto 0);
signal VALID_K_CHARAC_PLWA          : std_logic_vector(C_K_CHAR_WIDTH-1 downto 0);
signal DATA_RDY_PLWA                : std_logic;
signal INVALID_CHAR_PLWA            : std_logic_vector(C_K_CHAR_WIDTH-1  downto 0);
signal DISPARITY_ERR_PLWA           : std_logic_vector(C_K_CHAR_WIDTH-1  downto 0);
signal RX_WORD_IS_ALIGNED_PLWA      : std_logic;
signal COMMA_DET_PLWA               : std_logic_vector(C_K_CHAR_WIDTH-1 downto 0);

signal ENABLE_TRANSM_DATA_PLIF      : std_logic                                          :='0';

  -- Clock generation
  constant CLK_SYS_PERIOD     : time := 12.8 ns;
  constant TB_CKREF_IN_PERIOD : time := 6.4 ns;

begin
  ---------------------------------------------------------
  -----                  Assignment                   -----
  ---------------------------------------------------------
  LANE_RX0N       <= LANE_TX0N;
  LANE_RX0P       <= LANE_TX0P ;
  TB_CKREF_IN_N   <= not(TB_CKREF_IN);
  HSSL_CLOCK_I(0) <= CLK_HSSL;
  HSSL_CLOCK_I(1) <= CLK_HSSL;
  HSSL_CLOCK_I(2) <= CLK_HSSL;
  HSSL_CLOCK_I(3) <= CLK_HSSL;
  ---------------------------------------------------------
  -----                  Instantiation                -----
  ---------------------------------------------------------
  inst_SpaceFibre_64b : SpaceFibre_64b
    port map (
      HSSL_CLOCK_I                => HSSL_CLOCK_I,
      RX0N                        => LANE_RX0N,
      RX0P                        => LANE_RX0P,
      RX1N                        => '1',
      RX1P                        => '0',
      RX2N                        => '1',
      RX2P                        => '0',
      RX3N                        => '1',
      RX3P                        => '0',
      TX0N                        => LANE_TX0N,
      TX0P                        => LANE_TX0P,
      TX1N                        => OPEN,
      TX1P                        => OPEN,
      TX2N                        => OPEN,
      TX2P                        => OPEN,
      TX3N                        => OPEN,
      TX3P                        => OPEN,
      CKREFN                      => TB_CKREF_IN_N,
      CKREFP                      => TB_CKREF_IN,
      CLOCK_O                     => CLK_HSSL,
      DYN_CFG_EN_I                => '0',
      DYN_ADDR_I                  => (OTHERS => '0'),
      DYN_CALIBRATION_CS_N_I      => '1',
      DYN_LANE_CS_N_I             => "1111",
      DYN_WDATA_I                 => (OTHERS => '0'),
      DYN_WDATA_SEL_I             => '0',
      DYN_WE_N_I                  => '1',
      PLL_PMA_LOCK_ANALOG         => PLL_PMA_LOCK_ANALOG_HSSL,
      PLL_PMA_PWR_UP_I            => PLL_PMA_PWR_UP_PLIH,
      PLL_PMA_RST_N_I             => PLL_PMA_RST_N_PLIH,
      PLL_LOCK                    => OPEN,
      TX0_BUSY_O                  => TX_BUSY_HSSL,
      TX0_CLK_ENA_I               => '1',
      TX0_CLK_O                   => OPEN,
      TX0_DATA_I                  => DATA_TX_PLSI,
      TX0_CTRL_DRIVER_PWRDWN_N_I  => TX_DRIVER_PWRDWN_N_PLIH,
      TX0_RST_N_I                 => TX_RST_N_PLIH,
      TX0_CTRL_CHAR_IS_K_I        => VALID_K_CHARAC_PLSI,
      RX0_BUSY_O                  => RX_BUSY_HSSL,
      RX0_CTRL_EL_BUFF_STAT_O     => OPEN,
      RX0_CTRL_CHAR_IS_ALIGNED_O  => RX_WORD_IS_ALIGNED_HSSL,
      RX0_CTRL_CHAR_IS_COMMA_O    => COMMA_DET_HSSL,
      RX0_CTRL_CHAR_IS_F_O        => OPEN,
      RX0_CTRL_CHAR_IS_K_O        => VALID_K_CHARAC_HSSL,
      RX0_CTRL_DISP_ERR_O         => DISPARITY_ERR_HSSL,
      RX0_CTRL_NOT_IN_TABLE_O     => INVALID_CHAR_HSSL,
      RX0_CTRL_VALID_REALIGN_O    => OPEN,
      RX0_DATA_O                  => DATA_RX_HSSL,
      RX0_OVS_BIT_SEL_I           => "00",
      RX0_EYE_RST_I               => '0',
      RX0_PMA_LL_FAST_LOCKED_O    => OPEN,
      RX0_PMA_LL_SLOW_LOCKED_O    => RX_PMA_LL_SLOW_LOCKED_HSSL,
      RX0_PMA_LOSS_OF_SIGNAL_O    => RX_PMA_LOSS_OF_SIGNAL_HSSL,
      RX0_PMA_PLL_LOCK_O          => OPEN,
      RX0_PMA_PLL_LOCK_TRACK_O    => OPEN,
      RX0_PMA_RST_N_I             => RX_PMA_RST_N_PLIH,
      RX0_PMA_PWR_UP_I            => RX_PMA_PWR_UP_PLIH,
      RX0_RST_N_I                 => RX_RST_N_PLIH,
      RX0_TEST_O                  => OPEN,
      RX0_REPLACE_EN_I            => '0',
      RX0_ALIGN_SYNC_I            => RX_ALIGN_SYNC,
      RX0_EL_BUFF_RST_I           => '0'
    );
  inst_ppl_64_init_hssl: ppl_64_init_hssl
    port map (
      RST_N                      => RST_N,
      CLK                        => CLK_SYS,
      RECEIVER_DISABLED_PLIF     => RECEIVER_DISABLED_PLIF,
      CDR_PLIF                   => CDR_PLIF,
      TRANSMITTER_DISABLED_PLIF  => TRANSMITTER_DISABLED_PLIF,
      PLL_PMA_PWR_UP_PLIH        => PLL_PMA_PWR_UP_PLIH,
      TX_DRIVER_PWRDWN_N_PLIH    => TX_DRIVER_PWRDWN_N_PLIH,
      PLL_PMA_RST_N_PLIH         => PLL_PMA_RST_N_PLIH,
      PLL_PMA_LOCK_ANALOG_HSSL   => PLL_PMA_LOCK_ANALOG_HSSL,
      TX_RST_N_PLIH              => TX_RST_N_PLIH,
      TX_BUSY_HSSL               => TX_BUSY_HSSL,
      RX_PMA_PWR_UP_PLIH         => RX_PMA_PWR_UP_PLIH,
      RX_PMA_RST_N_PLIH          => RX_PMA_RST_N_PLIH,
      RX_PMA_LL_SLOW_LOCKED_HSSL => RX_PMA_LL_SLOW_LOCKED_HSSL,
      RX_RST_N_PLIH              => RX_RST_N_PLIH,
      RX_BUSY_HSSL               => RX_BUSY_HSSL,
      HSSL_RESET_DONE_PLIH       => HSSL_RESET_DONE_PLIH
    );
  inst_ppl_64_skip_insertion: ppl_64_skip_insertion
    port map (
      RST_N                   => RST_N,
      CLK                     => CLK_HSSL,
      NEW_DATA_PLCWI          => NEW_DATA_PLCWI,
      DATA_TX_PLCWI           => DATA_TX_PLCWI,
      VALID_K_CHARAC_PLCWI    => VALID_K_CHARAC_PLCWI,
      WAIT_SEND_DATA_PLSI      => WAIT_SEND_DATA_PLSI,
      DATA_TX_PLSI             => DATA_TX_PLSI,
      VALID_K_CHARAC_PLSI      => VALID_K_CHARAC_PLSI,
      ENABLE_TRANSM_DATA_PLIF => ENABLE_TRANSM_DATA_PLIF
    );

  inst_ppl_64_rx_sync_fsm : ppl_64_rx_sync_fsm
   port map(
      RST_N                   => RST_N,
      CLK                     => CLK_HSSL,
      LANE_RESET_DL           => LANE_RESET_DL,
      DATA_RX_PLRSF           => DATA_RX_PLRSF,
      VALID_K_CHARAC_PLRSF    => VALID_K_CHARAC_PLRSF,
      DATA_RDY_PLRSF          => DATA_RDY_PLRSF,
      DATA_RX_PLWA            => DATA_RX_PLWA,
      VALID_K_CHARAC_PLWA     => VALID_K_CHARAC_PLWA,
      INVALID_CHAR_PLWA       => INVALID_CHAR_PLWA,
      DISPARITY_ERR_PLWA      => DISPARITY_ERR_PLWA,
      RX_WORD_IS_ALIGNED_PLWA => RX_WORD_IS_ALIGNED_PLWA,
      COMMA_DET_PLWA          => COMMA_DET_PLWA,
      LANE_RESET              => LANE_RESET
    );

  inst_ppl_64_word_alignment : ppl_64_word_alignment
    port map(
      RST_N                   => RST_N,
      CLK                     => CLK_HSSL,
      DATA_RX_PLWA            => DATA_RX_PLWA,
      VALID_K_CHARAC_PLWA     => VALID_K_CHARAC_PLWA,
      DATA_RDY_PLWA           => DATA_RDY_PLWA,
      INVALID_CHAR_PLWA       => INVALID_CHAR_PLWA,
      DISPARITY_ERR_PLWA      => DISPARITY_ERR_PLWA,
      RX_WORD_IS_ALIGNED_PLWA => RX_WORD_IS_ALIGNED_PLWA,
      COMMA_DET_PLWA          => COMMA_DET_PLWA,
      DATA_RX_HSSL            => DATA_RX_HSSL,
      VALID_K_CHARAC_HSSL     => VALID_K_CHARAC_HSSL,
      INVALID_CHAR_HSSL       => INVALID_CHAR_HSSL,
      DISPARITY_ERR_HSSL      => DISPARITY_ERR_HSSL,
      RX_WORD_IS_ALIGNED_HSSL => RX_WORD_IS_ALIGNED_HSSL,
      COMMA_DET_HSSL          => COMMA_DET_HSSL
    );
  ---------------------------------------------------------
  -----                     Process                   -----
  ---------------------------------------------------------
  tb_ckref_in_process: process
  begin
    while true loop
      TB_CKREF_IN <= '0';
      wait for TB_CKREF_IN_PERIOD / 2;
      TB_CKREF_IN <= '1';
      wait for TB_CKREF_IN_PERIOD / 2;
    end loop;
  end process;

    clk_sys_process: process
  begin
    while true loop
      CLK_SYS <= '0';
      wait for CLK_SYS_PERIOD / 2;
      CLK_SYS <= '1';
      wait for CLK_SYS_PERIOD / 2;
    end loop;
  end process;

  -- Stimulus process
  stim_proc: process
    variable test_failed : boolean := false;
  begin
    -- Reset
    RST_N <= '0';
    wait for 20 ns;
    RST_N <= '1';
    NEW_DATA_PLCWI       <= '1';
    DATA_TX_PLCWI        <= C_INIT1_WORD & C_INIT1_WORD;
    VALID_K_CHARAC_PLCWI <= x"11";
    --                     INIT PROCEDURE                     --
    wait until HSSL_RESET_DONE_PLIH = '1';
    wait until rising_edge(CLK_HSSL);
    wait until rising_edge(CLK_HSSL);
    ENABLE_TRANSM_DATA_PLIF <='1';
    wait until rising_edge(CLK_HSSL);
    for i in 0 to 10000 loop

      wait until rising_edge(CLK_HSSL);
    end loop;


    wait;
  end process;
 
end architecture sim;