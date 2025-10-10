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
--------------------------------------------------------------------------
-- COMPANY       : CNES
--------------------------------------------------------------------------
-- TITLE         : configuration_1_bench.vhd
-- PROJECT       : SPACE FIBRE LIGHT
--------------------------------------------------------------------------
-- AUTHOR        : Thomas Favre Felix
-- CREATED       : 19/03/2025
--------------------------------------------------------------------------
-- DESCRIPTION   : Bench with the DUT and the models lane_
--------------------------------------------------------------------------
-- History       : V1.0: Creation of the file
--------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_model.all;
library data_link_lib;
use data_link_lib.data_link_lib.all;


entity CONFIGURATION_2_BENCH is
    generic(
        G_ADDR_WIDTH        : positive := C_AXI_ADDR_WIDTH;                              -- Generic for AXI address width
        G_DATA_WIDTH        : positive := C_AXI_DATA_WIDTH;                            -- Generic for AXI data width
        G_VC_NUM            : positive := 8;
        G_CHANNEL_NUMBER    : positive := 8;
        G_TARGET_TOP        : string   := "VERSAL"
    );
    port(
        -- Clock and reset
        CLK                   : in std_logic;                                    -- Clock signal
        CLK_HSSL_N             : in std_logic;                                   -- HSSL dedicated clock
        CLK_HSSL_P             : in std_logic;                                   -- HSSL dedicated clock
        RST_N                 : in std_logic;                                    -- Reset active low signal

        ---
        -- Serial Interface
        ---
        TX_POS                : out std_logic;                                  -- Positive LVDS serial data send
        TX_NEG                : out std_logic;                                  -- Negative LVDS serial data send
        RX_POS                : in  std_logic;                                  -- Positive LVDS serial data received
        RX_NEG                : in  std_logic;                                  -- Negative LVDS serial data received

        ---
        -- Discret from Network layer
        ---

        ---
        -- AXI4 Lite slave interface Configurator
        ---
        S_CON_AXI_AWADDR      : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);    -- Write address from master to slave
        S_CON_AXI_AWVALID     : in std_logic;                                    -- Master asserts when write address is valid
        S_CON_AXI_AWREADY     : out std_logic;                                   -- Slave ready to accept write address
        S_CON_AXI_WDATA       : in std_logic_vector(G_DATA_WIDTH-1 downto 0);    -- Write data from master
        S_CON_AXI_WSTRB       : in std_logic_vector(3 downto 0);                 -- Write strobe, indicates active byte lanes
        S_CON_AXI_WVALID      : in std_logic;                                    -- Master asserts when write data is valid
        S_CON_AXI_WREADY      : out std_logic;                                   -- Slave ready to accept write data
        S_CON_AXI_BREADY      : in std_logic;                                    -- Master ready to receive write response
        S_CON_AXI_BRESP       : out std_logic_vector(1 downto 0);                -- Write response from slave (OKAY or ERROR)
        S_CON_AXI_BVALID      : out std_logic;                                   -- Slave asserts when write response is valid
        S_CON_AXI_ARADDR      : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);    -- Read address from master to slave
        S_CON_AXI_ARVALID     : in std_logic;                                    -- Master asserts when read address is valid
        S_CON_AXI_ARREADY     : out std_logic;                                   -- Slave ready to accept read address
        S_CON_AXI_RREADY      : in std_logic;                                    -- Master ready to receive read data
        S_CON_AXI_RDATA       : out std_logic_vector(G_DATA_WIDTH-1 downto 0);   -- Read data from slave to master
        S_CON_AXI_RRESP       : out std_logic_vector(1 downto 0);                -- Read response (OKAY or ERROR)
        S_CON_AXI_RVALID      : out std_logic;                                   -- Slave asserts when read data is valid


        ---
        -- AXI4 Lite slave interface Lane Analyzer
        ---
        S_ANA_LANE_AXI_AWADDR : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);    -- Write address from master to slave
        S_ANA_LANE_AXI_AWVALID: in std_logic;                                    -- Master asserts when write address is valid
        S_ANA_LANE_AXI_AWREADY: out std_logic;                                   -- Slave ready to accept write address
        S_ANA_LANE_AXI_WDATA  : in std_logic_vector(G_DATA_WIDTH-1 downto 0);    -- Write data from master
        S_ANA_LANE_AXI_WSTRB  : in std_logic_vector(3 downto 0);                 -- Write strobe, indicates active byte lanes
        S_ANA_LANE_AXI_WVALID : in std_logic;                                    -- Master asserts when write data is valid
        S_ANA_LANE_AXI_WREADY : out std_logic;                                   -- Slave ready to accept write data
        S_ANA_LANE_AXI_BREADY : in std_logic;                                    -- Master ready to receive write response
        S_ANA_LANE_AXI_BRESP  : out std_logic_vector(1 downto 0);                -- Write response from slave (OKAY or ERROR)
        S_ANA_LANE_AXI_BVALID : out std_logic;                                   -- Slave asserts when write response is valid
        S_ANA_LANE_AXI_ARADDR : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);    -- Read address from master to slave
        S_ANA_LANE_AXI_ARVALID: in std_logic;                                    -- Master asserts when read address is valid
        S_ANA_LANE_AXI_ARREADY: out std_logic;                                   -- Slave ready to accept read address
        S_ANA_LANE_AXI_RREADY : in std_logic;                                    -- Master ready to receive read data
        S_ANA_LANE_AXI_RDATA  : out std_logic_vector(G_DATA_WIDTH-1 downto 0);   -- Read data from slave to master
        S_ANA_LANE_AXI_RRESP  : out std_logic_vector(1 downto 0);                -- Read response (OKAY or ERROR)
        S_ANA_LANE_AXI_RVALID : out std_logic;                                   -- Slave asserts when read data is valid

        ---
        -- AXI4 Lite slave interface Lane Analyzer
        ---
        S_GEN_LANE_AXI_AWADDR : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);    -- Write address from master to slave
        S_GEN_LANE_AXI_AWVALID: in std_logic;                                    -- Master asserts when write address is valid
        S_GEN_LANE_AXI_AWREADY: out std_logic;                                   -- Slave ready to accept write address
        S_GEN_LANE_AXI_WDATA  : in std_logic_vector(G_DATA_WIDTH-1 downto 0);    -- Write data from master
        S_GEN_LANE_AXI_WSTRB  : in std_logic_vector(3 downto 0);                 -- Write strobe, indicates active byte lanes
        S_GEN_LANE_AXI_WVALID : in std_logic;                                    -- Master asserts when write data is valid
        S_GEN_LANE_AXI_WREADY : out std_logic;                                   -- Slave ready to accept write data
        S_GEN_LANE_AXI_BREADY : in std_logic;                                    -- Master ready to receive write response
        S_GEN_LANE_AXI_BRESP  : out std_logic_vector(1 downto 0);                -- Write response from slave (OKAY or ERROR)
        S_GEN_LANE_AXI_BVALID : out std_logic;                                   -- Slave asserts when write response is valid
        S_GEN_LANE_AXI_ARADDR : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);    -- Read address from master to slave
        S_GEN_LANE_AXI_ARVALID: in std_logic;                                    -- Master asserts when read address is valid
        S_GEN_LANE_AXI_ARREADY: out std_logic;                                   -- Slave ready to accept read address
        S_GEN_LANE_AXI_RREADY : in std_logic;                                    -- Master ready to receive read data
        S_GEN_LANE_AXI_RDATA  : out std_logic_vector(G_DATA_WIDTH-1 downto 0);   -- Read data from slave to master
        S_GEN_LANE_AXI_RRESP  : out std_logic_vector(1 downto 0);                -- Read response (OKAY or ERROR)
        S_GEN_LANE_AXI_RVALID : out std_logic;                                   -- Slave asserts when read data is valid
        ---
        -- AXI4 Lite slave interface of all Data Link Analyzer
        ---

        -- AXI4 Lite slave interface for each instance
        S_ANA_0_AXI_AWADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);            -- Write address from master to slave
        S_ANA_0_AXI_AWVALID   : in std_logic;                                            -- Master asserts when write address is valid
        S_ANA_0_AXI_AWREADY   : out std_logic;                                           -- Slave ready to accept write address
        S_ANA_0_AXI_WDATA     : in std_logic_vector(G_DATA_WIDTH-1 downto 0);            -- Write data from master
        S_ANA_0_AXI_WSTRB     : in std_logic_vector(3 downto 0);                         -- Write strobe, indicates active byte data_links
        S_ANA_0_AXI_WVALID    : in std_logic;                                            -- Master asserts when write data is valid
        S_ANA_0_AXI_WREADY    : out std_logic;                                           -- Slave ready to accept write data
        S_ANA_0_AXI_BREADY    : in std_logic;                                            -- Master ready to receive write response
        S_ANA_0_AXI_BRESP     : out std_logic_vector(1 downto 0);                        -- Write response from slave (OKAY or ERROR)
        S_ANA_0_AXI_BVALID    : out std_logic;                                           -- Slave asserts when write response is valid
        S_ANA_0_AXI_ARADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);            -- Read address from master to slave
        S_ANA_0_AXI_ARVALID   : in std_logic;                                            -- Master asserts when read address is valid
        S_ANA_0_AXI_ARREADY   : out std_logic;                                           -- Slave ready to accept read address
        S_ANA_0_AXI_RREADY    : in std_logic;                                            -- Master ready to receive read data
        S_ANA_0_AXI_RDATA     : out std_logic_vector(G_DATA_WIDTH-1 downto 0);           -- Read data from slave to master
        S_ANA_0_AXI_RRESP     : out std_logic_vector(1 downto 0);                        -- Read response (OKAY or ERROR)
        S_ANA_0_AXI_RVALID    : out std_logic;                                           -- Slave asserts when read data is valid

        
        S_ANA_1_AXI_AWADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);            -- Write address from master to slave
        S_ANA_1_AXI_AWVALID   : in std_logic;                                            -- Master asserts when write address is valid
        S_ANA_1_AXI_AWREADY   : out std_logic;                                           -- Slave ready to accept write address
        S_ANA_1_AXI_WDATA     : in std_logic_vector(G_DATA_WIDTH-1 downto 0);            -- Write data from master
        S_ANA_1_AXI_WSTRB     : in std_logic_vector(3 downto 0);                         -- Write strobe, indicates active byte data_links
        S_ANA_1_AXI_WVALID    : in std_logic;                                            -- Master asserts when write data is valid
        S_ANA_1_AXI_WREADY    : out std_logic;                                           -- Slave ready to accept write data
        S_ANA_1_AXI_BREADY    : in std_logic;                                            -- Master ready to receive write response
        S_ANA_1_AXI_BRESP     : out std_logic_vector(1 downto 0);                        -- Write response from slave (OKAY or ERROR)
        S_ANA_1_AXI_BVALID    : out std_logic;                                           -- Slave asserts when write response is valid
        S_ANA_1_AXI_ARADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);            -- Read address from master to slave
        S_ANA_1_AXI_ARVALID   : in std_logic;                                            -- Master asserts when read address is valid
        S_ANA_1_AXI_ARREADY   : out std_logic;                                           -- Slave ready to accept read address
        S_ANA_1_AXI_RREADY    : in std_logic;                                            -- Master ready to receive read data
        S_ANA_1_AXI_RDATA     : out std_logic_vector(G_DATA_WIDTH-1 downto 0);           -- Read data from slave to master
        S_ANA_1_AXI_RRESP     : out std_logic_vector(1 downto 0);                        -- Read response (OKAY or ERROR)
        S_ANA_1_AXI_RVALID    : out std_logic;                                           -- Slave asserts when read data is valid

        
        S_ANA_2_AXI_AWADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);            -- Write address from master to slave
        S_ANA_2_AXI_AWVALID   : in std_logic;                                            -- Master asserts when write address is valid
        S_ANA_2_AXI_AWREADY   : out std_logic;                                           -- Slave ready to accept write address
        S_ANA_2_AXI_WDATA     : in std_logic_vector(G_DATA_WIDTH-1 downto 0);            -- Write data from master
        S_ANA_2_AXI_WSTRB     : in std_logic_vector(3 downto 0);                         -- Write strobe, indicates active byte data_links
        S_ANA_2_AXI_WVALID    : in std_logic;                                            -- Master asserts when write data is valid
        S_ANA_2_AXI_WREADY    : out std_logic;                                           -- Slave ready to accept write data
        S_ANA_2_AXI_BREADY    : in std_logic;                                            -- Master ready to receive write response
        S_ANA_2_AXI_BRESP     : out std_logic_vector(1 downto 0);                        -- Write response from slave (OKAY or ERROR)
        S_ANA_2_AXI_BVALID    : out std_logic;                                           -- Slave asserts when write response is valid
        S_ANA_2_AXI_ARADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);            -- Read address from master to slave
        S_ANA_2_AXI_ARVALID   : in std_logic;                                            -- Master asserts when read address is valid
        S_ANA_2_AXI_ARREADY   : out std_logic;                                           -- Slave ready to accept read address
        S_ANA_2_AXI_RREADY    : in std_logic;                                            -- Master ready to receive read data
        S_ANA_2_AXI_RDATA     : out std_logic_vector(G_DATA_WIDTH-1 downto 0);           -- Read data from slave to master
        S_ANA_2_AXI_RRESP     : out std_logic_vector(1 downto 0);                        -- Read response (OKAY or ERROR)
        S_ANA_2_AXI_RVALID    : out std_logic;                                           -- Slave asserts when read data is valid

        
        S_ANA_3_AXI_AWADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);            -- Write address from master to slave
        S_ANA_3_AXI_AWVALID   : in std_logic;                                            -- Master asserts when write address is valid
        S_ANA_3_AXI_AWREADY   : out std_logic;                                           -- Slave ready to accept write address
        S_ANA_3_AXI_WDATA     : in std_logic_vector(G_DATA_WIDTH-1 downto 0);            -- Write data from master
        S_ANA_3_AXI_WSTRB     : in std_logic_vector(3 downto 0);                         -- Write strobe, indicates active byte data_links
        S_ANA_3_AXI_WVALID    : in std_logic;                                            -- Master asserts when write data is valid
        S_ANA_3_AXI_WREADY    : out std_logic;                                           -- Slave ready to accept write data
        S_ANA_3_AXI_BREADY    : in std_logic;                                            -- Master ready to receive write response
        S_ANA_3_AXI_BRESP     : out std_logic_vector(1 downto 0);                        -- Write response from slave (OKAY or ERROR)
        S_ANA_3_AXI_BVALID    : out std_logic;                                           -- Slave asserts when write response is valid
        S_ANA_3_AXI_ARADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);            -- Read address from master to slave
        S_ANA_3_AXI_ARVALID   : in std_logic;                                            -- Master asserts when read address is valid
        S_ANA_3_AXI_ARREADY   : out std_logic;                                           -- Slave ready to accept read address
        S_ANA_3_AXI_RREADY    : in std_logic;                                            -- Master ready to receive read data
        S_ANA_3_AXI_RDATA     : out std_logic_vector(G_DATA_WIDTH-1 downto 0);           -- Read data from slave to master
        S_ANA_3_AXI_RRESP     : out std_logic_vector(1 downto 0);                        -- Read response (OKAY or ERROR)
        S_ANA_3_AXI_RVALID    : out std_logic;                                           -- Slave asserts when read data is valid

        
        S_ANA_4_AXI_AWADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);            -- Write address from master to slave
        S_ANA_4_AXI_AWVALID   : in std_logic;                                            -- Master asserts when write address is valid
        S_ANA_4_AXI_AWREADY   : out std_logic;                                           -- Slave ready to accept write address
        S_ANA_4_AXI_WDATA     : in std_logic_vector(G_DATA_WIDTH-1 downto 0);            -- Write data from master
        S_ANA_4_AXI_WSTRB     : in std_logic_vector(3 downto 0);                         -- Write strobe, indicates active byte data_links
        S_ANA_4_AXI_WVALID    : in std_logic;                                            -- Master asserts when write data is valid
        S_ANA_4_AXI_WREADY    : out std_logic;                                           -- Slave ready to accept write data
        S_ANA_4_AXI_BREADY    : in std_logic;                                            -- Master ready to receive write response
        S_ANA_4_AXI_BRESP     : out std_logic_vector(1 downto 0);                        -- Write response from slave (OKAY or ERROR)
        S_ANA_4_AXI_BVALID    : out std_logic;                                           -- Slave asserts when write response is valid
        S_ANA_4_AXI_ARADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);            -- Read address from master to slave
        S_ANA_4_AXI_ARVALID   : in std_logic;                                            -- Master asserts when read address is valid
        S_ANA_4_AXI_ARREADY   : out std_logic;                                           -- Slave ready to accept read address
        S_ANA_4_AXI_RREADY    : in std_logic;                                            -- Master ready to receive read data
        S_ANA_4_AXI_RDATA     : out std_logic_vector(G_DATA_WIDTH-1 downto 0);           -- Read data from slave to master
        S_ANA_4_AXI_RRESP     : out std_logic_vector(1 downto 0);                        -- Read response (OKAY or ERROR)
        S_ANA_4_AXI_RVALID    : out std_logic;                                           -- Slave asserts when read data is valid

        
        S_ANA_5_AXI_AWADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);            -- Write address from master to slave
        S_ANA_5_AXI_AWVALID   : in std_logic;                                            -- Master asserts when write address is valid
        S_ANA_5_AXI_AWREADY   : out std_logic;                                           -- Slave ready to accept write address
        S_ANA_5_AXI_WDATA     : in std_logic_vector(G_DATA_WIDTH-1 downto 0);            -- Write data from master
        S_ANA_5_AXI_WSTRB     : in std_logic_vector(3 downto 0);                         -- Write strobe, indicates active byte data_links
        S_ANA_5_AXI_WVALID    : in std_logic;                                            -- Master asserts when write data is valid
        S_ANA_5_AXI_WREADY    : out std_logic;                                           -- Slave ready to accept write data
        S_ANA_5_AXI_BREADY    : in std_logic;                                            -- Master ready to receive write response
        S_ANA_5_AXI_BRESP     : out std_logic_vector(1 downto 0);                        -- Write response from slave (OKAY or ERROR)
        S_ANA_5_AXI_BVALID    : out std_logic;                                           -- Slave asserts when write response is valid
        S_ANA_5_AXI_ARADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);            -- Read address from master to slave
        S_ANA_5_AXI_ARVALID   : in std_logic;                                            -- Master asserts when read address is valid
        S_ANA_5_AXI_ARREADY   : out std_logic;                                           -- Slave ready to accept read address
        S_ANA_5_AXI_RREADY    : in std_logic;                                            -- Master ready to receive read data
        S_ANA_5_AXI_RDATA     : out std_logic_vector(G_DATA_WIDTH-1 downto 0);           -- Read data from slave to master
        S_ANA_5_AXI_RRESP     : out std_logic_vector(1 downto 0);                        -- Read response (OKAY or ERROR)
        S_ANA_5_AXI_RVALID    : out std_logic;                                           -- Slave asserts when read data is valid

        
        S_ANA_6_AXI_AWADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);            -- Write address from master to slave
        S_ANA_6_AXI_AWVALID   : in std_logic;                                            -- Master asserts when write address is valid
        S_ANA_6_AXI_AWREADY   : out std_logic;                                           -- Slave ready to accept write address
        S_ANA_6_AXI_WDATA     : in std_logic_vector(G_DATA_WIDTH-1 downto 0);            -- Write data from master
        S_ANA_6_AXI_WSTRB     : in std_logic_vector(3 downto 0);                         -- Write strobe, indicates active byte data_links
        S_ANA_6_AXI_WVALID    : in std_logic;                                            -- Master asserts when write data is valid
        S_ANA_6_AXI_WREADY    : out std_logic;                                           -- Slave ready to accept write data
        S_ANA_6_AXI_BREADY    : in std_logic;                                            -- Master ready to receive write response
        S_ANA_6_AXI_BRESP     : out std_logic_vector(1 downto 0);                        -- Write response from slave (OKAY or ERROR)
        S_ANA_6_AXI_BVALID    : out std_logic;                                           -- Slave asserts when write response is valid
        S_ANA_6_AXI_ARADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);            -- Read address from master to slave
        S_ANA_6_AXI_ARVALID   : in std_logic;                                            -- Master asserts when read address is valid
        S_ANA_6_AXI_ARREADY   : out std_logic;                                           -- Slave ready to accept read address
        S_ANA_6_AXI_RREADY    : in std_logic;                                            -- Master ready to receive read data
        S_ANA_6_AXI_RDATA     : out std_logic_vector(G_DATA_WIDTH-1 downto 0);           -- Read data from slave to master
        S_ANA_6_AXI_RRESP     : out std_logic_vector(1 downto 0);                        -- Read response (OKAY or ERROR)
        S_ANA_6_AXI_RVALID    : out std_logic;                                           -- Slave asserts when read data is valid

        
        S_ANA_7_AXI_AWADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);            -- Write address from master to slave
        S_ANA_7_AXI_AWVALID   : in std_logic;                                            -- Master asserts when write address is valid
        S_ANA_7_AXI_AWREADY   : out std_logic;                                           -- Slave ready to accept write address
        S_ANA_7_AXI_WDATA     : in std_logic_vector(G_DATA_WIDTH-1 downto 0);            -- Write data from master
        S_ANA_7_AXI_WSTRB     : in std_logic_vector(3 downto 0);                         -- Write strobe, indicates active byte data_links
        S_ANA_7_AXI_WVALID    : in std_logic;                                            -- Master asserts when write data is valid
        S_ANA_7_AXI_WREADY    : out std_logic;                                           -- Slave ready to accept write data
        S_ANA_7_AXI_BREADY    : in std_logic;                                            -- Master ready to receive write response
        S_ANA_7_AXI_BRESP     : out std_logic_vector(1 downto 0);                        -- Write response from slave (OKAY or ERROR)
        S_ANA_7_AXI_BVALID    : out std_logic;                                           -- Slave asserts when write response is valid
        S_ANA_7_AXI_ARADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);            -- Read address from master to slave
        S_ANA_7_AXI_ARVALID   : in std_logic;                                            -- Master asserts when read address is valid
        S_ANA_7_AXI_ARREADY   : out std_logic;                                           -- Slave ready to accept read address
        S_ANA_7_AXI_RREADY    : in std_logic;                                            -- Master ready to receive read data
        S_ANA_7_AXI_RDATA     : out std_logic_vector(G_DATA_WIDTH-1 downto 0);           -- Read data from slave to master
        S_ANA_7_AXI_RRESP     : out std_logic_vector(1 downto 0);                        -- Read response (OKAY or ERROR)
        S_ANA_7_AXI_RVALID    : out std_logic;                                           -- Slave asserts when read data is valid


        S_ANA_8_AXI_AWADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);
        S_ANA_8_AXI_AWVALID   : in std_logic;
        S_ANA_8_AXI_AWREADY   : out std_logic;
        S_ANA_8_AXI_WDATA     : in std_logic_vector(G_DATA_WIDTH-1 downto 0);
        S_ANA_8_AXI_WSTRB     : in std_logic_vector(3 downto 0);
        S_ANA_8_AXI_WVALID    : in std_logic;
        S_ANA_8_AXI_WREADY    : out std_logic;
        S_ANA_8_AXI_BREADY    : in std_logic;
        S_ANA_8_AXI_BRESP     : out std_logic_vector(1 downto 0);
        S_ANA_8_AXI_BVALID    : out std_logic;
        S_ANA_8_AXI_ARADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);
        S_ANA_8_AXI_ARVALID   : in std_logic;
        S_ANA_8_AXI_ARREADY   : out std_logic;
        S_ANA_8_AXI_RREADY    : in std_logic;
        S_ANA_8_AXI_RDATA     : out std_logic_vector(G_DATA_WIDTH-1 downto 0);
        S_ANA_8_AXI_RRESP     : out std_logic_vector(1 downto 0);
        S_ANA_8_AXI_RVALID    : out std_logic;

        ---
        -- AXI4 Lite slave interface of all Data Link Generator
        ---
        -- AXI4 Lite slave interface for each instance
        S_GEN_0_AXI_AWADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);           -- Write address from master to slave
        S_GEN_0_AXI_AWVALID   : in std_logic;                                           -- Master asserts when write address is valid
        S_GEN_0_AXI_AWREADY   : out std_logic;                                          -- Slave ready to accept write address
        S_GEN_0_AXI_WDATA     : in std_logic_vector(G_DATA_WIDTH-1 downto 0);           -- Write data from master
        S_GEN_0_AXI_WSTRB     : in std_logic_vector(3 downto 0);                        -- Write strobe, indicates active byte lanes
        S_GEN_0_AXI_WVALID    : in std_logic;                                           -- Master asserts when write data is valid
        S_GEN_0_AXI_WREADY    : out std_logic;                                          -- Slave ready to accept write data
        S_GEN_0_AXI_BREADY    : in std_logic;                                           -- Master ready to receive write response
        S_GEN_0_AXI_BRESP     : out std_logic_vector(1 downto 0);                       -- Write response from slave (OKAY or ERROR)
        S_GEN_0_AXI_BVALID    : out std_logic;                                          -- Slave asserts when write response is valid
        S_GEN_0_AXI_ARADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);           -- Read address from master to slave
        S_GEN_0_AXI_ARVALID   : in std_logic;                                           -- Master asserts when read address is valid
        S_GEN_0_AXI_ARREADY   : out std_logic;                                          -- Slave ready to accept read address
        S_GEN_0_AXI_RREADY    : in std_logic;                                           -- Master ready to receive read data
        S_GEN_0_AXI_RDATA     : out std_logic_vector(G_DATA_WIDTH-1 downto 0);          -- Read data from slave to master
        S_GEN_0_AXI_RRESP     : out std_logic_vector(1 downto 0);                       -- Read response (OKAY or ERROR)
        S_GEN_0_AXI_RVALID    : out std_logic;                                          -- Slave asserts when read data is valid

        S_GEN_1_AXI_AWADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);           -- Write address from master to slave
        S_GEN_1_AXI_AWVALID   : in std_logic;                                           -- Master asserts when write address is valid
        S_GEN_1_AXI_AWREADY   : out std_logic;                                          -- Slave ready to accept write address
        S_GEN_1_AXI_WDATA     : in std_logic_vector(G_DATA_WIDTH-1 downto 0);           -- Write data from master
        S_GEN_1_AXI_WSTRB     : in std_logic_vector(3 downto 0);                        -- Write strobe, indicates active byte lanes
        S_GEN_1_AXI_WVALID    : in std_logic;                                           -- Master asserts when write data is valid
        S_GEN_1_AXI_WREADY    : out std_logic;                                          -- Slave ready to accept write data
        S_GEN_1_AXI_BREADY    : in std_logic;                                           -- Master ready to receive write response
        S_GEN_1_AXI_BRESP     : out std_logic_vector(1 downto 0);                       -- Write response from slave (OKAY or ERROR)
        S_GEN_1_AXI_BVALID    : out std_logic;                                          -- Slave asserts when write response is valid
        S_GEN_1_AXI_ARADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);           -- Read address from master to slave
        S_GEN_1_AXI_ARVALID   : in std_logic;                                           -- Master asserts when read address is valid
        S_GEN_1_AXI_ARREADY   : out std_logic;                                          -- Slave ready to accept read address
        S_GEN_1_AXI_RREADY    : in std_logic;                                           -- Master ready to receive read data
        S_GEN_1_AXI_RDATA     : out std_logic_vector(G_DATA_WIDTH-1 downto 0);          -- Read data from slave to master
        S_GEN_1_AXI_RRESP     : out std_logic_vector(1 downto 0);                       -- Read response (OKAY or ERROR)
        S_GEN_1_AXI_RVALID    : out std_logic;                                          -- Slave asserts when read data is valid

        S_GEN_2_AXI_AWADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);           -- Write address from master to slave
        S_GEN_2_AXI_AWVALID   : in std_logic;                                           -- Master asserts when write address is valid
        S_GEN_2_AXI_AWREADY   : out std_logic;                                          -- Slave ready to accept write address
        S_GEN_2_AXI_WDATA     : in std_logic_vector(G_DATA_WIDTH-1 downto 0);           -- Write data from master
        S_GEN_2_AXI_WSTRB     : in std_logic_vector(3 downto 0);                        -- Write strobe, indicates active byte lanes
        S_GEN_2_AXI_WVALID    : in std_logic;                                           -- Master asserts when write data is valid
        S_GEN_2_AXI_WREADY    : out std_logic;                                          -- Slave ready to accept write data
        S_GEN_2_AXI_BREADY    : in std_logic;                                           -- Master ready to receive write response
        S_GEN_2_AXI_BRESP     : out std_logic_vector(1 downto 0);                       -- Write response from slave (OKAY or ERROR)
        S_GEN_2_AXI_BVALID    : out std_logic;                                          -- Slave asserts when write response is valid
        S_GEN_2_AXI_ARADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);           -- Read address from master to slave
        S_GEN_2_AXI_ARVALID   : in std_logic;                                           -- Master asserts when read address is valid
        S_GEN_2_AXI_ARREADY   : out std_logic;                                          -- Slave ready to accept read address
        S_GEN_2_AXI_RREADY    : in std_logic;                                           -- Master ready to receive read data
        S_GEN_2_AXI_RDATA     : out std_logic_vector(G_DATA_WIDTH-1 downto 0);          -- Read data from slave to master
        S_GEN_2_AXI_RRESP     : out std_logic_vector(1 downto 0);                       -- Read response (OKAY or ERROR)
        S_GEN_2_AXI_RVALID    : out std_logic;                                          -- Slave asserts when read data is valid

        S_GEN_3_AXI_AWADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);           -- Write address from master to slave
        S_GEN_3_AXI_AWVALID   : in std_logic;                                           -- Master asserts when write address is valid
        S_GEN_3_AXI_AWREADY   : out std_logic;                                          -- Slave ready to accept write address
        S_GEN_3_AXI_WDATA     : in std_logic_vector(G_DATA_WIDTH-1 downto 0);           -- Write data from master
        S_GEN_3_AXI_WSTRB     : in std_logic_vector(3 downto 0);                        -- Write strobe, indicates active byte lanes
        S_GEN_3_AXI_WVALID    : in std_logic;                                           -- Master asserts when write data is valid
        S_GEN_3_AXI_WREADY    : out std_logic;                                          -- Slave ready to accept write data
        S_GEN_3_AXI_BREADY    : in std_logic;                                           -- Master ready to receive write response
        S_GEN_3_AXI_BRESP     : out std_logic_vector(1 downto 0);                       -- Write response from slave (OKAY or ERROR)
        S_GEN_3_AXI_BVALID    : out std_logic;                                          -- Slave asserts when write response is valid
        S_GEN_3_AXI_ARADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);           -- Read address from master to slave
        S_GEN_3_AXI_ARVALID   : in std_logic;                                           -- Master asserts when read address is valid
        S_GEN_3_AXI_ARREADY   : out std_logic;                                          -- Slave ready to accept read address
        S_GEN_3_AXI_RREADY    : in std_logic;                                           -- Master ready to receive read data
        S_GEN_3_AXI_RDATA     : out std_logic_vector(G_DATA_WIDTH-1 downto 0);          -- Read data from slave to master
        S_GEN_3_AXI_RRESP     : out std_logic_vector(1 downto 0);                       -- Read response (OKAY or ERROR)
        S_GEN_3_AXI_RVALID    : out std_logic;                                          -- Slave asserts when read data is valid

        S_GEN_4_AXI_AWADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);           -- Write address from master to slave
        S_GEN_4_AXI_AWVALID   : in std_logic;                                           -- Master asserts when write address is valid
        S_GEN_4_AXI_AWREADY   : out std_logic;                                          -- Slave ready to accept write address
        S_GEN_4_AXI_WDATA     : in std_logic_vector(G_DATA_WIDTH-1 downto 0);           -- Write data from master
        S_GEN_4_AXI_WSTRB     : in std_logic_vector(3 downto 0);                        -- Write strobe, indicates active byte lanes
        S_GEN_4_AXI_WVALID    : in std_logic;                                           -- Master asserts when write data is valid
        S_GEN_4_AXI_WREADY    : out std_logic;                                          -- Slave ready to accept write data
        S_GEN_4_AXI_BREADY    : in std_logic;                                           -- Master ready to receive write response
        S_GEN_4_AXI_BRESP     : out std_logic_vector(1 downto 0);                       -- Write response from slave (OKAY or ERROR)
        S_GEN_4_AXI_BVALID    : out std_logic;                                          -- Slave asserts when write response is valid
        S_GEN_4_AXI_ARADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);           -- Read address from master to slave
        S_GEN_4_AXI_ARVALID   : in std_logic;                                           -- Master asserts when read address is valid
        S_GEN_4_AXI_ARREADY   : out std_logic;                                          -- Slave ready to accept read address
        S_GEN_4_AXI_RREADY    : in std_logic;                                           -- Master ready to receive read data
        S_GEN_4_AXI_RDATA     : out std_logic_vector(G_DATA_WIDTH-1 downto 0);          -- Read data from slave to master
        S_GEN_4_AXI_RRESP     : out std_logic_vector(1 downto 0);                       -- Read response (OKAY or ERROR)
        S_GEN_4_AXI_RVALID    : out std_logic;                                          -- Slave asserts when read data is valid

        S_GEN_5_AXI_AWADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);           -- Write address from master to slave
        S_GEN_5_AXI_AWVALID   : in std_logic;                                           -- Master asserts when write address is valid
        S_GEN_5_AXI_AWREADY   : out std_logic;                                          -- Slave ready to accept write address
        S_GEN_5_AXI_WDATA     : in std_logic_vector(G_DATA_WIDTH-1 downto 0);           -- Write data from master
        S_GEN_5_AXI_WSTRB     : in std_logic_vector(3 downto 0);                        -- Write strobe, indicates active byte lanes
        S_GEN_5_AXI_WVALID    : in std_logic;                                           -- Master asserts when write data is valid
        S_GEN_5_AXI_WREADY    : out std_logic;                                          -- Slave ready to accept write data
        S_GEN_5_AXI_BREADY    : in std_logic;                                           -- Master ready to receive write response
        S_GEN_5_AXI_BRESP     : out std_logic_vector(1 downto 0);                       -- Write response from slave (OKAY or ERROR)
        S_GEN_5_AXI_BVALID    : out std_logic;                                          -- Slave asserts when write response is valid
        S_GEN_5_AXI_ARADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);           -- Read address from master to slave
        S_GEN_5_AXI_ARVALID   : in std_logic;                                           -- Master asserts when read address is valid
        S_GEN_5_AXI_ARREADY   : out std_logic;                                          -- Slave ready to accept read address
        S_GEN_5_AXI_RREADY    : in std_logic;                                           -- Master ready to receive read data
        S_GEN_5_AXI_RDATA     : out std_logic_vector(G_DATA_WIDTH-1 downto 0);          -- Read data from slave to master
        S_GEN_5_AXI_RRESP     : out std_logic_vector(1 downto 0);                       -- Read response (OKAY or ERROR)
        S_GEN_5_AXI_RVALID    : out std_logic;                                          -- Slave asserts when read data is valid

        S_GEN_6_AXI_AWADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);           -- Write address from master to slave
        S_GEN_6_AXI_AWVALID   : in std_logic;                                           -- Master asserts when write address is valid
        S_GEN_6_AXI_AWREADY   : out std_logic;                                          -- Slave ready to accept write address
        S_GEN_6_AXI_WDATA     : in std_logic_vector(G_DATA_WIDTH-1 downto 0);           -- Write data from master
        S_GEN_6_AXI_WSTRB     : in std_logic_vector(3 downto 0);                        -- Write strobe, indicates active byte lanes
        S_GEN_6_AXI_WVALID    : in std_logic;                                           -- Master asserts when write data is valid
        S_GEN_6_AXI_WREADY    : out std_logic;                                          -- Slave ready to accept write data
        S_GEN_6_AXI_BREADY    : in std_logic;                                           -- Master ready to receive write response
        S_GEN_6_AXI_BRESP     : out std_logic_vector(1 downto 0);                       -- Write response from slave (OKAY or ERROR)
        S_GEN_6_AXI_BVALID    : out std_logic;                                          -- Slave asserts when write response is valid
        S_GEN_6_AXI_ARADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);           -- Read address from master to slave
        S_GEN_6_AXI_ARVALID   : in std_logic;                                           -- Master asserts when read address is valid
        S_GEN_6_AXI_ARREADY   : out std_logic;                                          -- Slave ready to accept read address
        S_GEN_6_AXI_RREADY    : in std_logic;                                           -- Master ready to receive read data
        S_GEN_6_AXI_RDATA     : out std_logic_vector(G_DATA_WIDTH-1 downto 0);          -- Read data from slave to master
        S_GEN_6_AXI_RRESP     : out std_logic_vector(1 downto 0);                       -- Read response (OKAY or ERROR)
        S_GEN_6_AXI_RVALID    : out std_logic;                                          -- Slave asserts when read data is valid

        S_GEN_7_AXI_AWADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);           -- Write address from master to slave
        S_GEN_7_AXI_AWVALID   : in std_logic;                                           -- Master asserts when write address is valid
        S_GEN_7_AXI_AWREADY   : out std_logic;                                          -- Slave ready to accept write address
        S_GEN_7_AXI_WDATA     : in std_logic_vector(G_DATA_WIDTH-1 downto 0);           -- Write data from master
        S_GEN_7_AXI_WSTRB     : in std_logic_vector(3 downto 0);                        -- Write strobe, indicates active byte lanes
        S_GEN_7_AXI_WVALID    : in std_logic;                                           -- Master asserts when write data is valid
        S_GEN_7_AXI_WREADY    : out std_logic;                                          -- Slave ready to accept write data
        S_GEN_7_AXI_BREADY    : in std_logic;                                           -- Master ready to receive write response
        S_GEN_7_AXI_BRESP     : out std_logic_vector(1 downto 0);                       -- Write response from slave (OKAY or ERROR)
        S_GEN_7_AXI_BVALID    : out std_logic;                                          -- Slave asserts when write response is valid
        S_GEN_7_AXI_ARADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);           -- Read address from master to slave
        S_GEN_7_AXI_ARVALID   : in std_logic;                                           -- Master asserts when read address is valid
        S_GEN_7_AXI_ARREADY   : out std_logic;                                          -- Slave ready to accept read address
        S_GEN_7_AXI_RREADY    : in std_logic;                                           -- Master ready to receive read data
        S_GEN_7_AXI_RDATA     : out std_logic_vector(G_DATA_WIDTH-1 downto 0);          -- Read data from slave to master
        S_GEN_7_AXI_RRESP     : out std_logic_vector(1 downto 0);                       -- Read response (OKAY or ERROR)
        S_GEN_7_AXI_RVALID    : out std_logic;                                          -- Slave asserts when read data is valid

        S_GEN_8_AXI_AWADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);
        S_GEN_8_AXI_AWVALID   : in std_logic;
        S_GEN_8_AXI_AWREADY   : out std_logic;
        S_GEN_8_AXI_WDATA     : in std_logic_vector(G_DATA_WIDTH-1 downto 0);
        S_GEN_8_AXI_WSTRB     : in std_logic_vector(3 downto 0);
        S_GEN_8_AXI_WVALID    : in std_logic;
        S_GEN_8_AXI_WREADY    : out std_logic;
        S_GEN_8_AXI_BREADY    : in std_logic;
        S_GEN_8_AXI_BRESP     : out std_logic_vector(1 downto 0);
        S_GEN_8_AXI_BVALID    : out std_logic;
        S_GEN_8_AXI_ARADDR    : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);
        S_GEN_8_AXI_ARVALID   : in std_logic;
        S_GEN_8_AXI_ARREADY   : out std_logic;
        S_GEN_8_AXI_RREADY    : in std_logic;
        S_GEN_8_AXI_RDATA     : out std_logic_vector(G_DATA_WIDTH-1 downto 0);
        S_GEN_8_AXI_RRESP     : out std_logic_vector(1 downto 0);
        S_GEN_8_AXI_RVALID    : out std_logic

    );
end CONFIGURATION_2_BENCH;

architecture Behavioral of CONFIGURATION_2_BENCH is

    -- Internal signals configurator
    signal clk_tx                : std_logic;
    signal rst_txclk_n           : std_logic;
    signal interface_rst         : std_logic;
    signal reset_param_dl        : std_logic;
    signal link_rst              : std_logic;
    signal link_rst_asserted     : std_logic;
    signal nack_rst_en           : std_logic;
    signal nack_rst_mode         : std_logic;
    signal pause_vc              : std_logic_vector(G_CHANNEL_NUMBER downto 0);
    signal continuous_vc         : std_logic_vector(G_CHANNEL_NUMBER-1 downto 0);
    signal lane_start            : std_logic;
    signal autostart             : std_logic;
    signal lane_reset            : std_logic;
    signal parallel_loopback_en  : std_logic;
    signal standby_reason        : std_logic_vector(C_STDBYREASON_WIDTH-1 downto 0);
    signal near_end_serial_lb_en : std_logic;
    signal far_end_serial_lb_en  : std_logic;
    signal vc_credit             : std_logic_vector(G_CHANNEL_NUMBER-1 downto 0);
    signal fct_credit_overflow   : std_logic_vector(G_CHANNEL_NUMBER-1 downto 0);
    signal crc_long_error        : std_logic;
    signal crc_short_error       : std_logic;
    signal frame_error           : std_logic;
    signal sequence_error        : std_logic;
    signal far_end_link_rst      : std_logic;
    signal data_counter_tx       : std_logic_vector(6 downto 0);
    signal data_counter_rx       : std_logic_vector(6 downto 0);
    signal ack_counter_tx        : std_logic_vector(2 downto 0);
    signal nack_counter_tx       : std_logic_vector(2 downto 0);
    signal fct_counter_tx        : std_logic_vector(3 downto 0);
    signal ack_counter_rx        : std_logic_vector(2 downto 0);
    signal nack_counter_rx       : std_logic_vector(2 downto 0);
    signal fct_counter_rx        : std_logic_vector(3 downto 0);
    signal full_counter_rx       : std_logic_vector(1 downto 0);
    signal retry_counter_rx      : std_logic_vector(1 downto 0);
    signal seq_number_tx         : std_logic_vector(7 downto 0);
    signal seq_number_rx         : std_logic_vector(7 downto 0);
    signal input_buffer_ovfl     : std_logic_vector(G_CHANNEL_NUMBER-1 downto 0);
    signal frame_tx              : std_logic_vector(G_CHANNEL_NUMBER downto 0);
    signal frame_finished        : std_logic_vector(G_CHANNEL_NUMBER downto 0);
    signal lane_state            : std_logic_vector(C_LANESTATE_WIDTH-1 downto 0);
    signal rx_error_cnt          : std_logic_vector(C_RX_ERR_CNT_WIDTH-1 downto 0);
    signal rx_error_ovf          : std_logic;
    signal loss_signal           : std_logic;
    signal far_end_capa          : std_logic_vector(C_FAR_CAPA_WIDTH-1 downto 0);
    signal rx_polarity           : std_logic;
    signal rst_dut_n             : std_logic;
    signal current_time_slot_i   : std_logic_vector(7 downto 0);
    signal ack_seq_num_i         : std_logic_vector(7 downto 0);
    signal nack_seq_num_i        : std_logic_vector(7 downto 0);

    -- Internal signals for each analyzer instance
    type t_internal_signals_ana is record
        -- AXI4-Stream
        tdata                 : std_logic_vector(C_INTERNAL_BUS_WIDTH -1 downto 0);
        tvalid                : std_logic;
        tready                : std_logic;
        tlast                 : std_logic;
        tuser                 : std_logic_vector(C_VALID_K_WIDTH -1 downto 0);
        -- AXI4-LITE
        s_ana_axi_awaddr      : std_logic_vector(G_ADDR_WIDTH-1 downto 0);
        s_ana_axi_awvalid     : std_logic;  
        s_ana_axi_awready     : std_logic;  
        s_ana_axi_wdata       : std_logic_vector(G_DATA_WIDTH-1 downto 0);
        s_ana_axi_wstrb       : std_logic_vector(3 downto 0);
        s_ana_axi_wvalid      : std_logic; 
        s_ana_axi_wready      : std_logic; 
        s_ana_axi_bready      : std_logic; 
        s_ana_axi_bresp       : std_logic_vector(1 downto 0);
        s_ana_axi_bvalid      : std_logic; 
        s_ana_axi_araddr      : std_logic_vector(G_ADDR_WIDTH-1 downto 0); 
        s_ana_axi_arvalid     : std_logic;  
        s_ana_axi_arready     : std_logic;  
        s_ana_axi_rready      : std_logic; 
        s_ana_axi_rdata       : std_logic_vector(G_DATA_WIDTH-1 downto 0);
        s_ana_axi_rresp       : std_logic_vector(1 downto 0);
        s_ana_axi_rvalid      : std_logic; 
    end record;

    type t_internal_signals_ana_array is array (8 downto 0 ) of t_internal_signals_ana;
    signal internal_signals_ana : t_internal_signals_ana_array;

    -- Internal signals for each generator instance
    type t_internal_signals_gen is record
        -- AXI4-Stream
        tdata                 : std_logic_vector(C_INTERNAL_BUS_WIDTH -1 downto 0);
        tvalid                : std_logic;
        tready                : std_logic;
        tlast                 : std_logic;
        tuser                 : std_logic_vector(C_VALID_K_WIDTH -1 downto 0);
        -- AXI4-LITE
        s_gen_axi_awaddr      : std_logic_vector(G_ADDR_WIDTH-1 downto 0);
        s_gen_axi_awvalid     : std_logic;  
        s_gen_axi_awready     : std_logic;  
        s_gen_axi_wdata       : std_logic_vector(G_DATA_WIDTH-1 downto 0);
        s_gen_axi_wstrb       : std_logic_vector(3 downto 0);
        s_gen_axi_wvalid      : std_logic; 
        s_gen_axi_wready      : std_logic; 
        s_gen_axi_bready      : std_logic; 
        s_gen_axi_bresp       : std_logic_vector(1 downto 0);
        s_gen_axi_bvalid      : std_logic; 
        s_gen_axi_araddr      : std_logic_vector(G_ADDR_WIDTH-1 downto 0); 
        s_gen_axi_arvalid     : std_logic;  
        s_gen_axi_arready     : std_logic;  
        s_gen_axi_rready      : std_logic; 
        s_gen_axi_rdata       : std_logic_vector(G_DATA_WIDTH-1 downto 0);
        s_gen_axi_rresp       : std_logic_vector(1 downto 0);
        s_gen_axi_rvalid      : std_logic; 
    end record;

    type t_internal_signals_gen_array is array (8 downto 0 ) of t_internal_signals_gen;
    signal internal_signals_gen : t_internal_signals_gen_array;


    -- Internal signals for top of the SpaceFibre IP


    --AXI4 Stream TX
    signal axis_arstn_tx_dl          : std_logic_vector(G_VC_NUM downto 0);
    signal axis_aclk_tx_dl           : std_logic_vector(G_VC_NUM downto 0);
    signal axis_tready_tx_dl         : std_logic_vector(G_VC_NUM downto 0);
    signal axis_tdata_tx_dl          : vc_data_array(G_VC_NUM downto 0);
    signal axis_tuser_tx_dl          : vc_k_array(G_VC_NUM downto 0);
    signal axis_tlast_tx_dl          : std_logic_vector(G_VC_NUM downto 0);
    signal axis_tvalid_tx_dl         : std_logic_vector(G_VC_NUM downto 0);
    --AXI4 Stream RX
    signal axis_arstn_rx_dl          : std_logic_vector(G_VC_NUM downto 0);
    signal axis_aclk_rx_dl           : std_logic_vector(G_VC_NUM downto 0);
    signal axis_tready_rx_dl         : std_logic_vector(G_VC_NUM downto 0);
    signal axis_tdata_rx_dl          : vc_data_array(G_VC_NUM downto 0);
    signal axis_tuser_rx_dl          : vc_k_array(G_VC_NUM downto 0);
    signal axis_tlast_rx_dl          : std_logic_vector(G_VC_NUM downto 0);
    signal axis_tvalid_rx_dl         : std_logic_vector(G_VC_NUM downto 0);

    signal current_time_slot_nw      : std_logic_vector(7 downto 0);
    --Spy and injection interface
    signal data_tx_ppl               : std_logic_vector(31 downto 0);
    signal lane_reset_dl_ppl        : std_logic;
    signal capability_tx_ppl         : std_logic_vector(7 downto 0);
    signal new_data_tx_ppl           : std_logic;
    signal valid_k_charac_tx_ppl     : std_logic_vector(3 downto 0);
    signal fifo_rx_rd_en_ppl         : std_logic;
    signal fifo_tx_full_ppl          : std_logic;
    signal data_rx_ppl               : std_logic_vector(31 downto 0);
    signal fifo_rx_empty_ppl         : std_logic;
    signal fifo_rx_data_valid_ppl    : std_logic;
    signal valid_k_charac_rx_ppl     : std_logic_vector(3 downto 0);
    signal far_end_capa_dl           : std_logic_vector(7 downto 0);
    signal enable_spy                : std_logic;
    signal enable_inj                : std_logic;
    signal lane_reset_dl             : std_logic;
    --MIB
    
    
        
        -- Component declaration for spacefibre_light_top
        component spacefibre_light_top is
            generic(
                G_VC_NUM                         : integer := 8;                                    --! Number of virtual channel
                G_TARGET                         : string  := "VERSAL");
             port (
                RST_N                            : in  std_logic;                          --! global reset
                CLK                              : in  std_logic;                          --! Main clock
                CLK_TX                           : out  std_logic;                         --! Clock generated by manufacturer IP
                RST_TXCLK_N                      : out  std_logic;                         --! Reset clock generated by manufacturer IP
                -- CLK HSSL signals
                CLK_REF_N                        : in std_logic;                           --! HSSL dedicated clock
                CLK_REF_P                        : in std_logic;                           --! HSSL dedicated cloc
                -- FROM/TO Outside
                TX_POS                           : out std_logic;                          --! Positive LVDS serial data send
                TX_NEG                           : out std_logic;                          --! Negative LVDS serial data send
                RX_POS                           : in  std_logic;                          --! Positive LVDS serial data received
                RX_NEG                           : in  std_logic;                          --! Negative LVDS serial data received
                ----------------------- Data-Link layer signals -----------------------
                -- Discret signals
                AXIS_ARSTN_TX_DL                 : in  std_logic_vector(G_VC_NUM downto 0);
                AXIS_ACLK_TX_DL                  : in  std_logic_vector(G_VC_NUM downto 0);
                AXIS_TREADY_TX_DL                : out std_logic_vector(G_VC_NUM downto 0);
                AXIS_TDATA_TX_DL                 : in  vc_data_array(G_VC_NUM downto 0);
                AXIS_TUSER_TX_DL                 : in  vc_k_array(G_VC_NUM downto 0);
                AXIS_TLAST_TX_DL                 : in  std_logic_vector(G_VC_NUM downto 0);
                AXIS_TVALID_TX_DL                : in  std_logic_vector(G_VC_NUM downto 0);
                AXIS_ARSTN_RX_DL                 : in  std_logic_vector(G_VC_NUM downto 0);
                AXIS_ACLK_RX_DL                  : in  std_logic_vector(G_VC_NUM downto 0);
                AXIS_TREADY_RX_DL                : in  std_logic_vector(G_VC_NUM downto 0);
                AXIS_TDATA_RX_DL                 : out vc_data_array(G_VC_NUM downto 0);
                AXIS_TUSER_RX_DL                 : out vc_k_array(G_VC_NUM downto 0);
                AXIS_TLAST_RX_DL                 : out std_logic_vector(G_VC_NUM downto 0);
                AXIS_TVALID_RX_DL                : out std_logic_vector(G_VC_NUM downto 0);
                CURRENT_TIME_SLOT_NW             : in  std_logic_vector(7 downto 0);          --! Current time slot
                -- Paramters signals
                INTERFACE_RESET                  : in  std_logic;
                LINK_RESET                       : in  std_logic;
                NACK_RST_EN                      : in  std_logic;
                NACK_RST_MODE                    : in  std_logic;
                PAUSE_VC                         : in  std_logic_vector(8 downto 0);
                CONTINUOUS_VC                    : in  std_logic_vector(7 downto 0);
                -- Status signals
                SEQ_NUMBER_TX                    : out std_logic_vector(7 downto 0);    --! SEQ_NUMBER in transmission
                SEQ_NUMBER_RX                    : out std_logic_vector(7 downto 0);    --! SEQ_NUMBER in reception
                CREDIT_VC                        : out std_logic_vector(7 downto 0);    --! Indicates if each corresponding far-end input buffer has credit
                INPUT_BUF_OVF_VC                 : out std_logic_vector(G_VC_NUM-1 downto 0);
                FCT_CREDIT_OVERFLOW              : out std_logic_vector(7 downto 0);    --! Indicates overflow of each corresponding input buffer
                CRC_LONG_ERROR                   : out std_logic;                       --! CRC long error
                CRC_SHORT_ERROR                  : out std_logic;                       --! CRC short error
                FRAME_ERROR                      : out std_logic;                       --! Frame error
                SEQUENCE_ERROR                   : out std_logic;                       --! Sequence error
                FAR_END_LINK_RESET               : out std_logic;                       --! Far-end link reset status
                FRAME_FINISHED                   : out std_logic_vector(8 downto 0);    --! Indicates that corresponding channel finished emitting a frame
                FRAME_TX                         : out std_logic_vector(8 downto 0);    --! Indicates that corresponding channel is emitting a frame
                DATA_COUNTER_TX                  : out std_logic_vector(6 downto 0);    --! Indicate the number of data transmitted in last frame emitted
                DATA_COUNTER_RX                  : out std_logic_vector(6 downto 0);    --! Indicate the number of data received in last frame received
                ACK_COUNTER_TX                   : out std_logic_vector(2 downto 0);    --! ACK counter TX
                NACK_COUNTER_TX                  : out std_logic_vector(2 downto 0);    --! NACK counter TX
                FCT_COUNTER_TX                   : out std_logic_vector(3 downto 0);    --! FCT counter TX
                ACK_COUNTER_RX                   : out std_logic_vector(2 downto 0);    --! ACK counter RX
                NACK_COUNTER_RX                  : out std_logic_vector(2 downto 0);    --! NACK counter RX
                FCT_COUNTER_RX                   : out std_logic_vector(3 downto 0);    --! FCT counter RX
                FULL_COUNTER_RX                  : out std_logic_vector(1 downto 0);    --! FULL counter RX
                RETRY_COUNTER_RX                 : out std_logic_vector(1 downto 0);    --! RETRY counter RX
                CURRENT_TIME_SLOT                : out std_logic_vector(7 downto 0);    --! Current time slot
                RESET_PARAM                      : out std_logic;
                LINK_RST_ASSERTED                : out std_logic;
                NACK_SEQ_NUM                     : out std_logic_vector(7 downto 0);    --! NACK Seq_num received
                ACK_SEQ_NUM                      : out std_logic_vector(7 downto 0);    --! ACK Seq_num received
                ----------------------- Phy + Lane layer signals -----------------------
                -- -- Interface injector
                ENABLE_INJ                       : in std_logic;
                DATA_TX_INJ                      : in  std_logic_vector(31 downto 00);     --! Data parallel to be send from injector
                CAPABILITY_TX_INJ                : in  std_logic_vector(07 downto 00);     --! Capability send on TX link in INIT3 control word from injector
                NEW_DATA_TX_INJ                  : in  std_logic;                          --! Flag to write data in FIFO TX from injetor
                VALID_K_CHARAC_TX_INJ            : in  std_logic_vector(03 downto 00);     --! K charachter valid in the 32-bit DATA_TX_INJ vector
                FIFO_TX_FULL_INJ                 : out   std_logic;                        --! Flag full of the FIFO TX to the injector
                LANE_RESET_INJ                   : in  std_logic;
                -- -- Interface spy
                ENABLE_SPY                       : in std_logic;
                FIFO_RX_RD_EN_SPY                : in  std_logic;                          --! FiFo RX read enable flag from the spy
                DATA_RX_SPY                      : out std_logic_vector(31 downto 00);     --! 32-bit Data parallel to be received to the spy
                FIFO_RX_EMPTY_SPY                : out std_logic;                          --! FiFo RX empty flag to the spy
                FIFO_RX_DATA_VALID_SPY           : out std_logic;                          --! FiFo RX data valid flag to the spy
                VALID_K_CHARAC_RX_SPY            : out std_logic_vector(03 downto 00);     --! 4-bit valid K character flags to the spy
                -- Paramter and Status signals
                LANE_START                       : in  std_logic;                          --! Asserts or de-asserts LaneStart for the lane
                AUTOSTART                        : in  std_logic;                          --! Asserts or de-asserts AutoStart for the lane
                LANE_RESET                       : in  std_logic;                          --! Asserts or de-asserts LaneReset for the lane
                PARALLEL_LOOPBACK_EN             : in  std_logic;                          --! Enables or disables the parallel loopback for the lane
                STANDBY_REASON                   : in  std_logic_vector(07 downto 00);     --! In case of error, pauses communication
                NEAR_END_SERIAL_LB_EN            : in  std_logic;                          --! Enables or disables the near-end serial loopback for the lane
                FAR_END_SERIAL_LB_EN             : in  std_logic;                          --! Enables or disables the far-end serial loopback for the lane
                LANE_STATE                       : out std_logic_vector(03 downto 00);     --! Indicates the current state of the Lane Initialization state machine in a lane
                RX_ERROR_CNT                     : out std_logic_vector(07 downto 00);     --! Counter of error detected on the RX link
                RX_ERROR_OVF                     : out std_logic;                          --! Overflow flag of the RX_ERROR_CNT
                LOSS_SIGNAL                      : out std_logic;                          --! Set when no signal is received on RX link
                FAR_END_CAPA                     : out std_logic_vector(07 downto 00);     --! RX Capabilities field (INT3 flags)
                RX_POLARITY                      : out std_logic                           --! Set when the receiver polarity is inverted
             );
        end component;

    begin

    -- Instantiate the LANE_CONFIGURATOR module
    DATA_LINK_CONFIGURATOR_INST : entity work.DATA_LINK_CONFIGURATOR
        generic map(
            G_ADDR_WIDTH => G_ADDR_WIDTH,
            G_DATA_WIDTH => G_DATA_WIDTH
        )
        port map(
            CLK                   => CLK,
            RST_N                 => RST_N,
            CLK_DL                => CLK,
            RST_N_DL              => RST_N,
            CLK_TX                => clk_tx,
            RST_TXCLK_N           => rst_txclk_n,

            S_AXI_AWADDR          => S_CON_AXI_AWADDR,
            S_AXI_AWVALID         => S_CON_AXI_AWVALID,
            S_AXI_AWREADY         => S_CON_AXI_AWREADY,
            S_AXI_WDATA           => S_CON_AXI_WDATA,
            S_AXI_WSTRB           => S_CON_AXI_WSTRB,
            S_AXI_WVALID          => S_CON_AXI_WVALID,
            S_AXI_WREADY          => S_CON_AXI_WREADY,
            S_AXI_BREADY          => S_CON_AXI_BREADY,
            S_AXI_BRESP           => S_CON_AXI_BRESP,
            S_AXI_BVALID          => S_CON_AXI_BVALID,
            S_AXI_ARADDR          => S_CON_AXI_ARADDR,
            S_AXI_ARVALID         => S_CON_AXI_ARVALID,
            S_AXI_ARREADY         => S_CON_AXI_ARREADY,
            S_AXI_RREADY          => S_CON_AXI_RREADY,
            S_AXI_RDATA           => S_CON_AXI_RDATA,
            S_AXI_RRESP           => S_CON_AXI_RRESP,
            S_AXI_RVALID          => S_CON_AXI_RVALID,

            INTERFACE_RST         => interface_rst,
            RESET_PARAM_DL        => reset_param_dl,
            LINK_RST              => link_rst,
            LINK_RST_ASSERTED     => link_rst_asserted,
            NACK_RST_EN           => nack_rst_en,
            NACK_RST_MODE         => nack_rst_mode,
            PAUSE_VC              => pause_vc,
            CONTINUOUS_VC         => continuous_vc,

            LANE_START            => lane_start,
            AUTOSTART             => autostart,
            LANE_RESET            => lane_reset,
            PARALLEL_LOOPBACK_EN  => parallel_loopback_en,
            STANDBY_REASON        => standby_reason,
            NEAR_END_SERIAL_LB_EN => near_end_serial_lb_en,
            FAR_END_SERIAL_LB_EN  => far_end_serial_lb_en,
            
            VC_CREDIT             => vc_credit,
            FCT_CREDIT_OVERFLOW   => fct_credit_overflow,
            CRC_LONG_ERROR        => crc_long_error,
            CRC_SHORT_ERROR       => crc_short_error,
            FRAME_ERROR           => frame_error,
            SEQ_ERROR             => sequence_error,
            FAR_END_LINK_RST      => far_end_link_rst,
            SEQ_NUMBER_TX         => seq_number_tx,
            SEQ_NUMBER_RX         => seq_number_rx,
            INPUT_BUFFER_OVFL     => input_buffer_ovfl,

            FRAME_TX              => frame_tx,
            FRAME_FINISHED        => frame_finished,
            DATA_CNT_TX           => data_counter_tx,
            DATA_CNT_RX           => data_counter_rx,
            ACK_COUNTER_TX        => ack_counter_tx,
            NACK_COUNTER_TX       => nack_counter_tx,
            FCT_COUNTER_TX        => fct_counter_tx,
            ACK_COUNTER_RX        => ack_counter_rx,
            NACK_COUNTER_RX       => nack_counter_rx,
            FCT_COUNTER_RX        => fct_counter_rx,
            FULL_COUNTER_RX       => full_counter_rx,
            RETRY_COUNTER_RX      => retry_counter_rx,
            CURRENT_TIME_SLOT     => current_time_slot_i,
            
            ACK_SEQ_NUM           => ack_seq_num_i,
            NACK_SEQ_NUM          => nack_seq_num_i,

            LANE_STATE            => lane_state,
            RX_ERROR_CNT          => rx_error_cnt,
            RX_ERROR_OVF          => rx_error_ovf,
            LOSS_SIGNAL           => loss_signal,
            FAR_END_CAPA          => far_end_capa,
            RX_POLARITY           => rx_polarity,

            RST_DUT_N             => rst_dut_n,
            DL_EN                 => enable_inj,
            LANE_SPY_EN           => enable_spy
        );
       ---------------------------------------------------------------------------
   -- INSTANCE: I_LANE_GENERATOR
   -- Description : Lane generator model
   ---------------------------------------------------------------------------
   
   I_LANE_GENERATOR: entity work.LANE_GENERATOR
   port map (
      CLK             =>  CLK,
      RST_N           =>  rst_dut_n,
      S_AXI_AWADDR    =>  S_GEN_LANE_AXI_AWADDR,
      S_AXI_AWVALID   =>  S_GEN_LANE_AXI_AWVALID,
      S_AXI_AWREADY   =>  S_GEN_LANE_AXI_AWREADY,
      S_AXI_WDATA     =>  S_GEN_LANE_AXI_WDATA,
      S_AXI_WSTRB     =>  S_GEN_LANE_AXI_WSTRB,
      S_AXI_WVALID    =>  S_GEN_LANE_AXI_WVALID,
      S_AXI_WREADY    =>  S_GEN_LANE_AXI_WREADY,
      S_AXI_BREADY    =>  S_GEN_LANE_AXI_BREADY,
      S_AXI_BRESP     =>  S_GEN_LANE_AXI_BRESP,
      S_AXI_BVALID    =>  S_GEN_LANE_AXI_BVALID,
      S_AXI_ARADDR    =>  S_GEN_LANE_AXI_ARADDR,
      S_AXI_ARVALID   =>  S_GEN_LANE_AXI_ARVALID,
      S_AXI_ARREADY   =>  S_GEN_LANE_AXI_ARREADY,
      S_AXI_RREADY    =>  S_GEN_LANE_AXI_RREADY,
      S_AXI_RDATA     =>  S_GEN_LANE_AXI_RDATA,
      S_AXI_RRESP     =>  S_GEN_LANE_AXI_RRESP,
      S_AXI_RVALID    =>  S_GEN_LANE_AXI_RVALID,
      -- LANE interface
      ---------------------------------------
      DATA_TX               => data_tx_ppl,
      NEW_DATA_TX_PPL       => new_data_tx_ppl,
      FIFO_TX_FULL_PPL      => fifo_tx_full_ppl,
      LANE_RESET_DL         => lane_reset_dl,
      VALID_K_CHARAC_TX_PPL => valid_k_charac_tx_ppl,
      CAPABILITY_TX_PPL     => capability_tx_ppl
   );
  ---------------------------------------------------------------------------
  -- INSTANCE: I_LANE_ANALYZER
  -- Description : Lane analyzer model
  ---------------------------------------------------------------------------
  I_LANE_ANALYZER: entity work.LANE_ANALYZER
  port map (
     CLK             =>  CLK,
     RST_N           =>  rst_dut_n,
     S_AXI_AWADDR    =>  S_ANA_LANE_AXI_AWADDR,
     S_AXI_AWVALID   =>  S_ANA_LANE_AXI_AWVALID,
     S_AXI_AWREADY   =>  S_ANA_LANE_AXI_AWREADY,
     S_AXI_WDATA     =>  S_ANA_LANE_AXI_WDATA,
     S_AXI_WSTRB     =>  S_ANA_LANE_AXI_WSTRB,
     S_AXI_WVALID    =>  S_ANA_LANE_AXI_WVALID,
     S_AXI_WREADY    =>  S_ANA_LANE_AXI_WREADY,
     S_AXI_BREADY    =>  S_ANA_LANE_AXI_BREADY,
     S_AXI_BRESP     =>  S_ANA_LANE_AXI_BRESP,
     S_AXI_BVALID    =>  S_ANA_LANE_AXI_BVALID,
     S_AXI_ARADDR    =>  S_ANA_LANE_AXI_ARADDR,
     S_AXI_ARVALID   =>  S_ANA_LANE_AXI_ARVALID,
     S_AXI_ARREADY   =>  S_ANA_LANE_AXI_ARREADY,
     S_AXI_RREADY    =>  S_ANA_LANE_AXI_RREADY,
     S_AXI_RDATA     =>  S_ANA_LANE_AXI_RDATA,
     S_AXI_RRESP     =>  S_ANA_LANE_AXI_RRESP,
     S_AXI_RVALID    =>  S_ANA_LANE_AXI_RVALID,
     -- LANE interface
     ---------------------------------------
     DATA_RX               => data_rx_ppl,
     VALID_K_CHARAC_RX_PPL => valid_k_charac_rx_ppl,
     FIFO_RX_EMPTY_PPL     => fifo_rx_empty_ppl,
     FIFO_RX_DATA_VALID_PPL=> fifo_rx_data_valid_ppl,
     FIFO_RX_RD_EN_PPL     => fifo_rx_rd_en_ppl,
     FAR_END_CAPA_DL       => far_end_capa
  );

    -- Instantiate the DATA_LINK_ANALYZER module 9 times
    gen_data_link_analyzer: for i in 0 to 8 generate
        DATA_LINK_ANALYZER_INST : entity work.DATA_LINK_ANALYZER
            generic map(
                G_ADDR_WIDTH => G_ADDR_WIDTH,
                G_DATA_WIDTH => G_DATA_WIDTH
            )
            port map(
                CLK                   => clk,
                RST_N                 => rst_n,
                S_AXI_AWADDR          => internal_signals_ana(i).s_ana_axi_awaddr,
                S_AXI_AWVALID         => internal_signals_ana(i).s_ana_axi_awvalid,
                S_AXI_AWREADY         => internal_signals_ana(i).s_ana_axi_awready,
                S_AXI_WDATA           => internal_signals_ana(i).s_ana_axi_wdata,
                S_AXI_WSTRB           => internal_signals_ana(i).s_ana_axi_wstrb,
                S_AXI_WVALID          => internal_signals_ana(i).s_ana_axi_wvalid,
                S_AXI_WREADY          => internal_signals_ana(i).s_ana_axi_wready,
                S_AXI_BREADY          => internal_signals_ana(i).s_ana_axi_bready,
                S_AXI_BRESP           => internal_signals_ana(i).s_ana_axi_bresp,
                S_AXI_BVALID          => internal_signals_ana(i).s_ana_axi_bvalid,
                S_AXI_ARADDR          => internal_signals_ana(i).s_ana_axi_araddr,
                S_AXI_ARVALID         => internal_signals_ana(i).s_ana_axi_arvalid,
                S_AXI_ARREADY         => internal_signals_ana(i).s_ana_axi_arready,
                S_AXI_RREADY          => internal_signals_ana(i).s_ana_axi_rready,
                S_AXI_RDATA           => internal_signals_ana(i).s_ana_axi_rdata,
                S_AXI_RRESP           => internal_signals_ana(i).s_ana_axi_rresp,
                S_AXI_RVALID          => internal_signals_ana(i).s_ana_axi_rvalid,
                TDATA                 => internal_signals_ana(i).tdata,
                TVALID                => internal_signals_ana(i).tvalid,
                TREADY                => internal_signals_ana(i).tready,
                TLAST                 => internal_signals_ana(i).tlast,
                TUSER                 => internal_signals_ana(i).tuser
            );
    end generate;


    internal_signals_ana(0).s_ana_axi_awaddr    <= S_ANA_0_AXI_AWADDR;
    internal_signals_ana(0).s_ana_axi_awvalid   <= S_ANA_0_AXI_AWVALID;
    S_ANA_0_AXI_AWREADY                         <= internal_signals_ana(0).s_ana_axi_awready;
    internal_signals_ana(0).s_ana_axi_wdata     <= S_ANA_0_AXI_WDATA;
    internal_signals_ana(0).s_ana_axi_wstrb     <= S_ANA_0_AXI_WSTRB;
    internal_signals_ana(0).s_ana_axi_wvalid    <= S_ANA_0_AXI_WVALID;
    S_ANA_0_AXI_WREADY                          <= internal_signals_ana(0).s_ana_axi_wready;
    internal_signals_ana(0).s_ana_axi_bready    <= S_ANA_0_AXI_BREADY;
    S_ANA_0_AXI_BRESP                           <= internal_signals_ana(0).s_ana_axi_bresp;
    S_ANA_0_AXI_BVALID                          <= internal_signals_ana(0).s_ana_axi_bvalid;
    internal_signals_ana(0).s_ana_axi_araddr    <= S_ANA_0_AXI_ARADDR;
    internal_signals_ana(0).s_ana_axi_arvalid   <= S_ANA_0_AXI_ARVALID;
    S_ANA_0_AXI_ARREADY                         <= internal_signals_ana(0).s_ana_axi_arready;
    internal_signals_ana(0).s_ana_axi_rready    <= S_ANA_0_AXI_RREADY;
    S_ANA_0_AXI_RDATA                           <= internal_signals_ana(0).s_ana_axi_rdata;
    S_ANA_0_AXI_RRESP                           <= internal_signals_ana(0).s_ana_axi_rresp;
    S_ANA_0_AXI_RVALID                          <= internal_signals_ana(0).s_ana_axi_rvalid;

    internal_signals_ana(1).s_ana_axi_awaddr    <= S_ANA_1_AXI_AWADDR;
    internal_signals_ana(1).s_ana_axi_awvalid   <= S_ANA_1_AXI_AWVALID;
    S_ANA_1_AXI_AWREADY                         <= internal_signals_ana(1).s_ana_axi_awready;
    internal_signals_ana(1).s_ana_axi_wdata     <= S_ANA_1_AXI_WDATA;
    internal_signals_ana(1).s_ana_axi_wstrb     <= S_ANA_1_AXI_WSTRB;
    internal_signals_ana(1).s_ana_axi_wvalid    <= S_ANA_1_AXI_WVALID;
    S_ANA_1_AXI_WREADY                          <= internal_signals_ana(1).s_ana_axi_wready;
    internal_signals_ana(1).s_ana_axi_bready    <= S_ANA_1_AXI_BREADY;
    S_ANA_1_AXI_BRESP                           <= internal_signals_ana(1).s_ana_axi_bresp;
    S_ANA_1_AXI_BVALID                          <= internal_signals_ana(1).s_ana_axi_bvalid;
    internal_signals_ana(1).s_ana_axi_araddr    <= S_ANA_1_AXI_ARADDR;
    internal_signals_ana(1).s_ana_axi_arvalid   <= S_ANA_1_AXI_ARVALID;
    S_ANA_1_AXI_ARREADY                         <= internal_signals_ana(1).s_ana_axi_arready;
    internal_signals_ana(1).s_ana_axi_rready    <= S_ANA_1_AXI_RREADY;
    S_ANA_1_AXI_RDATA                           <= internal_signals_ana(1).s_ana_axi_rdata;
    S_ANA_1_AXI_RRESP                           <= internal_signals_ana(1).s_ana_axi_rresp;
    S_ANA_1_AXI_RVALID                          <= internal_signals_ana(1).s_ana_axi_rvalid;

    internal_signals_ana(2).s_ana_axi_awaddr    <= S_ANA_2_AXI_AWADDR;
    internal_signals_ana(2).s_ana_axi_awvalid   <= S_ANA_2_AXI_AWVALID;
    S_ANA_2_AXI_AWREADY                         <= internal_signals_ana(2).s_ana_axi_awready;
    internal_signals_ana(2).s_ana_axi_wdata     <= S_ANA_2_AXI_WDATA;
    internal_signals_ana(2).s_ana_axi_wstrb     <= S_ANA_2_AXI_WSTRB;
    internal_signals_ana(2).s_ana_axi_wvalid    <= S_ANA_2_AXI_WVALID;
    S_ANA_2_AXI_WREADY                          <= internal_signals_ana(2).s_ana_axi_wready;
    internal_signals_ana(2).s_ana_axi_bready    <= S_ANA_2_AXI_BREADY;
    S_ANA_2_AXI_BRESP                           <= internal_signals_ana(2).s_ana_axi_bresp;
    S_ANA_2_AXI_BVALID                          <= internal_signals_ana(2).s_ana_axi_bvalid;
    internal_signals_ana(2).s_ana_axi_araddr    <= S_ANA_2_AXI_ARADDR;
    internal_signals_ana(2).s_ana_axi_arvalid   <= S_ANA_2_AXI_ARVALID;
    S_ANA_2_AXI_ARREADY                         <= internal_signals_ana(2).s_ana_axi_arready;
    internal_signals_ana(2).s_ana_axi_rready    <= S_ANA_2_AXI_RREADY;
    S_ANA_2_AXI_RDATA                           <= internal_signals_ana(2).s_ana_axi_rdata;
    S_ANA_2_AXI_RRESP                           <= internal_signals_ana(2).s_ana_axi_rresp;
    S_ANA_2_AXI_RVALID                          <= internal_signals_ana(2).s_ana_axi_rvalid;

    internal_signals_ana(3).s_ana_axi_awaddr    <= S_ANA_3_AXI_AWADDR;
    internal_signals_ana(3).s_ana_axi_awvalid   <= S_ANA_3_AXI_AWVALID;
    S_ANA_3_AXI_AWREADY                         <= internal_signals_ana(3).s_ana_axi_awready;
    internal_signals_ana(3).s_ana_axi_wdata     <= S_ANA_3_AXI_WDATA;
    internal_signals_ana(3).s_ana_axi_wstrb     <= S_ANA_3_AXI_WSTRB;
    internal_signals_ana(3).s_ana_axi_wvalid    <= S_ANA_3_AXI_WVALID;
    S_ANA_3_AXI_WREADY                          <= internal_signals_ana(3).s_ana_axi_wready;
    internal_signals_ana(3).s_ana_axi_bready    <= S_ANA_3_AXI_BREADY;
    S_ANA_3_AXI_BRESP                           <= internal_signals_ana(3).s_ana_axi_bresp;
    S_ANA_3_AXI_BVALID                          <= internal_signals_ana(3).s_ana_axi_bvalid;
    internal_signals_ana(3).s_ana_axi_araddr    <= S_ANA_3_AXI_ARADDR;
    internal_signals_ana(3).s_ana_axi_arvalid   <= S_ANA_3_AXI_ARVALID;
    S_ANA_3_AXI_ARREADY                         <= internal_signals_ana(3).s_ana_axi_arready;
    internal_signals_ana(3).s_ana_axi_rready    <= S_ANA_3_AXI_RREADY;
    S_ANA_3_AXI_RDATA                           <= internal_signals_ana(3).s_ana_axi_rdata;
    S_ANA_3_AXI_RRESP                           <= internal_signals_ana(3).s_ana_axi_rresp;
    S_ANA_3_AXI_RVALID                          <= internal_signals_ana(3).s_ana_axi_rvalid;

    internal_signals_ana(4).s_ana_axi_awaddr    <= S_ANA_4_AXI_AWADDR;
    internal_signals_ana(4).s_ana_axi_awvalid   <= S_ANA_4_AXI_AWVALID;
    S_ANA_4_AXI_AWREADY                         <= internal_signals_ana(4).s_ana_axi_awready;
    internal_signals_ana(4).s_ana_axi_wdata     <= S_ANA_4_AXI_WDATA;
    internal_signals_ana(4).s_ana_axi_wstrb     <= S_ANA_4_AXI_WSTRB;
    internal_signals_ana(4).s_ana_axi_wvalid    <= S_ANA_4_AXI_WVALID;
    S_ANA_4_AXI_WREADY                          <= internal_signals_ana(4).s_ana_axi_wready;
    internal_signals_ana(4).s_ana_axi_bready    <= S_ANA_4_AXI_BREADY;
    S_ANA_4_AXI_BRESP                           <= internal_signals_ana(4).s_ana_axi_bresp;
    S_ANA_4_AXI_BVALID                          <= internal_signals_ana(4).s_ana_axi_bvalid;
    internal_signals_ana(4).s_ana_axi_araddr    <= S_ANA_4_AXI_ARADDR;
    internal_signals_ana(4).s_ana_axi_arvalid   <= S_ANA_4_AXI_ARVALID;
    S_ANA_4_AXI_ARREADY                         <= internal_signals_ana(4).s_ana_axi_arready;
    internal_signals_ana(4).s_ana_axi_rready    <= S_ANA_4_AXI_RREADY;
    S_ANA_4_AXI_RDATA                           <= internal_signals_ana(4).s_ana_axi_rdata;
    S_ANA_4_AXI_RRESP                           <= internal_signals_ana(4).s_ana_axi_rresp;
    S_ANA_4_AXI_RVALID                          <= internal_signals_ana(4).s_ana_axi_rvalid;

    internal_signals_ana(5).s_ana_axi_awaddr    <= S_ANA_5_AXI_AWADDR;
    internal_signals_ana(5).s_ana_axi_awvalid   <= S_ANA_5_AXI_AWVALID;
    S_ANA_5_AXI_AWREADY                         <= internal_signals_ana(5).s_ana_axi_awready;
    internal_signals_ana(5).s_ana_axi_wdata     <= S_ANA_5_AXI_WDATA;
    internal_signals_ana(5).s_ana_axi_wstrb     <= S_ANA_5_AXI_WSTRB;
    internal_signals_ana(5).s_ana_axi_wvalid    <= S_ANA_5_AXI_WVALID;
    S_ANA_5_AXI_WREADY                          <= internal_signals_ana(5).s_ana_axi_wready;
    internal_signals_ana(5).s_ana_axi_bready    <= S_ANA_5_AXI_BREADY;
    S_ANA_5_AXI_BRESP                           <= internal_signals_ana(5).s_ana_axi_bresp;
    S_ANA_5_AXI_BVALID                          <= internal_signals_ana(5).s_ana_axi_bvalid;
    internal_signals_ana(5).s_ana_axi_araddr    <= S_ANA_5_AXI_ARADDR;
    internal_signals_ana(5).s_ana_axi_arvalid   <= S_ANA_5_AXI_ARVALID;
    S_ANA_5_AXI_ARREADY                         <= internal_signals_ana(5).s_ana_axi_arready;
    internal_signals_ana(5).s_ana_axi_rready    <= S_ANA_5_AXI_RREADY;
    S_ANA_5_AXI_RDATA                           <= internal_signals_ana(5).s_ana_axi_rdata;
    S_ANA_5_AXI_RRESP                           <= internal_signals_ana(5).s_ana_axi_rresp;
    S_ANA_5_AXI_RVALID                          <= internal_signals_ana(5).s_ana_axi_rvalid;

    internal_signals_ana(6).s_ana_axi_awaddr    <= S_ANA_6_AXI_AWADDR;
    internal_signals_ana(6).s_ana_axi_awvalid   <= S_ANA_6_AXI_AWVALID;
    S_ANA_6_AXI_AWREADY                         <= internal_signals_ana(6).s_ana_axi_awready;
    internal_signals_ana(6).s_ana_axi_wdata     <= S_ANA_6_AXI_WDATA;
    internal_signals_ana(6).s_ana_axi_wstrb     <= S_ANA_6_AXI_WSTRB;
    internal_signals_ana(6).s_ana_axi_wvalid    <= S_ANA_6_AXI_WVALID;
    S_ANA_6_AXI_WREADY                          <= internal_signals_ana(6).s_ana_axi_wready;
    internal_signals_ana(6).s_ana_axi_bready    <= S_ANA_6_AXI_BREADY;
    S_ANA_6_AXI_BRESP                           <= internal_signals_ana(6).s_ana_axi_bresp;
    S_ANA_6_AXI_BVALID                          <= internal_signals_ana(6).s_ana_axi_bvalid;
    internal_signals_ana(6).s_ana_axi_araddr    <= S_ANA_6_AXI_ARADDR;
    internal_signals_ana(6).s_ana_axi_arvalid   <= S_ANA_6_AXI_ARVALID;
    S_ANA_6_AXI_ARREADY                         <= internal_signals_ana(6).s_ana_axi_arready;
    internal_signals_ana(6).s_ana_axi_rready    <= S_ANA_6_AXI_RREADY;
    S_ANA_6_AXI_RDATA                           <= internal_signals_ana(6).s_ana_axi_rdata;
    S_ANA_6_AXI_RRESP                           <= internal_signals_ana(6).s_ana_axi_rresp;
    S_ANA_6_AXI_RVALID                          <= internal_signals_ana(6).s_ana_axi_rvalid;

    internal_signals_ana(7).s_ana_axi_awaddr    <= S_ANA_7_AXI_AWADDR;
    internal_signals_ana(7).s_ana_axi_awvalid   <= S_ANA_7_AXI_AWVALID;
    S_ANA_7_AXI_AWREADY                         <= internal_signals_ana(7).s_ana_axi_awready;
    internal_signals_ana(7).s_ana_axi_wdata     <= S_ANA_7_AXI_WDATA;
    internal_signals_ana(7).s_ana_axi_wstrb     <= S_ANA_7_AXI_WSTRB;
    internal_signals_ana(7).s_ana_axi_wvalid    <= S_ANA_7_AXI_WVALID;
    S_ANA_7_AXI_WREADY                          <= internal_signals_ana(7).s_ana_axi_wready;
    internal_signals_ana(7).s_ana_axi_bready    <= S_ANA_7_AXI_BREADY;
    S_ANA_7_AXI_BRESP                           <= internal_signals_ana(7).s_ana_axi_bresp;
    S_ANA_7_AXI_BVALID                          <= internal_signals_ana(7).s_ana_axi_bvalid;
    internal_signals_ana(7).s_ana_axi_araddr    <= S_ANA_7_AXI_ARADDR;
    internal_signals_ana(7).s_ana_axi_arvalid   <= S_ANA_7_AXI_ARVALID;
    S_ANA_7_AXI_ARREADY                         <= internal_signals_ana(7).s_ana_axi_arready;
    internal_signals_ana(7).s_ana_axi_rready    <= S_ANA_7_AXI_RREADY;
    S_ANA_7_AXI_RDATA                           <= internal_signals_ana(7).s_ana_axi_rdata;
    S_ANA_7_AXI_RRESP                           <= internal_signals_ana(7).s_ana_axi_rresp;
    S_ANA_7_AXI_RVALID                          <= internal_signals_ana(7).s_ana_axi_rvalid;

    internal_signals_ana(8).s_ana_axi_awaddr    <= S_ANA_8_AXI_AWADDR;
    internal_signals_ana(8).s_ana_axi_awvalid   <= S_ANA_8_AXI_AWVALID;
    S_ANA_8_AXI_AWREADY                         <= internal_signals_ana(8).s_ana_axi_awready;
    internal_signals_ana(8).s_ana_axi_wdata     <= S_ANA_8_AXI_WDATA;
    internal_signals_ana(8).s_ana_axi_wstrb     <= S_ANA_8_AXI_WSTRB;
    internal_signals_ana(8).s_ana_axi_wvalid    <= S_ANA_8_AXI_WVALID;
    S_ANA_8_AXI_WREADY                          <= internal_signals_ana(8).s_ana_axi_wready;
    internal_signals_ana(8).s_ana_axi_bready    <= S_ANA_8_AXI_BREADY;
    S_ANA_8_AXI_BRESP                           <= internal_signals_ana(8).s_ana_axi_bresp;
    S_ANA_8_AXI_BVALID                          <= internal_signals_ana(8).s_ana_axi_bvalid;
    internal_signals_ana(8).s_ana_axi_araddr    <= S_ANA_8_AXI_ARADDR;
    internal_signals_ana(8).s_ana_axi_arvalid   <= S_ANA_8_AXI_ARVALID;
    S_ANA_8_AXI_ARREADY                         <= internal_signals_ana(8).s_ana_axi_arready;
    internal_signals_ana(8).s_ana_axi_rready    <= S_ANA_8_AXI_RREADY;
    S_ANA_8_AXI_RDATA                           <= internal_signals_ana(8).s_ana_axi_rdata;
    S_ANA_8_AXI_RRESP                           <= internal_signals_ana(8).s_ana_axi_rresp;
    S_ANA_8_AXI_RVALID                          <= internal_signals_ana(8).s_ana_axi_rvalid;
    
    
    -- Instantiate the DATA_LINK_GENERATOR module 9 times
    gen_data_link_generator: for i in 0 to 8 generate
        DATA_LINK_GENERATOR_INST : entity work.DATA_LINK_GENERATOR
            generic map(
                G_ADDR_WIDTH => G_ADDR_WIDTH,
                G_DATA_WIDTH => G_DATA_WIDTH
            )
            port map(
                CLK                   => clk,
                RST_N                 => rst_n,
                S_AXI_AWADDR          => internal_signals_gen(i).s_gen_axi_awaddr,
                S_AXI_AWVALID         => internal_signals_gen(i).s_gen_axi_awvalid,
                S_AXI_AWREADY         => internal_signals_gen(i).s_gen_axi_awready,
                S_AXI_WDATA           => internal_signals_gen(i).s_gen_axi_wdata,
                S_AXI_WSTRB           => internal_signals_gen(i).s_gen_axi_wstrb,
                S_AXI_WVALID          => internal_signals_gen(i).s_gen_axi_wvalid,
                S_AXI_WREADY          => internal_signals_gen(i).s_gen_axi_wready,
                S_AXI_BREADY          => internal_signals_gen(i).s_gen_axi_bready,
                S_AXI_BRESP           => internal_signals_gen(i).s_gen_axi_bresp,
                S_AXI_BVALID          => internal_signals_gen(i).s_gen_axi_bvalid,
                S_AXI_ARADDR          => internal_signals_gen(i).s_gen_axi_araddr,
                S_AXI_ARVALID         => internal_signals_gen(i).s_gen_axi_arvalid,
                S_AXI_ARREADY         => internal_signals_gen(i).s_gen_axi_arready,
                S_AXI_RREADY          => internal_signals_gen(i).s_gen_axi_rready,
                S_AXI_RDATA           => internal_signals_gen(i).s_gen_axi_rdata,
                S_AXI_RRESP           => internal_signals_gen(i).s_gen_axi_rresp,
                S_AXI_RVALID          => internal_signals_gen(i).s_gen_axi_rvalid,
                TDATA                 => internal_signals_gen(i).tdata,
                TVALID                => internal_signals_gen(i).tvalid,
                TREADY                => internal_signals_gen(i).tready,
                TLAST                 => internal_signals_gen(i).tlast,
                TUSER                 => internal_signals_gen(i).tuser
            );
    end generate;

	    internal_signals_gen(0).s_gen_axi_awaddr    <= S_GEN_0_AXI_AWADDR;
        internal_signals_gen(0).s_gen_axi_awvalid   <= S_GEN_0_AXI_AWVALID;
        S_GEN_0_AXI_AWREADY                         <= internal_signals_gen(0).s_gen_axi_awready;
        internal_signals_gen(0).s_gen_axi_wdata     <= S_GEN_0_AXI_WDATA;
        internal_signals_gen(0).s_gen_axi_wstrb     <= S_GEN_0_AXI_WSTRB;
        internal_signals_gen(0).s_gen_axi_wvalid    <= S_GEN_0_AXI_WVALID;
        S_GEN_0_AXI_WREADY                          <= internal_signals_gen(0).s_gen_axi_wready;
        internal_signals_gen(0).s_gen_axi_bready    <= S_GEN_0_AXI_BREADY;
        S_GEN_0_AXI_BRESP                           <= internal_signals_gen(0).s_gen_axi_bresp;
        S_GEN_0_AXI_BVALID                          <= internal_signals_gen(0).s_gen_axi_bvalid;
        internal_signals_gen(0).s_gen_axi_araddr    <= S_GEN_0_AXI_ARADDR;
        internal_signals_gen(0).s_gen_axi_arvalid   <= S_GEN_0_AXI_ARVALID;
        S_GEN_0_AXI_ARREADY                         <= internal_signals_gen(0).s_gen_axi_arready;
        internal_signals_gen(0).s_gen_axi_rready    <= S_GEN_0_AXI_RREADY;
        S_GEN_0_AXI_RDATA                           <= internal_signals_gen(0).s_gen_axi_rdata;
        S_GEN_0_AXI_RRESP                           <= internal_signals_gen(0).s_gen_axi_rresp;
        S_GEN_0_AXI_RVALID                          <= internal_signals_gen(0).s_gen_axi_rvalid;
    
        internal_signals_gen(1).s_gen_axi_awaddr    <= S_GEN_1_AXI_AWADDR;
        internal_signals_gen(1).s_gen_axi_awvalid   <= S_GEN_1_AXI_AWVALID;
        S_GEN_1_AXI_AWREADY                         <= internal_signals_gen(1).s_gen_axi_awready;
        internal_signals_gen(1).s_gen_axi_wdata     <= S_GEN_1_AXI_WDATA;
        internal_signals_gen(1).s_gen_axi_wstrb     <= S_GEN_1_AXI_WSTRB;
        internal_signals_gen(1).s_gen_axi_wvalid    <= S_GEN_1_AXI_WVALID;
        S_GEN_1_AXI_WREADY                          <= internal_signals_gen(1).s_gen_axi_wready;
        internal_signals_gen(1).s_gen_axi_bready    <= S_GEN_1_AXI_BREADY;
        S_GEN_1_AXI_BRESP                           <= internal_signals_gen(1).s_gen_axi_bresp;
        S_GEN_1_AXI_BVALID                          <= internal_signals_gen(1).s_gen_axi_bvalid;
        internal_signals_gen(1).s_gen_axi_araddr    <= S_GEN_1_AXI_ARADDR;
        internal_signals_gen(1).s_gen_axi_arvalid   <= S_GEN_1_AXI_ARVALID;
        S_GEN_1_AXI_ARREADY                         <= internal_signals_gen(1).s_gen_axi_arready;
        internal_signals_gen(1).s_gen_axi_rready    <= S_GEN_1_AXI_RREADY;
        S_GEN_1_AXI_RDATA                           <= internal_signals_gen(1).s_gen_axi_rdata;
        S_GEN_1_AXI_RRESP                           <= internal_signals_gen(1).s_gen_axi_rresp;
        S_GEN_1_AXI_RVALID                          <= internal_signals_gen(1).s_gen_axi_rvalid;
    
        internal_signals_gen(2).s_gen_axi_awaddr    <= S_GEN_2_AXI_AWADDR;
        internal_signals_gen(2).s_gen_axi_awvalid   <= S_GEN_2_AXI_AWVALID;
        S_GEN_2_AXI_AWREADY                         <= internal_signals_gen(2).s_gen_axi_awready;
        internal_signals_gen(2).s_gen_axi_wdata     <= S_GEN_2_AXI_WDATA;
        internal_signals_gen(2).s_gen_axi_wstrb     <= S_GEN_2_AXI_WSTRB;
        internal_signals_gen(2).s_gen_axi_wvalid    <= S_GEN_2_AXI_WVALID;
        S_GEN_2_AXI_WREADY                          <= internal_signals_gen(2).s_gen_axi_wready;
        internal_signals_gen(2).s_gen_axi_bready    <= S_GEN_2_AXI_BREADY;
        S_GEN_2_AXI_BRESP                           <= internal_signals_gen(2).s_gen_axi_bresp;
        S_GEN_2_AXI_BVALID                          <= internal_signals_gen(2).s_gen_axi_bvalid;
        internal_signals_gen(2).s_gen_axi_araddr    <= S_GEN_2_AXI_ARADDR;
        internal_signals_gen(2).s_gen_axi_arvalid   <= S_GEN_2_AXI_ARVALID;
        S_GEN_2_AXI_ARREADY                         <= internal_signals_gen(2).s_gen_axi_arready;
        internal_signals_gen(2).s_gen_axi_rready    <= S_GEN_2_AXI_RREADY;
        S_GEN_2_AXI_RDATA                           <= internal_signals_gen(2).s_gen_axi_rdata;
        S_GEN_2_AXI_RRESP                           <= internal_signals_gen(2).s_gen_axi_rresp;
        S_GEN_2_AXI_RVALID                          <= internal_signals_gen(2).s_gen_axi_rvalid;
    
        internal_signals_gen(3).s_gen_axi_awaddr    <= S_GEN_3_AXI_AWADDR;
        internal_signals_gen(3).s_gen_axi_awvalid   <= S_GEN_3_AXI_AWVALID;
        S_GEN_3_AXI_AWREADY                         <= internal_signals_gen(3).s_gen_axi_awready;
        internal_signals_gen(3).s_gen_axi_wdata     <= S_GEN_3_AXI_WDATA;
        internal_signals_gen(3).s_gen_axi_wstrb     <= S_GEN_3_AXI_WSTRB;
        internal_signals_gen(3).s_gen_axi_wvalid    <= S_GEN_3_AXI_WVALID;
        S_GEN_3_AXI_WREADY                          <= internal_signals_gen(3).s_gen_axi_wready;
        internal_signals_gen(3).s_gen_axi_bready    <= S_GEN_3_AXI_BREADY;
        S_GEN_3_AXI_BRESP                           <= internal_signals_gen(3).s_gen_axi_bresp;
        S_GEN_3_AXI_BVALID                          <= internal_signals_gen(3).s_gen_axi_bvalid;
        internal_signals_gen(3).s_gen_axi_araddr    <= S_GEN_3_AXI_ARADDR;
        internal_signals_gen(3).s_gen_axi_arvalid   <= S_GEN_3_AXI_ARVALID;
        S_GEN_3_AXI_ARREADY                         <= internal_signals_gen(3).s_gen_axi_arready;
        internal_signals_gen(3).s_gen_axi_rready    <= S_GEN_3_AXI_RREADY;
        S_GEN_3_AXI_RDATA                           <= internal_signals_gen(3).s_gen_axi_rdata;
        S_GEN_3_AXI_RRESP                           <= internal_signals_gen(3).s_gen_axi_rresp;
        S_GEN_3_AXI_RVALID                          <= internal_signals_gen(3).s_gen_axi_rvalid;
    
        internal_signals_gen(4).s_gen_axi_awaddr    <= S_GEN_4_AXI_AWADDR;
        internal_signals_gen(4).s_gen_axi_awvalid   <= S_GEN_4_AXI_AWVALID;
        S_GEN_4_AXI_AWREADY                         <= internal_signals_gen(4).s_gen_axi_awready;
        internal_signals_gen(4).s_gen_axi_wdata     <= S_GEN_4_AXI_WDATA;
        internal_signals_gen(4).s_gen_axi_wstrb     <= S_GEN_4_AXI_WSTRB;
        internal_signals_gen(4).s_gen_axi_wvalid    <= S_GEN_4_AXI_WVALID;
        S_GEN_4_AXI_WREADY                          <= internal_signals_gen(4).s_gen_axi_wready;
        internal_signals_gen(4).s_gen_axi_bready    <= S_GEN_4_AXI_BREADY;
        S_GEN_4_AXI_BRESP                           <= internal_signals_gen(4).s_gen_axi_bresp;
        S_GEN_4_AXI_BVALID                          <= internal_signals_gen(4).s_gen_axi_bvalid;
        internal_signals_gen(4).s_gen_axi_araddr    <= S_GEN_4_AXI_ARADDR;
        internal_signals_gen(4).s_gen_axi_arvalid   <= S_GEN_4_AXI_ARVALID;
        S_GEN_4_AXI_ARREADY                         <= internal_signals_gen(4).s_gen_axi_arready;
        internal_signals_gen(4).s_gen_axi_rready    <= S_GEN_4_AXI_RREADY;
        S_GEN_4_AXI_RDATA                           <= internal_signals_gen(4).s_gen_axi_rdata;
        S_GEN_4_AXI_RRESP                           <= internal_signals_gen(4).s_gen_axi_rresp;
        S_GEN_4_AXI_RVALID                          <= internal_signals_gen(4).s_gen_axi_rvalid;
    
        internal_signals_gen(5).s_gen_axi_awaddr    <= S_GEN_5_AXI_AWADDR;
        internal_signals_gen(5).s_gen_axi_awvalid   <= S_GEN_5_AXI_AWVALID;
        S_GEN_5_AXI_AWREADY                         <= internal_signals_gen(5).s_gen_axi_awready;
        internal_signals_gen(5).s_gen_axi_wdata     <= S_GEN_5_AXI_WDATA;
        internal_signals_gen(5).s_gen_axi_wstrb     <= S_GEN_5_AXI_WSTRB;
        internal_signals_gen(5).s_gen_axi_wvalid    <= S_GEN_5_AXI_WVALID;
        S_GEN_5_AXI_WREADY                          <= internal_signals_gen(5).s_gen_axi_wready;
        internal_signals_gen(5).s_gen_axi_bready    <= S_GEN_5_AXI_BREADY;
        S_GEN_5_AXI_BRESP                           <= internal_signals_gen(5).s_gen_axi_bresp;
        S_GEN_5_AXI_BVALID                          <= internal_signals_gen(5).s_gen_axi_bvalid;
        internal_signals_gen(5).s_gen_axi_araddr    <= S_GEN_5_AXI_ARADDR;
        internal_signals_gen(5).s_gen_axi_arvalid   <= S_GEN_5_AXI_ARVALID;
        S_GEN_5_AXI_ARREADY                         <= internal_signals_gen(5).s_gen_axi_arready;
        internal_signals_gen(5).s_gen_axi_rready    <= S_GEN_5_AXI_RREADY;
        S_GEN_5_AXI_RDATA                           <= internal_signals_gen(5).s_gen_axi_rdata;
        S_GEN_5_AXI_RRESP                           <= internal_signals_gen(5).s_gen_axi_rresp;
        S_GEN_5_AXI_RVALID                          <= internal_signals_gen(5).s_gen_axi_rvalid;
    
        internal_signals_gen(6).s_gen_axi_awaddr    <= S_GEN_6_AXI_AWADDR;
        internal_signals_gen(6).s_gen_axi_awvalid   <= S_GEN_6_AXI_AWVALID;
        S_GEN_6_AXI_AWREADY                         <= internal_signals_gen(6).s_gen_axi_awready;
        internal_signals_gen(6).s_gen_axi_wdata     <= S_GEN_6_AXI_WDATA;
        internal_signals_gen(6).s_gen_axi_wstrb     <= S_GEN_6_AXI_WSTRB;
        internal_signals_gen(6).s_gen_axi_wvalid    <= S_GEN_6_AXI_WVALID;
        S_GEN_6_AXI_WREADY                          <= internal_signals_gen(6).s_gen_axi_wready;
        internal_signals_gen(6).s_gen_axi_bready    <= S_GEN_6_AXI_BREADY;
        S_GEN_6_AXI_BRESP                           <= internal_signals_gen(6).s_gen_axi_bresp;
        S_GEN_6_AXI_BVALID                          <= internal_signals_gen(6).s_gen_axi_bvalid;
        internal_signals_gen(6).s_gen_axi_araddr    <= S_GEN_6_AXI_ARADDR;
        internal_signals_gen(6).s_gen_axi_arvalid   <= S_GEN_6_AXI_ARVALID;
        S_GEN_6_AXI_ARREADY                         <= internal_signals_gen(6).s_gen_axi_arready;
        internal_signals_gen(6).s_gen_axi_rready    <= S_GEN_6_AXI_RREADY;
        S_GEN_6_AXI_RDATA                           <= internal_signals_gen(6).s_gen_axi_rdata;
        S_GEN_6_AXI_RRESP                           <= internal_signals_gen(6).s_gen_axi_rresp;
        S_GEN_6_AXI_RVALID                          <= internal_signals_gen(6).s_gen_axi_rvalid;
    
        internal_signals_gen(7).s_gen_axi_awaddr    <= S_GEN_7_AXI_AWADDR;
        internal_signals_gen(7).s_gen_axi_awvalid   <= S_GEN_7_AXI_AWVALID;
        S_GEN_7_AXI_AWREADY                         <= internal_signals_gen(7).s_gen_axi_awready;
        internal_signals_gen(7).s_gen_axi_wdata     <= S_GEN_7_AXI_WDATA;
        internal_signals_gen(7).s_gen_axi_wstrb     <= S_GEN_7_AXI_WSTRB;
        internal_signals_gen(7).s_gen_axi_wvalid    <= S_GEN_7_AXI_WVALID;
        S_GEN_7_AXI_WREADY                          <= internal_signals_gen(7).s_gen_axi_wready;
        internal_signals_gen(7).s_gen_axi_bready    <= S_GEN_7_AXI_BREADY;
        S_GEN_7_AXI_BRESP                           <= internal_signals_gen(7).s_gen_axi_bresp;
        S_GEN_7_AXI_BVALID                          <= internal_signals_gen(7).s_gen_axi_bvalid;
        internal_signals_gen(7).s_gen_axi_araddr    <= S_GEN_7_AXI_ARADDR;
        internal_signals_gen(7).s_gen_axi_arvalid   <= S_GEN_7_AXI_ARVALID;
        S_GEN_7_AXI_ARREADY                         <= internal_signals_gen(7).s_gen_axi_arready;
        internal_signals_gen(7).s_gen_axi_rready    <= S_GEN_7_AXI_RREADY;
        S_GEN_7_AXI_RDATA                           <= internal_signals_gen(7).s_gen_axi_rdata;
        S_GEN_7_AXI_RRESP                           <= internal_signals_gen(7).s_gen_axi_rresp;
        S_GEN_7_AXI_RVALID                          <= internal_signals_gen(7).s_gen_axi_rvalid;
    
        internal_signals_gen(8).s_gen_axi_awaddr    <= S_GEN_8_AXI_AWADDR;
        internal_signals_gen(8).s_gen_axi_awvalid   <= S_GEN_8_AXI_AWVALID;
        S_GEN_8_AXI_AWREADY                         <= internal_signals_gen(8).s_gen_axi_awready;
        internal_signals_gen(8).s_gen_axi_wdata     <= S_GEN_8_AXI_WDATA;
        internal_signals_gen(8).s_gen_axi_wstrb     <= S_GEN_8_AXI_WSTRB;
        internal_signals_gen(8).s_gen_axi_wvalid    <= S_GEN_8_AXI_WVALID;
        S_GEN_8_AXI_WREADY                          <= internal_signals_gen(8).s_gen_axi_wready;
        internal_signals_gen(8).s_gen_axi_bready    <= S_GEN_8_AXI_BREADY;
        S_GEN_8_AXI_BRESP                           <= internal_signals_gen(8).s_gen_axi_bresp;
        S_GEN_8_AXI_BVALID                          <= internal_signals_gen(8).s_gen_axi_bvalid;
        internal_signals_gen(8).s_gen_axi_araddr    <= S_GEN_8_AXI_ARADDR;
        internal_signals_gen(8).s_gen_axi_arvalid   <= S_GEN_8_AXI_ARVALID;
        S_GEN_8_AXI_ARREADY                         <= internal_signals_gen(8).s_gen_axi_arready;
        internal_signals_gen(8).s_gen_axi_rready    <= S_GEN_8_AXI_RREADY;
        S_GEN_8_AXI_RDATA                           <= internal_signals_gen(8).s_gen_axi_rdata;
        S_GEN_8_AXI_RRESP                           <= internal_signals_gen(8).s_gen_axi_rresp;
        S_GEN_8_AXI_RVALID                          <= internal_signals_gen(8).s_gen_axi_rvalid;



        gen_data_link_tx: for i in 0 to 8 generate
            axis_aclk_tx_dl(i)                  <= clk;
            axis_arstn_tx_dl(i)                 <= rst_n;
            internal_signals_gen(i).tready      <= axis_tready_tx_dl(i);
            axis_tdata_tx_dl(i)                 <= internal_signals_gen(i).tdata;
            axis_tuser_tx_dl(i)                 <= internal_signals_gen(i).tuser;
            axis_tlast_tx_dl(i)                 <= internal_signals_gen(i).tlast;
            axis_tvalid_tx_dl(i)                <= internal_signals_gen(i).tvalid;
        end generate;

        gen_data_link_rx: for i in 0 to 8 generate
            axis_aclk_rx_dl(i)                  <= clk;
            axis_arstn_rx_dl(i)                 <= rst_n;
            axis_tready_rx_dl(i)                <=internal_signals_ana(i).tready;
            internal_signals_ana(i).tdata       <=axis_tdata_rx_dl(i);
            internal_signals_ana(i).tuser       <=axis_tuser_rx_dl(i);
            internal_signals_ana(i).tlast       <=axis_tlast_rx_dl(i);
            internal_signals_ana(i).tvalid      <=axis_tvalid_rx_dl(i);
        end generate;


-- Instantiation of the spacefibre_light_top module
spacefibre_instance : spacefibre_light_top
generic map(
    G_VC_NUM                         => 8,                                    --! Number of virtual channel
    G_TARGET                         => G_TARGET_TOP
    )
port map (
    RST_N                            => rst_dut_n,
    CLK                              => clk,
    CLK_TX                           => clk_tx,
    RST_TXCLK_N                      => rst_txclk_n,
    CLK_REF_N                        => CLK_HSSL_N,                        
    CLK_REF_P                        => CLK_HSSL_P,
    TX_POS                           => TX_POS,
    TX_NEG                           => TX_NEG,
    RX_POS                           => RX_POS,
    RX_NEG                           => RX_NEG,
    AXIS_ARSTN_TX_DL                 => axis_arstn_tx_dl,
    AXIS_ACLK_TX_DL                  => axis_aclk_tx_dl,
    AXIS_TREADY_TX_DL                => axis_tready_tx_dl,
    AXIS_TDATA_TX_DL                 => axis_tdata_tx_dl,
    AXIS_TUSER_TX_DL                 => axis_tuser_tx_dl,
    AXIS_TLAST_TX_DL                 => axis_tlast_tx_dl,
    AXIS_TVALID_TX_DL                => axis_tvalid_tx_dl,
    AXIS_ARSTN_RX_DL                 => axis_arstn_rx_dl,
    AXIS_ACLK_RX_DL                  => axis_aclk_rx_dl,
    AXIS_TREADY_RX_DL                => axis_tready_rx_dl,
    AXIS_TDATA_RX_DL                 => axis_tdata_rx_dl,
    AXIS_TUSER_RX_DL                 => axis_tuser_rx_dl,
    AXIS_TLAST_RX_DL                 => axis_tlast_rx_dl,
    AXIS_TVALID_RX_DL                => axis_tvalid_rx_dl,
    CURRENT_TIME_SLOT_NW             => "00000000",

    INTERFACE_RESET                  => interface_rst,
    LINK_RESET                       => link_rst,
    LINK_RST_ASSERTED                => link_rst_asserted,
    NACK_RST_EN                      => nack_rst_en,
    NACK_RST_MODE                    => nack_rst_mode,
    PAUSE_VC                         => pause_vc,
    CONTINUOUS_VC                    => continuous_vc,
    RESET_PARAM                      => reset_param_dl,

    NACK_SEQ_NUM                     => nack_seq_num_i,
    ACK_SEQ_NUM                      => ack_seq_num_i,

    INPUT_BUF_OVF_VC                 => input_buffer_ovfl,
    SEQ_NUMBER_TX                    => seq_number_tx,
    SEQ_NUMBER_RX                    => seq_number_rx,
    CREDIT_VC                        => vc_credit,
    FCT_CREDIT_OVERFLOW              => fct_credit_overflow,
    CRC_LONG_ERROR                   => crc_long_error,
    CRC_SHORT_ERROR                  => crc_short_error,
    FRAME_ERROR                      => frame_error,
    SEQUENCE_ERROR                   => sequence_error,
    FAR_END_LINK_RESET               => far_end_link_rst,
    FRAME_FINISHED                   => frame_finished,
    FRAME_TX                         => frame_tx,
    DATA_COUNTER_TX                  => data_counter_tx,
    DATA_COUNTER_RX                  => data_counter_rx,
    ACK_COUNTER_TX                   => ack_counter_tx,
    NACK_COUNTER_TX                  => nack_counter_tx,
    FCT_COUNTER_TX                   => fct_counter_tx,
    ACK_COUNTER_RX                   => ack_counter_rx,
    NACK_COUNTER_RX                  => nack_counter_rx,
    FCT_COUNTER_RX                   => fct_counter_rx,
    FULL_COUNTER_RX                  => full_counter_rx,
    RETRY_COUNTER_RX                 => retry_counter_rx,
    CURRENT_TIME_SLOT                => current_time_slot_i,

    --interface spy and injector
    ENABLE_INJ                       => enable_inj,
    DATA_TX_INJ                      => data_tx_ppl,
    CAPABILITY_TX_INJ                => capability_tx_ppl,
    NEW_DATA_TX_INJ                  => new_data_tx_ppl,
    VALID_K_CHARAC_TX_INJ            => valid_k_charac_tx_ppl,
    FIFO_TX_FULL_INJ                 => fifo_tx_full_ppl,
    LANE_RESET_INJ                   => lane_reset_dl,

    ENABLE_SPY                       => enable_spy,
    FIFO_RX_RD_EN_SPY                => fifo_rx_rd_en_ppl,
    DATA_RX_SPY                      => data_rx_ppl,
    FIFO_RX_EMPTY_SPY                => fifo_rx_empty_ppl,
    FIFO_RX_DATA_VALID_SPY           => fifo_rx_data_valid_ppl,
    VALID_K_CHARAC_RX_SPY            => valid_k_charac_rx_ppl,

    LANE_START                       => lane_start,
    AUTOSTART                        => autostart,
    LANE_RESET                       => lane_reset,
    PARALLEL_LOOPBACK_EN             => parallel_loopback_en,
    STANDBY_REASON                   => standby_reason,
    NEAR_END_SERIAL_LB_EN            => near_end_serial_lb_en,
    FAR_END_SERIAL_LB_EN             => far_end_serial_lb_en,

    LANE_STATE                       => lane_state,
    RX_ERROR_CNT                     => rx_error_cnt,
    RX_ERROR_OVF                     => rx_error_ovf,
    LOSS_SIGNAL                      => loss_signal,
    FAR_END_CAPA                     => far_end_capa,
    RX_POLARITY                      => rx_polarity
);

end Behavioral;

