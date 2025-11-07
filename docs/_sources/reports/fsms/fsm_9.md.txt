<a href="/spacefibrelight/reports/finite_state_machines.html">Back to FSM Report</a>

<br>

# FSM #9: current_state

## Summary

|Name|Location|Graph|Reset State|States|Input Signals|Output Signals|
|---|---|:---:|---|---|---:|---:|
current_state|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#70">ppl_64_bus_split_rx.vhd#70</linty-anchor>|<a href="/spacefibrelight/graphs/fsm_states_9_graph.html"><img title="Open FSM Diagram" src="/spacefibrelight/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open FSM Diagram"></a>|IDLE_ST| Count: 5<br>EMPTY_BUFFER<br>FULL_BUFFER<br>FULL_FULL_BUFFER<br>HALF_FULL_BUFFER<br>IDLE_ST|4|7||

<br>

## Input Signals

Count: 4

|Name|Declaration|
|---|---|
|DATA_RDY_RX_PLFRD|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#50">ppl_64_bus_split_rx.vhd#50</linty-anchor>|
|FIFO_RX_DATA_VALID_PLFRD|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#47">ppl_64_bus_split_rx.vhd#47</linty-anchor>|
|FIFO_RX_EMPTY_PLFRD|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#48">ppl_64_bus_split_rx.vhd#48</linty-anchor>|
|FIFO_RX_RD_EN_DL|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#38">ppl_64_bus_split_rx.vhd#38</linty-anchor>||

## Output Signals

Count: 7

|Name|Declaration|
|---|---|
|DATA_RX_PLBSR|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#39">ppl_64_bus_split_rx.vhd#39</linty-anchor>|
|FIFO_RX_DATA_VALID_PLBSR|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#40">ppl_64_bus_split_rx.vhd#40</linty-anchor>|
|FIFO_RX_RD_EN_PLBSR|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#45">ppl_64_bus_split_rx.vhd#45</linty-anchor>|
|VALID_K_CHARAC_RX_PLBSR|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#41">ppl_64_bus_split_rx.vhd#41</linty-anchor>|
|buffer_data_96|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#71">ppl_64_bus_split_rx.vhd#71</linty-anchor>|
|buffer_k_char_12|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#72">ppl_64_bus_split_rx.vhd#72</linty-anchor>|
|fifo_rx_rd_en_plbsr_i|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#73">ppl_64_bus_split_rx.vhd#73</linty-anchor>|

## Transition table

|From|To|Input Control Signals|
|---|---|---|
|IDLE_ST|IDLE_ST|FIFO_RX_EMPTY_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#48">ppl_64_bus_split_rx.vhd#48</linty-anchor>|
|IDLE_ST|EMPTY_BUFFER|FIFO_RX_EMPTY_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#48">ppl_64_bus_split_rx.vhd#48</linty-anchor>|
|EMPTY_BUFFER|EMPTY_BUFFER|DATA_RDY_RX_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#50">ppl_64_bus_split_rx.vhd#50</linty-anchor><br>FIFO_RX_DATA_VALID_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#47">ppl_64_bus_split_rx.vhd#47</linty-anchor>|
|EMPTY_BUFFER|EMPTY_BUFFER|DATA_RDY_RX_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#50">ppl_64_bus_split_rx.vhd#50</linty-anchor><br>FIFO_RX_DATA_VALID_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#47">ppl_64_bus_split_rx.vhd#47</linty-anchor><br>FIFO_RX_RD_EN_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#38">ppl_64_bus_split_rx.vhd#38</linty-anchor>|
|EMPTY_BUFFER|EMPTY_BUFFER|DATA_RDY_RX_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#50">ppl_64_bus_split_rx.vhd#50</linty-anchor><br>FIFO_RX_DATA_VALID_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#47">ppl_64_bus_split_rx.vhd#47</linty-anchor><br>FIFO_RX_RD_EN_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#38">ppl_64_bus_split_rx.vhd#38</linty-anchor>|
|EMPTY_BUFFER|HALF_FULL_BUFFER|DATA_RDY_RX_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#50">ppl_64_bus_split_rx.vhd#50</linty-anchor><br>FIFO_RX_DATA_VALID_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#47">ppl_64_bus_split_rx.vhd#47</linty-anchor><br>FIFO_RX_RD_EN_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#38">ppl_64_bus_split_rx.vhd#38</linty-anchor>|
|EMPTY_BUFFER|HALF_FULL_BUFFER|DATA_RDY_RX_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#50">ppl_64_bus_split_rx.vhd#50</linty-anchor><br>FIFO_RX_DATA_VALID_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#47">ppl_64_bus_split_rx.vhd#47</linty-anchor><br>FIFO_RX_RD_EN_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#38">ppl_64_bus_split_rx.vhd#38</linty-anchor>|
|EMPTY_BUFFER|HALF_FULL_BUFFER|DATA_RDY_RX_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#50">ppl_64_bus_split_rx.vhd#50</linty-anchor><br>FIFO_RX_DATA_VALID_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#47">ppl_64_bus_split_rx.vhd#47</linty-anchor><br>FIFO_RX_RD_EN_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#38">ppl_64_bus_split_rx.vhd#38</linty-anchor>|
|EMPTY_BUFFER|FULL_BUFFER|DATA_RDY_RX_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#50">ppl_64_bus_split_rx.vhd#50</linty-anchor><br>FIFO_RX_DATA_VALID_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#47">ppl_64_bus_split_rx.vhd#47</linty-anchor><br>FIFO_RX_RD_EN_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#38">ppl_64_bus_split_rx.vhd#38</linty-anchor>|
|HALF_FULL_BUFFER|EMPTY_BUFFER|DATA_RDY_RX_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#50">ppl_64_bus_split_rx.vhd#50</linty-anchor><br>FIFO_RX_DATA_VALID_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#47">ppl_64_bus_split_rx.vhd#47</linty-anchor><br>FIFO_RX_RD_EN_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#38">ppl_64_bus_split_rx.vhd#38</linty-anchor>|
|HALF_FULL_BUFFER|HALF_FULL_BUFFER|DATA_RDY_RX_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#50">ppl_64_bus_split_rx.vhd#50</linty-anchor><br>FIFO_RX_DATA_VALID_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#47">ppl_64_bus_split_rx.vhd#47</linty-anchor><br>FIFO_RX_RD_EN_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#38">ppl_64_bus_split_rx.vhd#38</linty-anchor>|
|HALF_FULL_BUFFER|HALF_FULL_BUFFER|DATA_RDY_RX_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#50">ppl_64_bus_split_rx.vhd#50</linty-anchor><br>FIFO_RX_DATA_VALID_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#47">ppl_64_bus_split_rx.vhd#47</linty-anchor><br>FIFO_RX_RD_EN_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#38">ppl_64_bus_split_rx.vhd#38</linty-anchor>|
|HALF_FULL_BUFFER|HALF_FULL_BUFFER|DATA_RDY_RX_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#50">ppl_64_bus_split_rx.vhd#50</linty-anchor><br>FIFO_RX_DATA_VALID_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#47">ppl_64_bus_split_rx.vhd#47</linty-anchor><br>FIFO_RX_RD_EN_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#38">ppl_64_bus_split_rx.vhd#38</linty-anchor>|
|HALF_FULL_BUFFER|FULL_BUFFER|DATA_RDY_RX_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#50">ppl_64_bus_split_rx.vhd#50</linty-anchor><br>FIFO_RX_DATA_VALID_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#47">ppl_64_bus_split_rx.vhd#47</linty-anchor><br>FIFO_RX_RD_EN_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#38">ppl_64_bus_split_rx.vhd#38</linty-anchor>|
|HALF_FULL_BUFFER|FULL_BUFFER|DATA_RDY_RX_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#50">ppl_64_bus_split_rx.vhd#50</linty-anchor><br>FIFO_RX_DATA_VALID_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#47">ppl_64_bus_split_rx.vhd#47</linty-anchor><br>FIFO_RX_RD_EN_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#38">ppl_64_bus_split_rx.vhd#38</linty-anchor>|
|HALF_FULL_BUFFER|FULL_BUFFER|DATA_RDY_RX_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#50">ppl_64_bus_split_rx.vhd#50</linty-anchor><br>FIFO_RX_DATA_VALID_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#47">ppl_64_bus_split_rx.vhd#47</linty-anchor><br>FIFO_RX_RD_EN_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#38">ppl_64_bus_split_rx.vhd#38</linty-anchor>|
|HALF_FULL_BUFFER|FULL_FULL_BUFFER|DATA_RDY_RX_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#50">ppl_64_bus_split_rx.vhd#50</linty-anchor><br>FIFO_RX_DATA_VALID_PLFRD: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#47">ppl_64_bus_split_rx.vhd#47</linty-anchor><br>FIFO_RX_RD_EN_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#38">ppl_64_bus_split_rx.vhd#38</linty-anchor>|
|FULL_BUFFER|HALF_FULL_BUFFER|FIFO_RX_RD_EN_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#38">ppl_64_bus_split_rx.vhd#38</linty-anchor>|
|FULL_BUFFER|FULL_BUFFER|FIFO_RX_RD_EN_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#38">ppl_64_bus_split_rx.vhd#38</linty-anchor>|
|FULL_FULL_BUFFER|FULL_BUFFER|FIFO_RX_RD_EN_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#38">ppl_64_bus_split_rx.vhd#38</linty-anchor>|
|FULL_FULL_BUFFER|FULL_FULL_BUFFER|FIFO_RX_RD_EN_DL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#38">ppl_64_bus_split_rx.vhd#38</linty-anchor>|


<br>

<a href="/spacefibrelight/reports/finite_state_machines.html">Back to FSM Report</a>