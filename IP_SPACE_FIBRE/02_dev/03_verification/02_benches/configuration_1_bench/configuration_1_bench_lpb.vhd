--------------------------------------------------------------------------
-- COMPANY       : ELSYS Design
--------------------------------------------------------------------------
-- TITLE         : configuration_1_bench_lpb.vhd
-- PROJECT       : SPACE FIBRE LIGHT
--------------------------------------------------------------------------
-- AUTHOR        : Yvan DAURIAC
-- CREATED       : 31/10/2024
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


library phy_plus_lane_lib;
use phy_plus_lane_lib.pkg_phy_plus_lane.all;

library commun;
use commun.all;

------------------------------------------------------------------------------------------------------------------
--                                                      ENTITY                                                  --
------------------------------------------------------------------------------------------------------------------
entity CONFIGURATION_1_BENCH_LPB is
    generic(
       G_ADDR_WIDTH : positive := C_AXI_ADDR_WIDTH;                              -- Generic for AXI address width
       G_DATA_WIDTH : positive := C_AXI_DATA_WIDTH                               -- Generic for AXI data width
    );
    port(
       -- Clock and reset
       ------------------
       CLK                       : in std_logic;                                         -- Clock signal
       RST_N                     : in std_logic;                                         -- Reset active low signal
        -- FROM/TO Outside
        ---------------------
       TX_POS                    : out std_logic;                                        -- Positive LVDS serial data send
       TX_NEG                    : out std_logic;                                        -- Negative LVDS serial data send
       RX_POS                    : in  std_logic;                                        -- Positive LVDS serial data received
       RX_NEG                    : in  std_logic;                                        -- Negative LVDS serial data received
       -- AXI4 Lite lane_configurator interface
       ---------------------------------------
           -- Write Address channel (AW)
       S_CON_AXI_AWADDR          : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);         -- Write address from master to slave
       S_CON_AXI_AWVALID         : in std_logic;                                         -- Master asserts when write address is valid
       S_CON_AXI_AWREADY         : out std_logic;                                        -- Slave ready to accept write address
           -- Write Data channel (W)
       S_CON_AXI_WDATA           : in std_logic_vector(G_DATA_WIDTH-1 downto 0);         -- Write data from master
       S_CON_AXI_WSTRB           : in std_logic_vector(3 downto 0);                      -- Write strobe, indicates active byte lanes
       S_CON_AXI_WVALID          : in std_logic;                                         -- Master asserts when write data is valid
       S_CON_AXI_WREADY          : out std_logic;                                        -- Slave ready to accept write data
           -- Write Response channel (B)
       S_CON_AXI_BREADY          : in std_logic;                                         -- Master ready to receive write response
       S_CON_AXI_BRESP           : out std_logic_vector(1 downto 0);                     -- Write response from slave (OKAY or ERROR)
       S_CON_AXI_BVALID          : out std_logic;                                        -- Slave asserts when write response is valid
           --Read Address channel (AR)
       S_CON_AXI_ARADDR          : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);         -- Read address from master to slave
       S_CON_AXI_ARVALID         : in std_logic;                                         -- Master asserts when read address is valid
       S_CON_AXI_ARREADY         : out std_logic;                                        -- Slave ready to accept read address
           -- Read channel (R)
       S_CON_AXI_RREADY          : in std_logic;                                         -- Master ready to receive read data
       S_CON_AXI_RDATA           : out std_logic_vector(G_DATA_WIDTH-1 downto 0);        -- Read data from slave to master
       S_CON_AXI_RRESP           : out std_logic_vector(1 downto 0);                     -- Read response (OKAY or ERROR)
       S_CON_AXI_RVALID          : out std_logic;                                        -- Slave asserts when read data is valid
       -- AXI4 Lite lane_generator interface
       ---------------------------------------
       -- Write Address channel (AW)
       S_GEN_AXI_AWADDR          : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);         -- Write address from master to slave
       S_GEN_AXI_AWVALID         : in std_logic;                                         -- Master asserts when write address is valid
       S_GEN_AXI_AWREADY         : out std_logic;                                        -- Slave ready to accept write address
           -- Write Data channel (W)
       S_GEN_AXI_WDATA           : in std_logic_vector(G_DATA_WIDTH-1 downto 0);         -- Write data from master
       S_GEN_AXI_WSTRB           : in std_logic_vector(3 downto 0);                      -- Write strobe, indicates active byte lanes
       S_GEN_AXI_WVALID          : in std_logic;                                         -- Master asserts when write data is valid
       S_GEN_AXI_WREADY          : out std_logic;                                        -- Slave ready to accept write data
           -- Write Response channel (B)
       S_GEN_AXI_BREADY          : in std_logic;                                         -- Master ready to receive write response
       S_GEN_AXI_BRESP           : out std_logic_vector(1 downto 0);                     -- Write response from slave (OKAY or ERROR)
       S_GEN_AXI_BVALID          : out std_logic;                                        -- Slave asserts when write response is valid
           --Read Address channel (AR)
       S_GEN_AXI_ARADDR          : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);         -- Read address from master to slave
       S_GEN_AXI_ARVALID         : in std_logic;                                         -- Master asserts when read address is valid
       S_GEN_AXI_ARREADY         : out std_logic;                                        -- Slave ready to accept read address
           -- Read channel (R)
       S_GEN_AXI_RREADY          : in std_logic;                                         -- Master ready to receive read data
       S_GEN_AXI_RDATA           : out std_logic_vector(G_DATA_WIDTH-1 downto 0);        -- Read data from slave to master
       S_GEN_AXI_RRESP           : out std_logic_vector(1 downto 0);                     -- Read response (OKAY or ERROR)
       S_GEN_AXI_RVALID          : out std_logic;                                        -- Slave asserts when read data is valid
       -- AXI4 Lite lane_analyzer interface
       ---------------------------------------
       -- Write Address channel (AW)
       S_ANA_AXI_AWADDR          : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);         -- Write address from master to slave
       S_ANA_AXI_AWVALID         : in std_logic;                                         -- Master asserts when write address is valid
       S_ANA_AXI_AWREADY         : out std_logic;                                        -- Slave ready to accept write address
           -- Write Data channel (W)
       S_ANA_AXI_WDATA           : in std_logic_vector(G_DATA_WIDTH-1 downto 0);         -- Write data from master
       S_ANA_AXI_WSTRB           : in std_logic_vector(3 downto 0);                      -- Write strobe, indicates active byte lanes
       S_ANA_AXI_WVALID          : in std_logic;                                         -- Master asserts when write data is valid
       S_ANA_AXI_WREADY          : out std_logic;                                        -- Slave ready to accept write data
           -- Write Response channel (B)
       S_ANA_AXI_BREADY          : in std_logic;                                         -- Master ready to receive write response
       S_ANA_AXI_BRESP           : out std_logic_vector(1 downto 0);                     -- Write response from slave (OKAY or ERROR)
       S_ANA_AXI_BVALID          : out std_logic;                                        -- Slave asserts when write response is valid
           --Read Address channel (AR)
       S_ANA_AXI_ARADDR          : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);         -- Read address from master to slave
       S_ANA_AXI_ARVALID         : in std_logic;                                         -- Master asserts when read address is valid
       S_ANA_AXI_ARREADY         : out std_logic;                                        -- Slave ready to accept read address
           -- Read channel (R)
       S_ANA_AXI_RREADY          : in std_logic;                                         -- Master ready to receive read data
       S_ANA_AXI_RDATA           : out std_logic_vector(G_DATA_WIDTH-1 downto 0);        -- Read data from slave to master
       S_ANA_AXI_RRESP           : out std_logic_vector(1 downto 0);                     -- Read response (OKAY or ERROR)
       S_ANA_AXI_RVALID          : out std_logic                                         -- Slave asserts when read data is valid
    );
end CONFIGURATION_1_BENCH_LPB;

architecture rtl of CONFIGURATION_1_BENCH_LPB is

  component FIFO_SC is
      generic (
         G_DWIDTH       : integer := 8;                                                  -- Largeur du bus de donnee
         G_DEPTH        : integer := 256;                                                -- Profondeur memoire de la FIFO
         G_DEPTH_SIZE   : integer := 8;
         G_FWFT         : integer range 0 to 1 := 0                                      -- Donnee directement presente en sortie FIRST_WORD_FALL_THROUGH
      );
      port (
         CLK            : in    std_logic;                                               -- Horloge systeme
         RESET_N        : in    std_logic;                                               -- Reset asyncrhone actif niveau bas
   
         WR             : in    std_logic;                                               -- Commande d'ecriture FIFO
         DATA_IN        : in    std_logic_vector(G_DWIDTH-1 downto 0);                   -- Donnee d'entree
   
         RD             : in    std_logic;                                               -- Commande de lecture FIFO
         DATA_OUT       : out   std_logic_vector(G_DWIDTH-1 downto 0);                   -- Donnee de sortie
   
         THRESHOLD_HIGH : in    std_logic_vector(G_DEPTH_SIZE-1 downto 0);               -- Seuil programme niveau haut de la FIFO
         THRESHOLD_LOW  : in    std_logic_vector(G_DEPTH_SIZE-1 downto 0);               -- Seuil programme niveau bas de la FIFO
   
         ALMOST_FULL    : out   std_logic;                                               -- Niveau de haut du seuil programme de la FIFO atteint
         ALMOST_EMPTY   : out   std_logic;                                               -- Niveau de bas du seuil programme de la FIFO atteint
         LEVEL          : out   std_logic_vector(G_DEPTH_SIZE-1 downto 0);               -- Niveau de remplissage de la FIFO
         FULL           : out   std_logic;                                               -- FIFO pleine
         EMPTY          : out   std_logic                                                -- FIFO vide
      );
   end component;



   ---------------------------------------
   -- SIGNAL DECLARATION
   ---------------------------------------
   -- lane _configurator
   -- to the LANE
   signal lane_start            : std_logic;                                          -- SpaceFibre lane start initialization signal
   signal autostart             : std_logic;                                          -- Enables communication lane to initialize automatically when a link is established
   signal lane_reset            : std_logic;                                          -- Reset Lane layer signal
   signal parallel_loopback_en  : std_logic;                                          -- Parallel loopback enables signal
   signal standby_reason        : std_logic_vector(C_STDBYREASON_WIDTH-1 downto 0);   -- Standby reason field
   -- to the PHY
   signal near_end_serial_lb_en : std_logic;                                          -- Near-End Serial Loopback
   signal far_end_serial_lb_en  : std_logic;                                          -- Far -End Serial Loopback
   -- from the LANE
   signal lane_state            : std_logic_vector(C_LANESTATE_WIDTH-1 downto 0);     -- Lane state field
   signal rx_error_cnt          : std_logic_vector(C_RX_ERR_CNT_WIDTH-1 downto 0);    -- RX Error Counter
   signal rx_error_ovf          : std_logic;                                          -- RX Error Overflow
   signal loss_signal           : std_logic;                                          -- Far-end lost Signal
   signal far_end_capa          : std_logic_vector(C_FAR_CAPA_WIDTH-1 downto 0);      -- Far-end Capablities
   signal rx_polarity           : std_logic;                                          -- RX Polarity
   -- lane generator
   -- to the LANE
   signal data_tx               : std_logic_vector(C_INTERNAL_BUS_WIDTH -1 downto 0); -- Data bus to the lane layer
   signal lane_reset_dl         : std_logic;                                          -- Lane Reset to the lane layer
   -- lane analyzer
   -- from the LANE
   signal data_rx               : std_logic_vector(C_INTERNAL_BUS_WIDTH -1 downto 0); -- Data bus from the lane layer
   signal capability_tx_ppl     : std_logic_vector(07 downto 00);                     -- Capability send on TX link in INIT3 control word
   signal new_data_tx_ppl       : std_logic;                                          -- Flag to write data in FIFO TX
   signal valid_k_charac_tx_ppl : std_logic_vector(03 downto 00);                     -- K charachter valid in the 32-bit DATA_TX_PPL vector
   signal fifo_rx_rd_en_ppl     : std_logic;                                          -- Flag to read data in FIFO RX
   signal fifo_tx_full_ppl      : std_logic;                                          -- Flag full of the FIFO TX
   signal fifo_rx_empty_ppl     : std_logic;                                          -- Flag EMPTY of the FIFO RX
   signal valid_k_charac_rx_ppl : std_logic_vector(03 downto 00);                     -- K charachter valid in the 32-bit DATA_TR_PPL vector
   signal rst                   : std_logic;                                          -- RST fifo
   signal fifo_data_tx          : std_logic_vector(36 -1 downto 0);                   -- K charachter valid in the 32-bit DATA_TX_PPL vector
   signal fifo_data_rx          : std_logic_vector(36 -1 downto 0);                   -- K charachter valid in the 32-bit DATA_TX_PPL vector
   signal fifo_rx_data_vld      : std_logic;                                          -- Data Valid flag from fifo_rx
begin
   ---------------------------------------------------------------------------
   -- ASSIGNATION
   ---------------------------------------------------------------------------
    rst <= not(RST_N);
    fifo_data_tx         <= valid_k_charac_tx_ppl & data_tx;
    valid_k_charac_rx_ppl <=  fifo_data_rx(35 downto 32);
    data_rx               <=  fifo_data_rx(31 downto 0);
   ---------------------------------------------------------------------------
   -- INSTANCE: I_LANE_CONFIGURATOR
   -- Description : Lane configurator model
   ---------------------------------------------------------------------------
    I_LANE_CONFIGURATOR: entity work.LANE_CONFIGURATOR
	port map (
	   CLK                  =>  CLK,
	   RST_N                =>  RST_N,
	   S_AXI_AWADDR         =>  S_CON_AXI_AWADDR,
	   S_AXI_AWVALID        =>  S_CON_AXI_AWVALID,
	   S_AXI_AWREADY        =>  S_CON_AXI_AWREADY,
	   S_AXI_WDATA          =>  S_CON_AXI_WDATA,
	   S_AXI_WSTRB          =>  S_CON_AXI_WSTRB,
	   S_AXI_WVALID         =>  S_CON_AXI_WVALID,
	   S_AXI_WREADY         =>  S_CON_AXI_WREADY,
	   S_AXI_BREADY         =>  S_CON_AXI_BREADY,
	   S_AXI_BRESP          =>  S_CON_AXI_BRESP,
	   S_AXI_BVALID         =>  S_CON_AXI_BVALID,
	   S_AXI_ARADDR         =>  S_CON_AXI_ARADDR,
	   S_AXI_ARVALID        =>  S_CON_AXI_ARVALID,
	   S_AXI_ARREADY        =>  S_CON_AXI_ARREADY,
	   S_AXI_RREADY         =>  S_CON_AXI_RREADY,
	   S_AXI_RDATA          =>  S_CON_AXI_RDATA,
	   S_AXI_RRESP          =>  S_CON_AXI_RRESP,
	   S_AXI_RVALID         =>  S_CON_AXI_RVALID,
	   -- LANE + PHY interface
       ---------------------------------------
       -- to the LANE
	   LANE_START           => lane_start,
	   AUTOSTART            => autostart,
	   LANE_RESET           => lane_reset,
	   PARALLEL_LOOPBACK_EN => parallel_loopback_en,
	   STANDBY_REASON       => standby_reason,
       -- to the PHY
	   NEAR_END_SERIAL_LB_EN => near_end_serial_lb_en,
	   FAR_END_SERIAL_LB_EN  => far_end_serial_lb_en,
       -- from the LANE
	   LANE_STATE           => lane_state,
	   RX_ERROR_CNT         => rx_error_cnt,
	   RX_ERROR_OVF         => rx_error_ovf,
	   LOSS_SIGNAL          => loss_signal,
	   FAR_END_CAPA         => far_end_capa,
	   RX_POLARITY          => rx_polarity
	);
   ---------------------------------------------------------------------------
   -- INSTANCE: I_LANE_GENERATOR
   -- Description : Lane generator model
   ---------------------------------------------------------------------------
    I_LANE_GENERATOR: entity work.LANE_GENERATOR
	port map (
	   CLK             =>  CLK,
	   RST_N           =>  RST_N,
	   S_AXI_AWADDR    =>  S_GEN_AXI_AWADDR,
	   S_AXI_AWVALID   =>  S_GEN_AXI_AWVALID,
	   S_AXI_AWREADY   =>  S_GEN_AXI_AWREADY,
	   S_AXI_WDATA     =>  S_GEN_AXI_WDATA,
	   S_AXI_WSTRB     =>  S_GEN_AXI_WSTRB,
	   S_AXI_WVALID    =>  S_GEN_AXI_WVALID,
	   S_AXI_WREADY    =>  S_GEN_AXI_WREADY,
	   S_AXI_BREADY    =>  S_GEN_AXI_BREADY,
	   S_AXI_BRESP     =>  S_GEN_AXI_BRESP,
	   S_AXI_BVALID    =>  S_GEN_AXI_BVALID,
	   S_AXI_ARADDR    =>  S_GEN_AXI_ARADDR,
	   S_AXI_ARVALID   =>  S_GEN_AXI_ARVALID,
	   S_AXI_ARREADY   =>  S_GEN_AXI_ARREADY,
	   S_AXI_RREADY    =>  S_GEN_AXI_RREADY,
	   S_AXI_RDATA     =>  S_GEN_AXI_RDATA,
	   S_AXI_RRESP     =>  S_GEN_AXI_RRESP,
	   S_AXI_RVALID    =>  S_GEN_AXI_RVALID,
	   -- LANE interface
       ---------------------------------------
	   DATA_TX               => data_tx,
       NEW_DATA_TX_PPL       => new_data_tx_ppl,
       FIFO_TX_FULL_PPL      => fifo_tx_full_ppl,
       LANE_RESET_DL         => lane_reset_dl,
       VALID_K_CHARAC_TX_PPL => valid_k_charac_tx_ppl
	);
   ---------------------------------------------------------------------------
   -- INSTANCE: I_LANE_ANALYZER
   -- Description : Lane analyzer model
   ---------------------------------------------------------------------------
   I_LANE_ANALYZER: entity work.LANE_ANALYZER
   port map (
      CLK             =>  CLK,
      RST_N           =>  RST_N,
      S_AXI_AWADDR    =>  S_ANA_AXI_AWADDR,
      S_AXI_AWVALID   =>  S_ANA_AXI_AWVALID,
      S_AXI_AWREADY   =>  S_ANA_AXI_AWREADY,
      S_AXI_WDATA     =>  S_ANA_AXI_WDATA,
      S_AXI_WSTRB     =>  S_ANA_AXI_WSTRB,
      S_AXI_WVALID    =>  S_ANA_AXI_WVALID,
      S_AXI_WREADY    =>  S_ANA_AXI_WREADY,
      S_AXI_BREADY    =>  S_ANA_AXI_BREADY,
      S_AXI_BRESP     =>  S_ANA_AXI_BRESP,
      S_AXI_BVALID    =>  S_ANA_AXI_BVALID,
      S_AXI_ARADDR    =>  S_ANA_AXI_ARADDR,
      S_AXI_ARVALID   =>  S_ANA_AXI_ARVALID,
      S_AXI_ARREADY   =>  S_ANA_AXI_ARREADY,
      S_AXI_RREADY    =>  S_ANA_AXI_RREADY,
      S_AXI_RDATA     =>  S_ANA_AXI_RDATA,
      S_AXI_RRESP     =>  S_ANA_AXI_RRESP,
      S_AXI_RVALID    =>  S_ANA_AXI_RVALID,
      -- LANE interface
      ---------------------------------------
      DATA_RX               => data_rx,
      VALID_K_CHARAC_RX_PPL => valid_k_charac_rx_ppl,
      FIFO_RX_EMPTY_PPL     => fifo_rx_empty_ppl,
      FIFO_RX_RD_EN_PPL     => fifo_rx_rd_en_ppl
   );
   ---------------------------------------------------------------------------
   -- INSTANCE: I_FIFO_lpb
   -- Description : Lane configurator model
   ---------------------------------------------------------------------------
   I_FIFO : FIFO_SC
   generic map(
       G_DWIDTH       => C_DWIDTH,
       G_DEPTH        => 1024,
       G_DEPTH_SIZE   => C_AWIDTH,
       G_FWFT         => 0
    )
   port map (
      RESET_N                 => RST_N,
      CLK                     => clk,
      -- write port
      DATA_IN                 => fifo_data_tx,
      WR                      => new_data_tx_ppl,
      FULL             => fifo_tx_full_ppl,
      -- read port
      DATA_OUT                 => fifo_data_rx,
      RD              => fifo_rx_rd_en_ppl,
      EMPTY            => fifo_rx_empty_ppl,
      -- Status port
      THRESHOLD_HIGH => (others => '1'),
      THRESHOLD_LOW  => (others => '0'),
      LEVEL          => open,
      ALMOST_FULL    => open,
      ALMOST_EMPTY   => open
   );

end architecture;