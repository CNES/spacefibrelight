<a href="/spacefibrelight/reports/design_hierarchy.html#vhdl-entities">Back to Design Hierarchy Report</a>

<br>

# Entity - SpaceFibre_64b

## Summary

| Name | Location | Description |
| --- | --- | --- |
|SpaceFibre_64b|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#85">hssl_SpaceFibre_64b.vhd#85</linty-anchor>||
## Instantiations

Count: 1

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| inst_SpaceFibre_64b | <linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#895">phy_plus_lane_64b.vhd#895</linty-anchor> |  | <a href="/spacefibrelight/reports/design/module_7/instantiation_1.html"><img title="View Instantiation Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details"></a> |


## Generics

Count: 1

| Name | Type | Default value | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#87">LOCATION</linty-anchor>|string|"hssl0"||
## Ports

Count: 62

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#90">ckrefn</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#91">ckrefp</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#92">clock_o</linty-anchor>|out|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#93">dyn_addr_i</linty-anchor>|in|std_logic_vector ( 3 downto 0 )||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#94">dyn_calibration_cs_n_i</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#95">dyn_cfg_en_i</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#96">dyn_lane_cs_n_i</linty-anchor>|in|std_logic_vector ( 3 downto 0 )||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#97">dyn_wdata_i</linty-anchor>|in|std_logic_vector ( 11 downto 0 )||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#98">dyn_wdata_sel_i</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#99">dyn_we_n_i</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#100">hssl_clock_i</linty-anchor>|in|std_logic_vector ( 3 downto 0 )||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#101">pll_lock</linty-anchor>|out|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#102">pll_pma_lock_analog</linty-anchor>|out|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#103">pll_pma_pwr_up_i</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#104">pll_pma_rst_n_i</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#105">rx0_align_sync_i</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#106">rx0_busy_o</linty-anchor>|out|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#107">rx0_ctrl_char_is_aligned_o</linty-anchor>|out|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#108">rx0_ctrl_char_is_comma_o</linty-anchor>|out|std_logic_vector ( 7 downto 0 )||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#109">rx0_ctrl_char_is_f_o</linty-anchor>|out|std_logic_vector ( 7 downto 0 )||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#110">rx0_ctrl_char_is_k_o</linty-anchor>|out|std_logic_vector ( 7 downto 0 )||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#111">rx0_ctrl_disp_err_o</linty-anchor>|out|std_logic_vector ( 7 downto 0 )||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#112">rx0_ctrl_el_buff_stat_o</linty-anchor>|out|std_logic_vector ( 7 downto 0 )||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#113">rx0_ctrl_not_in_table_o</linty-anchor>|out|std_logic_vector ( 7 downto 0 )||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#114">rx0_ctrl_valid_realign_o</linty-anchor>|out|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#115">rx0_data_o</linty-anchor>|out|std_logic_vector ( 63 downto 0 )||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#116">rx0_el_buff_rst_i</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#117">rx0_eye_rst_i</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#118">rx0_ovs_bit_sel_i</linty-anchor>|in|std_logic_vector ( 1 downto 0 )||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#119">rx0_pma_ll_fast_locked_o</linty-anchor>|out|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#120">rx0_pma_ll_slow_locked_o</linty-anchor>|out|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#121">rx0_pma_loss_of_signal_o</linty-anchor>|out|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#122">rx0_pma_pll_lock_o</linty-anchor>|out|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#123">rx0_pma_pll_lock_track_o</linty-anchor>|out|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#124">rx0_pma_pwr_up_i</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#125">rx0_pma_rst_n_i</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#126">rx0_replace_en_i</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#127">rx0_rst_n_i</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#128">rx0_test_o</linty-anchor>|out|std_logic_vector ( 7 downto 0 )||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#129">rx0n</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#130">rx0p</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#131">rx1n</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#132">rx1p</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#133">rx2n</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#134">rx2p</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#135">rx3n</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#136">rx3p</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#137">tx0_busy_o</linty-anchor>|out|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#138">tx0_clk_ena_i</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#139">tx0_clk_o</linty-anchor>|out|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#140">tx0_ctrl_char_is_k_i</linty-anchor>|in|std_logic_vector ( 7 downto 0 )||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#141">tx0_ctrl_driver_pwrdwn_n_i</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#142">tx0_data_i</linty-anchor>|in|std_logic_vector ( 63 downto 0 )||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#143">tx0_rst_n_i</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#144">tx0n</linty-anchor>|out|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#145">tx0p</linty-anchor>|out|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#146">tx1n</linty-anchor>|out|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#147">tx1p</linty-anchor>|out|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#148">tx2n</linty-anchor>|out|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#149">tx2p</linty-anchor>|out|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#150">tx3n</linty-anchor>|out|std_logic||
|<linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#151">tx3p</linty-anchor>|out|std_logic||


<br>

<a href="/spacefibrelight/reports/design_hierarchy.html#vhdl-entities">Back to Design Hierarchy Report</a>