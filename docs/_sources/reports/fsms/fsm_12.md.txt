<a href="/spacefibrelight/reports/finite_state_machines.html">Back to FSM Report</a>

<br>

# FSM #12: current_state_pll_pma

## Summary

|Name|Location|Graph|Reset State|States|Input Signals|Output Signals|
|---|---|:---:|---|---|---:|---:|
current_state_pll_pma|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#85">ppl_64_init_hssl.vhd#85</linty-anchor>|<a href="/spacefibrelight/graphs/fsm_states_12_graph.html"><img title="Open FSM Diagram" src="/spacefibrelight/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open FSM Diagram"></a>|PMA_PLL_POWER_UP_ST| Count: 4<br>PMA_PLL_LOCK_ST<br>PMA_PLL_POWER_UP_ST<br>PMA_PLL_RST_PULSE_ST<br>TX_POWER_UP_ST|0|4||

<br>

## Input Signals

Count: 0

|Name|Declaration|
|---|---|
|

## Output Signals

Count: 4

|Name|Declaration|
|---|---|
|PLL_PMA_PWR_UP_PLIH|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#41">ppl_64_init_hssl.vhd#41</linty-anchor>|
|PLL_PMA_RST_N_PLIH|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#43">ppl_64_init_hssl.vhd#43</linty-anchor>|
|TX_DRIVER_PWRDWN_N_PLIH|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#42">ppl_64_init_hssl.vhd#42</linty-anchor>|
|pma_pll_seq_end|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#88">ppl_64_init_hssl.vhd#88</linty-anchor>|

## Transition table

|From|To|Input Control Signals|
|---|---|---|
|PMA_PLL_POWER_UP_ST|TX_POWER_UP_ST||
|TX_POWER_UP_ST|PMA_PLL_RST_PULSE_ST||
|PMA_PLL_RST_PULSE_ST|PMA_PLL_LOCK_ST||
|PMA_PLL_LOCK_ST|PMA_PLL_LOCK_ST||


<br>

<a href="/spacefibrelight/reports/finite_state_machines.html">Back to FSM Report</a>