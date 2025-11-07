<a href="/spacefibrelight/reports/finite_state_machines.html">Back to FSM Report</a>

<br>

# FSM #10: current_state_tx_pcs

## Summary

|Name|Location|Graph|Reset State|States|Input Signals|Output Signals|
|---|---|:---:|---|---|---:|---:|
current_state_tx_pcs|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#87">ppl_64_init_hssl.vhd#87</linty-anchor>|<a href="/spacefibrelight/graphs/fsm_states_10_graph.html"><img title="Open FSM Diagram" src="/spacefibrelight/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open FSM Diagram"></a>|IDLE_ST| Count: 3<br>IDLE_ST<br>TX_PULSE_ST<br>TX_STARTED_ST|2|1||

<br>

## Input Signals

Count: 2

|Name|Declaration|
|---|---|
|TRANSMITTER_DISABLED_PLIF|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#39">ppl_64_init_hssl.vhd#39</linty-anchor>|
|pma_pll_seq_end|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#88">ppl_64_init_hssl.vhd#88</linty-anchor>||

## Output Signals

Count: 1

|Name|Declaration|
|---|---|
|TX_RST_N_PLIH|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#45">ppl_64_init_hssl.vhd#45</linty-anchor>|

## Transition table

|From|To|Input Control Signals|
|---|---|---|
|IDLE_ST|IDLE_ST|TRANSMITTER_DISABLED_PLIF: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#39">ppl_64_init_hssl.vhd#39</linty-anchor><br>pma_pll_seq_end: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#88">ppl_64_init_hssl.vhd#88</linty-anchor>|
|IDLE_ST|TX_PULSE_ST|TRANSMITTER_DISABLED_PLIF: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#39">ppl_64_init_hssl.vhd#39</linty-anchor><br>pma_pll_seq_end: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#88">ppl_64_init_hssl.vhd#88</linty-anchor>|
|TX_PULSE_ST|TX_STARTED_ST||
|TX_STARTED_ST|TX_STARTED_ST||


<br>

<a href="/spacefibrelight/reports/finite_state_machines.html">Back to FSM Report</a>