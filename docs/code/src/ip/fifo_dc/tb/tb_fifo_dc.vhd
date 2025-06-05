LIBRARY ieee ;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity tb_fifo_dc is
end entity;

architecture tb of tb_fifo_dc is
      
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


----------------------------- Stimulus signals
constant periode                       : time := 6.667 ns;
constant C_AWIDTH                       : integer := 10;
constant C_DWIDTH                       : integer := 36;

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

begin


RST   <= not RST_N;

DUT_FIFO_DC : FIFO_DC
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

   RST_N <= '0';
   wait for 10 us;
   wait until rising_edge(CLK);
   RST_N <= '1';
   wait for 20 us;
   FIFO_READ_0_rd_en <= '0';
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"1" & x"23456789";
   FIFO_WRITE_0_wr_en   <= '1';
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"A" & x"BCDEF123";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_en   <= '0';
      wait until rising_edge(CLK);
     wait until rising_edge(CLK);
       wait until rising_edge(CLK);
   FIFO_READ_0_rd_en <= '1';
   wait until rising_edge(CLK);
     wait until rising_edge(CLK);
       wait until rising_edge(CLK);
   --FIFO_READ_0_rd_en <= '0';








   
   
   
   wait;   
end process;

end tb;