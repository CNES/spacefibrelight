[Back to FSM Report](../finite_state_machines.md)

<br>

# FSM #10: current_state

## Summary

|Name|Location|Graph|Reset State|States|Input Signals|Output Signals|
|---|---|:---:|---|---|---:|---:|
current_state|<linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#67">rx_sync_fsm.vhd#67</linty-anchor>|<a href="/graphs/fsm_states_10_graph.html"><img title="Open FSM Diagram" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open FSM Diagram"></a>|LOST_SYNC_ST| Count: 3<br>CHECK_SYNC_ST<br>LOST_SYNC_ST<br>READY_ST|10|11||

<br>

## Input Signals

Count: 10

|Name|Declaration|
|---|---|
|COMMA_DET_FROM_IP|<linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#50">rx_sync_fsm.vhd#50</linty-anchor>|
|LANE_RESET|<linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#52">rx_sync_fsm.vhd#52</linty-anchor>|
|LANE_RESET_DL|<linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#38">rx_sync_fsm.vhd#38</linty-anchor>|
|comma_det_from_ip_r|<linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#68">rx_sync_fsm.vhd#68</linty-anchor>|
|disparity_err|<linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#78">rx_sync_fsm.vhd#78</linty-anchor>|
|err_word_x5|<linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#75">rx_sync_fsm.vhd#75</linty-anchor>|
|invalid_symb|<linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#77">rx_sync_fsm.vhd#77</linty-anchor>|
|rx_word_realign_from_ip_r|<linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#69">rx_sync_fsm.vhd#69</linty-anchor>|
|rx_word_realign_from_ip_rr|<linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#70">rx_sync_fsm.vhd#70</linty-anchor>|
|valid_symb|<linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#76">rx_sync_fsm.vhd#76</linty-anchor>||

## Output Signals

Count: 11

|Name|Declaration|
|---|---|
|DATA_RDY_TO_LCWD|<linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#42">rx_sync_fsm.vhd#42</linty-anchor>|
|DATA_RX_TO_LCWD|<linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#40">rx_sync_fsm.vhd#40</linty-anchor>|
|VALID_K_CARAC_TO_LCWD|<linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#41">rx_sync_fsm.vhd#41</linty-anchor>|
|data_rdy_to_lcwd_i|<linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#73">rx_sync_fsm.vhd#73</linty-anchor>|
|data_rx_to_lcwd_i|<linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#71">rx_sync_fsm.vhd#71</linty-anchor>|
|disparity_err|<linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#78">rx_sync_fsm.vhd#78</linty-anchor>|
|err_word_cnt|<linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#74">rx_sync_fsm.vhd#74</linty-anchor>|
|err_word_x5|<linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#75">rx_sync_fsm.vhd#75</linty-anchor>|
|invalid_symb|<linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#77">rx_sync_fsm.vhd#77</linty-anchor>|
|valid_k_charac_to_lcwd_i|<linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#72">rx_sync_fsm.vhd#72</linty-anchor>|
|valid_symb|<linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#76">rx_sync_fsm.vhd#76</linty-anchor>|

## Transition table

|From|To|Input Control Signals|
|---|---|---|
|LOST_SYNC_ST|LOST_SYNC_ST|COMMA_DET_FROM_IP: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#50">rx_sync_fsm.vhd#50</linty-anchor><br>comma_det_from_ip_r: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#68">rx_sync_fsm.vhd#68</linty-anchor>|
|LOST_SYNC_ST|CHECK_SYNC_ST|COMMA_DET_FROM_IP: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#50">rx_sync_fsm.vhd#50</linty-anchor><br>comma_det_from_ip_r: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#68">rx_sync_fsm.vhd#68</linty-anchor>|
|CHECK_SYNC_ST|LOST_SYNC_ST|LANE_RESET: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#52">rx_sync_fsm.vhd#52</linty-anchor><br>LANE_RESET_DL: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#38">rx_sync_fsm.vhd#38</linty-anchor><br>err_word_x5: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#75">rx_sync_fsm.vhd#75</linty-anchor><br>rx_word_realign_from_ip_r: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#69">rx_sync_fsm.vhd#69</linty-anchor><br>rx_word_realign_from_ip_rr: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#70">rx_sync_fsm.vhd#70</linty-anchor>|
|CHECK_SYNC_ST|CHECK_SYNC_ST|LANE_RESET: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#52">rx_sync_fsm.vhd#52</linty-anchor><br>LANE_RESET_DL: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#38">rx_sync_fsm.vhd#38</linty-anchor><br>err_word_x5: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#75">rx_sync_fsm.vhd#75</linty-anchor><br>rx_word_realign_from_ip_r: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#69">rx_sync_fsm.vhd#69</linty-anchor><br>rx_word_realign_from_ip_rr: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#70">rx_sync_fsm.vhd#70</linty-anchor><br>valid_symb: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#76">rx_sync_fsm.vhd#76</linty-anchor>|
|CHECK_SYNC_ST|READY_ST|LANE_RESET: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#52">rx_sync_fsm.vhd#52</linty-anchor><br>LANE_RESET_DL: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#38">rx_sync_fsm.vhd#38</linty-anchor><br>err_word_x5: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#75">rx_sync_fsm.vhd#75</linty-anchor><br>rx_word_realign_from_ip_r: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#69">rx_sync_fsm.vhd#69</linty-anchor><br>rx_word_realign_from_ip_rr: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#70">rx_sync_fsm.vhd#70</linty-anchor><br>valid_symb: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#76">rx_sync_fsm.vhd#76</linty-anchor>|
|READY_ST|LOST_SYNC_ST|LANE_RESET: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#52">rx_sync_fsm.vhd#52</linty-anchor><br>LANE_RESET_DL: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#38">rx_sync_fsm.vhd#38</linty-anchor><br>rx_word_realign_from_ip_r: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#69">rx_sync_fsm.vhd#69</linty-anchor><br>rx_word_realign_from_ip_rr: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#70">rx_sync_fsm.vhd#70</linty-anchor>|
|READY_ST|CHECK_SYNC_ST|LANE_RESET: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#52">rx_sync_fsm.vhd#52</linty-anchor><br>LANE_RESET_DL: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#38">rx_sync_fsm.vhd#38</linty-anchor><br>disparity_err: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#78">rx_sync_fsm.vhd#78</linty-anchor><br>invalid_symb: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#77">rx_sync_fsm.vhd#77</linty-anchor><br>rx_word_realign_from_ip_r: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#69">rx_sync_fsm.vhd#69</linty-anchor><br>rx_word_realign_from_ip_rr: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#70">rx_sync_fsm.vhd#70</linty-anchor>|
|READY_ST|READY_ST|LANE_RESET: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#52">rx_sync_fsm.vhd#52</linty-anchor><br>LANE_RESET_DL: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#38">rx_sync_fsm.vhd#38</linty-anchor><br>disparity_err: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#78">rx_sync_fsm.vhd#78</linty-anchor><br>invalid_symb: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#77">rx_sync_fsm.vhd#77</linty-anchor><br>rx_word_realign_from_ip_r: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#69">rx_sync_fsm.vhd#69</linty-anchor><br>rx_word_realign_from_ip_rr: <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#70">rx_sync_fsm.vhd#70</linty-anchor>|


<br>

[Back to FSM Report](../finite_state_machines.md)