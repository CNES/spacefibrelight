LIBRARY ieee ;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity tb_fifo_dc_drop_bad_frame is
end entity;

architecture tb of tb_fifo_dc_drop_bad_frame is
      
component FIFO_DC_DROP_BAD_FRAME is
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
        WR_DATA_EN              : in  std_logic; 


        ------------------
        -- MODIF
        ------------------  
        -- Frame control port
        FRAME_ERROR              : in std_logic;                                 -- Valid received data
        END_FRAME                : in std_logic;                                 -- End of frame
        ------------------

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


----------------------------- Stimulus signals
constant periode                       : time := 6.667 ns;
constant C_AWIDTH                      : integer := 10;
constant C_DWIDTH                      : integer := 36;

signal RST_N                           : std_logic := '0';
signal CLK                             : std_logic := '0';

signal out_bufg_gt_clk                 : std_logic := '0';

signal RST                             : std_logic := '0';
signal FIFO_READ_0_empty               : std_logic := '0';
signal FIFO_READ_0_rd_data             : std_logic_vector(35 downto 00) := (others => '0');
signal FIFO_READ_0_rd_en               : std_logic := '0';
signal FIFO_WRITE_0_full               : std_logic := '0';
signal FIFO_WRITE_0_wr_data            : std_logic_vector(35 downto 00) := (others => '0');
signal FIFO_WRITE_0_wr_en              : std_logic := '0';


signal RD_DATA_VLD                     : std_logic := '0';
signal STATUS_BUSY_FLUSH               : std_logic := '0';

signal STATUS_THRESHOLD_HIGH           : std_logic := '0';
signal STATUS_THRESHOLD_LOW            : std_logic := '0';
signal STATUS_FULL                     : std_logic := '0';
signal STATUS_EMPTY                    : std_logic := '0';
signal STATUS_LEVEL_WR                 : std_logic_vector(C_AWIDTH-1 downto 0) := (others => '0');
signal STATUS_LEVEL_RD                 : std_logic_vector(C_AWIDTH-1 downto 0) := (others => '0');

------------------
-- MODIF
------------------
signal s_valid_data                     : std_logic := '0';
signal s_end_frame                      : std_logic := '0';
signal s_frame_error                    : std_logic := '0';
------------------

begin

RST           <= not RST_N;
s_frame_error <= not s_valid_data;

DUT_FIFO_DC : FIFO_DC_DROP_BAD_FRAME
   generic map(
        G_DWIDTH                => C_DWIDTH,
        G_AWIDTH                => C_AWIDTH,
        G_THRESHOLD_HIGH        => 2**C_AWIDTH,
        G_THRESHOLD_LOW         => 0
    )
    port map(
        RST_N                   => RST_N,

        -- Writing port
        WR_CLK                  => CLK,
        WR_DATA                 => FIFO_WRITE_0_wr_data,
        WR_DATA_EN              => FIFO_WRITE_0_wr_en,
        
        ------------------
        -- MODIF
        ------------------
        -- Frame control port
        FRAME_ERROR             => s_frame_error,
        END_FRAME               => s_end_frame,
        ------------------
        
        -- Reading port
        RD_CLK                  => CLK,
        RD_DATA                 => FIFO_READ_0_rd_data,
        RD_DATA_EN              => FIFO_READ_0_rd_en,
        RD_DATA_VLD             => RD_DATA_VLD,
        -- Command port
        CMD_FLUSH               => '0',
        STATUS_BUSY_FLUSH       => STATUS_BUSY_FLUSH,
        -- Status port
        STATUS_THRESHOLD_HIGH   => STATUS_THRESHOLD_HIGH,
        STATUS_THRESHOLD_LOW    => STATUS_THRESHOLD_LOW,
        STATUS_FULL             => FIFO_WRITE_0_full,
        STATUS_EMPTY            => FIFO_READ_0_empty,
        STATUS_LEVEL_WR         => STATUS_LEVEL_WR,
        STATUS_LEVEL_RD         => STATUS_LEVEL_RD
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

   RST_N                <= '0';
   wait for 10 us;
   wait until rising_edge(CLK);
   RST_N                <= '1';
   wait for 10 us;
   FIFO_READ_0_rd_en    <= '0';
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_en   <= '1';
   
    ------------------
    -- MODIF
    ------------------
   FIFO_READ_0_rd_en    <= '1';
   
-- Trame 1 : valide
   s_valid_data         <= '1';
   FIFO_WRITE_0_wr_data <= x"1" & x"11111111";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"1" & x"22222222";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"1" & x"33333333";
   s_end_frame          <= '1';
   wait until rising_edge(CLK);
   s_end_frame          <= '0';
   
-- Trame 2 : erreur
   s_valid_data         <= '1';
   FIFO_WRITE_0_wr_data <= x"2" & x"11111111";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"2" & x"22222222";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"2" & x"22222222";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"2" & x"22222222";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"2" & x"22222222";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"2" & x"22222222";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"2" & x"22222222";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"2" & x"22222222";
   wait until rising_edge(CLK);
   s_valid_data         <= '0';                 
   FIFO_WRITE_0_wr_data <= x"2" & x"33333333";  -- erreur à la fin
   s_end_frame          <= '1';
   wait until rising_edge(CLK);
   s_end_frame          <= '0';

-- Trame 3 : valide 
   s_valid_data         <= '1';
   FIFO_WRITE_0_wr_data <= x"3" & x"11111111";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"3" & x"22222222";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"3" & x"33333333";
   s_end_frame          <= '1';
   wait until rising_edge(CLK);
   s_end_frame          <= '0';
   
-- Trame 4 : erreur
   s_valid_data         <= '0';
   FIFO_WRITE_0_wr_data <= x"4" & x"11111111";  -- erreur au début
   wait until rising_edge(CLK);
   s_valid_data         <= '1';
   FIFO_WRITE_0_wr_data <= x"4" & x"22222222";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"4" & x"33333333";
   s_end_frame          <= '1';
   wait until rising_edge(CLK);
   s_end_frame          <= '0';
   
-- Trame 5 : valide
   s_valid_data         <= '1';
   FIFO_WRITE_0_wr_data <= x"5" & x"11111111";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"5" & x"22222222";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"5" & x"33333333";
   s_end_frame          <= '1';
   wait until rising_edge(CLK);
   s_end_frame          <= '0';
   
-- Trame 6 : erreur
   s_valid_data         <= '1';
   FIFO_WRITE_0_wr_data <= x"6" & x"11111111";
   s_valid_data         <= '0';
   FIFO_WRITE_0_wr_data <= x"6" & x"22222222";  -- erreur au milieu
   wait until rising_edge(CLK);
   s_valid_data         <= '1';
   FIFO_WRITE_0_wr_data <= x"6" & x"33333333";
   s_end_frame          <= '1';
   wait until rising_edge(CLK);
   s_end_frame          <= '0';
   
---- Trame 7 : valide
   s_valid_data         <= '1';
   FIFO_WRITE_0_wr_data <= x"7" & x"11111111";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"7" & x"22222222";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"7" & x"33333333";
   s_end_frame          <= '1';
   wait until rising_edge(CLK);
   s_end_frame          <= '0';

-- Trame 8 : erreur 
   s_valid_data         <= '0';
   FIFO_WRITE_0_wr_data <= x"8" & x"11111111";  -- une seule donnée 
   s_end_frame          <= '1';
   wait until rising_edge(CLK);
   s_end_frame          <= '0';
   
-- Trame 9 : valide 
   s_valid_data         <= '1';
   FIFO_WRITE_0_wr_data <= x"9" & x"11111111";
   s_end_frame          <= '1';
   wait until rising_edge(CLK);
   s_end_frame          <= '0';
   
-- Trame 10 & 11: erreur
   s_valid_data         <= '1';
   FIFO_WRITE_0_wr_data <= x"A" & x"11111111";
   s_valid_data         <= '0';
   FIFO_WRITE_0_wr_data <= x"A" & x"22222222";  -- erreur dans une premiere trame
   wait until rising_edge(CLK);
   s_valid_data         <= '1';
   FIFO_WRITE_0_wr_data <= x"A" & x"33333333";
   s_end_frame          <= '1';
   wait until rising_edge(CLK);
   s_end_frame          <= '0';
   s_valid_data         <= '1';
   FIFO_WRITE_0_wr_data <= x"B" & x"11111111";
   s_valid_data         <= '0';
   FIFO_WRITE_0_wr_data <= x"B" & x"22222222";  -- erreur dans une deuxième trame
   wait until rising_edge(CLK);
   s_valid_data         <= '1';
   FIFO_WRITE_0_wr_data <= x"B" & x"33333333";
   s_end_frame          <= '1';
   wait until rising_edge(CLK);
   s_end_frame          <= '0';
   
-- Trame 12 : valide
   s_valid_data         <= '1';
   FIFO_WRITE_0_wr_data <= x"C" & x"11111111";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"C" & x"22222222";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"C" & x"33333333";
   s_end_frame          <= '1';
   wait until rising_edge(CLK);
   s_end_frame          <= '0';
   
-- Trame 13 : erreurs
   s_valid_data         <= '0';
   FIFO_WRITE_0_wr_data <= x"D" & x"11111111";  -- erreur 1
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"D" & x"22222222";  -- erreur 2
   wait until rising_edge(CLK);
   s_valid_data         <= '1';
   FIFO_WRITE_0_wr_data <= x"D" & x"33333333";
   s_end_frame          <= '1';
   wait until rising_edge(CLK);
   s_end_frame          <= '0';
   
-- Trame 14 : valide
   s_valid_data         <= '1';
   FIFO_WRITE_0_wr_data <= x"E" & x"11111111";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"E" & x"22222222";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"E" & x"33333333";
   s_end_frame          <= '1';
   wait until rising_edge(CLK);
   s_end_frame          <= '0';
   
-- Trame 15 : erreurs
   s_valid_data         <= '0';
   FIFO_WRITE_0_wr_data <= x"F" & x"11111111"; -- erreur 1
   wait until rising_edge(CLK);
   s_valid_data         <= '1';
   FIFO_WRITE_0_wr_data <= x"F" & x"22222222";   
   wait until rising_edge(CLK);
   s_valid_data         <= '0';
   FIFO_WRITE_0_wr_data <= x"F" & x"33333333";  -- erreur 2 
   s_end_frame          <= '1';
   wait until rising_edge(CLK);
   s_end_frame          <= '0';
   
-- Trame 16 : valide
   s_valid_data         <= '1';
   FIFO_WRITE_0_wr_data <= x"0" & x"11111111";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"0" & x"22222222";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"0" & x"33333333";
   s_end_frame          <= '1';
   wait until rising_edge(CLK);
   s_end_frame          <= '0';
   
-- Trame 17 : valide
   s_valid_data         <= '1';
   FIFO_WRITE_0_wr_data <= x"0" & x"11111111";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"0" & x"22222222";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"0" & x"33333333";
   s_end_frame          <= '1';
   wait until rising_edge(CLK);
   s_end_frame          <= '0';
   
   FIFO_WRITE_0_wr_en   <= '0';
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   --FIFO_READ_0_rd_en <= '1';
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   --FIFO_READ_0_rd_en <= '0';

   wait;   
end process;

end tb;