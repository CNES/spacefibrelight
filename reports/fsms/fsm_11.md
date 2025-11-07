<a href="/spacefibrelight/reports/finite_state_machines.html">Back to FSM Report</a>

<br>

# FSM #11: current_state_rx_pll_pma

## Summary

|Name|Location|Graph|Reset State|States|Input Signals|Output Signals|
|---|---|:---:|---|---|---:|---:|
current_state_rx_pll_pma|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#86">ppl_64_init_hssl.vhd#86</linty-anchor>|<a href="/spacefibrelight/graphs/fsm_states_11_graph.html"><img title="Open FSM Diagram" src="/spacefibrelight/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open FSM Diagram"></a>|IDLE_ST| Count: 6<br>IDLE_ST<br>RX_PMA_LOCK_ST<br>RX_PMA_PLL_PULSE_ST<br>RX_PMA_POWER_UP_ST<br>RX_RST_PULSE_ST<br>RX_STARTED_ST|4|3||

<br>

## Input Signals

Count: 4

|Name|Declaration|
|---|---|
|CDR_PLIF|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#38">ppl_64_init_hssl.vhd#38</linty-anchor>|
|RECEIVER_DISABLED_PLIF|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#37">ppl_64_init_hssl.vhd#37</linty-anchor>|
|RX_PMA_LL_SLOW_LOCKED_HSSL|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#49">ppl_64_init_hssl.vhd#49</linty-anchor>|
|pma_pll_seq_end|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#88">ppl_64_init_hssl.vhd#88</linty-anchor>||

## Output Signals

Count: 3

|Name|Declaration|
|---|---|
|RX_PMA_PWR_UP_PLIH|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#47">ppl_64_init_hssl.vhd#47</linty-anchor>|
|RX_PMA_RST_N_PLIH|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#48">ppl_64_init_hssl.vhd#48</linty-anchor>|
|RX_RST_N_PLIH|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#50">ppl_64_init_hssl.vhd#50</linty-anchor>|

## Transition table

|From|To|Input Control Signals|
|---|---|---|
|IDLE_ST|IDLE_ST|RECEIVER_DISABLED_PLIF: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#37">ppl_64_init_hssl.vhd#37</linty-anchor><br>pma_pll_seq_end: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#88">ppl_64_init_hssl.vhd#88</linty-anchor>|
|IDLE_ST|RX_PMA_POWER_UP_ST|RECEIVER_DISABLED_PLIF: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#37">ppl_64_init_hssl.vhd#37</linty-anchor><br>pma_pll_seq_end: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#88">ppl_64_init_hssl.vhd#88</linty-anchor>|
|RX_PMA_POWER_UP_ST|RX_PMA_POWER_UP_ST|CDR_PLIF: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#38">ppl_64_init_hssl.vhd#38</linty-anchor>|
|RX_PMA_POWER_UP_ST|RX_PMA_PLL_PULSE_ST|CDR_PLIF: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#38">ppl_64_init_hssl.vhd#38</linty-anchor>|
|RX_PMA_PLL_PULSE_ST|RX_PMA_LOCK_ST||
|RX_PMA_LOCK_ST|RX_PMA_LOCK_ST|RX_PMA_LL_SLOW_LOCKED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#49">ppl_64_init_hssl.vhd#49</linty-anchor>|
|RX_PMA_LOCK_ST|RX_RST_PULSE_ST|RX_PMA_LL_SLOW_LOCKED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd#49">ppl_64_init_hssl.vhd#49</linty-anchor>|
|RX_RST_PULSE_ST|RX_STARTED_ST||
|RX_STARTED_ST|RX_STARTED_ST||


<br>

<a href="/spacefibrelight/reports/finite_state_machines.html">Back to FSM Report</a>