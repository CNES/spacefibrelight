[Back to FSM Report](../finite_state_machines.md)

<br>

# FSM #7: current_state

## Summary

|Name|Location|Graph|Reset State|States|Input Signals|Output Signals|
|---|---|:---:|---|---|---:|---:|
current_state|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#121">data_out_buf.vhd#121</linty-anchor>|<a href="/graphs/fsm_states_7_graph.html"><img title="Open FSM Diagram" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open FSM Diagram"></a>|INIT_ST| Count: 5<br>ADD_EEP_ST<br>IDLE_ST<br>INIT_ST<br>WAIT_EIP_ST<br>WAIT_END_FLUSH_ST|9|5||

<br>

## Input Signals

Count: 9

|Name|Declaration|
|---|---|
|LINK_RESET_DLRE|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#40">data_out_buf.vhd#40</linty-anchor>|
|S_AXIS_TDATA_NW|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#45">data_out_buf.vhd#45</linty-anchor>|
|S_AXIS_TUSER_NW|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#46">data_out_buf.vhd#46</linty-anchor>|
|S_AXIS_TVALID_NW|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#48">data_out_buf.vhd#48</linty-anchor>|
|cont_mode_flg|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#138">data_out_buf.vhd#138</linty-anchor>|
|last_k_char|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#139">data_out_buf.vhd#139</linty-anchor>|
|link_reset_dlre_sync|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#162">data_out_buf.vhd#162</linty-anchor>|
|s_axis_tready_i|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#135">data_out_buf.vhd#135</linty-anchor>|
|s_axis_tready_r|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#136">data_out_buf.vhd#136</linty-anchor>||

## Output Signals

Count: 5

|Name|Declaration|
|---|---|
|cmd_flush|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#140">data_out_buf.vhd#140</linty-anchor>|
|s_axis_tdata_i|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#131">data_out_buf.vhd#131</linty-anchor>|
|s_axis_tlast_i|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#133">data_out_buf.vhd#133</linty-anchor>|
|s_axis_tuser_i|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#132">data_out_buf.vhd#132</linty-anchor>|
|s_axis_tvalid_i|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#134">data_out_buf.vhd#134</linty-anchor>|

## Transition table

|From|To|Input Control Signals|
|---|---|---|
|INIT_ST|INIT_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#40">data_out_buf.vhd#40</linty-anchor><br>link_reset_dlre_sync: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#162">data_out_buf.vhd#162</linty-anchor>|
|INIT_ST|IDLE_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#40">data_out_buf.vhd#40</linty-anchor><br>link_reset_dlre_sync: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#162">data_out_buf.vhd#162</linty-anchor>|
|IDLE_ST|IDLE_ST|cont_mode_flg: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#138">data_out_buf.vhd#138</linty-anchor><br>link_reset_dlre_sync: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#162">data_out_buf.vhd#162</linty-anchor>|
|IDLE_ST|WAIT_END_FLUSH_ST|last_k_char: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#139">data_out_buf.vhd#139</linty-anchor><br>link_reset_dlre_sync: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#162">data_out_buf.vhd#162</linty-anchor>|
|IDLE_ST|ADD_EEP_ST|cont_mode_flg: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#138">data_out_buf.vhd#138</linty-anchor><br>link_reset_dlre_sync: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#162">data_out_buf.vhd#162</linty-anchor>|
|IDLE_ST|WAIT_EIP_ST|last_k_char: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#139">data_out_buf.vhd#139</linty-anchor><br>link_reset_dlre_sync: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#162">data_out_buf.vhd#162</linty-anchor>|
|WAIT_END_FLUSH_ST|IDLE_ST|s_axis_tready_i: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#135">data_out_buf.vhd#135</linty-anchor>|
|WAIT_END_FLUSH_ST|WAIT_END_FLUSH_ST|s_axis_tready_i: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#135">data_out_buf.vhd#135</linty-anchor>|
|ADD_EEP_ST|IDLE_ST|S_AXIS_TUSER_NW: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#46">data_out_buf.vhd#46</linty-anchor><br>S_AXIS_TVALID_NW: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#48">data_out_buf.vhd#48</linty-anchor><br>s_axis_tready_i: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#135">data_out_buf.vhd#135</linty-anchor><br>s_axis_tready_r: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#136">data_out_buf.vhd#136</linty-anchor>|
|ADD_EEP_ST|ADD_EEP_ST|s_axis_tready_i: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#135">data_out_buf.vhd#135</linty-anchor><br>s_axis_tready_r: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#136">data_out_buf.vhd#136</linty-anchor>|
|ADD_EEP_ST|WAIT_EIP_ST|S_AXIS_TUSER_NW: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#46">data_out_buf.vhd#46</linty-anchor><br>S_AXIS_TVALID_NW: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#48">data_out_buf.vhd#48</linty-anchor><br>s_axis_tready_i: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#135">data_out_buf.vhd#135</linty-anchor><br>s_axis_tready_r: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#136">data_out_buf.vhd#136</linty-anchor>|
|WAIT_EIP_ST|IDLE_ST|S_AXIS_TDATA_NW: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#45">data_out_buf.vhd#45</linty-anchor><br>S_AXIS_TUSER_NW: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#46">data_out_buf.vhd#46</linty-anchor><br>S_AXIS_TVALID_NW: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#48">data_out_buf.vhd#48</linty-anchor>|
|WAIT_EIP_ST|IDLE_ST|S_AXIS_TDATA_NW: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#45">data_out_buf.vhd#45</linty-anchor><br>S_AXIS_TUSER_NW: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#46">data_out_buf.vhd#46</linty-anchor><br>S_AXIS_TVALID_NW: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#48">data_out_buf.vhd#48</linty-anchor>|
|WAIT_EIP_ST|IDLE_ST|S_AXIS_TDATA_NW: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#45">data_out_buf.vhd#45</linty-anchor><br>S_AXIS_TUSER_NW: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#46">data_out_buf.vhd#46</linty-anchor><br>S_AXIS_TVALID_NW: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#48">data_out_buf.vhd#48</linty-anchor>|
|WAIT_EIP_ST|IDLE_ST|S_AXIS_TDATA_NW: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#45">data_out_buf.vhd#45</linty-anchor><br>S_AXIS_TUSER_NW: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#46">data_out_buf.vhd#46</linty-anchor><br>S_AXIS_TVALID_NW: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#48">data_out_buf.vhd#48</linty-anchor>|
|WAIT_EIP_ST|WAIT_EIP_ST|S_AXIS_TDATA_NW: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#45">data_out_buf.vhd#45</linty-anchor><br>S_AXIS_TUSER_NW: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#46">data_out_buf.vhd#46</linty-anchor><br>S_AXIS_TVALID_NW: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#48">data_out_buf.vhd#48</linty-anchor>|
|WAIT_EIP_ST|WAIT_EIP_ST|S_AXIS_TVALID_NW: <linty-anchor href="//src/module_data_link/data_out_buf.vhd#48">data_out_buf.vhd#48</linty-anchor>|


<br>

[Back to FSM Report](../finite_state_machines.md)