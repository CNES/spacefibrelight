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
-- Author(s) : Y. DAURIAC
--
-- Project : IP SpaceFibreLight
--
-- Creation date : 24/02/2025
--
-- Description : This module describes the Output Broadcast Buffer
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library data_link_lib;
use data_link_lib.data_link_lib.all;

entity data_out_bc_buf is
  port (
    RST_N                 : in  std_logic;                                          --! Global reset (Active-low)
    CLK                   : in  std_logic;                                          --! Global Clock
    -- data_link_reset (DLRE) interface
    LINK_RESET_DLRE        :in  std_logic;                                          --! Link Reset command
    -- AXI-Stream interface
    S_AXIS_ARSTN_NW	      : in std_logic;                                           --! Active-low asynchronous reset for the AXI-Stream interface
		S_AXIS_ACLK_NW	      : in std_logic;                                           --! Clock signal for the AXI-Stream interface
		S_AXIS_TREADY_DL      : out std_logic;                                          --! Indicates that TDATA, TUSER, and TLAST are valid
		S_AXIS_TDATA_NW       : in std_logic_vector(C_DATA_LENGTH-1 downto 0);          --! AXI-Stream data bus
		S_AXIS_TUSER_NW       : in std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);  --! Indicates the end of a data packet
		S_AXIS_TLAST_NW       : in std_logic;                                           --! Receiver ready signal (slave is ready to accept data)
		S_AXIS_TVALID_NW      : in std_logic;                                           --! AXI-Stream user-defined sideband signal
    -- data_mac (DMAC) interface
    VC_READY_DOBUF        : out  std_logic;                                          --! Virtual Channel ready flag
    DATA_DOBUF            : out  std_logic_vector(C_DATA_LENGTH-1 downto 0);         --! Data parallel to data_mac
    VALID_K_CHARAC_DOBUF  : out  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0); --! K character valid in the 32-bit DATA_DOBUF vector
    DATA_VALID_DOBUF      : out  std_logic;                                          --! Data valid flag associated with DATA_DOBUF
    END_PACKET_DOBUF      : out  std_logic;                                          --! End packet flag
    VC_RD_EN_DMAC         : in   std_logic                                           --! Read command from data_mac
  );
end data_out_bc_buf;

architecture rtl of data_out_bc_buf is
---------------------------------------------------------
-----                  Module declaration           -----
---------------------------------------------------------
  component FIFO_DC_AXIS_S is
  	generic (
  		-- Users to add parameters here
      G_DWIDTH                : integer := 36;                                 -- Data bus fifo length
      G_AWIDTH                : integer := 10;                                 -- Address bus fifo length
      G_THRESHOLD_HIGH        : integer := 2**10;                              -- high threshold
      G_THRESHOLD_LOW         : integer := 0;                                  -- low threshold
      -- User parameters ends
      S_AXIS_TDATA_WIDTH	    : integer := 32;                                 -- Data AXIS length
  		S_AXIS_TUSER_WIDTH	    : integer := 4                                   -- User AXIS length
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
      cmd_flush               : in  std_logic;                                 -- Fifo flush
      STATUS_BUSY_FLUSH       : out std_logic;                                 -- Fifo is flushing
      STATUS_THRESHOLD_HIGH   : out std_logic;                                 -- Threshold high reached flag (on WR_CLK)
      STATUS_THRESHOLD_LOW    : out std_logic;                                 -- Threshold low reached flag (on RD_CLK)
      STATUS_FULL             : out std_logic;                                 -- Full fifo flag (on WR_CLK)
      STATUS_EMPTY            : out std_logic;                                 -- Empty fifo flag (on RD_CLK)
      STATUS_LEVEL_WR         : out std_logic_vector(G_AWIDTH-1 downto 0);     -- FIFO fill level (on WR_CLK)
      STATUS_LEVEL_RD         : out std_logic_vector(G_AWIDTH-1 downto 0) ;    -- FIFO fill level (on RD_CLK)
      -- User ports ends
  		-- Do not modify the ports beyond this line
  		-- Ports of Axi SLAVE Bus Interface S00_AXIS
  		S_AXIS_ACLK             : in std_logic;
  		S_AXIS_TREADY         	: out std_logic;
  		S_AXIS_TDATA          	: in std_logic_vector(C_DATA_LENGTH-1 downto 0);
  		S_AXIS_TUSER          	: in std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
  		S_AXIS_TLAST          	: in std_logic;
  		S_AXIS_TVALID         	: in std_logic
  	);
  end component;

---------------------------------------------------------
-----                  Signal declaration           -----
---------------------------------------------------------
  --Fifo signals
  signal rd_data                : std_logic_vector(C_DATA_LENGTH + C_BYTE_BY_WORD_LENGTH-1 downto 0);
  signal rd_data_vld            : std_logic;
  signal status_busy_flush      : std_logic;
  signal status_threshold_high  : std_logic;
  signal status_threshold_low   : std_logic;
  signal status_full            : std_logic;
  signal status_empty           : std_logic;

  -- continuous mode
  signal cmd_flush              : std_logic;
  signal cnt_cmd_flush          : unsigned (1 downto 0);
  signal vc_end_packet          : std_logic;
  signal cnt_word_sent          : unsigned(6-1 downto 0);     -- cnt_word sent, max= 64
      -- Fifo
  signal rst_n_fifo             : std_logic;
begin
---------------------------------------------------------
-----                     Assignements              -----
---------------------------------------------------------

  DATA_DOBUF           <= rd_data(C_DATA_LENGTH-1 downto 0);
  VALID_K_CHARAC_DOBUF <= rd_data(C_DATA_LENGTH+C_BYTE_BY_WORD_LENGTH-1 downto C_DATA_LENGTH);
  DATA_VALID_DOBUF     <= rd_data_vld;
  END_PACKET_DOBUF     <= vc_end_packet and rd_data_vld;

---------------------------------------------------------
-----                     Instantiation             -----
---------------------------------------------------------
  -- FIFO_DC_AXIS_S Instantiation
  ints_fifo_dc_axis_s: FIFO_DC_AXIS_S
  generic map (
    G_DWIDTH              => C_DATA_LENGTH + C_BYTE_BY_WORD_LENGTH,
    G_AWIDTH              => C_OUT_BUF_SIZE,
    G_THRESHOLD_HIGH      => (2**C_OUT_BUF_SIZE)-3,
    G_THRESHOLD_LOW       => 2,
    S_AXIS_TDATA_WIDTH    => C_DATA_LENGTH,
    S_AXIS_TUSER_WIDTH    => C_BYTE_BY_WORD_LENGTH
  )
  port map (
    aresetn               => rst_n_fifo,
    RD_CLK                => CLK,
    RD_DATA               => rd_data,
    RD_DATA_EN            => VC_RD_EN_DMAC,
    RD_DATA_VLD           => rd_data_vld,
    cmd_flush             => cmd_flush,
    STATUS_BUSY_FLUSH     => status_busy_flush,
    STATUS_THRESHOLD_HIGH => status_threshold_high,
    STATUS_THRESHOLD_LOW  => status_threshold_low,
    STATUS_FULL           => status_full,
    STATUS_EMPTY          => status_empty,
    STATUS_LEVEL_WR       => open,
    STATUS_LEVEL_RD       => open,
    S_AXIS_ACLK           => S_AXIS_ACLK_NW,
    S_AXIS_TREADY         => S_AXIS_TREADY_DL,
    S_AXIS_TDATA          => S_AXIS_TDATA_NW,
    S_AXIS_TUSER          => S_AXIS_TUSER_NW,
    S_AXIS_TLAST          => S_AXIS_TLAST_NW,
    S_AXIS_TVALID         => S_AXIS_TVALID_NW
  );
---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_rst_fifo
-- Description: Manages the reset signal of the FiFo
---------------------------------------------------------
p_rst_fifo: process(CLK, RST_N, S_AXIS_ARSTN_NW)
begin
  if RST_N = '0' or  S_AXIS_ARSTN_NW = '0' then
    rst_n_fifo <= '0';
  elsif rising_edge(CLK) then
    rst_n_fifo <= '1';
  end if;
end process p_rst_fifo;
---------------------------------------------------------
-- Process: p_link_reset
-- Description: Flush management on link reset command
---------------------------------------------------------
p_link_reset: process(CLK, RST_N)
begin
  if RST_N = '0' then
    cmd_flush     <= '0';
    cnt_cmd_flush <= (others => '0');
  elsif rising_edge(CLK) then
    if (cnt_cmd_flush > 2) then
      cmd_flush     <= '0';
      cnt_cmd_flush <= (others => '0');
    elsif LINK_RESET_DLRE = '1' then
      cnt_cmd_flush <= cnt_cmd_flush + 1;
      cmd_flush     <= '1';
    elsif cmd_flush = '1' then
      cnt_cmd_flush <= cnt_cmd_flush + 1;
    else
      cmd_flush     <='0';
      cnt_cmd_flush <= (others => '0');
    end if;
  end if;
end process p_link_reset;
---------------------------------------------------------
-- Process: p_vc_end_packet
-- Description: Manages the end of packet
---------------------------------------------------------
p_vc_end_packet: process(CLK, RST_N)
begin
  if RST_N = '0' then
    vc_end_packet <= '0';
  elsif rising_edge(CLK) then
    if LINK_RESET_DLRE = '1' then
      vc_end_packet <= '0';
    elsif rd_data_vld = '1' and vc_end_packet ='1' then
      vc_end_packet <= '0';
    elsif rd_data_vld = '1' then
      vc_end_packet <= '1';
    end if;
  end if;
end process p_vc_end_packet;
---------------------------------------------------------
-- Process: p_vc_ready
-- Description: Manages the virtual channel ready signal
---------------------------------------------------------
  p_vc_ready: process(CLK, RST_N)
  begin
    if RST_N = '0' then
      VC_READY_DOBUF <= '0';
    elsif rising_edge(CLK) then
      if status_empty = '0' then
        VC_READY_DOBUF <= '1';
      else
        VC_READY_DOBUF <= '0';
      end if;
    end if;
  end process p_vc_ready;
end architecture rtl;