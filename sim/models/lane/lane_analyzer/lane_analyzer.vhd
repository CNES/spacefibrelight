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
-- TITLE         : lane_analyzer.vhd
-- PROJECT       : SPACE FIBRE LIGHT
--------------------------------------------------------------------------
-- AUTHOR        : ELSYS Design (Yvan DAURIAC)
-- CREATED       : 14/09/2024
--------------------------------------------------------------------------
-- DESCRIPTION   : Model able to analyze data from the lane layer
--------------------------------------------------------------------------
-- History       : V1.0: Creation of the file
--------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_model.all;
------------------------------------------------------------------------------------------------------------------
--                                                      ENTITY                                                  --
------------------------------------------------------------------------------------------------------------------
entity LANE_ANALYZER is
   generic(
      G_ADDR_WIDTH : positive := C_AXI_ADDR_WIDTH;                                     -- Generic for AXI address width
      G_DATA_WIDTH : positive := C_AXI_DATA_WIDTH                                      -- Generic for AXI data width
   );
   port(
      -- Clock and reset
      ------------------
      CLK                   : in std_logic;                                            -- Clock signal
      RST_N                 : in std_logic;                                            -- Reset active low signal
      -- AXI4 Lite slave interface
      ---------------------------------------
          -- Write Address channel (AW)
      S_AXI_AWADDR          : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);            -- Write address from master to slave
      S_AXI_AWVALID         : in std_logic;                                            -- Master asserts when write address is valid
      S_AXI_AWREADY         : out std_logic;                                           -- Slave ready to accept write address
          -- Write Data channel (W)
      S_AXI_WDATA           : in std_logic_vector(G_DATA_WIDTH-1 downto 0);            -- Write data from master
      S_AXI_WSTRB           : in std_logic_vector(3 downto 0);                         -- Write strobe, indicates active byte lanes
      S_AXI_WVALID          : in std_logic;                                            -- Master asserts when write data is valid
      S_AXI_WREADY          : out std_logic;                                           -- Slave ready to accept write data
          -- Write Response channel (B)
      S_AXI_BREADY          : in std_logic;                                            -- Master ready to receive write response
      S_AXI_BRESP           : out std_logic_vector(1 downto 0);                        -- Write response from slave (OKAY or ERROR)
      S_AXI_BVALID          : out std_logic;                                           -- Slave asserts when write response is valid
          --Read Address channel (AR)
      S_AXI_ARADDR          : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);            -- Read address from master to slave
      S_AXI_ARVALID         : in std_logic;                                            -- Master asserts when read address is valid
      S_AXI_ARREADY         : out std_logic;                                           -- Slave ready to accept read address
          -- Read channel (R)
      S_AXI_RREADY          : in std_logic;                                            -- Master ready to receive read data
      S_AXI_RDATA           : out std_logic_vector(G_DATA_WIDTH-1 downto 0);           -- Read data from slave to master
      S_AXI_RRESP           : out std_logic_vector(1 downto 0);                        -- Read response (OKAY or ERROR)
      S_AXI_RVALID          : out std_logic;                                           -- Slave asserts when read data is valid
      -- LANE interface
      ---------------------------------------
      DATA_RX                : in std_logic_vector(C_INTERNAL_BUS_WIDTH -1 downto 0);  -- Data bus from the lane layer
      VALID_K_CHARAC_RX_PPL  : in std_logic_vector(C_VALID_K_WIDTH-1 downto 0);        -- K charachter valid in the 32-bit DATA_TR_PPL vector
      FIFO_RX_EMPTY_PPL      : in std_logic;                                           -- Flag EMPTY of the FIFO RX
      FIFO_RX_DATA_VALID_PPL : in std_logic;                                           -- Flag DATA_VALID of the FIFO RX
      FIFO_RX_RD_EN_PPL      : out std_logic;                                          -- Flag to read data in FIFO RX
      FAR_END_CAPA_DL        : in std_logic_vector(C_LA_LANE_CAPA_WIDTH-1  downto 0)  -- Capability field receive in INIT3 control word
   );
end LANE_ANALYZER;
------------------------------------------------------------------------------------------------------------------
--                                                  ARCHITECTURE                                                --
------------------------------------------------------------------------------------------------------------------
architecture rtl of LANE_ANALYZER is
---------------------------------------
-- TYPES
---------------------------------------
   type axi_wr_state_t       is (IDLE_WAIT_WR_ADDR, WR_RESPONSE);                             -- Write states for FSM declaration
   type axi_rd_state_t       is (IDLE_WAIT_RD_ADDR, RD_RESPONSE);                             -- Read states for FSM declaration
   type generation_state_t   is (IDLE, WAIT_NOT_EMPTY, WAIT_FRAME, ANALYZE, WAIT_SKIP, DELAY, END_TEST); -- generation data states for FSM declaration
   type control_word_state_t is (IDLE, WAIT_CONTROL_WORD, ANA_CONTROL_WORD, DELAY, END_TEST); -- Control word states for FSM declaration
   type rxerr_state_t        is (IDLE, WAIT_RXERR, ANA_RXERR, DELAY, END_TEST);               -- RXERR states for FSM declaration
---------------------------------------
-- SIGNAL DECLARATION
---------------------------------------
   signal axi_wr_state                : axi_wr_state_t;
   signal axi_rd_state                : axi_rd_state_t;
   signal generation_state            : generation_state_t;
   signal control_word_state          : control_word_state_t;
   signal rxerr_state                 : rxerr_state_t;
   -- Registers
   ------------
   signal reg_la_config               : std_logic_vector(G_DATA_WIDTH-1 downto 0);          -- lane_analyzer configuration register
   signal reg_la_control              : std_logic_vector(G_DATA_WIDTH-1 downto 0);          -- lane_analyzer control register
   signal reg_la_status               : std_logic_vector(G_DATA_WIDTH-1 downto 0);          -- lane_analyzer status register
   signal reg_la_init_val             : std_logic_vector(G_DATA_WIDTH-1 downto 0);          -- lane_analyzer intial value register
   -- Intermediate signals
   -----------------------
   signal frame_number                : unsigned(C_LG_FRAME_NB_WIDTH-1 downto 0);           -- Frame number signal
   signal frame_size                  : unsigned(C_LG_FRAME_SIZE_WIDTH-1 downto 0);         -- Frame size signal
   signal inter_pkt_delay             : unsigned(C_LG_INTER_PKT_DELAY_WIDTH-1 downto 0);    -- Inter-packet delay signal
   signal gen_data                    : std_logic;                                          -- Type of generation data signal
   signal model_start                 : std_logic;                                          -- Start generation data signal
   signal data_mode                   : unsigned(C_LG_DATA_MODE_WIDTH-1 downto 0);          -- Data mode signal
   signal busy                        : std_logic;                                          -- Busy signal
   signal test_end                    : std_logic;                                          -- End of the test signal
   signal err_counter                 : unsigned(C_LA_CNT_ERR_MAX_WIDTH-1 downto 0);        -- Error counter
   -- P_GENERATOR signals
   signal busy_frame                  : std_logic;                                          -- Busy frame signal
   signal test_end_frame              : std_logic;                                          -- End of the test frame signal
   signal err_counter_frame           : unsigned(C_LG_CNT_ERR_MAX_WIDTH-1 downto 0);        -- Error counter frame bus
   signal fifo_rx_rd_en_ppl_frame     : std_logic;                                          -- P_GENERATOR Flag to write data in FIFO TX
   signal init_val                    : unsigned(C_INTERNAL_BUS_WIDTH-1 downto 0);          -- Initial value signal
   signal cnt_frame                   : unsigned(C_LG_FRAME_NB_WIDTH-1 downto 0);           -- Frame counter
   signal cnt_byte                    : unsigned(C_LG_FRAME_SIZE_WIDTH-1 downto 0);         -- Packet counter
   signal mask                        : std_logic_vector(C_INTERNAL_BUS_WIDTH-1 downto 0);  -- Mask for the last packet of a frame
   signal cnt_delay_frame             : unsigned(C_LG_INTER_PKT_DELAY_WIDTH-1 downto 0);    -- Inter-packet delay counter
   signal val_data                    : unsigned(C_INTERNAL_BUS_WIDTH-1 downto 0);          -- Data value incremental generation
   signal prbs_data                   : std_logic_vector(C_INTERNAL_BUS_WIDTH-1 downto 0);  -- Data value PRBS generation
   signal data_verif                  : unsigned(C_INTERNAL_BUS_WIDTH-1 downto 0);          -- Data value incremental generation
   signal cnt_start                   : unsigned((C_INTERNAL_BUS_WIDTH/8)-1 downto 0);      -- Counter before the first packet of a test
   -- P_CONTROL_WORD signals
   signal busy_cont_word              : std_logic;                                          -- Busy control word signal
   signal test_end_cont_word          : std_logic;                                          -- End of the test control word signal
   signal err_counter_cont_word       : unsigned(C_LG_CNT_ERR_MAX_WIDTH-1 downto 0);        -- Error counter control word bus
   signal data_verif_cont_word        : std_logic_vector(C_INTERNAL_BUS_WIDTH -1 downto 0); -- P_CONTROL_WORD Data bus to the lane layer
   signal fifo_rx_rd_en_ppl_cont_word : std_logic;                                          -- P_CONTROL_WORD flag to write data in FIFO TX
   signal cnt_cont_word               : unsigned(3 downto 0);                               -- Counter of control word
   signal cnt_delay_cont_word         : unsigned(C_LG_INTER_PKT_DELAY_WIDTH-1 downto 0);    -- P_WP_CONTROL_WORDRONG_K inter-packet delay counter
   -- P_RXERR signals
   signal busy_rxerr                  : std_logic;                                          -- Busy control word signal
   signal test_end_rxerr              : std_logic;                                          -- End of the test control word signal
   signal err_counter_rxerr           : unsigned(C_LG_CNT_ERR_MAX_WIDTH-1 downto 0);        -- Error counter control word bus
   signal data_verif_rxerr            : std_logic_vector(C_INTERNAL_BUS_WIDTH -1 downto 0); -- P_CONTROL_WORD Data bus to the lane layer
   signal fifo_rx_rd_en_ppl_rxerr     : std_logic;                                          -- P_CONTROL_WORD flag to write data in FIFO TX
   signal cnt_rxerr                   : unsigned(C_LG_FRAME_NB_WIDTH-1 downto 0);                               -- Counter of control word
   signal cnt_delay_rxerr             : unsigned(C_LG_INTER_PKT_DELAY_WIDTH-1 downto 0);    -- P_WP_CONTROL_WORDRONG_K inter-packet delay counter
   signal cnt_data_valid              : unsigned(7-1 downto 0);    

   begin
---------------------------------------
-- SIGNAL CONNECTION
---------------------------------------
   -- busy assingation in function of the data_mode
   busy              <= busy_frame     when data_mode = C_LA_DM_DATA else
                        busy_cont_word when data_mode = C_LA_DM_CONTROL_WORD else
                        busy_rxerr     when data_mode = C_LA_DM_RXERR else
                        '0';
   -- test_end assingation in function of the data_mode
   test_end          <= test_end_frame     when data_mode = C_LA_DM_DATA else
                        test_end_cont_word when data_mode = C_LA_DM_CONTROL_WORD else
                        test_end_rxerr     when data_mode = C_LA_DM_RXERR else
                        '0';
   -- err_counter assingation in function of the data_mode
   err_counter       <= err_counter_frame     when data_mode = C_LA_DM_DATA else
                        err_counter_cont_word when data_mode = C_LA_DM_CONTROL_WORD else
                        err_counter_rxerr     when data_mode = C_LA_DM_RXERR else
                        (others => '0');
   -- NEW_DATA_TX_PPL assingation in function of the data_mode
   FIFO_RX_RD_EN_PPL <= fifo_rx_rd_en_ppl_frame     when data_mode = C_LA_DM_DATA else
                        fifo_rx_rd_en_ppl_cont_word when data_mode = C_LA_DM_CONTROL_WORD else
                        fifo_rx_rd_en_ppl_rxerr     when data_mode = C_LA_DM_RXERR else
                        '0';
---------------------------------------
-- INSTANCIATION
---------------------------------------
---------------------------------------
-- PROCESS
---------------------------------------
   ------------------------------------------
   -- AXI
   ------------------------------------------
   ---------------------------------------------------------------------------
   -- PROCESS: P_AXI_READ
   -- Description : AXI4 Lite reading process
   ---------------------------------------------------------------------------
   P_AXI_READ : process(CLK, RST_N)
   begin
      -- Reset
      if (RST_N ='0') then
         axi_rd_state    <= IDLE_WAIT_RD_ADDR;
         S_AXI_ARREADY   <= '1';               -- Ready for new request
         S_AXI_RRESP     <= "00";              -- OKAY default response
         S_AXI_RDATA     <= (others => '0');   -- Default data at zero
         S_AXI_RVALID    <= '0';               -- Default read validity at zero
      elsif rising_edge(CLK) then
         case axi_rd_state is
            -- Waiting for a read request
            when IDLE_WAIT_RD_ADDR =>
               S_AXI_ARREADY <= '1';     -- Ready for new read request
               if (S_AXI_ARVALID = '1') then
                   S_AXI_ARREADY <= '0'; -- Ready signal deasserted to indicate request processing
                   -- Configuration lane_analyzer register address
                   if (S_AXI_ARADDR(C_SLAVE_ADDR_WIDTH-1 downto 0) = C_ADDR_LA_CONFIG) then
                       S_AXI_RDATA  <= reg_la_config;
                       S_AXI_RRESP  <= "00";
                       S_AXI_RVALID <= '1';
                       axi_rd_state <= RD_RESPONSE;
                   -- Control lane_analyzer register address
                   elsif (S_AXI_ARADDR(C_SLAVE_ADDR_WIDTH-1 downto 0) = C_ADDR_LA_CONTROL) then
                       S_AXI_RDATA  <= reg_la_control;
                       S_AXI_RRESP  <= "00";
                       S_AXI_RVALID <= '1';
                       axi_rd_state <= RD_RESPONSE;
                   -- Status lane_analyzer register address
                   elsif (S_AXI_ARADDR(C_SLAVE_ADDR_WIDTH-1 downto 0) = C_ADDR_LA_STATUS) then
                       S_AXI_RDATA  <= reg_la_status;
                       S_AXI_RRESP  <= "00";
                       S_AXI_RVALID <= '1';
                       axi_rd_state <= RD_RESPONSE;
                   -- Initial value lane_analyzer register address
                   elsif (S_AXI_ARADDR(C_SLAVE_ADDR_WIDTH-1 downto 0) = C_ADDR_LA_INIT_VAL) then
                     S_AXI_RDATA  <= reg_la_init_val;
                     S_AXI_RRESP  <= "00";
                     S_AXI_RVALID <= '1';
                     axi_rd_state <= RD_RESPONSE;
                   -- Unrecognized address
                   -- Unrecognized address
                   else
                       S_AXI_RDATA  <= (others => '0');   -- Default response data
                       S_AXI_RRESP  <= "10";              -- Error response (SLVERR)
                       S_AXI_RVALID <= '1';               -- Response valid
                       axi_rd_state <= RD_RESPONSE;       -- Send the error response
                   end if;
               -- No read request received
               else
                   axi_rd_state <= IDLE_WAIT_RD_ADDR;
               end if;
            -- Responding to the read request
            when RD_RESPONSE =>
               -- Waiting for data reception confirmation from the master
               if (S_AXI_RREADY = '1') then
                   S_AXI_RVALID <= '0';               -- Deassertion of response validity
                   S_AXI_RDATA  <= (others => '0');   -- Data reset
                   S_AXI_RRESP  <= "00";              -- Default OKAY response
                   axi_rd_state <= IDLE_WAIT_RD_ADDR;
               -- Wait until the master's reception confirmation is received
               else
                   axi_rd_state <= RD_RESPONSE;
               end if;
            -- Unrecognized state, return to IDLE state
            when others =>
               axi_rd_state <= IDLE_WAIT_RD_ADDR;
         end case;
      end if;
   end process P_AXI_READ;
   ---------------------------------------------------------------------------
   -- PROCESS: P_AXI_WRITE
   -- Description : AXI4 Lite writing process
   ---------------------------------------------------------------------------
   P_AXI_WRITE: process(CLK, RST_N)
   begin
      -- Reset
      if (RST_N = '0') then
         axi_wr_state    <= IDLE_WAIT_WR_ADDR;
         S_AXI_AWREADY   <= '1';                   -- Ready for new request
         S_AXI_WREADY    <= '1';                   -- Ready to receive write data
         S_AXI_BRESP     <= "00";                  -- OKAY default response
         S_AXI_BVALID    <= '0';                   -- Default write response validity
         reg_la_config   <= init_la_configuration; -- Configuration register initialization
         reg_la_control  <= init_la_control;       -- Control register initialization
         reg_la_init_val <= init_la_init_val;      -- Initial value initialization
      elsif rising_edge(CLK) then
         if (model_start ='1') then
            reg_la_control(C_LA_MODEL_START_BTFD)  <= '0';  -- Reset model start bit
         end if;
         case axi_wr_state is
            -- Waiting for a write request
            when IDLE_WAIT_WR_ADDR =>
               S_AXI_AWREADY <= '1';              -- Ready for new request
               S_AXI_WREADY  <= '1';
               if (S_AXI_AWVALID = '1' and S_AXI_WVALID ='1') then
                  S_AXI_AWREADY <= '0';           -- Ready signals deasserted to indicate request processing
                  S_AXI_WREADY  <= '0';
                  -- Configuration lane_analyzer register address
                  if (S_AXI_AWADDR(C_SLAVE_ADDR_WIDTH-1 downto 0) = C_ADDR_LA_CONFIG) then
                     reg_la_config <= S_AXI_WDATA; -- Write configuration parameters
                     S_AXI_BRESP   <= "00";        -- OKAY response
                     S_AXI_BVALID  <= '1';         -- Valid response
                     axi_wr_state  <= WR_RESPONSE;
                  -- Control lane_analyzer register address
                  elsif (S_AXI_AWADDR(C_SLAVE_ADDR_WIDTH-1 downto 0) = C_ADDR_LA_CONTROL) then
                     reg_la_control <= S_AXI_WDATA; -- Write control parameters
                     S_AXI_BRESP    <= "00";        -- OKAY response
                     S_AXI_BVALID   <= '1';         -- Valid response
                     axi_wr_state   <= WR_RESPONSE;
                  -- Initial value lane_analyzer register address
                  elsif (S_AXI_AWADDR(C_SLAVE_ADDR_WIDTH-1 downto 0) = C_ADDR_LA_INIT_VAL) then
                     reg_la_init_val <= S_AXI_WDATA; -- Write control parameters
                     S_AXI_BRESP     <= "00";        -- OKAY response
                     S_AXI_BVALID    <= '1';         -- Valid response
                     axi_wr_state    <= WR_RESPONSE;
                  -- Unrecognized address
                  else
                     S_AXI_BRESP  <= "10";          -- Error response (SLVERR)
                     S_AXI_BVALID <= '1';           -- Response valid
                     axi_wr_state <= WR_RESPONSE;
                  end if;
               -- No write request received
               else
                  axi_wr_state <= IDLE_WAIT_WR_ADDR;
               end if;
            -- Responding to the write request
            when WR_RESPONSE =>
               -- Waiting for response reception confirmation from the master
               if (S_AXI_BREADY  = '1') then
                  S_AXI_BVALID <= '0';           -- Reset response validity
                  S_AXI_BRESP  <= "00";          -- Default OKAY response
                  axi_wr_state <= IDLE_WAIT_WR_ADDR;
               -- Wait until the master's reception confirmation is received
               else
                  axi_wr_state <= WR_RESPONSE;
               end if;
            -- Unrecognized state, return to IDLE state
            when others =>
                axi_wr_state <= IDLE_WAIT_WR_ADDR;
         end case;
      end if;
   end process P_AXI_WRITE;
   ------------------------------------------
   -- Register
   ------------------------------------------
   ---------------------------------------------------------------------------
   -- PROCESS: P_CONFIGURATION
   -- Description : update model configuration signals
   ---------------------------------------------------------------------------
   P_CONFIGURATION : process(CLK, RST_N)
   begin
      -- Reset
      if (RST_N ='0') then
         frame_number    <= C_DEFAULT_LA_FRAME_NB;        -- Default value of frame number
         frame_size      <= C_DEFAULT_LA_FRAME_SIZE;      -- Default value of frame size
         inter_pkt_delay <= C_DEFAULT_LA_INTER_PKT_DELAY; -- Default value of inter packet delay
         gen_data        <= C_DEFAULT_LA_GEN_DATA;        -- Default value of generation data
      elsif rising_edge(CLK) then
         frame_number    <= unsigned(reg_la_config(C_LA_FRAME_NB_MAX_BTFD downto 0));                                 -- Frame_number update via its bit field in the register
         frame_size      <= unsigned(reg_la_config(C_LA_FRAME_SIZE_MAX_BTFD downto C_LA_FRAME_NB_MAX_BTFD+1));        -- frame_size update via its bit field in the register
         inter_pkt_delay <= unsigned(reg_la_config(C_LA_INTER_PKT_DELAY_MAX_BTFD downto C_LA_FRAME_SIZE_MAX_BTFD+1)); -- inter_pkt_delay update via its bit field in the register
         gen_data        <= reg_la_config(C_LA_GEN_DATA_BTFD);                                                        -- gen_data update via its bit field in the register
         data_mode       <= unsigned(reg_la_config(C_LA_DATA_MODE_MAX_BTFD downto C_LA_GEN_DATA_BTFD +1));            -- data_mode update via its bit field in the register
      end if;
   end process P_CONFIGURATION;

   ---------------------------------------------------------------------------
   -- PROCESS: P_CONTROL
   -- Description : update model control signal
   ---------------------------------------------------------------------------
   P_CONTROL : process(CLK, RST_N)
   begin
      -- Reset
      if (RST_N ='0') then
         model_start <= C_DEFAULT_LA_MODEL_START;              -- Default value of model_start
      elsif rising_edge(CLK) then
         model_start <= reg_la_control(C_LA_MODEL_START_BTFD); -- model_start update via its bit field in the register
      end if;
   end process P_CONTROL;

   ---------------------------------------------------------------------------
   -- PROCESS: P_STATUS
   -- Description : update status register
   ---------------------------------------------------------------------------
   P_STATUS : process(CLK, RST_N)
   begin
      -- Reset
      if (RST_N ='0') then
         reg_la_status                                                         <= init_la_status;
      elsif rising_edge(CLK) then
         reg_la_status(C_LA_BUSY_BTFD)                                         <= busy;                          -- bit field update in register via signal busy
         reg_la_status(C_LA_TEST_END_BTFD)                                     <= test_end;                      -- bit field update in register via signal test_end
         reg_la_status(C_LA_ERR_CNT_MAX_BTFD downto  C_LA_TEST_END_BTFD+1)     <= std_logic_vector(err_counter); -- bit field update in register via signal err_counter
         reg_la_status(C_LA_LANE_CAPA_MAX_BTFD downto C_LA_ERR_CNT_MAX_BTFD +1) <= FAR_END_CAPA_DL;               -- bit field update in register via signal FAR_END_CAPA_DL
      end if;
   end process P_STATUS;
   ---------------------------------------------------------------------------
   -- PROCESS: P_INIT_VAL
   -- Description : update model initial value signal
   ---------------------------------------------------------------------------
   P_INIT_VAL : process(CLK, RST_N)
   begin
      -- Reset
      if (RST_N ='0') then
         init_val   <= C_DEFAULT_LA_INIT_VAL;     -- Default value of init_val
      elsif rising_edge(CLK) then
         init_val   <= unsigned(reg_la_init_val);
      end if;
   end process P_INIT_VAL;

   ------------------------------------------
   -- Treatment
   ------------------------------------------
   ---------------------------------------------------------------------------
   -- PROCESS: P_ANALYZER
   -- Description : Analyze data
   ---------------------------------------------------------------------------
   P_ANALYZER : process(CLK, RST_N)
   begin
      -- Reset
      if (RST_N ='0') then
         generation_state        <= IDLE;
         cnt_delay_frame         <= (others=>'0');
         cnt_byte                <= (others=>'0');
         cnt_frame               <= (others=>'0');
         cnt_start               <= (others=>'0');
         mask                    <= (others=>'0');
         val_data                <= (others=>'0');
         busy_frame              <= '0';
         test_end_frame          <= '0';
         prbs_data               <= (others=>'1');
         err_counter_frame       <= (others=>'0');
         data_verif              <= (others=>'0');
         fifo_rx_rd_en_ppl_frame <= '0';
         cnt_data_valid          <= (others =>'0');
      elsif rising_edge(CLK) then
         case generation_state is
            -- Waiting for a start request
            when IDLE =>
               -- reset signals between the tests
               val_data                <= init_val;
               prbs_data               <= std_logic_vector(init_val);
               data_verif              <= (others=>'0');
               fifo_rx_rd_en_ppl_frame <= '0';
               cnt_data_valid          <= (others =>'0');
               if (model_start = '1' and data_mode =C_LA_DM_DATA) then
                  busy_frame              <= '1';                                  -- model busy
                  test_end_frame          <= '0';                                  -- reset for a new test
                  fifo_rx_rd_en_ppl_frame <= '1';                                  -- read fifo RX requested
                  cnt_byte                <= unsigned(frame_size)-C_PACKET_WIDTH ; -- number of packets = frame size
                  err_counter_frame       <= (others=>'0');
                  if (unsigned(frame_size) <= C_PACKET_WIDTH)then -- first and last packet of the frame
                     -- determine the number of usefull byte for the last packet
                     for i in 0 to C_INTERNAL_BUS_WIDTH-1 loop
                        if (i >= unsigned(frame_size)*to_unsigned(C_PACKET_WIDTH,cnt_byte'length)) then
                           mask(i) <= '0';
                        else
                           mask(i) <= '1';
                        end if;
                     end loop;
                  elsif (unsigned(frame_size)-C_PACKET_WIDTH <= C_PACKET_WIDTH)then -- penultimate packet of the frame
                     -- determine the number of usefull byte for the last packet
                     for i in 0 to C_INTERNAL_BUS_WIDTH-1 loop
                        if (i >= (unsigned(frame_size) - to_unsigned(C_PACKET_WIDTH,cnt_byte'length))*to_unsigned(C_PACKET_WIDTH,cnt_byte'length)) then
                           mask(i) <= '0';
                        else
                           mask(i) <= '1';
                        end if;
                     end loop;
                  else
                     mask <= (others=>'1');
                  end if;
                  generation_state <= WAIT_NOT_EMPTY;
               end if;

            when WAIT_NOT_EMPTY =>
               if (FIFO_RX_EMPTY_PPL= '0') then
                  generation_state <= WAIT_FRAME;
               end if;
            when WAIT_FRAME =>
               if (DATA_RX = std_logic_vector(to_unsigned(1,DATA_RX'length))) then -- DATA_RX = ID Frame 1
--                  if (VALID_K_CHARAC_RX_PPL/="0000") then
--                    err_counter_frame      <= err_counter_frame+1;
--                  end if;
                  cnt_start           <= (others=>'0');
                  -- Generate verification data
                  if (unsigned(frame_size) <= C_PACKET_WIDTH) then -- first packet of a frame
                     data_verif <= resize(cnt_frame +2,data_verif'length);  -- ID of the frame
                  elsif (gen_data= C_INCREMENTAL) then  -- incremental data
                     if (cnt_byte < C_PACKET_WIDTH) then-- last packet of the frame
                        data_verif <= val_data and unsigned(mask); -- fill data_verif with usefull data and complete with zeros
                     else -- classic packet
                        data_verif <= val_data;  -- push incremental data in the data_verif signal
                     end if;
                     val_data  <= val_data + C_INCR_VAL_DATA; -- incremental data generation
                  else -- PRBS data
                     if (cnt_byte < C_PACKET_WIDTH) then -- last packet of the frame
                        data_verif <= unsigned(prbs_data and mask); -- fill the register tx with usefull data and complete with zeros
                     else -- classic packet
                        data_verif <= unsigned(prbs_data); -- push PRBS data in the data_verif signal
                     end if;
                     prbs_data <= prbs_data(C_INTERNAL_BUS_WIDTH-2 downto 0) & (prbs_data(C_INTERNAL_BUS_WIDTH-1) xor prbs_data(C_INTERNAL_BUS_WIDTH-2) xor prbs_data(C_INTERNAL_BUS_WIDTH-4) xor prbs_data(C_INTERNAL_BUS_WIDTH-5));-- prbs data generation
                  end if;
                  -- Packet management
                  if (unsigned(frame_size) <= C_PACKET_WIDTH)then -- last packet of the frame
                     cnt_byte       <= unsigned(frame_size);
                     cnt_frame      <= cnt_frame+2;
                  elsif (cnt_byte <= C_PACKET_WIDTH )then -- last packet of the frame
                     cnt_byte       <= unsigned(frame_size);
                     cnt_frame      <= cnt_frame+1;
                  elsif (cnt_byte-C_PACKET_WIDTH <= C_PACKET_WIDTH)then -- penultimate packet of the frame
                     -- determine the number of usefull byte for the last packet
                     for i in 0 to C_INTERNAL_BUS_WIDTH-1 loop
                        if (i >= (cnt_byte - to_unsigned(C_PACKET_WIDTH,cnt_byte'length))*to_unsigned(C_PACKET_WIDTH,cnt_byte'length)) then
                           mask(i) <= '0';
                        else
                           mask(i) <= '1';
                        end if;
                     end loop;
                     cnt_byte       <= cnt_byte-C_PACKET_WIDTH;
                  else -- classic packet
                     cnt_byte       <= cnt_byte-C_PACKET_WIDTH;
                  end if;
                  -- Frame management
                  if (unsigned(frame_number) = 1) then -- one frame
                     if (unsigned(frame_size) <= C_PACKET_WIDTH) then -- one packet
                        generation_state <= END_TEST;
                     elsif(unsigned(inter_pkt_delay) > to_unsigned(0,inter_pkt_delay'length)) then -- delay requested
                        generation_state <= DELAY;
                     else -- no delay requested, next state is data generation
                        generation_state <= ANALYZE;
                     end if;
                  elsif (cnt_frame >= unsigned(frame_number)-1) then -- last frame
                     cnt_frame        <= (others=>'0');
                     data_verif       <= (others=>'0');
                     generation_state <= END_TEST;
                  elsif(unsigned(inter_pkt_delay) > to_unsigned(0,inter_pkt_delay'length)) then -- delay requested
                     generation_state <= DELAY;
                  else -- no delay requested, next state is data generation
                     generation_state <= ANALYZE;
                  end if;
               elsif (cnt_start > unsigned(inter_pkt_delay)+50) then -- No ID frame received after a time
                  cnt_start         <= (others=>'0');
                  err_counter_frame <= err_counter_frame+1;
               else
                  cnt_start <= cnt_start+1;
               end if;

            when ANALYZE =>
               -- DATA_RX verification
               if (FIFO_RX_DATA_VALID_PPL ='1') then
                 cnt_data_valid  <= (others =>'0');
                 if (DATA_RX /= std_logic_vector(data_verif) or VALID_K_CHARAC_RX_PPL/="0000") then
                    err_counter_frame      <= err_counter_frame+1;
                 end if;
                 -- Generate data_verif
                 if (cnt_byte = unsigned(frame_size)) then -- first packet of a frame but not frame 1
                    data_verif <= resize(cnt_frame +1,data_verif'length);  -- ID of the frame
                 elsif (gen_data= C_INCREMENTAL) then  -- incremental data
                    if (cnt_byte < C_PACKET_WIDTH) then-- last packet of the frame
                       data_verif <= val_data and unsigned(mask); -- fill data_verif with usefull data and complete with zeros
                    else -- classic packet
                       data_verif <= val_data;  -- push incremental data in the data_verif signal
                    end if;
                    val_data  <= val_data + C_INCR_VAL_DATA; -- incremental data generation
                 else -- PRBS data
                    if (cnt_byte < C_PACKET_WIDTH) then -- last packet of the frame
                       data_verif <= unsigned(prbs_data and mask); -- fill data_verif with usefull data and complete with zeros
                    else -- classic packet
                       data_verif <= unsigned(prbs_data); -- push PRBS data in the data_verif signal
                    end if;
                    prbs_data <= prbs_data(C_INTERNAL_BUS_WIDTH-2 downto 0) & (prbs_data(C_INTERNAL_BUS_WIDTH-1) xor prbs_data(C_INTERNAL_BUS_WIDTH-2) xor prbs_data(C_INTERNAL_BUS_WIDTH-4) xor prbs_data(C_INTERNAL_BUS_WIDTH-5)); -- prbs data generation
                 end if;
                 -- Packet management
                 if (cnt_byte <= C_PACKET_WIDTH )then -- last packet of the frame
                    cnt_byte       <= unsigned(frame_size);
                    cnt_frame      <= cnt_frame+1;
                 elsif (cnt_byte-C_PACKET_WIDTH <= C_PACKET_WIDTH)then -- penultimate packet of the frame
                    -- determine the number of usefull byte for the last packet
                    for i in 0 to C_INTERNAL_BUS_WIDTH-1 loop
                       if (i >= (cnt_byte - to_unsigned(C_PACKET_WIDTH,cnt_byte'length))*to_unsigned(C_PACKET_WIDTH,cnt_byte'length)) then
                          mask(i) <= '0';
                       else
                          mask(i) <= '1';
                       end if;
                    end loop;
                    cnt_byte       <= cnt_byte-C_PACKET_WIDTH;
                 else -- classic packet
                    cnt_byte       <= cnt_byte-C_PACKET_WIDTH;
                 end if;
                 -- Frame management
                 if (cnt_frame >= unsigned(frame_number)) then -- last frame
                    cnt_frame        <= (others=>'0');
                    generation_state <= END_TEST;
                 elsif(unsigned(inter_pkt_delay) > to_unsigned(0,inter_pkt_delay'length)) then -- delay requested
                   generation_state <= DELAY;
                 else -- no delay requested, next state is data generation
                   generation_state <= ANALYZE;
                 end if;
               else 
                 if (cnt_data_valid > 3) then
                   err_counter_frame  <= err_counter_frame+1;
                   cnt_frame        <= (others=>'0');
                   generation_state   <= END_TEST;
                   cnt_data_valid     <= (others =>'0');
                 else 
                   cnt_data_valid <= cnt_data_valid + 1;
                 end if;
               end if;

            when DELAY =>
               --Delay counter
               if (cnt_delay_frame = unsigned(inter_pkt_delay)-1)then  -- inter packets delay reached
                  cnt_delay_frame        <= (others=>'0');
                  if (FIFO_RX_EMPTY_PPL= '1') then
                     generation_state <= WAIT_SKIP;
                  else
                    generation_state       <= ANALYZE;
                  end if;
               else -- inter packets delay not reached
                  cnt_delay_frame <= cnt_delay_frame + 1;
               end if;


            when END_TEST =>
               test_end_frame         <= '1';  -- test finished
               busy_frame             <= '0';
               generation_state <= IDLE;

            when others =>
               generation_state <= IDLE;
         end case;
      end if;
   end process P_ANALYZER;
   ---------------------------------------------------------------------------
   -- PROCESS: P_CONTROL_WORD
   -- Description : Analyze all the data link control word from the lane layer
   ---------------------------------------------------------------------------
   P_CONTROL_WORD : process(CLK, RST_N)
   begin
      -- Reset
      if (RST_N ='0') then
         control_word_state              <= IDLE;
         cnt_delay_cont_word             <= (others=>'0');
         cnt_cont_word                   <= (others=>'0');
         data_verif_cont_word            <= (others=>'0');
         busy_cont_word                  <= '0';
         test_end_cont_word              <= '0';
         fifo_rx_rd_en_ppl_cont_word     <= '0';
         err_counter_cont_word           <= (others=>'0');
      elsif rising_edge(CLK) then
         case control_word_state is
            -- Waiting for a start request
            when IDLE =>
               if (model_start = '1' and data_mode= C_LA_DM_CONTROL_WORD) then
                  busy_cont_word            <= '1';                  -- model busy_frame
                  test_end_cont_word        <= '0';                  -- reset for a new test
                  fifo_rx_rd_en_ppl_cont_word   <= '1';                  -- read fifo RX requested
                  err_counter_cont_word     <= (others=>'0');
                  data_verif_cont_word      <= "00000000000000000101000011111100"; -- SDF: D0.0, D0.0, D16.2, K28.7
                  control_word_state        <= WAIT_CONTROL_WORD;
               end if;

            when WAIT_CONTROL_WORD =>
               if (FIFO_RX_EMPTY_PPL= '0') then -- FIFO RX not empty
                  if (unsigned(inter_pkt_delay) =0) then -- no delay
                     control_word_state   <= ANA_CONTROL_WORD;
                  else
                     control_word_state   <= DELAY;
                  end if;
               end if;

            when ANA_CONTROL_WORD =>
               if (FIFO_RX_DATA_VALID_PPL ='1') then
                  if (DATA_RX /= std_logic_vector(data_verif_cont_word) or VALID_K_CHARAC_RX_PPL/="0001") then-- is DATA_RX not OK ?
                     err_counter_cont_word      <= err_counter_cont_word+1;
                  end if;
                  if (cnt_cont_word = 0)then
                     data_verif_cont_word     <= "00000000000000000000000000011100"; -- EDF: D0.0, D0.0, D0.0, K28.0
                  elsif (cnt_cont_word = 1)then
                     data_verif_cont_word     <= "00000000000000000101110111111100"; -- SBF: D0.0, D0.0, D29.2, K28.7
                  elsif (cnt_cont_word = 2)then
                     data_verif_cont_word     <= "00000000000000000000000001011100"; -- EBF: D0.0, D0.0, D0.0, K28.2
                  elsif (cnt_cont_word = 3)then
                     data_verif_cont_word     <= "00000000000000000100010011111100"; -- SIF: D0.0, D0.0, D4.2, K28.7
                  end if;
                  cnt_cont_word <= cnt_cont_word+1;
               end if;
               if (cnt_cont_word > 3)then
                  control_word_state <= END_TEST;
               elsif(unsigned(inter_pkt_delay) > 0) then -- delay requested
                  control_word_state <= DELAY;
               end if;

            when DELAY =>
               --Delay counter
               if (cnt_delay_cont_word = unsigned(inter_pkt_delay)-1)then  -- inter packets delay reached
                  cnt_delay_cont_word <= (others=>'0');
                  control_word_state  <= ANA_CONTROL_WORD;
               else -- inter packets delay not reached
                  cnt_delay_cont_word <= cnt_delay_cont_word + 1;
               end if;

            when END_TEST =>
               fifo_rx_rd_en_ppl_cont_word  <= '0';  -- read fifo RX not requested
               test_end_cont_word           <= '1';  -- test finished
               busy_cont_word               <= '0';
               control_word_state           <= IDLE;

            when others =>
               control_word_state <= IDLE;
         end case;
      end if;
   end process P_CONTROL_WORD;
   ---------------------------------------------------------------------------
   -- PROCESS: P_RXERR
   -- Description : Analyze all the RXERR from the lane layer
   ---------------------------------------------------------------------------
   P_RXERR : process(CLK, RST_N)
   begin
      -- Reset
      if (RST_N ='0') then
         rxerr_state              <= IDLE;
         cnt_delay_rxerr             <= (others=>'0');
         cnt_rxerr                   <= (others=>'0');
         data_verif_rxerr            <= (others=>'0');
         busy_rxerr                  <= '0';
         test_end_rxerr              <= '0';
         err_counter_rxerr           <= (others=>'0');
      elsif rising_edge(CLK) then
         case rxerr_state is
            -- Waiting for a start request
            when IDLE =>
               -- reset signals between the tests
               cnt_rxerr                  <= (others=>'0');
               if (model_start = '1' and data_mode= C_LA_DM_RXERR) then
                  busy_rxerr              <= '1';                  -- model busy_frame
                  test_end_rxerr          <= '0';                  -- reset for a new test
                  fifo_rx_rd_en_ppl_rxerr <= '1';                  -- read fifo RX requested
                  err_counter_rxerr       <= (others=>'0');
                  data_verif_rxerr        <= (others=>'0'); -- RXERR: D0.0, D0.0, D0.0, K0.0
                  rxerr_state             <= WAIT_RXERR;
               end if;

            when WAIT_RXERR=>
               if (FIFO_RX_DATA_VALID_PPL= '1') then -- FIFO RX not empty
                  if (DATA_RX /= std_logic_vector(data_verif_rxerr) or VALID_K_CHARAC_RX_PPL/="0001") then -- is DATA_RX not OK ?
                     err_counter_rxerr <= err_counter_rxerr+1;
                     cnt_rxerr        <= to_unsigned(0,cnt_rxerr'length);
                  elsif (DATA_RX = std_logic_vector(data_verif_rxerr) or VALID_K_CHARAC_RX_PPL="0001") then-- is DATA_RX OK ?
                     cnt_rxerr        <= to_unsigned(1,cnt_rxerr'length);
                  end if;
                  
                  if (unsigned(inter_pkt_delay) =0) then -- no delay
                     if ("00001" = frame_number) and (DATA_RX = std_logic_vector(data_verif_rxerr) or VALID_K_CHARAC_RX_PPL="0001")then
                        rxerr_state <= END_TEST;
                     else
                        rxerr_state   <= ANA_RXERR;
                     end if;
                  else
                     rxerr_state   <= DELAY;
                  end if;
               end if;

            when ANA_RXERR =>
               if (FIFO_RX_DATA_VALID_PPL= '1') then -- FIFO RX not empty
                  if (DATA_RX /= std_logic_vector(data_verif_rxerr) or VALID_K_CHARAC_RX_PPL/="0001") then-- is DATA_RX not OK ?
                     err_counter_rxerr      <= err_counter_rxerr+1;
                  elsif (DATA_RX = std_logic_vector(data_verif_rxerr) or VALID_K_CHARAC_RX_PPL="0001") then-- is DATA_RX OK ?
                     cnt_rxerr <= cnt_rxerr+1;
                  end if;
                  if (cnt_rxerr = frame_number-1) and (DATA_RX = std_logic_vector(data_verif_rxerr) or VALID_K_CHARAC_RX_PPL="0001") then
                     rxerr_state <= END_TEST;
                  elsif(unsigned(inter_pkt_delay) > 0) then -- delay requested
                     rxerr_state <= DELAY;
                  end if;
               end if;

            when DELAY =>
               --Delay counter
               if (cnt_delay_rxerr = unsigned(inter_pkt_delay)-1)then  -- inter packets delay reached
                  cnt_delay_rxerr <= (others=>'0');
                  rxerr_state  <= ANA_RXERR;
               else -- inter packets delay not reached
                  cnt_delay_rxerr <= cnt_delay_rxerr + 1;
               end if;

            when END_TEST =>
               fifo_rx_rd_en_ppl_rxerr  <= '0';  -- read fifo RX not requested
               test_end_rxerr           <= '1';  -- test finished
               busy_rxerr               <= '0';
               rxerr_state           <= IDLE;

            when others =>
               rxerr_state <= IDLE;
         end case;
      end if;
   end process P_RXERR;

end rtl;
