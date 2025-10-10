-- hx  = 0;
-- tx0 = 0;
-- tx1 = None;
-- tx2 = None;
-- tx3 = None;
-- rx0 = 0;
-- rx1 = None;
-- rx2 = None;
-- rx3 = None;
--This wrapper was autogenetared by NX wrapper_generator --
--                Do not modify manually                 --
library IEEE;
use IEEE.std_logic_1164.all;
library NX;
use NX.nxPackage.all;
--component SpaceFibre_64b is
--generic (
--   LOCATION : string := "hssl0"
--);
--port (
--   ckrefn                                             : in  std_logic
--  ;ckrefp                                             : in  std_logic
--  ;clock_o                                            : out std_logic
--  ;dyn_addr_i                                         : in  std_logic_vector (3 downto 0)
--  ;dyn_calibration_cs_n_i                             : in  std_logic
--  ;dyn_cfg_en_i                                       : in  std_logic
--  ;dyn_lane_cs_n_i                                    : in  std_logic_vector (3 downto 0)
--  ;dyn_wdata_i                                        : in  std_logic_vector (11 downto 0)
--  ;dyn_wdata_sel_i                                    : in  std_logic
--  ;dyn_we_n_i                                         : in  std_logic
--  ;hssl_clock_i                                       : in  std_logic_vector (3 downto 0)
--  ;pll_lock                                           : out std_logic
--  ;pll_pma_lock_analog                                : out std_logic
--  ;pll_pma_pwr_up_i                                   : in  std_logic
--  ;pll_pma_rst_n_i                                    : in  std_logic
--  ;rx0_align_sync_i                                   : in  std_logic
--  ;rx0_busy_o                                         : out std_logic
--  ;rx0_ctrl_char_is_aligned_o                         : out std_logic
--  ;rx0_ctrl_char_is_comma_o                           : out std_logic_vector (7 downto 0)
--  ;rx0_ctrl_char_is_f_o                               : out std_logic_vector (7 downto 0)
--  ;rx0_ctrl_char_is_k_o                               : out std_logic_vector (7 downto 0)
--  ;rx0_ctrl_disp_err_o                                : out std_logic_vector (7 downto 0)
--  ;rx0_ctrl_el_buff_stat_o                            : out std_logic_vector (7 downto 0)
--  ;rx0_ctrl_not_in_table_o                            : out std_logic_vector (7 downto 0)
--  ;rx0_ctrl_valid_realign_o                           : out std_logic
--  ;rx0_data_o                                         : out std_logic_vector (63 downto 0)
--  ;rx0_el_buff_rst_i                                  : in  std_logic
--  ;rx0_eye_rst_i                                      : in  std_logic
--  ;rx0_ovs_bit_sel_i                                  : in  std_logic_vector (1 downto 0)
--  ;rx0_pma_ll_fast_locked_o                           : out std_logic
--  ;rx0_pma_ll_slow_locked_o                           : out std_logic
--  ;rx0_pma_loss_of_signal_o                           : out std_logic
--  ;rx0_pma_pll_lock_o                                 : out std_logic
--  ;rx0_pma_pll_lock_track_o                           : out std_logic
--  ;rx0_pma_pwr_up_i                                   : in  std_logic
--  ;rx0_pma_rst_n_i                                    : in  std_logic
--  ;rx0_replace_en_i                                   : in  std_logic
--  ;rx0_rst_n_i                                        : in  std_logic
--  ;rx0_test_o                                         : out std_logic_vector (7 downto 0)
--  ;rx0n                                               : in  std_logic
--  ;rx0p                                               : in  std_logic
--  ;rx1n                                               : in  std_logic
--  ;rx1p                                               : in  std_logic
--  ;rx2n                                               : in  std_logic
--  ;rx2p                                               : in  std_logic
--  ;rx3n                                               : in  std_logic
--  ;rx3p                                               : in  std_logic
--  ;tx0_busy_o                                         : out std_logic
--  ;tx0_clk_ena_i                                      : in  std_logic
--  ;tx0_clk_o                                          : out std_logic
--  ;tx0_ctrl_char_is_k_i                               : in  std_logic_vector (7 downto 0)
--  ;tx0_ctrl_driver_pwrdwn_n_i                         : in  std_logic
--  ;tx0_data_i                                         : in  std_logic_vector (63 downto 0)
--  ;tx0_rst_n_i                                        : in  std_logic
--  ;tx0n                                               : out std_logic
--  ;tx0p                                               : out std_logic
--  ;tx1n                                               : out std_logic
--  ;tx1p                                               : out std_logic
--  ;tx2n                                               : out std_logic
--  ;tx2p                                               : out std_logic
--  ;tx3n                                               : out std_logic
--  ;tx3p                                               : out std_logic
--);
--end component;
entity SpaceFibre_64b is
generic (
   LOCATION : string := "hssl0"
);
port (
   ckrefn                                             : in  std_logic
  ;ckrefp                                             : in  std_logic
  ;clock_o                                            : out std_logic
  ;dyn_addr_i                                         : in  std_logic_vector (3 downto 0)
  ;dyn_calibration_cs_n_i                             : in  std_logic
  ;dyn_cfg_en_i                                       : in  std_logic
  ;dyn_lane_cs_n_i                                    : in  std_logic_vector (3 downto 0)
  ;dyn_wdata_i                                        : in  std_logic_vector (11 downto 0)
  ;dyn_wdata_sel_i                                    : in  std_logic
  ;dyn_we_n_i                                         : in  std_logic
  ;hssl_clock_i                                       : in  std_logic_vector (3 downto 0)
  ;pll_lock                                           : out std_logic
  ;pll_pma_lock_analog                                : out std_logic
  ;pll_pma_pwr_up_i                                   : in  std_logic
  ;pll_pma_rst_n_i                                    : in  std_logic
  ;rx0_align_sync_i                                   : in  std_logic
  ;rx0_busy_o                                         : out std_logic
  ;rx0_ctrl_char_is_aligned_o                         : out std_logic
  ;rx0_ctrl_char_is_comma_o                           : out std_logic_vector (7 downto 0)
  ;rx0_ctrl_char_is_f_o                               : out std_logic_vector (7 downto 0)
  ;rx0_ctrl_char_is_k_o                               : out std_logic_vector (7 downto 0)
  ;rx0_ctrl_disp_err_o                                : out std_logic_vector (7 downto 0)
  ;rx0_ctrl_el_buff_stat_o                            : out std_logic_vector (7 downto 0)
  ;rx0_ctrl_not_in_table_o                            : out std_logic_vector (7 downto 0)
  ;rx0_ctrl_valid_realign_o                           : out std_logic
  ;rx0_data_o                                         : out std_logic_vector (63 downto 0)
  ;rx0_el_buff_rst_i                                  : in  std_logic
  ;rx0_eye_rst_i                                      : in  std_logic
  ;rx0_ovs_bit_sel_i                                  : in  std_logic_vector (1 downto 0)
  ;rx0_pma_ll_fast_locked_o                           : out std_logic
  ;rx0_pma_ll_slow_locked_o                           : out std_logic
  ;rx0_pma_loss_of_signal_o                           : out std_logic
  ;rx0_pma_pll_lock_o                                 : out std_logic
  ;rx0_pma_pll_lock_track_o                           : out std_logic
  ;rx0_pma_pwr_up_i                                   : in  std_logic
  ;rx0_pma_rst_n_i                                    : in  std_logic
  ;rx0_replace_en_i                                   : in  std_logic
  ;rx0_rst_n_i                                        : in  std_logic
  ;rx0_test_o                                         : out std_logic_vector (7 downto 0)
  ;rx0n                                               : in  std_logic
  ;rx0p                                               : in  std_logic
  ;rx1n                                               : in  std_logic
  ;rx1p                                               : in  std_logic
  ;rx2n                                               : in  std_logic
  ;rx2p                                               : in  std_logic
  ;rx3n                                               : in  std_logic
  ;rx3p                                               : in  std_logic
  ;tx0_busy_o                                         : out std_logic
  ;tx0_clk_ena_i                                      : in  std_logic
  ;tx0_clk_o                                          : out std_logic
  ;tx0_ctrl_char_is_k_i                               : in  std_logic_vector (7 downto 0)
  ;tx0_ctrl_driver_pwrdwn_n_i                         : in  std_logic
  ;tx0_data_i                                         : in  std_logic_vector (63 downto 0)
  ;tx0_rst_n_i                                        : in  std_logic
  ;tx0n                                               : out std_logic
  ;tx0p                                               : out std_logic
  ;tx1n                                               : out std_logic
  ;tx1p                                               : out std_logic
  ;tx2n                                               : out std_logic
  ;tx2p                                               : out std_logic
  ;tx3n                                               : out std_logic
  ;tx3p                                               : out std_logic
);
end entity;
architecture rtl of SpaceFibre_64b is
begin
Inst_NX_HSSL_U_FULL : NX_HSSL_U_FULL
  generic map (
     cfg_dyn_all_rx_pma_m_eye_coarse_ena_i              => '0'
    ,cfg_dyn_all_rx_pma_m_eye_dn_i                      => '0'
    ,cfg_dyn_all_rx_pma_m_eye_fine_ena_i                => '0'
    ,cfg_dyn_all_rx_pma_m_eye_i                         => '0'
    ,cfg_dyn_all_rx_pma_m_eye_step_i                    => "0000"
    ,cfg_dyn_all_rx_pma_m_eye_up_i                      => '0'
    ,cfg_dyn_all_rx_pma_threshold_1_i                   => "01000"
    ,cfg_dyn_all_rx_pma_threshold_2_i                   => "00100"
    ,cfg_dyn_all_rx_pma_trim_locked_i                   => "011"
    ,cfg_dyn_all_rx_pma_trim_mode_i                     => "11"
    ,cfg_dyn_all_rx_pma_trim_unlocked_i                 => "000"
    ,cfg_dyn_rx0_pma_ctle_cap_p_i                       => "0011"
    ,cfg_dyn_rx0_pma_ctle_res_p_i                       => "0000"
    ,cfg_dyn_rx0_pma_dfe_idac_tap1_n_i                  => "111111"
    ,cfg_dyn_rx0_pma_dfe_idac_tap2_n_i                  => "111111"
    ,cfg_dyn_rx0_pma_dfe_idac_tap3_n_i                  => "111111"
    ,cfg_dyn_rx0_pma_dfe_idac_tap4_n_i                  => "111111"
    ,cfg_dyn_rx0_pma_termination_cmd_i                  => "111111"
    ,cfg_dyn_rx1_pma_ctle_cap_p_i                       => "0000"
    ,cfg_dyn_rx1_pma_ctle_res_p_i                       => "0000"
    ,cfg_dyn_rx1_pma_dfe_idac_tap1_n_i                  => "000000"
    ,cfg_dyn_rx1_pma_dfe_idac_tap2_n_i                  => "000000"
    ,cfg_dyn_rx1_pma_dfe_idac_tap3_n_i                  => "000000"
    ,cfg_dyn_rx1_pma_dfe_idac_tap4_n_i                  => "000000"
    ,cfg_dyn_rx1_pma_termination_cmd_i                  => "000000"
    ,cfg_dyn_rx2_pma_ctle_cap_p_i                       => "0000"
    ,cfg_dyn_rx2_pma_ctle_res_p_i                       => "0000"
    ,cfg_dyn_rx2_pma_dfe_idac_tap1_n_i                  => "000000"
    ,cfg_dyn_rx2_pma_dfe_idac_tap2_n_i                  => "000000"
    ,cfg_dyn_rx2_pma_dfe_idac_tap3_n_i                  => "000000"
    ,cfg_dyn_rx2_pma_dfe_idac_tap4_n_i                  => "000000"
    ,cfg_dyn_rx2_pma_termination_cmd_i                  => "000000"
    ,cfg_dyn_rx3_pma_ctle_cap_p_i                       => "0000"
    ,cfg_dyn_rx3_pma_ctle_res_p_i                       => "0000"
    ,cfg_dyn_rx3_pma_dfe_idac_tap1_n_i                  => "000000"
    ,cfg_dyn_rx3_pma_dfe_idac_tap2_n_i                  => "000000"
    ,cfg_dyn_rx3_pma_dfe_idac_tap3_n_i                  => "000000"
    ,cfg_dyn_rx3_pma_dfe_idac_tap4_n_i                  => "000000"
    ,cfg_dyn_rx3_pma_termination_cmd_i                  => "000000"
    ,cfg_dyn_tx0_pma_main_en_i                          => "101111"
    ,cfg_dyn_tx0_pma_main_sign_i                        => '1'
    ,cfg_dyn_tx0_pma_margin_input_i                     => "000000000"
    ,cfg_dyn_tx0_pma_margin_sel_i                       => "000000000"
    ,cfg_dyn_tx0_pma_post_en_i                          => "11101"
    ,cfg_dyn_tx0_pma_post_sel_i                         => "00000000"
    ,cfg_dyn_tx0_pma_post_sign_i                        => '0'
    ,cfg_dyn_tx0_pma_pre_en_i                           => '1'
    ,cfg_dyn_tx0_pma_pre_sel_i                          => "0000"
    ,cfg_dyn_tx0_pma_pre_sign_i                         => '0'
    ,cfg_dyn_tx1_pma_main_en_i                          => "000000"
    ,cfg_dyn_tx1_pma_main_sign_i                        => '0'
    ,cfg_dyn_tx1_pma_margin_input_i                     => "000000000"
    ,cfg_dyn_tx1_pma_margin_sel_i                       => "000000000"
    ,cfg_dyn_tx1_pma_post_en_i                          => "00000"
    ,cfg_dyn_tx1_pma_post_sel_i                         => "00000000"
    ,cfg_dyn_tx1_pma_post_sign_i                        => '0'
    ,cfg_dyn_tx1_pma_pre_en_i                           => '0'
    ,cfg_dyn_tx1_pma_pre_sel_i                          => "0000"
    ,cfg_dyn_tx1_pma_pre_sign_i                         => '0'
    ,cfg_dyn_tx2_pma_main_en_i                          => "000000"
    ,cfg_dyn_tx2_pma_main_sign_i                        => '0'
    ,cfg_dyn_tx2_pma_margin_input_i                     => "000000000"
    ,cfg_dyn_tx2_pma_margin_sel_i                       => "000000000"
    ,cfg_dyn_tx2_pma_post_en_i                          => "00000"
    ,cfg_dyn_tx2_pma_post_sel_i                         => "00000000"
    ,cfg_dyn_tx2_pma_post_sign_i                        => '0'
    ,cfg_dyn_tx2_pma_pre_en_i                           => '0'
    ,cfg_dyn_tx2_pma_pre_sel_i                          => "0000"
    ,cfg_dyn_tx2_pma_pre_sign_i                         => '0'
    ,cfg_dyn_tx3_pma_main_en_i                          => "000000"
    ,cfg_dyn_tx3_pma_main_sign_i                        => '0'
    ,cfg_dyn_tx3_pma_margin_input_i                     => "000000000"
    ,cfg_dyn_tx3_pma_margin_sel_i                       => "000000000"
    ,cfg_dyn_tx3_pma_post_en_i                          => "00000"
    ,cfg_dyn_tx3_pma_post_sel_i                         => "00000000"
    ,cfg_dyn_tx3_pma_post_sign_i                        => '0'
    ,cfg_dyn_tx3_pma_pre_en_i                           => '0'
    ,cfg_dyn_tx3_pma_pre_sel_i                          => "0000"
    ,cfg_dyn_tx3_pma_pre_sign_i                         => '0'
    ,cfg_main_clk_to_fabric_div_en_i                    => '0'
    ,cfg_main_clk_to_fabric_div_mode_i                  => '0'
    ,cfg_main_clk_to_fabric_sel_i                       => '0'
    ,cfg_main_clkref_sel_i                              => "00"
    ,cfg_main_rclk_to_fabric_sel_i                      => "00"
    ,cfg_main_rx_usrclk_sel_i                           => "000"
    ,cfg_main_tx_usrclk_sel_i                           => "000"
    ,cfg_main_use_only_usr_clock_i                      => '0'
    ,cfg_pcs_ovs_en_i                                   => '0'
    ,cfg_pcs_ovs_mode_i                                 => '0'
    ,cfg_pcs_pll_lock_ppm_i                             => "111"
    ,cfg_pcs_word_len_i                                 => "11"
    ,cfg_pll_pma_ckref_ext_i                            => '0'
    ,cfg_pll_pma_cpump_i                                => "1000"
    ,cfg_pll_pma_divl_i                                 => "00"
    ,cfg_pll_pma_divm_i                                 => '0'
    ,cfg_pll_pma_divn_i                                 => "01"
    ,cfg_pll_pma_gbx_en_i                               => '0'
    ,cfg_pll_pma_int_data_len_i                         => '0'
    ,cfg_pll_pma_lvds_en_i                              => '1'
    ,cfg_pll_pma_lvds_mux_i                             => '1'
    ,cfg_pll_pma_mux_ckref_i                            => '1'
    ,cfg_rx0_gearbox_en_i                               => '0'
    ,cfg_rx0_gearbox_mode_i                             => '0'
    ,cfg_rx0_pcs_8b_dscr_sel_i                          => '0'
    ,cfg_rx0_pcs_align_bypass_i                         => '0'
    ,cfg_rx0_pcs_buffers_bypass_i                       => '0'
    ,cfg_rx0_pcs_buffers_use_cdc_i                      => '0'
    ,cfg_rx0_pcs_bypass_pma_cdc_i                       => '0'
    ,cfg_rx0_pcs_bypass_usr_cdc_i                       => '0'
    ,cfg_rx0_pcs_comma_mask_i                           => "0001111111"
    ,cfg_rx0_pcs_debug_en_i                             => '0'
    ,cfg_rx0_pcs_dec_bypass_i                           => '0'
    ,cfg_rx0_pcs_dscr_bypass_i                          => '1'
    ,cfg_rx0_pcs_el_buff_diff_bef_comp_i                => "0100"
    ,cfg_rx0_pcs_el_buff_max_comp_i                     => "0111"
    ,cfg_rx0_pcs_el_buff_only_one_skp_i                 => '1'
    ,cfg_rx0_pcs_el_buff_skp_char_0_i                   => "111111100"
    ,cfg_rx0_pcs_el_buff_skp_char_1_i                   => "011001110"
    ,cfg_rx0_pcs_el_buff_skp_char_2_i                   => "001111111"
    ,cfg_rx0_pcs_el_buff_skp_char_3_i                   => "001111111"
    ,cfg_rx0_pcs_el_buff_skp_header_0_i                 => "111111100"
    ,cfg_rx0_pcs_el_buff_skp_header_1_i                 => "011001110"
    ,cfg_rx0_pcs_el_buff_skp_header_2_i                 => "001111111"
    ,cfg_rx0_pcs_el_buff_skp_header_3_i                 => "001111111"
    ,cfg_rx0_pcs_el_buff_skp_header_size_i              => "00"
    ,cfg_rx0_pcs_el_buff_skp_seq_size_i                 => "00"
    ,cfg_rx0_pcs_fsm_sel_i                              => "00"
    ,cfg_rx0_pcs_fsm_watchdog_en_i                      => '0'
    ,cfg_rx0_pcs_loopback_i                             => '0'
    ,cfg_rx0_pcs_m_comma_en_i                           => '1'
    ,cfg_rx0_pcs_m_comma_val_i                          => "1010000011"
    ,cfg_rx0_pcs_nb_comma_bef_realign_i                 => "00"
    ,cfg_rx0_pcs_p_comma_en_i                           => '1'
    ,cfg_rx0_pcs_p_comma_val_i                          => "0101111100"
    ,cfg_rx0_pcs_polarity_i                             => '0'
    ,cfg_rx0_pcs_protocol_size_i                        => '0'
    ,cfg_rx0_pcs_replace_bypass_i                       => '1'
    ,cfg_rx0_pcs_sync_supported_i                       => '0'
    ,cfg_rx0_pma_cdr_cp_i                               => "0000"
    ,cfg_rx0_pma_clk_pos_i                              => '0'
    ,cfg_rx0_pma_coarse_ppm_i                           => "101"
    ,cfg_rx0_pma_ctrl_term_i                            => "000000"
    ,cfg_rx0_pma_dco_divl_i                             => "00"
    ,cfg_rx0_pma_dco_divm_i                             => '0'
    ,cfg_rx0_pma_dco_divn_i                             => "01"
    ,cfg_rx0_pma_dco_reg_res_i                          => "00"
    ,cfg_rx0_pma_dco_vref_sel_i                         => '0'
    ,cfg_rx0_pma_fine_ppm_i                             => "001"
    ,cfg_rx0_pma_loopback_i                             => '0'
    ,cfg_rx0_pma_m_eye_ppm_i                            => "000"
    ,cfg_rx0_pma_peak_detect_cmd_i                      => "00"
    ,cfg_rx0_pma_peak_detect_on_i                       => '1'
    ,cfg_rx0_pma_pll_cpump_n_i                          => "000"
    ,cfg_rx0_pma_pll_divf_en_n_i                        => '0'
    ,cfg_rx0_pma_pll_divf_i                             => "00"
    ,cfg_rx0_pma_pll_divm_en_n_i                        => '0'
    ,cfg_rx0_pma_pll_divm_i                             => "00"
    ,cfg_rx0_pma_pll_divn_en_n_i                        => '0'
    ,cfg_rx0_pma_pll_divn_i                             => '0'
    ,cfg_rx1_gearbox_en_i                               => '0'
    ,cfg_rx1_gearbox_mode_i                             => '0'
    ,cfg_rx1_pcs_8b_dscr_sel_i                          => '0'
    ,cfg_rx1_pcs_align_bypass_i                         => '0'
    ,cfg_rx1_pcs_buffers_bypass_i                       => '0'
    ,cfg_rx1_pcs_buffers_use_cdc_i                      => '0'
    ,cfg_rx1_pcs_bypass_pma_cdc_i                       => '0'
    ,cfg_rx1_pcs_bypass_usr_cdc_i                       => '0'
    ,cfg_rx1_pcs_comma_mask_i                           => "0000000000"
    ,cfg_rx1_pcs_debug_en_i                             => '0'
    ,cfg_rx1_pcs_dec_bypass_i                           => '0'
    ,cfg_rx1_pcs_dscr_bypass_i                          => '0'
    ,cfg_rx1_pcs_el_buff_diff_bef_comp_i                => "0000"
    ,cfg_rx1_pcs_el_buff_max_comp_i                     => "0000"
    ,cfg_rx1_pcs_el_buff_only_one_skp_i                 => '0'
    ,cfg_rx1_pcs_el_buff_skp_char_0_i                   => "000000000"
    ,cfg_rx1_pcs_el_buff_skp_char_1_i                   => "000000000"
    ,cfg_rx1_pcs_el_buff_skp_char_2_i                   => "000000000"
    ,cfg_rx1_pcs_el_buff_skp_char_3_i                   => "000000000"
    ,cfg_rx1_pcs_el_buff_skp_header_0_i                 => "000000000"
    ,cfg_rx1_pcs_el_buff_skp_header_1_i                 => "000000000"
    ,cfg_rx1_pcs_el_buff_skp_header_2_i                 => "000000000"
    ,cfg_rx1_pcs_el_buff_skp_header_3_i                 => "000000000"
    ,cfg_rx1_pcs_el_buff_skp_header_size_i              => "00"
    ,cfg_rx1_pcs_el_buff_skp_seq_size_i                 => "00"
    ,cfg_rx1_pcs_fsm_sel_i                              => "00"
    ,cfg_rx1_pcs_fsm_watchdog_en_i                      => '0'
    ,cfg_rx1_pcs_loopback_i                             => '0'
    ,cfg_rx1_pcs_m_comma_en_i                           => '0'
    ,cfg_rx1_pcs_m_comma_val_i                          => "0000000000"
    ,cfg_rx1_pcs_nb_comma_bef_realign_i                 => "00"
    ,cfg_rx1_pcs_p_comma_en_i                           => '0'
    ,cfg_rx1_pcs_p_comma_val_i                          => "0000000000"
    ,cfg_rx1_pcs_polarity_i                             => '0'
    ,cfg_rx1_pcs_protocol_size_i                        => '0'
    ,cfg_rx1_pcs_replace_bypass_i                       => '0'
    ,cfg_rx1_pcs_sync_supported_i                       => '0'
    ,cfg_rx1_pma_cdr_cp_i                               => "0000"
    ,cfg_rx1_pma_clk_pos_i                              => '0'
    ,cfg_rx1_pma_coarse_ppm_i                           => "000"
    ,cfg_rx1_pma_ctrl_term_i                            => "000000"
    ,cfg_rx1_pma_dco_divl_i                             => "00"
    ,cfg_rx1_pma_dco_divm_i                             => '0'
    ,cfg_rx1_pma_dco_divn_i                             => "00"
    ,cfg_rx1_pma_dco_reg_res_i                          => "00"
    ,cfg_rx1_pma_dco_vref_sel_i                         => '0'
    ,cfg_rx1_pma_fine_ppm_i                             => "000"
    ,cfg_rx1_pma_loopback_i                             => '0'
    ,cfg_rx1_pma_m_eye_ppm_i                            => "000"
    ,cfg_rx1_pma_peak_detect_cmd_i                      => "00"
    ,cfg_rx1_pma_peak_detect_on_i                       => '0'
    ,cfg_rx1_pma_pll_cpump_n_i                          => "000"
    ,cfg_rx1_pma_pll_divf_en_n_i                        => '0'
    ,cfg_rx1_pma_pll_divf_i                             => "00"
    ,cfg_rx1_pma_pll_divm_en_n_i                        => '0'
    ,cfg_rx1_pma_pll_divm_i                             => "00"
    ,cfg_rx1_pma_pll_divn_en_n_i                        => '0'
    ,cfg_rx1_pma_pll_divn_i                             => '0'
    ,cfg_rx2_gearbox_en_i                               => '0'
    ,cfg_rx2_gearbox_mode_i                             => '0'
    ,cfg_rx2_pcs_8b_dscr_sel_i                          => '0'
    ,cfg_rx2_pcs_align_bypass_i                         => '0'
    ,cfg_rx2_pcs_buffers_bypass_i                       => '0'
    ,cfg_rx2_pcs_buffers_use_cdc_i                      => '0'
    ,cfg_rx2_pcs_bypass_pma_cdc_i                       => '0'
    ,cfg_rx2_pcs_bypass_usr_cdc_i                       => '0'
    ,cfg_rx2_pcs_comma_mask_i                           => "0000000000"
    ,cfg_rx2_pcs_debug_en_i                             => '0'
    ,cfg_rx2_pcs_dec_bypass_i                           => '0'
    ,cfg_rx2_pcs_dscr_bypass_i                          => '0'
    ,cfg_rx2_pcs_el_buff_diff_bef_comp_i                => "0000"
    ,cfg_rx2_pcs_el_buff_max_comp_i                     => "0000"
    ,cfg_rx2_pcs_el_buff_only_one_skp_i                 => '0'
    ,cfg_rx2_pcs_el_buff_skp_char_0_i                   => "000000000"
    ,cfg_rx2_pcs_el_buff_skp_char_1_i                   => "000000000"
    ,cfg_rx2_pcs_el_buff_skp_char_2_i                   => "000000000"
    ,cfg_rx2_pcs_el_buff_skp_char_3_i                   => "000000000"
    ,cfg_rx2_pcs_el_buff_skp_header_0_i                 => "000000000"
    ,cfg_rx2_pcs_el_buff_skp_header_1_i                 => "000000000"
    ,cfg_rx2_pcs_el_buff_skp_header_2_i                 => "000000000"
    ,cfg_rx2_pcs_el_buff_skp_header_3_i                 => "000000000"
    ,cfg_rx2_pcs_el_buff_skp_header_size_i              => "00"
    ,cfg_rx2_pcs_el_buff_skp_seq_size_i                 => "00"
    ,cfg_rx2_pcs_fsm_sel_i                              => "00"
    ,cfg_rx2_pcs_fsm_watchdog_en_i                      => '0'
    ,cfg_rx2_pcs_loopback_i                             => '0'
    ,cfg_rx2_pcs_m_comma_en_i                           => '0'
    ,cfg_rx2_pcs_m_comma_val_i                          => "0000000000"
    ,cfg_rx2_pcs_nb_comma_bef_realign_i                 => "00"
    ,cfg_rx2_pcs_p_comma_en_i                           => '0'
    ,cfg_rx2_pcs_p_comma_val_i                          => "0000000000"
    ,cfg_rx2_pcs_polarity_i                             => '0'
    ,cfg_rx2_pcs_protocol_size_i                        => '0'
    ,cfg_rx2_pcs_replace_bypass_i                       => '0'
    ,cfg_rx2_pcs_sync_supported_i                       => '0'
    ,cfg_rx2_pma_cdr_cp_i                               => "0000"
    ,cfg_rx2_pma_clk_pos_i                              => '0'
    ,cfg_rx2_pma_coarse_ppm_i                           => "000"
    ,cfg_rx2_pma_ctrl_term_i                            => "000000"
    ,cfg_rx2_pma_dco_divl_i                             => "00"
    ,cfg_rx2_pma_dco_divm_i                             => '0'
    ,cfg_rx2_pma_dco_divn_i                             => "00"
    ,cfg_rx2_pma_dco_reg_res_i                          => "00"
    ,cfg_rx2_pma_dco_vref_sel_i                         => '0'
    ,cfg_rx2_pma_fine_ppm_i                             => "000"
    ,cfg_rx2_pma_loopback_i                             => '0'
    ,cfg_rx2_pma_m_eye_ppm_i                            => "000"
    ,cfg_rx2_pma_peak_detect_cmd_i                      => "00"
    ,cfg_rx2_pma_peak_detect_on_i                       => '0'
    ,cfg_rx2_pma_pll_cpump_n_i                          => "000"
    ,cfg_rx2_pma_pll_divf_en_n_i                        => '0'
    ,cfg_rx2_pma_pll_divf_i                             => "00"
    ,cfg_rx2_pma_pll_divm_en_n_i                        => '0'
    ,cfg_rx2_pma_pll_divm_i                             => "00"
    ,cfg_rx2_pma_pll_divn_en_n_i                        => '0'
    ,cfg_rx2_pma_pll_divn_i                             => '0'
    ,cfg_rx3_gearbox_en_i                               => '0'
    ,cfg_rx3_gearbox_mode_i                             => '0'
    ,cfg_rx3_pcs_8b_dscr_sel_i                          => '0'
    ,cfg_rx3_pcs_align_bypass_i                         => '0'
    ,cfg_rx3_pcs_buffers_bypass_i                       => '0'
    ,cfg_rx3_pcs_buffers_use_cdc_i                      => '0'
    ,cfg_rx3_pcs_bypass_pma_cdc_i                       => '0'
    ,cfg_rx3_pcs_bypass_usr_cdc_i                       => '0'
    ,cfg_rx3_pcs_comma_mask_i                           => "0000000000"
    ,cfg_rx3_pcs_debug_en_i                             => '0'
    ,cfg_rx3_pcs_dec_bypass_i                           => '0'
    ,cfg_rx3_pcs_dscr_bypass_i                          => '0'
    ,cfg_rx3_pcs_el_buff_diff_bef_comp_i                => "0000"
    ,cfg_rx3_pcs_el_buff_max_comp_i                     => "0000"
    ,cfg_rx3_pcs_el_buff_only_one_skp_i                 => '0'
    ,cfg_rx3_pcs_el_buff_skp_char_0_i                   => "000000000"
    ,cfg_rx3_pcs_el_buff_skp_char_1_i                   => "000000000"
    ,cfg_rx3_pcs_el_buff_skp_char_2_i                   => "000000000"
    ,cfg_rx3_pcs_el_buff_skp_char_3_i                   => "000000000"
    ,cfg_rx3_pcs_el_buff_skp_header_0_i                 => "000000000"
    ,cfg_rx3_pcs_el_buff_skp_header_1_i                 => "000000000"
    ,cfg_rx3_pcs_el_buff_skp_header_2_i                 => "000000000"
    ,cfg_rx3_pcs_el_buff_skp_header_3_i                 => "000000000"
    ,cfg_rx3_pcs_el_buff_skp_header_size_i              => "00"
    ,cfg_rx3_pcs_el_buff_skp_seq_size_i                 => "00"
    ,cfg_rx3_pcs_fsm_sel_i                              => "00"
    ,cfg_rx3_pcs_fsm_watchdog_en_i                      => '0'
    ,cfg_rx3_pcs_loopback_i                             => '0'
    ,cfg_rx3_pcs_m_comma_en_i                           => '0'
    ,cfg_rx3_pcs_m_comma_val_i                          => "0000000000"
    ,cfg_rx3_pcs_nb_comma_bef_realign_i                 => "00"
    ,cfg_rx3_pcs_p_comma_en_i                           => '0'
    ,cfg_rx3_pcs_p_comma_val_i                          => "0000000000"
    ,cfg_rx3_pcs_polarity_i                             => '0'
    ,cfg_rx3_pcs_protocol_size_i                        => '0'
    ,cfg_rx3_pcs_replace_bypass_i                       => '0'
    ,cfg_rx3_pcs_sync_supported_i                       => '0'
    ,cfg_rx3_pma_cdr_cp_i                               => "0000"
    ,cfg_rx3_pma_clk_pos_i                              => '0'
    ,cfg_rx3_pma_coarse_ppm_i                           => "000"
    ,cfg_rx3_pma_ctrl_term_i                            => "000000"
    ,cfg_rx3_pma_dco_divl_i                             => "00"
    ,cfg_rx3_pma_dco_divm_i                             => '0'
    ,cfg_rx3_pma_dco_divn_i                             => "00"
    ,cfg_rx3_pma_dco_reg_res_i                          => "00"
    ,cfg_rx3_pma_dco_vref_sel_i                         => '0'
    ,cfg_rx3_pma_fine_ppm_i                             => "000"
    ,cfg_rx3_pma_loopback_i                             => '0'
    ,cfg_rx3_pma_m_eye_ppm_i                            => "000"
    ,cfg_rx3_pma_peak_detect_cmd_i                      => "00"
    ,cfg_rx3_pma_peak_detect_on_i                       => '0'
    ,cfg_rx3_pma_pll_cpump_n_i                          => "000"
    ,cfg_rx3_pma_pll_divf_en_n_i                        => '0'
    ,cfg_rx3_pma_pll_divf_i                             => "00"
    ,cfg_rx3_pma_pll_divm_en_n_i                        => '0'
    ,cfg_rx3_pma_pll_divm_i                             => "00"
    ,cfg_rx3_pma_pll_divn_en_n_i                        => '0'
    ,cfg_rx3_pma_pll_divn_i                             => '0'
    ,cfg_test_mode_i                                    => "00"
    ,cfg_tx0_gearbox_en_i                               => '0'
    ,cfg_tx0_gearbox_mode_i                             => '0'
    ,cfg_tx0_pcs_8b_scr_sel_i                           => '0'
    ,cfg_tx0_pcs_bypass_pma_cdc_i                       => '0'
    ,cfg_tx0_pcs_bypass_usr_cdc_i                       => '0'
    ,cfg_tx0_pcs_enc_bypass_i                           => '0'
    ,cfg_tx0_pcs_esistream_fsm_en_i                     => '0'
    ,cfg_tx0_pcs_loopback_i                             => '0'
    ,cfg_tx0_pcs_polarity_i                             => '0'
    ,cfg_tx0_pcs_protocol_size_i                        => '0'
    ,cfg_tx0_pcs_replace_bypass_i                       => '1'
    ,cfg_tx0_pcs_scr_bypass_i                           => '1'
    ,cfg_tx0_pcs_scr_init_i                             => "00000000000000000"
    ,cfg_tx0_pcs_sync_supported_i                       => '0'
    ,cfg_tx0_pma_clk_pos_i                              => '0'
    ,cfg_tx0_pma_loopback_i                             => '0'
    ,cfg_tx1_gearbox_en_i                               => '0'
    ,cfg_tx1_gearbox_mode_i                             => '0'
    ,cfg_tx1_pcs_8b_scr_sel_i                           => '0'
    ,cfg_tx1_pcs_bypass_pma_cdc_i                       => '0'
    ,cfg_tx1_pcs_bypass_usr_cdc_i                       => '0'
    ,cfg_tx1_pcs_enc_bypass_i                           => '0'
    ,cfg_tx1_pcs_esistream_fsm_en_i                     => '0'
    ,cfg_tx1_pcs_loopback_i                             => '0'
    ,cfg_tx1_pcs_polarity_i                             => '0'
    ,cfg_tx1_pcs_protocol_size_i                        => '0'
    ,cfg_tx1_pcs_replace_bypass_i                       => '0'
    ,cfg_tx1_pcs_scr_bypass_i                           => '0'
    ,cfg_tx1_pcs_scr_init_i                             => "00000000000000000"
    ,cfg_tx1_pcs_sync_supported_i                       => '0'
    ,cfg_tx1_pma_clk_pos_i                              => '0'
    ,cfg_tx1_pma_loopback_i                             => '0'
    ,cfg_tx2_gearbox_en_i                               => '0'
    ,cfg_tx2_gearbox_mode_i                             => '0'
    ,cfg_tx2_pcs_8b_scr_sel_i                           => '0'
    ,cfg_tx2_pcs_bypass_pma_cdc_i                       => '0'
    ,cfg_tx2_pcs_bypass_usr_cdc_i                       => '0'
    ,cfg_tx2_pcs_enc_bypass_i                           => '0'
    ,cfg_tx2_pcs_esistream_fsm_en_i                     => '0'
    ,cfg_tx2_pcs_loopback_i                             => '0'
    ,cfg_tx2_pcs_polarity_i                             => '0'
    ,cfg_tx2_pcs_protocol_size_i                        => '0'
    ,cfg_tx2_pcs_replace_bypass_i                       => '0'
    ,cfg_tx2_pcs_scr_bypass_i                           => '0'
    ,cfg_tx2_pcs_scr_init_i                             => "00000000000000000"
    ,cfg_tx2_pcs_sync_supported_i                       => '0'
    ,cfg_tx2_pma_clk_pos_i                              => '0'
    ,cfg_tx2_pma_loopback_i                             => '0'
    ,cfg_tx3_gearbox_en_i                               => '0'
    ,cfg_tx3_gearbox_mode_i                             => '0'
    ,cfg_tx3_pcs_8b_scr_sel_i                           => '0'
    ,cfg_tx3_pcs_bypass_pma_cdc_i                       => '0'
    ,cfg_tx3_pcs_bypass_usr_cdc_i                       => '0'
    ,cfg_tx3_pcs_enc_bypass_i                           => '0'
    ,cfg_tx3_pcs_esistream_fsm_en_i                     => '0'
    ,cfg_tx3_pcs_loopback_i                             => '0'
    ,cfg_tx3_pcs_polarity_i                             => '0'
    ,cfg_tx3_pcs_protocol_size_i                        => '0'
    ,cfg_tx3_pcs_replace_bypass_i                       => '0'
    ,cfg_tx3_pcs_scr_bypass_i                           => '0'
    ,cfg_tx3_pcs_scr_init_i                             => "00000000000000000"
    ,cfg_tx3_pcs_sync_supported_i                       => '0'
    ,cfg_tx3_pma_clk_pos_i                              => '0'
    ,cfg_tx3_pma_loopback_i                             => '0'
    ,location                                           => LOCATION
  )
  port map (
     calibrate                                          => '0'
    ,ckrefn                                             => ckrefn
    ,ckrefp                                             => ckrefp
    ,hssl_clock_i                                       => hssl_clock_i
    ,hssl_clock_o                                       => clock_o
    ,hssl_rclock_o                                      => open
    ,pll_ckref_in                                       => '0'
    ,pll_ckref_out                                      => open
    ,pma_pll_fbr_clk_ref_o                              => open
    ,rx0n                                               => rx0n
    ,rx0p                                               => rx0p
    ,rx1n                                               => rx1n
    ,rx1p                                               => rx1p
    ,rx2n                                               => rx2n
    ,rx2p                                               => rx2p
    ,rx3n                                               => rx3n
    ,rx3p                                               => rx3p
    ,scan_en_i                                          => '0'
    ,scan_in_i                                          => "00000000"
    ,scan_out_o                                         => open
    ,tx0n                                               => tx0n
    ,tx0p                                               => tx0p
    ,tx1n                                               => tx1n
    ,tx1p                                               => tx1p
    ,tx2n                                               => tx2n
    ,tx2p                                               => tx2p
    ,tx3n                                               => tx3n
    ,tx3p                                               => tx3p
    ,usr_calibrate_pma_out_o                            => open
    ,usr_dyn_cfg_addr_i                                 => dyn_addr_i
    ,usr_dyn_cfg_calibration_cs_n_i                     => dyn_calibration_cs_n_i
    ,usr_dyn_cfg_en_i                                   => dyn_cfg_en_i
    ,usr_dyn_cfg_lane_cs_n_i                            => dyn_lane_cs_n_i
    ,usr_dyn_cfg_wdata_i                                => dyn_wdata_i
    ,usr_dyn_cfg_wdata_sel_i                            => dyn_wdata_sel_i
    ,usr_dyn_cfg_we_n_i                                 => dyn_we_n_i
    ,usr_main_async_debug_ack_i                         => '0'
    ,usr_main_async_debug_lane_sel_i                    => "00"
    ,usr_main_async_debug_req_o                         => open
    ,usr_main_rst_n_i                                   => '0'
    ,usr_main_rx_pma_ll_out_o                           => open
    ,usr_pll_ckfb_lock_o                                => open
    ,usr_pll_lock_o                                     => pll_lock
    ,usr_pll_pma_lock_analog_o                          => pll_pma_lock_analog
    ,usr_pll_pma_pwr_down_n_i                           => pll_pma_pwr_up_i
    ,usr_pll_pma_rst_n_i                                => pll_pma_rst_n_i
    ,usr_rx0_busy_o                                     => rx0_busy_o
    ,usr_rx0_ctrl_align_en_i                            => '1'
    ,usr_rx0_ctrl_align_sync_i                          => rx0_align_sync_i
    ,usr_rx0_ctrl_char_is_a_o                           => rx0_ctrl_el_buff_stat_o
    ,usr_rx0_ctrl_char_is_aligned_o                     => rx0_ctrl_char_is_aligned_o
    ,usr_rx0_ctrl_char_is_comma_o                       => rx0_ctrl_char_is_comma_o
    ,usr_rx0_ctrl_char_is_f_o                           => rx0_ctrl_char_is_f_o
    ,usr_rx0_ctrl_char_is_k_o                           => rx0_ctrl_char_is_k_o
    ,usr_rx0_ctrl_debug_sel_i                           => "000"
    ,usr_rx0_ctrl_dec_en_i                              => '1'
    ,usr_rx0_ctrl_disp_err_o                            => rx0_ctrl_disp_err_o
    ,usr_rx0_ctrl_dscr_en_i                             => '0'
    ,usr_rx0_ctrl_el_buff_rst_i                         => rx0_el_buff_rst_i
    ,usr_rx0_ctrl_not_in_table_o                        => rx0_ctrl_not_in_table_o
    ,usr_rx0_ctrl_ovs_bit_sel_i                         => rx0_ovs_bit_sel_i
    ,usr_rx0_ctrl_replace_en_i                          => rx0_replace_en_i
    ,usr_rx0_ctrl_valid_realign_o                       => rx0_ctrl_valid_realign_o
    ,usr_rx0_data_o                                     => rx0_data_o
    ,usr_rx0_pma_ll_fast_locked_o                       => rx0_pma_ll_fast_locked_o
    ,usr_rx0_pma_ll_slow_locked_o                       => rx0_pma_ll_slow_locked_o
    ,usr_rx0_pma_loss_of_signal_o                       => rx0_pma_loss_of_signal_o
    ,usr_rx0_pma_m_eye_rst_i                            => rx0_eye_rst_i
    ,usr_rx0_pma_pll_lock_o                             => rx0_pma_pll_lock_o
    ,usr_rx0_pma_pll_lock_track_o                       => rx0_pma_pll_lock_track_o
    ,usr_rx0_pma_pwr_down_n_i                           => rx0_pma_pwr_up_i
    ,usr_rx0_pma_rst_n_i                                => rx0_pma_rst_n_i
    ,usr_rx0_rst_n_i                                    => rx0_rst_n_i
    ,usr_rx0_test_o                                     => rx0_test_o
    ,usr_rx1_busy_o                                     => open
    ,usr_rx1_ctrl_align_en_i                            => '0'
    ,usr_rx1_ctrl_align_sync_i                          => '0'
    ,usr_rx1_ctrl_char_is_a_o                           => open
    ,usr_rx1_ctrl_char_is_aligned_o                     => open
    ,usr_rx1_ctrl_char_is_comma_o                       => open
    ,usr_rx1_ctrl_char_is_f_o                           => open
    ,usr_rx1_ctrl_char_is_k_o                           => open
    ,usr_rx1_ctrl_debug_sel_i                           => "000"
    ,usr_rx1_ctrl_dec_en_i                              => '0'
    ,usr_rx1_ctrl_disp_err_o                            => open
    ,usr_rx1_ctrl_dscr_en_i                             => '0'
    ,usr_rx1_ctrl_el_buff_rst_i                         => '0'
    ,usr_rx1_ctrl_not_in_table_o                        => open
    ,usr_rx1_ctrl_ovs_bit_sel_i                         => "00"
    ,usr_rx1_ctrl_replace_en_i                          => '0'
    ,usr_rx1_ctrl_valid_realign_o                       => open
    ,usr_rx1_data_o                                     => open
    ,usr_rx1_pma_ll_fast_locked_o                       => open
    ,usr_rx1_pma_ll_slow_locked_o                       => open
    ,usr_rx1_pma_loss_of_signal_o                       => open
    ,usr_rx1_pma_m_eye_rst_i                            => '0'
    ,usr_rx1_pma_pll_lock_o                             => open
    ,usr_rx1_pma_pll_lock_track_o                       => open
    ,usr_rx1_pma_pwr_down_n_i                           => '0'
    ,usr_rx1_pma_rst_n_i                                => '0'
    ,usr_rx1_rst_n_i                                    => '0'
    ,usr_rx1_test_o                                     => open
    ,usr_rx2_busy_o                                     => open
    ,usr_rx2_ctrl_align_en_i                            => '0'
    ,usr_rx2_ctrl_align_sync_i                          => '0'
    ,usr_rx2_ctrl_char_is_a_o                           => open
    ,usr_rx2_ctrl_char_is_aligned_o                     => open
    ,usr_rx2_ctrl_char_is_comma_o                       => open
    ,usr_rx2_ctrl_char_is_f_o                           => open
    ,usr_rx2_ctrl_char_is_k_o                           => open
    ,usr_rx2_ctrl_debug_sel_i                           => "000"
    ,usr_rx2_ctrl_dec_en_i                              => '0'
    ,usr_rx2_ctrl_disp_err_o                            => open
    ,usr_rx2_ctrl_dscr_en_i                             => '0'
    ,usr_rx2_ctrl_el_buff_rst_i                         => '0'
    ,usr_rx2_ctrl_not_in_table_o                        => open
    ,usr_rx2_ctrl_ovs_bit_sel_i                         => "00"
    ,usr_rx2_ctrl_replace_en_i                          => '0'
    ,usr_rx2_ctrl_valid_realign_o                       => open
    ,usr_rx2_data_o                                     => open
    ,usr_rx2_pma_ll_fast_locked_o                       => open
    ,usr_rx2_pma_ll_slow_locked_o                       => open
    ,usr_rx2_pma_loss_of_signal_o                       => open
    ,usr_rx2_pma_m_eye_rst_i                            => '0'
    ,usr_rx2_pma_pll_lock_o                             => open
    ,usr_rx2_pma_pll_lock_track_o                       => open
    ,usr_rx2_pma_pwr_down_n_i                           => '0'
    ,usr_rx2_pma_rst_n_i                                => '0'
    ,usr_rx2_rst_n_i                                    => '0'
    ,usr_rx2_test_o                                     => open
    ,usr_rx3_busy_o                                     => open
    ,usr_rx3_ctrl_align_en_i                            => '0'
    ,usr_rx3_ctrl_align_sync_i                          => '0'
    ,usr_rx3_ctrl_char_is_a_o                           => open
    ,usr_rx3_ctrl_char_is_aligned_o                     => open
    ,usr_rx3_ctrl_char_is_comma_o                       => open
    ,usr_rx3_ctrl_char_is_f_o                           => open
    ,usr_rx3_ctrl_char_is_k_o                           => open
    ,usr_rx3_ctrl_debug_sel_i                           => "000"
    ,usr_rx3_ctrl_dec_en_i                              => '0'
    ,usr_rx3_ctrl_disp_err_o                            => open
    ,usr_rx3_ctrl_dscr_en_i                             => '0'
    ,usr_rx3_ctrl_el_buff_rst_i                         => '0'
    ,usr_rx3_ctrl_not_in_table_o                        => open
    ,usr_rx3_ctrl_ovs_bit_sel_i                         => "00"
    ,usr_rx3_ctrl_replace_en_i                          => '0'
    ,usr_rx3_ctrl_valid_realign_o                       => open
    ,usr_rx3_data_o                                     => open
    ,usr_rx3_pma_ll_fast_locked_o                       => open
    ,usr_rx3_pma_ll_slow_locked_o                       => open
    ,usr_rx3_pma_loss_of_signal_o                       => open
    ,usr_rx3_pma_m_eye_rst_i                            => '0'
    ,usr_rx3_pma_pll_lock_o                             => open
    ,usr_rx3_pma_pll_lock_track_o                       => open
    ,usr_rx3_pma_pwr_down_n_i                           => '0'
    ,usr_rx3_pma_rst_n_i                                => '0'
    ,usr_rx3_rst_n_i                                    => '0'
    ,usr_rx3_test_o                                     => open
    ,usr_tx0_busy_o                                     => tx0_busy_o
    ,usr_tx0_ctrl_char_is_k_i                           => tx0_ctrl_char_is_k_i
    ,usr_tx0_ctrl_driver_pwrdwn_n_i                     => tx0_ctrl_driver_pwrdwn_n_i
    ,usr_tx0_ctrl_enc_en_i                              => "11111111"
    ,usr_tx0_ctrl_end_of_frame_i                        => "00000000"
    ,usr_tx0_ctrl_end_of_multiframe_i                   => "00000000"
    ,usr_tx0_ctrl_invalid_k_o                           => open
    ,usr_tx0_ctrl_replace_en_i                          => '0'
    ,usr_tx0_ctrl_scr_en_i                              => "00000000"
    ,usr_tx0_data_i                                     => tx0_data_i
    ,usr_tx0_pma_clk_en_i                               => tx0_clk_ena_i
    ,usr_tx0_pma_tx_clk_o                               => tx0_clk_o
    ,usr_tx0_rst_n_i                                    => tx0_rst_n_i
    ,usr_tx1_busy_o                                     => open
    ,usr_tx1_ctrl_char_is_k_i                           => "00000000"
    ,usr_tx1_ctrl_driver_pwrdwn_n_i                     => '0'
    ,usr_tx1_ctrl_enc_en_i                              => "00000000"
    ,usr_tx1_ctrl_end_of_frame_i                        => "00000000"
    ,usr_tx1_ctrl_end_of_multiframe_i                   => "00000000"
    ,usr_tx1_ctrl_invalid_k_o                           => open
    ,usr_tx1_ctrl_replace_en_i                          => '0'
    ,usr_tx1_ctrl_scr_en_i                              => "00000000"
    ,usr_tx1_data_i                                     => "0000000000000000000000000000000000000000000000000000000000000000"
    ,usr_tx1_pma_clk_en_i                               => '0'
    ,usr_tx1_pma_tx_clk_o                               => open
    ,usr_tx1_rst_n_i                                    => '0'
    ,usr_tx2_busy_o                                     => open
    ,usr_tx2_ctrl_char_is_k_i                           => "00000000"
    ,usr_tx2_ctrl_driver_pwrdwn_n_i                     => '0'
    ,usr_tx2_ctrl_enc_en_i                              => "00000000"
    ,usr_tx2_ctrl_end_of_frame_i                        => "00000000"
    ,usr_tx2_ctrl_end_of_multiframe_i                   => "00000000"
    ,usr_tx2_ctrl_invalid_k_o                           => open
    ,usr_tx2_ctrl_replace_en_i                          => '0'
    ,usr_tx2_ctrl_scr_en_i                              => "00000000"
    ,usr_tx2_data_i                                     => "0000000000000000000000000000000000000000000000000000000000000000"
    ,usr_tx2_pma_clk_en_i                               => '0'
    ,usr_tx2_pma_tx_clk_o                               => open
    ,usr_tx2_rst_n_i                                    => '0'
    ,usr_tx3_busy_o                                     => open
    ,usr_tx3_ctrl_char_is_k_i                           => "00000000"
    ,usr_tx3_ctrl_driver_pwrdwn_n_i                     => '0'
    ,usr_tx3_ctrl_enc_en_i                              => "00000000"
    ,usr_tx3_ctrl_end_of_frame_i                        => "00000000"
    ,usr_tx3_ctrl_end_of_multiframe_i                   => "00000000"
    ,usr_tx3_ctrl_invalid_k_o                           => open
    ,usr_tx3_ctrl_replace_en_i                          => '0'
    ,usr_tx3_ctrl_scr_en_i                              => "00000000"
    ,usr_tx3_data_i                                     => "0000000000000000000000000000000000000000000000000000000000000000"
    ,usr_tx3_pma_clk_en_i                               => '0'
    ,usr_tx3_pma_tx_clk_o                               => open
    ,usr_tx3_rst_n_i                                    => '0'
  );
end architecture;
