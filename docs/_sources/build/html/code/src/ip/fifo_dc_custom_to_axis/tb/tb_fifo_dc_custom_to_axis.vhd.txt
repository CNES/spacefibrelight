----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.02.2025 10:27:26
-- Module Name: fifo_dc_custom_to_axis_tbfifo_dc_custom_to_axis_tb - Behavioral
-- 
-- Revision:
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_fifo_dc_custom_to_axis is
end tb_fifo_dc_custom_to_axis;

architecture Behavioral of tb_fifo_dc_custom_to_axis is

component FIFO_DC_AXIS_M is
	generic (
		-- Users to add parameters here
        G_DWIDTH                : integer := 36;                                 -- Data bus fifo length
        G_AWIDTH                : integer := 10;                                 -- Address bus fifo length
        G_THRESHOLD_HIGH        : integer := 2**10;                              -- high threshold
        G_THRESHOLD_LOW         : integer := 0    ;                             -- low threshold
		-- User parameters ends
		M_AXIS_TDATA_WIDTH      : integer   := 32;
		M_AXIS_TUSER_WIDTH      : integer := 4
	);
	port (
		-- Users to add ports here
		aresetn      	        : in std_logic;
		WR_CLK                  : in  std_logic;                                -- Clock
        WR_DATA                 : in  std_logic_vector(G_DWIDTH-1 downto 0);    -- Data write bus
        WR_DATA_EN              : in  std_logic;                                -- Write command
		-- STATUS FIFO
        CMD_FLUSH               : in  std_logic;                                -- fifo flush
        STATUS_BUSY_FLUSH       : out std_logic;                                -- fifo is flushing
        STATUS_THRESHOLD_HIGH   : out std_logic;                                -- threshold high reached flag (sur WR_CLK)
        STATUS_THRESHOLD_LOW    : out std_logic;                                -- threshold low reached flag (sur RD_CLK)
        STATUS_FULL             : out std_logic;                                -- full fifo flag (sur WR_CLK)
        STATUS_EMPTY            : out std_logic;                                -- empty fifo flag (sur RD_CLK)
        STATUS_LEVEL_WR         : out std_logic_vector(G_AWIDTH-1 downto 0);    -- Niveau de remplissage de la FIFO (sur WR_CLK)
        STATUS_LEVEL_RD         : out std_logic_vector(G_AWIDTH-1 downto 0) ;   -- Niveau de remplissage de la FIFO (sur RD_CLK)
		-- User ports ends
		-- Do not modify the ports beyond this line
		-- Ports of Axi Master Bus Interface M00_AXIS
		M_AXIS_ACLK	            : in std_logic;
		M_AXIS_TVALID	        : out std_logic;
		M_AXIS_TDATA	        : out std_logic_vector(M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TLAST	        : out std_logic;
		M_AXIS_TREADY	        : in std_logic;
		M_AXIS_TUSER            : out std_logic_vector(M_AXIS_TUSER_WIDTH-1 downto 0)

	);
end component FIFO_DC_AXIS_M;

signal rst_n        : std_logic := '0';
signal m_ready_rd   : std_logic := '0';
signal CLK          : std_logic := '0';
signal s_wr_data    : std_logic_vector(35 downto 00) := (others =>'0');
signal s_wr_data_en : std_logic := '0';

constant periode                        : time := 6.667 ns;
constant C_AWIDTH                       : integer := 10;
constant C_DWIDTH                       : integer := 36;
constant C_M_AXIS_TDATA_WIDTH           : integer := 32;
constant C_M_AXIS_TUSER_WIDTH           : integer := 4;

begin

FIFO_DC_AXIS_M_inst: FIFO_DC_AXIS_M 
	generic map(
        G_DWIDTH             => C_DWIDTH,              
        G_AWIDTH             => C_AWIDTH,          
        G_THRESHOLD_HIGH     => 2**C_AWIDTH,  
        G_THRESHOLD_LOW      => 0, 
        M_AXIS_TDATA_WIDTH   => C_M_AXIS_TDATA_WIDTH,
		M_AXIS_TUSER_WIDTH   => C_M_AXIS_TUSER_WIDTH
	)
	port map(
		aresetn      	     => rst_n,
		WR_CLK               => CLK,
        WR_DATA              => s_wr_data,
        WR_DATA_EN           => s_wr_data_en,
        CMD_FLUSH            => '0',               
        STATUS_BUSY_FLUSH    => open,                          
        STATUS_THRESHOLD_HIGH=> open,
        STATUS_THRESHOLD_LOW => open,   
        STATUS_FULL          => open,   
        STATUS_EMPTY         => open,   
        STATUS_LEVEL_WR      => open,   
        STATUS_LEVEL_RD      => open,   
		M_AXIS_ACLK	         => CLK,
		M_AXIS_TVALID	     => open,   
		M_AXIS_TDATA	     => open,   
		M_AXIS_TUSER	     => open,   
		M_AXIS_TLAST	     => open,   
		M_AXIS_TREADY	     => m_ready_rd
	);

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
   rst_n <= '0';
   wait for 1 us;
   wait until rising_edge(CLK);
   rst_n <= '1';
   wait for 1 us;
   m_ready_rd <= '1';           
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   
   -- Trame 1
   s_wr_data <= x"1" & x"22222222"; 
   s_wr_data_en   <= '1';
   wait until rising_edge(CLK);
   s_wr_data <= x"3" & x"44444444"; 
   wait until rising_edge(CLK); 
   s_wr_data <= x"5" & x"66666666";
   wait until rising_edge(CLK);
   s_wr_data <= x"7" & x"88888888";
   wait until rising_edge(CLK);
   s_wr_data <= x"9" & x"AAAAAAAA";
   wait until rising_edge(CLK);
   s_wr_data <= x"B" & x"CCCCCCCC";
   wait until rising_edge(CLK);
   s_wr_data <= x"D" & x"EEEEEEEE";
   wait until rising_edge(CLK);
   s_wr_data_en   <= '0';   
   
   -- Trame 2
   wait until rising_edge(CLK);
   s_wr_data_en   <= '1';   
   s_wr_data <= x"1" & x"22222222"; 
   wait until rising_edge(CLK);
   s_wr_data <= x"3" & x"44444444"; 
   wait until rising_edge(CLK); 
   s_wr_data <= x"5" & x"66666666";
   wait until rising_edge(CLK);
   s_wr_data <= x"7" & x"88888888";
   wait until rising_edge(CLK);
   s_wr_data <= x"9" & x"AAAAAAAA";
   wait until rising_edge(CLK);
   s_wr_data <= x"B" & x"CCCCCCCC";
   wait until rising_edge(CLK);
   s_wr_data <= x"D" & x"EEEEEEEE";
   wait until rising_edge(CLK);
   s_wr_data <= x"1" & x"22222222"; 
   wait until rising_edge(CLK);
   s_wr_data <= x"3" & x"44444444"; 
   wait until rising_edge(CLK); 
   s_wr_data <= x"5" & x"66666666";
   wait until rising_edge(CLK);
   s_wr_data <= x"7" & x"88888888";
   wait until rising_edge(CLK);
   s_wr_data <= x"9" & x"AAAAAAAA";
   wait until rising_edge(CLK);
   s_wr_data <= x"B" & x"CCCCCCCC";
   wait until rising_edge(CLK);
   s_wr_data <= x"D" & x"EEEEEEEE";
   wait until rising_edge(CLK);
   s_wr_data_en   <= '0';  
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   
   -- Trame 3 arrive alors que ready à 0
   s_wr_data_en   <= '1';   
   s_wr_data <= x"1" & x"22222222"; 
   wait until rising_edge(CLK);
   s_wr_data <= x"3" & x"44444444"; 
   wait until rising_edge(CLK); 
   s_wr_data <= x"5" & x"66666666";
   wait until rising_edge(CLK);
   s_wr_data <= x"7" & x"88888888";
   m_ready_rd <= '0'; 
   wait until rising_edge(CLK);
   s_wr_data <= x"9" & x"AAAAAAAA";
   wait until rising_edge(CLK);
   s_wr_data <= x"B" & x"CCCCCCCC";
   wait until rising_edge(CLK);
   s_wr_data <= x"D" & x"EEEEEEEE";
   wait until rising_edge(CLK);
   s_wr_data_en   <= '0';  
   m_ready_rd <= '1'; 
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   
   -- Trame 4 : ready passe à 0 en même temps que rd_data_vld à 1
   s_wr_data_en   <= '1';   
   s_wr_data <= x"1" & x"22222222"; 
   wait until rising_edge(CLK);
   s_wr_data <= x"3" & x"44444444"; 
   wait until rising_edge(CLK); 
   s_wr_data <= x"5" & x"66666666";
   wait until rising_edge(CLK);
   s_wr_data <= x"7" & x"88888888";
   wait until rising_edge(CLK);
   s_wr_data <= x"9" & x"AAAAAAAA";
   wait until rising_edge(CLK);
   s_wr_data <= x"B" & x"CCCCCCCC";
   m_ready_rd <= '0'; 
   wait until rising_edge(CLK);
   s_wr_data <= x"D" & x"EEEEEEEE";
   wait until rising_edge(CLK);
   s_wr_data_en   <= '0';  
   m_ready_rd <= '1'; 
   
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   
   -- Trame 5 : ready passe à 0 un cycle après rd_valid à 1
   s_wr_data_en   <= '1';   
   s_wr_data <= x"1" & x"22222222"; 
   wait until rising_edge(CLK);
   s_wr_data <= x"3" & x"44444444"; 
   wait until rising_edge(CLK); 
   s_wr_data <= x"5" & x"66666666";
   wait until rising_edge(CLK);
   s_wr_data <= x"7" & x"88888888";
   wait until rising_edge(CLK);
   s_wr_data <= x"9" & x"AAAAAAAA";
   wait until rising_edge(CLK);
   s_wr_data <= x"B" & x"CCCCCCCC";
   wait until rising_edge(CLK);
   s_wr_data <= x"D" & x"EEEEEEEE";
   m_ready_rd <= '0'; 
   wait until rising_edge(CLK);
   s_wr_data_en   <= '0'; 
   wait until rising_edge(CLK);
   m_ready_rd <= '1'; 
   
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   
   
   -- Trame 6 : ready passe à 0 deux cycle après rd_valid à 1
   s_wr_data_en   <= '1';   
   s_wr_data <= x"1" & x"22222222"; 
   wait until rising_edge(CLK);
   s_wr_data <= x"3" & x"44444444"; 
   wait until rising_edge(CLK); 
   s_wr_data <= x"5" & x"66666666";
   wait until rising_edge(CLK);
   s_wr_data <= x"7" & x"88888888";
   wait until rising_edge(CLK);
   s_wr_data <= x"9" & x"AAAAAAAA";
   wait until rising_edge(CLK);
   s_wr_data <= x"B" & x"CCCCCCCC";
   wait until rising_edge(CLK);
   s_wr_data <= x"D" & x"EEEEEEEE";
   wait until rising_edge(CLK);
   s_wr_data_en   <= '0';  
   m_ready_rd <= '0';  
   wait until rising_edge(CLK); 
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   m_ready_rd <= '1';  
   
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   
    -- Trame 7 : ready passe à 0 en même temps que rd_data_valid (fin de trame) 
   s_wr_data_en   <= '1';   
   s_wr_data <= x"1" & x"22222222"; 
   wait until rising_edge(CLK);
   s_wr_data <= x"3" & x"44444444"; 
   wait until rising_edge(CLK); 
   s_wr_data <= x"5" & x"66666666";
   wait until rising_edge(CLK);
   s_wr_data <= x"7" & x"88888888";
   wait until rising_edge(CLK);
   s_wr_data <= x"9" & x"AAAAAAAA";
   wait until rising_edge(CLK);
   s_wr_data <= x"B" & x"CCCCCCCC";
   wait until rising_edge(CLK);
   s_wr_data <= x"D" & x"EEEEEEEE";
   wait until rising_edge(CLK);
   s_wr_data_en   <= '0';  
   wait until rising_edge(CLK); 
   wait until rising_edge(CLK);
   wait until rising_edge(CLK); 
   wait until rising_edge(CLK); 
   wait until rising_edge(CLK); 
   m_ready_rd <= '0';  
   wait until rising_edge(CLK); 
   wait until rising_edge(CLK);
   m_ready_rd <= '1';  
   
    -- Trame 8 : ready à 0 au moment de tlast et nouvelle trame et ready à 0
   s_wr_data_en   <= '1';   
   s_wr_data <= x"1" & x"22222222"; 
   wait until rising_edge(CLK);
   s_wr_data <= x"3" & x"44444444"; 
   wait until rising_edge(CLK); 
   s_wr_data <= x"5" & x"66666666";
   wait until rising_edge(CLK);
   s_wr_data <= x"7" & x"88888888";
   wait until rising_edge(CLK);
   s_wr_data <= x"9" & x"AAAAAAAA";
   wait until rising_edge(CLK);
   s_wr_data <= x"B" & x"CCCCCCCC";
   wait until rising_edge(CLK);
   s_wr_data <= x"D" & x"EEEEEEEE";
   wait until rising_edge(CLK);
   s_wr_data_en   <= '0';  
   wait until rising_edge(CLK); 
   
   s_wr_data_en   <= '1';   
   s_wr_data <= x"1" & x"22222222"; 
   wait until rising_edge(CLK);
   s_wr_data <= x"3" & x"44444444"; 
   wait until rising_edge(CLK); 
   s_wr_data <= x"5" & x"66666666";
  wait until rising_edge(CLK);
   s_wr_data <= x"7" & x"88888888";
  wait until rising_edge(CLK);
   s_wr_data <= x"9" & x"AAAAAAAA";
   wait until rising_edge(CLK);
   s_wr_data <= x"B" & x"CCCCCCCC";
   m_ready_rd <= '0';  
   wait until rising_edge(CLK);
   s_wr_data <= x"D" & x"EEEEEEEE";
   wait until rising_edge(CLK);
   s_wr_data_en   <= '0';  
   
   wait until rising_edge(CLK);
   wait until rising_edge(CLK); 
   m_ready_rd <= '1';  
   wait until rising_edge(CLK); 
   wait until rising_edge(CLK); 
   m_ready_rd <= '0';  
   wait until rising_edge(CLK);
    
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   m_ready_rd <= '1';  

   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   
    -- Trame 9 : une seule donnée
   s_wr_data_en   <= '1';   
   s_wr_data <= x"1" & x"22222222"; 
   wait until rising_edge(CLK);
   s_wr_data_en   <= '0';  
   wait until rising_edge(CLK); 
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK); 
   m_ready_rd <= '0'; 
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   m_ready_rd <= '1';  
   
   
   wait;   
end process;

end Behavioral;


