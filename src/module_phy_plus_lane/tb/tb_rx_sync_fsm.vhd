LIBRARY ieee ;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library work;

entity tb_rx_sync_fsm is
end entity;

architecture tb of tb_rx_sync_fsm is

   component rx_sync_fsm is
      port (
         RST_N                            : in  std_logic;                       -- global reset
         CLK                              : in  std_logic;                       -- Main clock 150 MHz versal / 100MHz NanoXplore
         -- FROM Data-link layer
         LANE_RESET_DL                    : in  std_logic;                       -- Lane reset command from Data-Link Layer.
         -- TO lane_ctrl_word_detection
         DATA_RX_TO_LCWD                  : out std_logic_vector(31 downto 00);  -- 
         VALID_K_CHARAC_TO_LCWD            : out std_logic_vector(03 downto 00);  --
         DATA_RDY_TO_LCWD                 : out std_logic;                       -- 
         
         -- FROM MANUFACTURER IP
         DATA_RX_FROM_IP                  : in  std_logic_vector(31 downto 00);  -- 
         VALID_K_CHARAC_FROM_IP            : in  std_logic_vector(03 downto 00);  -- 
         DATA_RDY_FROM_IP                 : in  std_logic;                       --
         INVALID_CHAR_FROM_IP             : in  std_logic_vector(03 downto 00);  --
         DISPARITY_ERR_FROM_IP            : in  std_logic_vector(03 downto 00);  --
         RX_WORD_REALIGN_FROM_IP          : in  std_logic;                       -- 
         COMMA_DET_FROM_IP                : in  std_logic;                       -- Flag indicates that a comma is detected on the word receive
   
         -- PARAMETERS
         LANE_RESET                       : in  std_logic                        -- Asserts or de-asserts LaneReset for the lane
         
      );
   end component;


----------------------------- Stimulus signals
constant periode                        : time := 6.667 ns;

signal RST_N                            : std_logic := '0';
signal CLK                              : std_logic := '0';
-- FROM Data-link layer
signal LANE_RESET_DL                    : std_logic := '0';
-- TO lane_ctrl_word_detection
signal DATA_RX_TO_LCWD                  : std_logic_vector(31 downto 00) := (others => '0');
signal VALID_K_CHARAC_TO_LCWD            : std_logic_vector(03 downto 00) := (others => '0');
signal DATA_RDY_TO_LCWD                 : std_logic := '0';
-- FROM MANUFACTURER IP
signal DATA_RX_FROM_IP                  : std_logic_vector(31 downto 00) := (others => '0');
signal VALID_K_CHARAC_FROM_IP            : std_logic_vector(03 downto 00) := (others => '0');
signal DATA_RDY_FROM_IP                 : std_logic := '0';                     
signal INVALID_CHAR_FROM_IP             : std_logic_vector(03 downto 00) := (others => '0');
signal DISPARITY_ERR_FROM_IP            : std_logic_vector(03 downto 00) := (others => '0');  --
signal RX_WORD_REALIGN_FROM_IP          : std_logic := '0';
signal COMMA_DET_FROM_IP                : std_logic := '0';
-- PARAMETERS
signal LANE_RESET                       : std_logic := '0';

begin

----------------------------- Instanciation 
DUT : rx_sync_fsm
   port map(
      RST_N                            => RST_N,
      CLK                              => CLK,
      -- FROM Data-link layer
      LANE_RESET_DL                    => LANE_RESET_DL,
      -- TO lane_ctrl_word_detection
      DATA_RX_TO_LCWD                  => DATA_RX_TO_LCWD,
      VALID_K_CHARAC_TO_LCWD            => VALID_K_CHARAC_TO_LCWD,
      DATA_RDY_TO_LCWD                 => DATA_RDY_TO_LCWD,
      -- FROM MANUFACTURER IP
      DATA_RX_FROM_IP                  => DATA_RX_FROM_IP,
      VALID_K_CHARAC_FROM_IP            => VALID_K_CHARAC_FROM_IP,
      DATA_RDY_FROM_IP                 => DATA_RDY_FROM_IP,
      INVALID_CHAR_FROM_IP             => INVALID_CHAR_FROM_IP,
      DISPARITY_ERR_FROM_IP            => DISPARITY_ERR_FROM_IP,
      RX_WORD_REALIGN_FROM_IP          => RX_WORD_REALIGN_FROM_IP,
      COMMA_DET_FROM_IP                => COMMA_DET_FROM_IP,
      -- PARAMETERS
      LANE_RESET                       => LANE_RESET
      );


-- generate clock 150 MHz
horloge : process
begin
   CLK   <= not CLK;
   wait for periode/2;
end process;
----------------------------------------------------------------------------
-- Scenario
----------------------------------------------------------------------------
scenario : process
begin

   RST_N <= '0';
   wait for 10 us;
   wait until rising_edge(CLK);
   RST_N <= '1';
   wait for 20 us;
   
   -- Test LOST_SYNC_ST actions on state
   wait for 50 us;

   -- test transition LOST_SYNC_ST to CHECK_SYNC_ST
   wait until rising_edge(CLK);
   COMMA_DET_FROM_IP <= '1';
   wait until rising_edge(CLK);
   COMMA_DET_FROM_IP <= '0';
   wait for 50 us;

   -- test transition CHECK_SYNC_ST to LOST_SYNC_ST (reset soft)
   wait until rising_edge(CLK);
   LANE_RESET  <= '1';
   wait until rising_edge(CLK);
   LANE_RESET  <= '0';

   -- test transition CHECK_SYNC_ST to LOST_SYNC_ST (error x5)
   wait until rising_edge(CLK);
   COMMA_DET_FROM_IP <= '1';
   wait until rising_edge(CLK);
   COMMA_DET_FROM_IP <= '0';
   wait for 50 us;
   wait until rising_edge(CLK);     -- 1st word with error
   DATA_RDY_FROM_IP        <= '1';
   INVALID_CHAR_FROM_IP    <= x"1";
   DATA_RX_FROM_IP         <= x"11223344";
   VALID_K_CHARAC_FROM_IP   <= x"1";
   wait until rising_edge(CLK);     -- 2nd word with errors
   INVALID_CHAR_FROM_IP <= x"F";
   DATA_RX_FROM_IP         <= x"55667788";
   VALID_K_CHARAC_FROM_IP   <= x"2";
   wait until rising_edge(CLK);     -- 3rd word with errors
   DISPARITY_ERR_FROM_IP <= x"F";
   DATA_RX_FROM_IP         <= x"99AABBCC";
   VALID_K_CHARAC_FROM_IP   <= x"3";
   wait until rising_edge(CLK);     -- 4th word with errors
   DISPARITY_ERR_FROM_IP <= x"3";
   DATA_RX_FROM_IP         <= x"DDEEFF00";
   VALID_K_CHARAC_FROM_IP   <= x"4";
   wait until rising_edge(CLK);     -- 5th word with error
   INVALID_CHAR_FROM_IP <= x"1";
   DATA_RX_FROM_IP         <= x"11223344";
   VALID_K_CHARAC_FROM_IP   <= x"5";
   wait until rising_edge(CLK);
   INVALID_CHAR_FROM_IP  <= x"0";
   DISPARITY_ERR_FROM_IP <= x"0";
   DATA_RDY_FROM_IP      <= '0';
   wait for 50 us;

   -- test transition CHECK_SYNC_ST to READY_ST
   wait until rising_edge(CLK);
   COMMA_DET_FROM_IP <= '1';
   wait until rising_edge(CLK);
   COMMA_DET_FROM_IP <= '0';
   wait for 50 us;
   DATA_RDY_FROM_IP     <= '1';
   INVALID_CHAR_FROM_IP <= x"1";
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   INVALID_CHAR_FROM_IP <= x"0";
   wait for 50 us;

   --test transition READY_ST to LOST_SYNC_ST (realign = '1')
   wait until rising_edge(CLK);
   RX_WORD_REALIGN_FROM_IP <= '1';
   wait for 20 us;
   RX_WORD_REALIGN_FROM_IP <= '0';
   DATA_RDY_FROM_IP     <= '0';
   wait for 30 us;

   -- test transition READY_ST to CHECK_SYNC_ST (invalid_symb = '1')
   wait until rising_edge(CLK);
   COMMA_DET_FROM_IP <= '1';
   wait until rising_edge(CLK);
   COMMA_DET_FROM_IP <= '0';
   wait for 50 us;
   DATA_RDY_FROM_IP     <= '1';
   INVALID_CHAR_FROM_IP <= x"1";
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   INVALID_CHAR_FROM_IP <= x"0";
   wait for 50 us;

   wait until rising_edge(CLK);
   INVALID_CHAR_FROM_IP <= x"1";
   wait for 50 us;









   
   
   
   wait;   
end process;

end tb;