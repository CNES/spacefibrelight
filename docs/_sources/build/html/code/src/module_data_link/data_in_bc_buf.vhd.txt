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
-- Description : This module describes the Input Broadcast Buffer
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library data_link_lib;
use data_link_lib.data_link_lib.all;

entity data_in_bc_buf is
  port (
    RST_N                  : in  std_logic;                                           --! Global reset (Active-low)
    CLK                    : in  std_logic;                                           --! Global Clock
    -- data_link_reset (DLRE) interface
    LINK_RESET_DLRE        : in  std_logic;                                          --! Link Reset command
    -- AXI-Stream interface
    M_AXIS_ARSTN_NW	       : in  std_logic;                                          --! Active-low asynchronous reset for the AXI-Stream interface
    M_AXIS_ACLK_NW	       : in  std_logic;                                          --! Clock signal for the AXI-Stream interface
    M_AXIS_TVALID_DIBUF	   : out std_logic;                                          --! Indicates that TDATA, TUSER, and TLAST are valid
    M_AXIS_TDATA_DIBUF	   : out std_logic_vector(C_DATA_LENGTH-1 downto 0);         --! AXI-Stream data bus
    M_AXIS_TLAST_DIBUF	   : out std_logic;                                          --! Indicates the end of a data packet
    M_AXIS_TREADY_NW	     : in  std_logic;                                          --! Receiver ready signal (slave is ready to accept data)
    M_AXIS_TUSER_DIBUF     : out std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0); --! AXI-Stream user-defined sideband signal
    -- data_desencapsulation_bc (DDESBC) interface
    DATA_DDESBC            : in  std_logic_vector(C_DATA_K_WIDTH-1 downto 0);        --! Data parallel (K character + DATA) from data_desencapsulation_bc
    DATA_EN_DDESBC         : in  std_logic                                           --! Data valid flag associated with DDESBC
  );
end data_in_bc_buf;

architecture rtl of data_in_bc_buf is
---------------------------------------------------------
-----                  Module declaration           -----
---------------------------------------------------------
   component FIFO_DC_AXIS_M is
    generic (
      -- Users to add parameters here
      G_DWIDTH                 : integer := 36;                                 -- Data bus fifo length
      G_AWIDTH                 : integer := 10;                                 -- Address bus fifo length
      G_THRESHOLD_HIGH         : integer := 2**10;                              -- high threshold
      G_THRESHOLD_LOW          : integer := 0;                                  -- low threshold
      -- User parameters ends
      M_AXIS_TDATA_WIDTH       : integer := 32;                                  -- Data AXIS length
      M_AXIS_TUSER_WIDTH       : integer := 4                                    -- User AXIS length
    );
    port (
      -- Users to add ports here
      aresetn      	          : in std_logic;
      -- Custom interface (slave)
      WR_CLK                  : in  std_logic;                                -- Clock
      WR_DATA                 : in  std_logic_vector(G_DWIDTH-1 downto 0);    -- Data write bus
      WR_DATA_EN              : in  std_logic;                                -- Write command
      -- STATUS FIFO
      CMD_FLUSH               : in  std_logic;                                -- Fifo flush
      STATUS_BUSY_FLUSH       : out std_logic;                                -- Fifo is flushing
      STATUS_THRESHOLD_HIGH   : out std_logic;                                -- Threshold high reached flag (on WR_CLK)
      STATUS_THRESHOLD_LOW    : out std_logic;                                -- Threshold low reached flag (on RD_CLK)
      STATUS_FULL             : out std_logic;                                -- Full fifo flag (on WR_CLK)
      STATUS_EMPTY            : out std_logic;                                -- Empty fifo flag (on RD_CLK)
      STATUS_LEVEL_WR         : out std_logic_vector(G_AWIDTH-1 downto 0);    -- FIFO fill level (on WR_CLK)
      STATUS_LEVEL_RD         : out std_logic_vector(G_AWIDTH-1 downto 0) ;   -- FIFO fill level (on RD_CLK)
      -- User ports ends
      -- Do not modify the ports beyond this line
      -- Ports of Axi Master Bus Interface M00_AXIS
      M_AXIS_ACLK	            : in std_logic;
      M_AXIS_TVALID	          : out std_logic;
      M_AXIS_TDATA	          : out std_logic_vector(M_AXIS_TDATA_WIDTH-1 downto 0);
      M_AXIS_TLAST	          : out std_logic;
      M_AXIS_TREADY	          : in std_logic;
      M_AXIS_TUSER            : out std_logic_vector(M_AXIS_TUSER_WIDTH-1 downto 0)
    );
  end component;

---------------------------------------------------------
-----                  Signal declaration           -----
---------------------------------------------------------
  signal link_reset_cmd         : std_logic;
  signal status_busy_flush      : std_logic;
  signal status_full            : std_logic;
  signal cmd_flush              : std_logic;
  signal last_k_char            : std_logic;
  signal data_in                : std_logic_vector(C_DATA_LENGTH+C_BYTE_BY_WORD_LENGTH-1 downto 0);
  signal data_in_en             : std_logic;
  signal cnt_word_sent          : unsigned (7 downto 0);
  signal cnt_req_fct            : unsigned (2 downto 0);
  -- AXIS Stream
  signal m_axis_tvalid	        : std_logic;
  signal m_axis_tdata	          : std_logic_vector(C_DATA_LENGTH-1 downto 0);
  signal m_axis_tlast	          : std_logic;
  signal m_axis_tready	        : std_logic;
  signal m_axis_tuser           : std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
  -- Fifo
  signal rst_n_fifo             : std_logic;

begin
---------------------------------------------------------
-----                     Instantiation             -----
---------------------------------------------------------
  -- FIFO_DC_AXIS_S Instantiation
  ints_fifo_dc_axis_m : FIFO_DC_AXIS_M
  generic map (
      G_DWIDTH                => C_DATA_LENGTH + C_BYTE_BY_WORD_LENGTH,
      G_AWIDTH                => C_IN_BUF_SIZE,
      M_AXIS_TDATA_WIDTH      => C_DATA_LENGTH,
      M_AXIS_TUSER_WIDTH      => C_BYTE_BY_WORD_LENGTH
  )
  port map (
      aresetn                => rst_n_fifo,
      WR_CLK                 => CLK,
      WR_DATA                => DATA_DDESBC,
      WR_DATA_EN             => DATA_EN_DDESBC,
      CMD_FLUSH              => cmd_flush,
      STATUS_BUSY_FLUSH      => status_busy_flush,
      STATUS_THRESHOLD_HIGH  => open,
      STATUS_THRESHOLD_LOW   => open,
      STATUS_FULL            => status_full,
      STATUS_EMPTY           => open,
      STATUS_LEVEL_WR        => open,
      STATUS_LEVEL_RD        => open,
      M_AXIS_ACLK            => M_AXIS_ACLK_NW,
      M_AXIS_TVALID          => M_AXIS_TVALID_DIBUF,
      M_AXIS_TDATA           => M_AXIS_TDATA_DIBUF,
      M_AXIS_TLAST           => M_AXIS_TLAST_DIBUF,
      M_AXIS_TREADY          => M_AXIS_TREADY_NW,
      M_AXIS_TUSER           => M_AXIS_TUSER_DIBUF
  );

---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_rst_fifo
-- Description: Manages the reset signal of the FiFo
---------------------------------------------------------
p_rst_fifo: process(M_AXIS_ACLK_NW, RST_N, M_AXIS_ARSTN_NW)
begin
  if RST_N = '0' or M_AXIS_ARSTN_NW = '0' then
    rst_n_fifo <= '0';
  elsif rising_edge(M_AXIS_ACLK_NW) then
    rst_n_fifo <= '1';
  end if;
end process p_rst_fifo;
---------------------------------------------------------
-- Process: p_link_reset
-- Description: Flush command management
---------------------------------------------------------
p_link_reset: process(CLK, RST_N)
begin
  if RST_N = '0' then
    cmd_flush <= '0';
  elsif rising_edge(CLK) then
    if LINK_RESET_DLRE = '1' then
      cmd_flush <='1';
    else
      cmd_flush <='0';
    end if;
  end if;
end process p_link_reset;

end architecture rtl;