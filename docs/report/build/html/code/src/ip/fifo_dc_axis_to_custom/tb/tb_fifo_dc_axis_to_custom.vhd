----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.02.2025 10:27:26
-- Design Name: 
-- Module Name: fifo_dc_axis_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_fifo_dc_axis_to_custom is
end tb_fifo_dc_axis_to_custom;

architecture Behavioral of tb_fifo_dc_axis_to_custom is

component FIFO_DC_AXIS_S is
	generic (
		-- Users to add parameters here
        G_DWIDTH                : integer := 36;                                 -- Data bus fifo length
        G_AWIDTH                : integer := 10;                                 -- Address bus fifo length
        G_THRESHOLD_HIGH        : integer := 2**10;                              -- high threshold
        G_THRESHOLD_LOW         : integer := 0;                                 -- low threshold
	    S_AXIS_TDATA_WIDTH	    : integer	:= 32;
		S_AXIS_TUSER_WIDTH	    : integer	:= 4
	);
	port (
		-- Users to add ports here
		aresetn      	        : in std_logic;
		-- Custom interface master (rd)
		RD_CLK                  : in  std_logic;                                -- Clock
        RD_DATA                 : out std_logic_vector(G_DWIDTH-1 downto 0);    -- Data read bus
        RD_DATA_EN              : in  std_logic;                                -- Read command
        RD_DATA_VLD             : out std_logic;                                -- Data valid		
		-- STATUS FIFO
        CMD_FLUSH               : in  std_logic;                                -- fifo flush
        STATUS_BUSY_FLUSH       : out std_logic;                                -- fifo is flushing
        STATUS_THRESHOLD_HIGH   : out std_logic;                                -- threshold high reached flag (sur WR_CLK)
        STATUS_THRESHOLD_LOW    : out std_logic;                                -- threshold low reached flag (sur RD_CLK)
        STATUS_FULL             : out std_logic;                                -- full fifo flag (sur WR_CLK)
        STATUS_EMPTY            : out std_logic;                                -- empty fifo flag (sur RD_CLK)
        STATUS_LEVEL_WR         : out std_logic_vector(G_AWIDTH-1 downto 0);    -- Niveau de remplissage de la FIFO (sur WR_CLK)
        STATUS_LEVEL_RD         : out std_logic_vector(G_AWIDTH-1 downto 0) ;   -- Niveau de remplissage de la FIFO (sur RD_CLK)
		-- Ports of Axi SLAVE Bus Interface S00_AXIS
		S_AXIS_ACLK	            : in std_logic;
		S_AXIS_TREADY       	: out std_logic;
		S_AXIS_TDATA        	: in std_logic_vector(S_AXIS_TDATA_WIDTH-1 downto 0);
		S_AXIS_TUSER        	: in std_logic_vector(S_AXIS_TUSER_WIDTH-1 downto 0);
		S_AXIS_TLAST        	: in std_logic;
		S_AXIS_TVALID       	: in std_logic
		-- User ports ends
	);
end component FIFO_DC_AXIS_S;

signal rst_n        : std_logic := '0';
signal CLK          : std_logic := '0';
signal s_data_wr    : std_logic_vector(31 downto 0):=(others =>'0');
signal s_last_wr    : std_logic := '0';
signal s_valid_wr   : std_logic := '0';
signal s_rd_data_en : std_logic := '0';
signal s_user_wr    : std_logic_vector(3 downto 0);

constant periode              : time := 6.667 ns;
constant C_AWIDTH             : integer := 10;
constant C_DWIDTH             : integer := 36;
constant C_S_AXIS_TDATA_WIDTH : integer := 32;
constant C_S_AXIS_TUSER_WIDTH : integer := 4;

begin

FIFO_DC_AXIS_S_inst: FIFO_DC_AXIS_S 
	generic map(
        G_DWIDTH           => C_DWIDTH,              
        G_AWIDTH           => C_AWIDTH,          
        G_THRESHOLD_HIGH   => 2**C_AWIDTH,  
        G_THRESHOLD_LOW    => 0, 
        S_AXIS_TDATA_WIDTH => C_S_AXIS_TDATA_WIDTH, 
        S_AXIS_TUSER_WIDTH => C_S_AXIS_TUSER_WIDTH
	)
	port map(
		aresetn      	        => rst_n,
		RD_CLK                  => CLK,
		RD_DATA                 => open,    
        RD_DATA_EN              => s_rd_data_en,    
        RD_DATA_VLD             => open,    
        CMD_FLUSH               => '0',               
        STATUS_BUSY_FLUSH       => open,                          
        STATUS_THRESHOLD_HIGH   => open,
        STATUS_THRESHOLD_LOW    => open,   
        STATUS_FULL             => open,   
        STATUS_EMPTY            => open,   
        STATUS_LEVEL_WR         => open,   
        STATUS_LEVEL_RD         => open,   
		S_AXIS_ACLK	            => CLK,
		S_AXIS_TREADY           => open,   
		S_AXIS_TDATA            => s_data_wr,
		S_AXIS_TUSER            => s_user_wr,
		S_AXIS_TLAST            => s_last_wr,
		S_AXIS_TVALID           => s_valid_wr
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
   wait for 10 us;
   wait until rising_edge(CLK);
   rst_n <= '1';
   wait for 20 us;
   s_rd_data_en <= '0';        
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   s_data_wr <= x"23456789"; 
   s_user_wr <= x"1";
   s_valid_wr   <= '1';
   s_last_wr <= '0';
    wait until rising_edge(CLK);
   s_data_wr <= x"23456789";
   s_user_wr <= x"B";
   s_valid_wr   <= '1';
   s_last_wr <= '0';
    wait until rising_edge(CLK);
   s_data_wr <= x"23456789"; 
   s_user_wr <= x"C";
   s_valid_wr   <= '1';
   s_last_wr <= '0';
   wait until rising_edge(CLK);
   s_data_wr <= x"BCDEF123";
   s_user_wr <= x"A";
   s_valid_wr   <= '1';
   s_last_wr <= '1';
   wait until rising_edge(CLK);
   s_last_wr <= '0';
   s_valid_wr   <= '0';     
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   s_rd_data_en <= '1';          
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait;   
end process;


end Behavioral;


