<a href="/spacefibrelight/reports/finite_state_machines.html">Back to FSM Report</a>

<br>

# FSM #15: current_state

## Summary

|Name|Location|Graph|Reset State|States|Input Signals|Output Signals|
|---|---|:---:|---|---|---:|---:|
current_state|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#66">ppl_64_rx_sync_fsm.vhd#66</linty-anchor>|<a href="/spacefibrelight/graphs/fsm_states_15_graph.html"><img title="Open FSM Diagram" src="/spacefibrelight/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open FSM Diagram"></a>|LOST_SYNC_ST| Count: 3<br>CHECK_SYNC_ST<br>LOST_SYNC_ST<br>READY_ST|7|10||

<br>

## Input Signals

Count: 7

|Name|Declaration|
|---|---|
|COMMA_DET_PLWA|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#47">ppl_64_rx_sync_fsm.vhd#47</linty-anchor>|
|LANE_RESET|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#50">ppl_64_rx_sync_fsm.vhd#50</linty-anchor>|
|LANE_RESET_DL|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#35">ppl_64_rx_sync_fsm.vhd#35</linty-anchor>|
|RX_WORD_IS_ALIGNED_PLWA|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#46">ppl_64_rx_sync_fsm.vhd#46</linty-anchor>|
|disp_invalid_err|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#74">ppl_64_rx_sync_fsm.vhd#74</linty-anchor>|
|err_word_x5|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#72">ppl_64_rx_sync_fsm.vhd#72</linty-anchor>|
|valid_symb|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#73">ppl_64_rx_sync_fsm.vhd#73</linty-anchor>||

## Output Signals

Count: 10

|Name|Declaration|
|---|---|
|DATA_RDY_PLRSF|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#39">ppl_64_rx_sync_fsm.vhd#39</linty-anchor>|
|DATA_RX_PLRSF|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#37">ppl_64_rx_sync_fsm.vhd#37</linty-anchor>|
|VALID_K_CHARAC_PLRSF|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#38">ppl_64_rx_sync_fsm.vhd#38</linty-anchor>|
|data_rdy_to_lcwd_i|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#70">ppl_64_rx_sync_fsm.vhd#70</linty-anchor>|
|data_rx_to_lcwd_i|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#68">ppl_64_rx_sync_fsm.vhd#68</linty-anchor>|
|disp_invalid_err|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#74">ppl_64_rx_sync_fsm.vhd#74</linty-anchor>|
|err_word_cnt|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#71">ppl_64_rx_sync_fsm.vhd#71</linty-anchor>|
|err_word_x5|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#72">ppl_64_rx_sync_fsm.vhd#72</linty-anchor>|
|valid_k_charac_to_lcwd_i|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#69">ppl_64_rx_sync_fsm.vhd#69</linty-anchor>|
|valid_symb|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#73">ppl_64_rx_sync_fsm.vhd#73</linty-anchor>|

## Transition table

|From|To|Input Control Signals|
|---|---|---|
|LOST_SYNC_ST|LOST_SYNC_ST|COMMA_DET_PLWA: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#47">ppl_64_rx_sync_fsm.vhd#47</linty-anchor>|
|LOST_SYNC_ST|CHECK_SYNC_ST|COMMA_DET_PLWA: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#47">ppl_64_rx_sync_fsm.vhd#47</linty-anchor>|
|CHECK_SYNC_ST|LOST_SYNC_ST|LANE_RESET: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#50">ppl_64_rx_sync_fsm.vhd#50</linty-anchor><br>LANE_RESET_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#35">ppl_64_rx_sync_fsm.vhd#35</linty-anchor><br>RX_WORD_IS_ALIGNED_PLWA: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#46">ppl_64_rx_sync_fsm.vhd#46</linty-anchor><br>err_word_x5: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#72">ppl_64_rx_sync_fsm.vhd#72</linty-anchor>|
|CHECK_SYNC_ST|CHECK_SYNC_ST|LANE_RESET: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#50">ppl_64_rx_sync_fsm.vhd#50</linty-anchor><br>LANE_RESET_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#35">ppl_64_rx_sync_fsm.vhd#35</linty-anchor><br>RX_WORD_IS_ALIGNED_PLWA: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#46">ppl_64_rx_sync_fsm.vhd#46</linty-anchor><br>err_word_x5: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#72">ppl_64_rx_sync_fsm.vhd#72</linty-anchor><br>valid_symb: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#73">ppl_64_rx_sync_fsm.vhd#73</linty-anchor>|
|CHECK_SYNC_ST|READY_ST|LANE_RESET: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#50">ppl_64_rx_sync_fsm.vhd#50</linty-anchor><br>LANE_RESET_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#35">ppl_64_rx_sync_fsm.vhd#35</linty-anchor><br>RX_WORD_IS_ALIGNED_PLWA: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#46">ppl_64_rx_sync_fsm.vhd#46</linty-anchor><br>err_word_x5: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#72">ppl_64_rx_sync_fsm.vhd#72</linty-anchor><br>valid_symb: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#73">ppl_64_rx_sync_fsm.vhd#73</linty-anchor>|
|READY_ST|LOST_SYNC_ST|LANE_RESET: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#50">ppl_64_rx_sync_fsm.vhd#50</linty-anchor><br>LANE_RESET_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#35">ppl_64_rx_sync_fsm.vhd#35</linty-anchor><br>RX_WORD_IS_ALIGNED_PLWA: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#46">ppl_64_rx_sync_fsm.vhd#46</linty-anchor>|
|READY_ST|CHECK_SYNC_ST|LANE_RESET: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#50">ppl_64_rx_sync_fsm.vhd#50</linty-anchor><br>LANE_RESET_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#35">ppl_64_rx_sync_fsm.vhd#35</linty-anchor><br>RX_WORD_IS_ALIGNED_PLWA: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#46">ppl_64_rx_sync_fsm.vhd#46</linty-anchor><br>disp_invalid_err: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#74">ppl_64_rx_sync_fsm.vhd#74</linty-anchor>|
|READY_ST|READY_ST|LANE_RESET: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#50">ppl_64_rx_sync_fsm.vhd#50</linty-anchor><br>LANE_RESET_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#35">ppl_64_rx_sync_fsm.vhd#35</linty-anchor><br>RX_WORD_IS_ALIGNED_PLWA: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#46">ppl_64_rx_sync_fsm.vhd#46</linty-anchor><br>disp_invalid_err: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#74">ppl_64_rx_sync_fsm.vhd#74</linty-anchor>|


<br>

<a href="/spacefibrelight/reports/finite_state_machines.html">Back to FSM Report</a>