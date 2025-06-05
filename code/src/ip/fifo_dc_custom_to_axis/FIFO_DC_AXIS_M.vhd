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
-- Author(s)        :
--
-- Project          :
--
-- Creation Date    :
--
-- Description      : Dual clock FIFO module with AXIS MASTER interface
--                    Custom interface (write) and AXIS Master interface (read)
----------------------------------------------------------------------------

---------------------------------------------------------------------------
-- LIBRARY DECLARATION
---------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

---------------------------------------------------------------------------
-- ENTITY DECLARATION
---------------------------------------------------------------------------
entity FIFO_DC_AXIS_M is
	generic (
		-- Users to add parameters here
        G_DWIDTH                : integer := 36;                                 --! Data bus FIFO length
        G_AWIDTH                : integer := 10;                                 --! Address bus FIFO length
        G_THRESHOLD_HIGH        : integer := 2**10;                              --! High threshold
        G_THRESHOLD_LOW         : integer := 0;                                  --! Low threshold
        -- User parameters ends
        M_AXIS_TDATA_WIDTH      : integer := 32;                                 --! Data AXIS length
		M_AXIS_TUSER_WIDTH      : integer := 4                                   --! User AXIS length
	);
	port (
		-- Users to add ports here
		aresetn      	        : in std_logic;                                  --! Active-low reset
		-- Custom interface (slave)
		WR_CLK                  : in  std_logic;                                --! Clock
        WR_DATA                 : in  std_logic_vector(G_DWIDTH-1 downto 0);    --! Data write bus
        WR_DATA_EN              : in  std_logic;                                --! Write command
		-- FIFO STATUS
        CMD_FLUSH               : in  std_logic;                                --! FIFO flush command
        STATUS_BUSY_FLUSH       : out std_logic;                                --! FIFO is flushing
        STATUS_THRESHOLD_HIGH   : out std_logic;                                --! High threshold reached flag (on WR_CLK)
        STATUS_THRESHOLD_LOW    : out std_logic;                                --! Low threshold reached flag (on RD_CLK)
        STATUS_FULL             : out std_logic;                                --! Full FIFO flag (on WR_CLK)
        STATUS_EMPTY            : out std_logic;                                --! Empty FIFO flag (on RD_CLK)
        STATUS_LEVEL_WR         : out std_logic_vector(G_AWIDTH-1 downto 0);    --! FIFO fill level (on WR_CLK)
        STATUS_LEVEL_RD         : out std_logic_vector(G_AWIDTH-1 downto 0);    --! FIFO fill level (on RD_CLK)
        -- User ports ends
		-- Do not modify the ports beyond this line
		-- Ports of AXI Master Bus Interface M00_AXIS
		M_AXIS_ACLK	            : in std_logic;                                 --! Clock input for the AXI Stream Master interface
		M_AXIS_TVALID	        : out std_logic;                                --! Indicates that the data on M_AXIS_TDATA is valid
		M_AXIS_TDATA	        : out std_logic_vector(M_AXIS_TDATA_WIDTH-1 downto 0); --! Data output bus for the AXI Stream Master interface
		M_AXIS_TLAST	        : out std_logic;                                --! Indicates the last transfer in a packet
		M_AXIS_TREADY	        : in std_logic;                                 --! Indicates that the receiver is ready to accept data
		M_AXIS_TUSER            : out std_logic_vector(M_AXIS_TUSER_WIDTH-1 downto 0) --! User-defined data output bus for the AXI Stream Master interface
	);
end FIFO_DC_AXIS_M;

---------------------------------------------------------------------------
-- ARCHITECTURE DECLARATION
---------------------------------------------------------------------------
architecture arch_imp of FIFO_DC_AXIS_M is

   ---------------------------------------------------------------------------
   -- COMPONENT DECLARATION
   ---------------------------------------------------------------------------
	component AXIS_MASTER is
		generic (
		G_DWIDTH                : integer := 36;                                -- Data bus length
		M_AXIS_TDATA_WIDTH      : integer := 32;                                -- Data AXIS length
		M_AXIS_TUSER_WIDTH      : integer := 4                                  -- User AXIS length
		);
		port (
		rd_data                 : in std_logic_vector(G_DWIDTH-1 downto 0);    -- Data read bus
		rd_data_vld             : in std_logic;                                 -- Read command
		rd_data_en              : out std_logic;                                -- Data valid
		m00_axis_aclk	        : in std_logic;                                 -- Clock input
		m00_axis_aresetn	    : in std_logic;                                 -- Active-low reset input
		m00_axis_tvalid	        : out std_logic;                                -- Indicates that the data on m00_axis_tdata is valid
		m00_axis_tdata	        : out std_logic_vector(M_AXIS_TDATA_WIDTH-1 downto 0); -- Data output bus for the AXI Stream Master interface
		m00_axis_tlast	        : out std_logic;                                -- Indicates the last transfer in a packet
		m00_axis_tready	        : in std_logic;                                 -- Indicates that the receiver is ready to accept data
		m00_axis_tuser          : out std_logic_vector(M_AXIS_TUSER_WIDTH-1 downto 0) -- User-defined data output bus for the AXI Stream Master interface
		);
	end component AXIS_MASTER;

	component FIFO_DC is
        generic (
        G_DWIDTH                : integer := 36;                                 -- Data bus FIFO length
        G_AWIDTH                : integer := 10;                                 -- Address bus FIFO length
        G_THRESHOLD_HIGH        : integer := 2**10;                              -- High threshold
        G_THRESHOLD_LOW         : integer := 0                                   -- Low threshold
        );
        port (
        RST_N                   : in  std_logic;                                 -- Active-low reset

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
        CMD_FLUSH               : in  std_logic;                                -- FIFO flush command
        STATUS_BUSY_FLUSH       : out std_logic;                                -- FIFO is flushing

        -- Status port
        STATUS_THRESHOLD_HIGH   : out std_logic;                                -- High threshold reached flag (on WR_CLK)
        STATUS_THRESHOLD_LOW    : out std_logic;                                -- Low threshold reached flag (on RD_CLK)
        STATUS_FULL             : out std_logic;                                -- Full FIFO flag (on WR_CLK)
        STATUS_EMPTY            : out std_logic;                                -- Empty FIFO flag (on RD_CLK)
        STATUS_LEVEL_WR         : out std_logic_vector(G_AWIDTH-1 downto 0);    -- FIFO fill level (on WR_CLK)
        STATUS_LEVEL_RD         : out std_logic_vector(G_AWIDTH-1 downto 0)     -- FIFO fill level (on RD_CLK)
        );
    end component FIFO_DC;

   ---------------------------------------------------------------------------
   -- SIGNAL DECLARATION
   ---------------------------------------------------------------------------

   -- FIFO to AXIS Master
    signal rd_data_reg          : std_logic_vector(G_DWIDTH-1 downto 0);     -- Data read bus register
    signal rd_data_vld_reg      : std_logic;                                   -- Data valid register
    signal rd_data_en_reg       : std_logic;                                   -- Read command register

begin

    ---------------------------------------------------------------------------
    -- instantiation
    ---------------------------------------------------------------------------

    -- Instantiation of AXI Bus Interface M00_AXIS
    AXIS_MASTER_inst : AXIS_MASTER
        generic map (
           G_DWIDTH                => G_DWIDTH,
           M_AXIS_TDATA_WIDTH      => M_AXIS_TDATA_WIDTH,
		   M_AXIS_TUSER_WIDTH      => M_AXIS_TUSER_WIDTH
        )
        port map (
            rd_data                => rd_data_reg,
            rd_data_vld            => rd_data_vld_reg,
            rd_data_en             => rd_data_en_reg,
            m00_axis_aclk	       => M_AXIS_ACLK,
            m00_axis_aresetn	   => aresetn,
            m00_axis_tvalid	       => M_AXIS_TVALID,
            m00_axis_tdata	       => M_AXIS_TDATA,
            m00_axis_tlast	       => M_AXIS_TLAST,
            m00_axis_tready	       => M_AXIS_TREADY,
            m00_axis_tuser         => M_AXIS_TUSER
        );

	-- Instantiation of FIFO dual-clock
    fifo_dc_inst : FIFO_DC
        generic map (
            G_DWIDTH              => G_DWIDTH,
            G_AWIDTH              => G_AWIDTH,
            G_THRESHOLD_HIGH      => G_THRESHOLD_HIGH,
            G_THRESHOLD_LOW       => G_THRESHOLD_LOW
        )
        port map (
            RST_N                 => aresetn,
            WR_CLK                => WR_CLK,
            WR_DATA               => WR_DATA,
            WR_DATA_EN            => WR_DATA_EN,
            RD_CLK                => M_AXIS_ACLK,
            RD_DATA               => rd_data_reg,
            RD_DATA_EN            => rd_data_en_reg,
            RD_DATA_VLD           => rd_data_vld_reg,
            CMD_FLUSH             => CMD_FLUSH,
            STATUS_BUSY_FLUSH     => STATUS_BUSY_FLUSH,
            STATUS_THRESHOLD_HIGH => STATUS_THRESHOLD_HIGH,
            STATUS_THRESHOLD_LOW  => STATUS_THRESHOLD_LOW,
            STATUS_FULL           => STATUS_FULL,
            STATUS_EMPTY          => STATUS_EMPTY,
            STATUS_LEVEL_WR       => STATUS_LEVEL_WR,
            STATUS_LEVEL_RD       => STATUS_LEVEL_RD
        );

end arch_imp;
