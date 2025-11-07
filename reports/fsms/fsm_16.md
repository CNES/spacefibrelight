<a href="/spacefibrelight/reports/finite_state_machines.html">Back to FSM Report</a>

<br>

# FSM #16: state

## Summary

|Name|Location|Graph|Reset State|States|Input Signals|Output Signals|
|---|---|:---:|---|---|---:|---:|
state|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#67">ppl_64_skip_insertion.vhd#67</linty-anchor>|<a href="/spacefibrelight/graphs/fsm_states_16_graph.html"><img title="Open FSM Diagram" src="/spacefibrelight/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open FSM Diagram"></a>|TX_INIT_ST| Count: 5<br>TX_DATA_1_ST<br>TX_DATA_2_ST<br>TX_INIT_ST<br>TX_SKIP_1_ST<br>TX_SKIP_2_ST|2|8||

<br>

## Input Signals

Count: 2

|Name|Declaration|
|---|---|
|ENABLE_TRANSM_DATA_PLIF|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#43">ppl_64_skip_insertion.vhd#43</linty-anchor>|
|state_cnt|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#68">ppl_64_skip_insertion.vhd#68</linty-anchor>||

## Output Signals

Count: 8

|Name|Declaration|
|---|---|
|DATA_TX_PLSI|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#40">ppl_64_skip_insertion.vhd#40</linty-anchor>|
|VALID_K_CHARAC_PLSI|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#41">ppl_64_skip_insertion.vhd#41</linty-anchor>|
|WAIT_SEND_DATA_PLSI|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#38">ppl_64_skip_insertion.vhd#38</linty-anchor>|
|data_1|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#62">ppl_64_skip_insertion.vhd#62</linty-anchor>|
|data_2|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#61">ppl_64_skip_insertion.vhd#61</linty-anchor>|
|k_char_1|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#65">ppl_64_skip_insertion.vhd#65</linty-anchor>|
|k_char_2|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#64">ppl_64_skip_insertion.vhd#64</linty-anchor>|
|state_cnt|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#68">ppl_64_skip_insertion.vhd#68</linty-anchor>|

## Transition table

|From|To|Input Control Signals|
|---|---|---|
|TX_INIT_ST|TX_INIT_ST|ENABLE_TRANSM_DATA_PLIF: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#43">ppl_64_skip_insertion.vhd#43</linty-anchor>|
|TX_INIT_ST|TX_DATA_1_ST|ENABLE_TRANSM_DATA_PLIF: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#43">ppl_64_skip_insertion.vhd#43</linty-anchor>|
|TX_DATA_1_ST|TX_INIT_ST|ENABLE_TRANSM_DATA_PLIF: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#43">ppl_64_skip_insertion.vhd#43</linty-anchor>|
|TX_DATA_1_ST|TX_DATA_1_ST|ENABLE_TRANSM_DATA_PLIF: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#43">ppl_64_skip_insertion.vhd#43</linty-anchor><br>state_cnt: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#68">ppl_64_skip_insertion.vhd#68</linty-anchor>|
|TX_DATA_1_ST|TX_SKIP_1_ST|ENABLE_TRANSM_DATA_PLIF: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#43">ppl_64_skip_insertion.vhd#43</linty-anchor><br>state_cnt: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#68">ppl_64_skip_insertion.vhd#68</linty-anchor>|
|TX_DATA_2_ST|TX_INIT_ST|ENABLE_TRANSM_DATA_PLIF: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#43">ppl_64_skip_insertion.vhd#43</linty-anchor>|
|TX_DATA_2_ST|TX_DATA_2_ST|ENABLE_TRANSM_DATA_PLIF: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#43">ppl_64_skip_insertion.vhd#43</linty-anchor><br>state_cnt: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#68">ppl_64_skip_insertion.vhd#68</linty-anchor>|
|TX_DATA_2_ST|TX_SKIP_2_ST|ENABLE_TRANSM_DATA_PLIF: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#43">ppl_64_skip_insertion.vhd#43</linty-anchor><br>state_cnt: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#68">ppl_64_skip_insertion.vhd#68</linty-anchor>|
|TX_SKIP_1_ST|TX_DATA_2_ST||
|TX_SKIP_2_ST|TX_DATA_1_ST||


<br>

<a href="/spacefibrelight/reports/finite_state_machines.html">Back to FSM Report</a>