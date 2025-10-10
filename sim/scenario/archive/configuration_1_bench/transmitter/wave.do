onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/CLK
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/RST_N
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/CLK_TX
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/RST_TXCLK_N
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/S_AXI_AWADDR
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/S_AXI_AWVALID
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/S_AXI_AWREADY
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/S_AXI_WDATA
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/S_AXI_WSTRB
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/S_AXI_WVALID
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/S_AXI_WREADY
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/S_AXI_BREADY
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/S_AXI_BRESP
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/S_AXI_BVALID
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/S_AXI_ARADDR
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/S_AXI_ARVALID
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/S_AXI_ARREADY
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/S_AXI_RREADY
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/S_AXI_RDATA
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/S_AXI_RRESP
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/S_AXI_RVALID
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/LANE_START
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/AUTOSTART
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/LANE_RESET
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/PARALLEL_LOOPBACK_EN
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/STANDBY_REASON
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/NEAR_END_SERIAL_LB_EN
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/FAR_END_SERIAL_LB_EN
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/LANE_STATE
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/RX_ERROR_CNT
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/RX_ERROR_OVF
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/LOSS_SIGNAL
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/FAR_END_CAPA
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/RX_POLARITY
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/RST_DUT_N
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/axi_wr_state
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/axi_rd_state
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/reg_lane_param
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/reg_lane_status
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/reg_phy_param
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/reg_global
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/lane_start_pulse
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/lane_state_i
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/rx_error_cnt_i
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/rx_error_ovf_i
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/loss_signal_i
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/far_end_capa_i
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/rx_polarity_i
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/outputs_to_sync
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/outputs_to_dut
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/inputs_to_sync
add wave -noupdate -group Configurator /configuration_1_bench/I_LANE_CONFIGURATOR/inputs_to_model
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/CLK
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/RST_N
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/S_AXI_AWADDR
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/S_AXI_AWVALID
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/S_AXI_AWREADY
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/S_AXI_WDATA
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/S_AXI_WSTRB
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/S_AXI_WVALID
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/S_AXI_WREADY
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/S_AXI_BREADY
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/S_AXI_BRESP
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/S_AXI_BVALID
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/S_AXI_ARADDR
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/S_AXI_ARVALID
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/S_AXI_ARREADY
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/S_AXI_RREADY
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/S_AXI_RDATA
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/S_AXI_RRESP
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/S_AXI_RVALID
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/DATA_TX
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/NEW_DATA_TX_PPL
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/FIFO_TX_FULL_PPL
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/LANE_RESET_DL
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/VALID_K_CHARAC_TX_PPL
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/CAPABILITY_TX_PPL
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/axi_wr_state
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/axi_rd_state
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/generation_state
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/control_word_state
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/reg_lg_config
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/reg_lg_control
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/reg_lg_status
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/reg_lg_init_val
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/reg_data_tx_frame
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/reg_data_tx_cont_word
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/reg_data_tx_k_charact
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/frame_number
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/frame_size
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/inter_pkt_delay
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/gen_data
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/model_start
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/data_mode
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/busy
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/test_end
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/err_counter
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/busy_frame
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/test_end_frame
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/err_counter_frame
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/data_tx_frame
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/new_data_tx_ppl_frame
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/valid_k_charac_tx_ppl_frame
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/init_val
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/cnt_frame
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/cnt_byte
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/mask
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/cnt_delay_frame
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/val_data
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/prbs_data
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/busy_cont_word
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/test_end_cont_word
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/err_counter_cont_word
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/data_tx_cont_word
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/new_data_tx_ppl_cont_word
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/valid_k_charac_tx_ppl_cont_word
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/cnt_cont_word
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/cnt_delay_cont_word
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/busy_k_charact
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/test_end_k_charact
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/data_tx_k_charact
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/new_data_tx_ppl_k_charact
add wave -noupdate -group Generator /configuration_1_bench/I_LANE_GENERATOR/valid_k_charac_tx_ppl_k_charact
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/CLK
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/RST_N
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/S_AXI_AWADDR
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/S_AXI_AWVALID
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/S_AXI_AWREADY
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/S_AXI_WDATA
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/S_AXI_WSTRB
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/S_AXI_WVALID
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/S_AXI_WREADY
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/S_AXI_BREADY
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/S_AXI_BRESP
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/S_AXI_BVALID
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/S_AXI_ARADDR
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/S_AXI_ARVALID
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/S_AXI_ARREADY
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/S_AXI_RREADY
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/S_AXI_RDATA
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/S_AXI_RRESP
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/S_AXI_RVALID
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/DATA_RX
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/VALID_K_CHARAC_RX_PPL
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/FIFO_RX_EMPTY_PPL
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/FIFO_RX_RD_EN_PPL
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/FAR_END_CAPA_DL
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/axi_wr_state
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/axi_rd_state
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/generation_state
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/control_word_state
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/rxerr_state
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/reg_la_config
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/reg_la_control
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/reg_la_status
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/reg_la_init_val
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/frame_number
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/frame_size
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/inter_pkt_delay
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/gen_data
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/model_start
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/data_mode
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/busy
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/test_end
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/err_counter
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/busy_frame
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/test_end_frame
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/err_counter_frame
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/fifo_rx_rd_en_ppl_frame
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/init_val
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/cnt_frame
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/cnt_byte
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/mask
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/cnt_delay_frame
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/val_data
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/prbs_data
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/data_verif
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/cnt_start
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/busy_cont_word
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/test_end_cont_word
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/err_counter_cont_word
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/data_verif_cont_word
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/fifo_rx_rd_en_ppl_cont_word
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/cnt_cont_word
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/cnt_delay_cont_word
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/busy_rxerr
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/test_end_rxerr
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/err_counter_rxerr
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/data_verif_rxerr
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/fifo_rx_rd_en_ppl_rxerr
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/cnt_rxerr
add wave -noupdate -group Analyzer /configuration_1_bench/I_LANE_ANALYZER/cnt_delay_rxerr
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/RST_N
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/CLK
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/CLK_TX
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/RST_TXCLK_N
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/CLK_GTY
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/TX_POS
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/TX_NEG
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/RX_POS
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/RX_NEG
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/DATA_TX_PPL
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/LANE_RESET_DL_PPL
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/CAPABILITY_TX_PPL
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/NEW_DATA_TX_PPL
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/VALID_K_CHARAC_TX_PPL
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/FIFO_RX_RD_EN_PPL
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/FIFO_TX_FULL_PPL
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/DATA_RX_PPL
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/FIFO_RX_EMPTY_PPL
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/VALID_K_CHARAC_RX_PPL
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/FAR_END_CAPA_DL
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/LANE_START
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/AUTOSTART
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/LANE_RESET
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/PARALLEL_LOOPBACK_EN
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/STANDBY_REASON
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/NEAR_END_SERIAL_LB_EN
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/FAR_END_SERIAL_LB_EN
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/LANE_STATE
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/RX_ERROR_CNT
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/RX_ERROR_OVF
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/LOSS_SIGNAL
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/FAR_END_CAPA
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/RX_POLARITY
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/rst_sync_gty_n
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/clk_tx_i
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/pll_lock
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/lane_start_ppl
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/autostart_ppl
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/lane_reset_ppl
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/parallel_loopback_en_ppl
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/standby_reason_ppl
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/near_end_serial_lb_en_ppl
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/far_end_serial_lb_en_ppl
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/lane_state_ppl
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/rx_error_cnt_ppl
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/rx_error_ovf_ppl
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/loss_signal_ppl
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/far_end_capa_ppl
add wave -noupdate -group DUT /configuration_1_bench/I_DUT_PHY_LANE/rx_polariry_ppl
add wave -noupdate -group reset_synchro /configuration_1_bench/I_DUT_PHY_LANE/inst_reset_sync_clk_from_GTY/RST_N
add wave -noupdate -group reset_synchro /configuration_1_bench/I_DUT_PHY_LANE/inst_reset_sync_clk_from_GTY/CLK
add wave -noupdate -group reset_synchro /configuration_1_bench/I_DUT_PHY_LANE/inst_reset_sync_clk_from_GTY/PLL_LOCK
add wave -noupdate -group reset_synchro /configuration_1_bench/I_DUT_PHY_LANE/inst_reset_sync_clk_from_GTY/INTERNAL_SYNC_RST_N
add wave -noupdate -group reset_synchro /configuration_1_bench/I_DUT_PHY_LANE/inst_reset_sync_clk_from_GTY/reset_gen_r_n
add wave -noupdate -group reset_synchro /configuration_1_bench/I_DUT_PHY_LANE/inst_reset_sync_clk_from_GTY/reset_gen_rr_n
add wave -noupdate -group reset_synchro /configuration_1_bench/I_DUT_PHY_LANE/inst_reset_sync_clk_from_GTY/pll_lock_r
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/LANE_START
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/AUTOSTART
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/LANE_RESET
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/PARALLEL_LOOPBACK_EN
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/STANDBY_REASON
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/NEAR_END_SERIAL_LB_EN
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/FAR_END_SERIAL_LB_EN
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/LANE_STATE
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/RX_ERROR_CNT
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/RX_ERROR_OVF
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/LOSS_SIGNAL
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/FAR_END_CAPA
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/RX_POLARITY
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/LANE_START_TO_MOD
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/AUTOSTART_TO_MOD
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/LANE_RESET_TO_MOD
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/PARALLEL_LOOPBACK_EN_TO_MOD
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/STANDBY_REASON_TO_MOD
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/NEAR_END_SERIAL_LB_EN_TO_MOD
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/FAR_END_SERIAL_LB_EN_TO_MOD
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/LANE_STATE_FROM_MOD
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/RX_ERROR_CNT_FROM_MOD
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/RX_ERROR_OVF_FROM_MOD
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/LOSS_SIGNAL_FROM_MOD
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/FAR_END_CAPA_FROM_MOD
add wave -noupdate -group MIB /configuration_1_bench/I_DUT_PHY_LANE/inst_mib_phy_plus_lane/RX_POLARITY_FROM_MOD
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/RST_N
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/CLK
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/LANE_RESET_DL
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/NO_SIGNAL
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/RX_NEW_WORD
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/DETECTED_INIT1
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/DETECTED_INIT2
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/DETECTED_INIT3
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/DETECTED_INV_INIT1
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/DETECTED_INV_INIT2
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/DETECTED_RXERR_WORD
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/DETECTED_LOSS_SIGNAL
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/DETECTED_STANDBY
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/COMMA_K287_RXED
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/RECEIVER_DISABLED
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/CDR
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/SEND_RXERR
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/INVERT_RX_BITS
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/NO_SIGNAL_DETECTION_ENABLED
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/STANDBY_SIGNAL_X32
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/LOST_SIGNAL_X32
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/TRANSMITTER_DISABLED
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/SEND_INIT1_CTRL_WORD
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/SEND_INIT2_CTRL_WORD
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/SEND_INIT3_CTRL_WORD
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/ENABLE_TRANSM_DATA
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/SEND_32_STANDBY_CTRL_WORDS
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/SEND_32_LOSS_SIGNAL_CTRL_WORDS
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/LOST_CAUSE
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/LANE_START
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/AUTOSTART
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/LANE_RESET
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/LANE_STATE
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/RX_ERROR_CNT
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/RX_ERROR_OVF
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/current_state
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/current_state_r
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/clear_line_cnt
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/clear_line_done
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/cdr_i
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/enable_init_cnt
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/rx_words_cnt
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/rx_new_word_r
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/rx_error_cnt_i
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/rx_error_cnt_ovf_i
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/detected_rxerr_word_r
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/init_timeout_cnt
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/init_timeout_reaches
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/loss_signal_x3_cnt
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/lost_signal_x3
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/standby_signal_x3_cnt
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/standby_signal_x3
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/inv_init1_rxed_cnt
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/init1_rxed
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/init1_rxed_r
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/inv_init1_rxed_x3
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/detected_init1_r
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/detected_inv_init1_r
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/init2_rxed_cnt
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/inv_init2_rxed_cnt
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/init2_rxed_x3
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/inv_init2_rxed_x3
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/init2_rxed
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/detected_init2_r
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/detected_inv_init2_r
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/init3_rxed_cnt
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/init3_rxed_x3
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/detected_init3_r
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/rxed_1023_word_cnt
add wave -noupdate -group {Init FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_init_fsm/rxed_1023_word
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/RST_N
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/WR_CLK
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/WR_DATA
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/WR_DATA_EN
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/RD_CLK
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/RD_DATA
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/RD_DATA_EN
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/RD_DATA_VLD
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/CMD_FLUSH
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/STATUS_BUSY_FLUSH
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/STATUS_THRESHOLD_HIGH
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/STATUS_THRESHOLD_LOW
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/STATUS_FULL
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/STATUS_EMPTY
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/STATUS_LEVEL_WR
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/STATUS_LEVEL_RD
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/ptr_wr
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/ptr_wr_inc
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/ptr_wr_inc2
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/ptr_rd
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/ptr_rd_inc
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/ptr_wr_gray
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/ptr_rd_gray
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/ptr_wr_in_rd
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/ptr_rd_in_wr
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/ram_level
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/cmd_flush_req
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/cmd_flush_inv
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/cmd_flush_inv_wr
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/cmd_flush_inv_rd
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/flush_ack_inv_wr
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/flush_ack_inv_wr_r
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/flush_ack_inv_rd
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/flush_ack_inv_rd_r
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/flush_ack_wr
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/flush_ack_rd
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/wr_en
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/rd_en
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/full
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/full_prev
add wave -noupdate -group {Fifo TX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_tx_data/empty
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/RST_N
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/CLK
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/RD_DATA_FROM_DL
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/CAPABILITY_FROM_DL
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/DATA_TX_FROM_DL
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/VALID_K_CHARAC_FROM_DL
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/NO_DATA_FROM_DL
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/WAIT_SEND_DATA_FROM_SKIP
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/NEW_DATA_TO_SKIP
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/DATA_TX_TO_SKIP
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/VALID_K_CHARAC_TO_SKIP
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/SEND_INIT1_CTRL_WORD
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/SEND_INIT2_CTRL_WORD
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/SEND_INIT3_CTRL_WORD
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/ENABLE_TRANSM_DATA
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/SEND_32_STANDBY_CTRL_WORDS
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/STANDBY_REASON
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/SEND_32_LOSS_SIGNAL_CTRL_WORDS
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/LOST_CAUSE
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/STANDBY_SIGNAL_X32
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/LOST_SIGNAL_X32
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/prbs_counter
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/init_word_sent
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/send_stdby_cnt
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/send_loss_sig_cnt
add wave -noupdate -group {Insert Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_insert/no_data_from_dl_r
add wave -noupdate -group {Parallele loopback} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_parallel_loopback/DATA_TX_FROM_LCWI
add wave -noupdate -group {Parallele loopback} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_parallel_loopback/VALID_K_CARAC_FROM_LCWI
add wave -noupdate -group {Parallele loopback} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_parallel_loopback/DATA_RDY_FROM_LCWI
add wave -noupdate -group {Parallele loopback} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_parallel_loopback/DATA_TX_FROM_RSF
add wave -noupdate -group {Parallele loopback} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_parallel_loopback/VALID_K_CARAC_FROM_RSF
add wave -noupdate -group {Parallele loopback} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_parallel_loopback/DATA_RDY_FROM_RSF
add wave -noupdate -group {Parallele loopback} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_parallel_loopback/WAIT_SKIP_DATA
add wave -noupdate -group {Parallele loopback} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_parallel_loopback/DATA_TX_TO_LCWD
add wave -noupdate -group {Parallele loopback} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_parallel_loopback/VALID_K_CHARAC_TO_LCWD
add wave -noupdate -group {Parallele loopback} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_parallel_loopback/DATA_RDY_TO_LCWD
add wave -noupdate -group {Parallele loopback} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_parallel_loopback/PARALLEL_LOOPBACK_EN
add wave -noupdate -group {Insert SKIP} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_skip_insertion/RST_N
add wave -noupdate -group {Insert SKIP} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_skip_insertion/CLK
add wave -noupdate -group {Insert SKIP} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_skip_insertion/NEW_DATA_FROM_LCWI
add wave -noupdate -group {Insert SKIP} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_skip_insertion/DATA_TX_FROM_LCWI
add wave -noupdate -group {Insert SKIP} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_skip_insertion/VALID_K_CHARAC_FROM_LCWI
add wave -noupdate -group {Insert SKIP} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_skip_insertion/WAIT_SEND_DATA
add wave -noupdate -group {Insert SKIP} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_skip_insertion/DATA_TX_TO_IP
add wave -noupdate -group {Insert SKIP} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_skip_insertion/VALID_K_CHARAC_TO_IP
add wave -noupdate -group {Insert SKIP} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_skip_insertion/ENABLE_TRANSM_DATA
add wave -noupdate -group {Insert SKIP} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_skip_insertion/words_x5000_cnt
add wave -noupdate -group {Insert SKIP} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_skip_insertion/new_data_from_tcwi_r
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/RST_N
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/CLK
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/LANE_RESET_DL
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/DATA_RX_TO_LCWD
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/VALID_K_CHARAC_TO_LCWD
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/DATA_RDY_TO_LCWD
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/DATA_RX_FROM_IP
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/VALID_K_CHARAC_FROM_IP
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/DATA_RDY_FROM_IP
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/INVALID_CHAR_FROM_IP
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/DISPARITY_ERR_FROM_IP
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/RX_WORD_REALIGN_FROM_IP
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/COMMA_DET_FROM_IP
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/LANE_RESET
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/current_state
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/comma_det_from_ip_r
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/rx_word_realign_from_ip_r
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/data_rx_to_lcwd_i
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/valid_k_charac_to_lcwd_i
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/data_rdy_to_lcwd_i
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/err_word_cnt
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/err_word_x5
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/valid_symb
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/invalid_symb
add wave -noupdate -group {RX synchro FSM} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_rx_sync_fsm/disparity_err
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/RST_N
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/CLK
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/NO_SIGNAL
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/RX_NEW_WORD
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DETECTED_INIT1
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DETECTED_INIT2
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DETECTED_INIT3
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DETECTED_INV_INIT1
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DETECTED_INV_INIT2
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DETECTED_RXERR_WORD
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DETECTED_LOSS_SIGNAL
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DETECTED_STANDBY
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/COMMA_K287_RXED
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/CAPABILITY
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/SEND_RXERR
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/NO_SIGNAL_DETECTION_ENABLED
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/ENABLE_TRANSM_DATA
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DATA_RX_FROM_RSF
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/VALID_K_CARAC_FROM_RSF
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DATA_RDY_FROM_RSF
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DATA_RX_TO_DL
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/VALID_K_CARAC_TO_DL
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DATA_RDY_TO_DL
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/data_rx_to_dl_i
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/valid_k_charac_to_dl_i
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/data_rdy_to_dl_i
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/enable_transm_data_r
add wave -noupdate -group {Detect Ctrl Word} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_lane_ctrl_word_detect/enable_transm_data_rr
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/RST_N
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/WR_CLK
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/WR_DATA
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/WR_DATA_EN
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/RD_CLK
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/RD_DATA
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/RD_DATA_EN
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/RD_DATA_VLD
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/CMD_FLUSH
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/STATUS_BUSY_FLUSH
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/STATUS_THRESHOLD_HIGH
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/STATUS_THRESHOLD_LOW
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/STATUS_FULL
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/STATUS_EMPTY
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/STATUS_LEVEL_WR
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/STATUS_LEVEL_RD
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/ptr_wr
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/ptr_wr_inc
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/ptr_wr_inc2
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/ptr_rd
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/ptr_rd_inc
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/ptr_wr_gray
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/ptr_rd_gray
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/ptr_wr_in_rd
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/ptr_rd_in_wr
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/ram_level
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/cmd_flush_req
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/cmd_flush_inv
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/cmd_flush_inv_wr
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/cmd_flush_inv_rd
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/flush_ack_inv_wr
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/flush_ack_inv_wr_r
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/flush_ack_inv_rd
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/flush_ack_inv_rd_r
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/flush_ack_wr
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/flush_ack_rd
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/wr_en
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/rd_en
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/full
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/full_prev
add wave -noupdate -group {Fifo RX} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_fifo_rx_data/empty
add wave -noupdate -group BufGT /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_bufg_gt_tx_clock/gt_bufgtce_0
add wave -noupdate -group BufGT /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_bufg_gt_tx_clock/gt_bufgtcemask_0
add wave -noupdate -group BufGT /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_bufg_gt_tx_clock/gt_bufgtclr_0
add wave -noupdate -group BufGT /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_bufg_gt_tx_clock/gt_bufgtclrmask_0
add wave -noupdate -group BufGT /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_bufg_gt_tx_clock/gt_bufgtdiv_0
add wave -noupdate -group BufGT /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_bufg_gt_tx_clock/outclk_0
add wave -noupdate -group BufGT /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_bufg_gt_tx_clock/usrclk_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxbufstatus_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxbyteisaligned_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxbyterealign_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxcdrhold_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxcdrovrden_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxcomsasdet_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxctrl0_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxctrl1_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxctrl2_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxctrl3_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxdata_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxdatavalid_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxpd_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxpolarity_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxrate_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX_clr_out_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX_clrb_leaf_out_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX0_ch_txbufstatus_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX0_ch_txctrl0_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX0_ch_txctrl1_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX0_ch_txctrl2_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX0_ch_txdata
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX0_ch_txpd_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX0_ch_txrate_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX_clr_out_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX_clrb_leaf_out_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_rst_all_in_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_rst_rx_datapath_in_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_rst_rx_done_out_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_rst_rx_pll_and_datapath_in_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_rst_tx_datapath_in_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_rst_tx_done_out_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_rst_tx_pll_and_datapath_in_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_GTREFCLK0_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_GT_DEBUG_0_gpi
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_GT_DEBUG_0_gpo
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_RX0_outclk_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_RX0_usrclk_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_TX0_outclk_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_TX0_usrclk_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_hsclk0_lcplllock_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/Quad0_CH0_DEBUG_0_ch_loopback
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/Quad0_GT_Serial_0_grx_n
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/Quad0_GT_Serial_0_grx_p
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/Quad0_GT_Serial_0_gtx_n
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/Quad0_GT_Serial_0_gtx_p
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/gtpowergood_0
add wave -noupdate -group {Extended Phy Wrapper} /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/gtwiz_freerun_clk_0
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/gtpowergood
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/gtwiz_freerun_clk
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_GTREFCLK0
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_TX0_outclk
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_RX0_outclk
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_rxp
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_rxn
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_txp
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_txn
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_ch0_loopback
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_gpi
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_gpo
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_hsclk0_lcplllock
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_TX0_usrclk
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_RX0_usrclk
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdata
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txbufstatus
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdccdone
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_gttxreset
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdebugpcsout
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txprogdivresetdone
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txresetdone
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txinhibit
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txlatclk
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txmaincursor
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txpcsresetmask
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txpd
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txpisopd
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txpmaresetmask
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txpolarity
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txpostcursor
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txprbsforceerr
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txprbssel
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txprecursor
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txprogdivreset
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txrate
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txresetmode
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txheader
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txsequence
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphalignresetmask
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txcominit
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txcomsas
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txcomwake
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdapicodeovrden
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdapicodereset
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdetectrx
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphdlytstclk
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdlyalignreq
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txelecidle
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txmldchaindone
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txmldchainreq
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txoneszeros
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txpausedelayalign
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphalignreq
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphdlypd
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphdlyreset
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphsetinitreq
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphshift180
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txpicodeovrden
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txpicodereset
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txpippmen
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txswing
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txsyncallin
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_tx10gstat
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txcomfinish
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdlyalignerr
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdlyalignprog
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphaligndone
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphalignerr
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphalignoutrsvd
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphdlyresetdone
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphsetinitdone
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphshift180done
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txsyncdone
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txctrl0
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txctrl1
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txctrl2
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdeemph
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txmargin
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdiffctrl
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txpippmstepsize
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdapiresetdone
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txqpisenn
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txqpisenp
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txswingouthigh
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txswingoutlow
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdapireset
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdapiresetmask
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txqpibiasen
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txqpiweakpu
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxbufstatus
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxcdrlock
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxdebugpcsout
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxprbserr
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxprbslocked
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxcdrhold
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxcdrovrden
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxlatclk
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxpcsresetmask
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxpd
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxpmaresetmask
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxpolarity
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxprbscntreset
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxrate
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxresetmode
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxdata
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rx10gstat
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxdatavalid
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxheader
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxchanisaligned
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxchanrealign
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxchbondi
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxchbondo
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxclkcorcnt
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxcominitdet
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxcommadet
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxbyteisaligned
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxbyterealign
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxcomsasdet
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxcomwakedet
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxctrl0
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxctrl1
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxctrl2
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxctrl3
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxdapicodeovrden
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxdapicodereset
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxdlyalignerr
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxdlyalignprog
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxdlyalignreq
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxelecidle
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxeqtraining
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxfinealigndone
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxgearboxslip
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxheadervalid
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxlpmen
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxmldchaindone
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxmldchainreq
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxmlfinealignreq
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxoobreset
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxosintdone
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxphaligndone
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxphalignerr
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxphalignreq
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxphalignresetmask
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxphdlypd
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxphdlyreset
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxphdlyresetdone
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxphsetinitreq
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxphshift180
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxphshift180done
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxphsetinitdone
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxslide
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxsliderdy
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxstartofseq
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxstatus
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxsyncallin
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxsyncdone
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxtermination
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxvalid
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxchanbondseq
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxchanbond_busy
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxchanbond_en
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxchanbond_master
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxchanbond_slave
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxchanbond_level
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_cdrbmcdrreq
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_cdrfreqos
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_cdrincpctrl
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_cdrstepdir
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_cdrstepsq
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_cdrstepsx
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_eyescanreset
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_eyescantrigger
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_eyescandataerror
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_refdebugout
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxdapiresetdone
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxpkdet
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxqpisenn
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxqpisenp
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxsimplexphystatus
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxslipdone
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_dfehold
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_dfeovrd
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxdapireset
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxdapiresetmask
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxqpien
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxcdrphdone
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_gtrxreset
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxprogdivresetdone
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxresetdone
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxcdrreset
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxprbssel
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxprogdivreset
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX_clr_out
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX_clrb_leaf_out
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX_clr_out
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX_clrb_leaf_out
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_rst_all_in
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_rst_tx_pll_and_datapath_in
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_rst_tx_datapath_in
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_rst_tx_done_out
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_rst_rx_pll_and_datapath_in
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_rst_rx_datapath_in
add wave -noupdate -group GTY /configuration_1_bench/I_DUT_PHY_LANE/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_rst_rx_done_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 fs} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits fs
update
WaveRestoreZoom {0 fs} {1 ps}
