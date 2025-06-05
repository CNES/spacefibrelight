[Back to FSM Report](../finite_state_machines.md)

<br>

# FSM #4: current_state

## Summary

|Name|Location|Graph|Reset State|States|Input Signals|Output Signals|
|---|---|:---:|---|---|---:|---:|
current_state|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#117">data_in_buf.vhd#117</linty-anchor>|<a href="/graphs/fsm_states_4_graph.html"><img title="Open FSM Diagram" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open FSM Diagram"></a>|INIT_ST| Count: 4<br>ADD_EEP_ST<br>IDLE_ST<br>INIT_ST<br>LINK_RESET_ST|4|3||

<br>

## Input Signals

Count: 4

|Name|Declaration|
|---|---|
|LINK_RESET_DLRE|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#38">data_in_buf.vhd#38</linty-anchor>|
|last_k_char_reg2|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#124">data_in_buf.vhd#124</linty-anchor>|
|link_reset_dlre_r|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#140">data_in_buf.vhd#140</linty-anchor>|
|status_busy_flush|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#119">data_in_buf.vhd#119</linty-anchor>||

## Output Signals

Count: 3

|Name|Declaration|
|---|---|
|cmd_flush|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#121">data_in_buf.vhd#121</linty-anchor>|
|data_in|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#125">data_in_buf.vhd#125</linty-anchor>|
|data_in_en|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#126">data_in_buf.vhd#126</linty-anchor>|

## Transition table

|From|To|Input Control Signals|
|---|---|---|
|INIT_ST|INIT_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_in_buf.vhd#38">data_in_buf.vhd#38</linty-anchor><br>link_reset_dlre_r: <linty-anchor href="//src/module_data_link/data_in_buf.vhd#140">data_in_buf.vhd#140</linty-anchor>|
|INIT_ST|IDLE_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_in_buf.vhd#38">data_in_buf.vhd#38</linty-anchor><br>link_reset_dlre_r: <linty-anchor href="//src/module_data_link/data_in_buf.vhd#140">data_in_buf.vhd#140</linty-anchor>|
|IDLE_ST|IDLE_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_in_buf.vhd#38">data_in_buf.vhd#38</linty-anchor>|
|IDLE_ST|LINK_RESET_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_in_buf.vhd#38">data_in_buf.vhd#38</linty-anchor>|
|LINK_RESET_ST|IDLE_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_in_buf.vhd#38">data_in_buf.vhd#38</linty-anchor><br>last_k_char_reg2: <linty-anchor href="//src/module_data_link/data_in_buf.vhd#124">data_in_buf.vhd#124</linty-anchor>|
|LINK_RESET_ST|LINK_RESET_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_in_buf.vhd#38">data_in_buf.vhd#38</linty-anchor>|
|LINK_RESET_ST|ADD_EEP_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_in_buf.vhd#38">data_in_buf.vhd#38</linty-anchor><br>last_k_char_reg2: <linty-anchor href="//src/module_data_link/data_in_buf.vhd#124">data_in_buf.vhd#124</linty-anchor>|
|ADD_EEP_ST|IDLE_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_in_buf.vhd#38">data_in_buf.vhd#38</linty-anchor><br>status_busy_flush: <linty-anchor href="//src/module_data_link/data_in_buf.vhd#119">data_in_buf.vhd#119</linty-anchor>|
|ADD_EEP_ST|ADD_EEP_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_in_buf.vhd#38">data_in_buf.vhd#38</linty-anchor><br>status_busy_flush: <linty-anchor href="//src/module_data_link/data_in_buf.vhd#119">data_in_buf.vhd#119</linty-anchor>|


<br>

[Back to FSM Report](../finite_state_machines.md)