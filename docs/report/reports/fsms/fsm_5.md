[Back to FSM Report](../finite_state_machines.md)

<br>

# FSM #5: current_state

## Summary

|Name|Location|Graph|Reset State|States|Input Signals|Output Signals|
|---|---|:---:|---|---|---:|---:|
current_state|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#69">data_link_reset.vhd#69</linty-anchor>|<a href="/graphs/fsm_states_5_graph.html"><img title="Open FSM Diagram" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open FSM Diagram"></a>|CONF_RST_ST| Count: 4<br>CHECK_FAR_END_RST_ST<br>CONF_RST_ST<br>LINK_INIT_ST<br>NEAR_END_RST_ST|8|7||

<br>

## Input Signals

Count: 8

|Name|Declaration|
|---|---|
|FAR_END_CAPA_PPL|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#49">data_link_reset.vhd#49</linty-anchor>|
|INTERFACE_RESET_MIB|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#52">data_link_reset.vhd#52</linty-anchor>|
|LANE_ACTIVE_PPL|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#48">data_link_reset.vhd#48</linty-anchor>|
|LINK_RESET_DERRM|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#44">data_link_reset.vhd#44</linty-anchor>|
|LINK_RESET_DIBUF|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#42">data_link_reset.vhd#42</linty-anchor>|
|LINK_RESET_MIB|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#53">data_link_reset.vhd#53</linty-anchor>|
|cnt_link_reset|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#70">data_link_reset.vhd#70</linty-anchor>|
|lane_active_ppl_r|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#71">data_link_reset.vhd#71</linty-anchor>||

## Output Signals

Count: 7

|Name|Declaration|
|---|---|
|LANE_RESET_DLRE|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#46">data_link_reset.vhd#46</linty-anchor>|
|LINK_RESET_DLRE|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#40">data_link_reset.vhd#40</linty-anchor>|
|NEAR_END_CAPA_DLRE|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#47">data_link_reset.vhd#47</linty-anchor>|
|RESET_PARAM_DLRE|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#51">data_link_reset.vhd#51</linty-anchor>|
|cnt_link_reset|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#70">data_link_reset.vhd#70</linty-anchor>|
|lane_reset_dlre_i|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#73">data_link_reset.vhd#73</linty-anchor>|
|link_reset_dlre_i|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#72">data_link_reset.vhd#72</linty-anchor>|

## Transition table

|From|To|Input Control Signals|
|---|---|---|
|CONF_RST_ST|CONF_RST_ST|cnt_link_reset: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#70">data_link_reset.vhd#70</linty-anchor>|
|CONF_RST_ST|NEAR_END_RST_ST|cnt_link_reset: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#70">data_link_reset.vhd#70</linty-anchor>|
|NEAR_END_RST_ST|CONF_RST_ST|INTERFACE_RESET_MIB: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#52">data_link_reset.vhd#52</linty-anchor>|
|NEAR_END_RST_ST|NEAR_END_RST_ST|INTERFACE_RESET_MIB: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#52">data_link_reset.vhd#52</linty-anchor><br>LINK_RESET_MIB: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#53">data_link_reset.vhd#53</linty-anchor>|
|NEAR_END_RST_ST|NEAR_END_RST_ST|INTERFACE_RESET_MIB: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#52">data_link_reset.vhd#52</linty-anchor><br>LINK_RESET_MIB: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#53">data_link_reset.vhd#53</linty-anchor><br>cnt_link_reset: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#70">data_link_reset.vhd#70</linty-anchor>|
|NEAR_END_RST_ST|CHECK_FAR_END_RST_ST|INTERFACE_RESET_MIB: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#52">data_link_reset.vhd#52</linty-anchor><br>LINK_RESET_MIB: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#53">data_link_reset.vhd#53</linty-anchor><br>cnt_link_reset: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#70">data_link_reset.vhd#70</linty-anchor>|
|CHECK_FAR_END_RST_ST|CONF_RST_ST|INTERFACE_RESET_MIB: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#52">data_link_reset.vhd#52</linty-anchor>|
|CHECK_FAR_END_RST_ST|NEAR_END_RST_ST|INTERFACE_RESET_MIB: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#52">data_link_reset.vhd#52</linty-anchor><br>LINK_RESET_DERRM: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#44">data_link_reset.vhd#44</linty-anchor><br>LINK_RESET_DIBUF: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#42">data_link_reset.vhd#42</linty-anchor><br>LINK_RESET_MIB: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#53">data_link_reset.vhd#53</linty-anchor>|
|CHECK_FAR_END_RST_ST|CHECK_FAR_END_RST_ST|FAR_END_CAPA_PPL: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#49">data_link_reset.vhd#49</linty-anchor><br>INTERFACE_RESET_MIB: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#52">data_link_reset.vhd#52</linty-anchor><br>LANE_ACTIVE_PPL: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#48">data_link_reset.vhd#48</linty-anchor><br>LINK_RESET_DERRM: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#44">data_link_reset.vhd#44</linty-anchor><br>LINK_RESET_DIBUF: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#42">data_link_reset.vhd#42</linty-anchor><br>LINK_RESET_MIB: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#53">data_link_reset.vhd#53</linty-anchor><br>lane_active_ppl_r: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#71">data_link_reset.vhd#71</linty-anchor>|
|CHECK_FAR_END_RST_ST|LINK_INIT_ST|FAR_END_CAPA_PPL: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#49">data_link_reset.vhd#49</linty-anchor><br>INTERFACE_RESET_MIB: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#52">data_link_reset.vhd#52</linty-anchor><br>LANE_ACTIVE_PPL: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#48">data_link_reset.vhd#48</linty-anchor><br>LINK_RESET_DERRM: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#44">data_link_reset.vhd#44</linty-anchor><br>LINK_RESET_DIBUF: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#42">data_link_reset.vhd#42</linty-anchor><br>LINK_RESET_MIB: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#53">data_link_reset.vhd#53</linty-anchor><br>lane_active_ppl_r: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#71">data_link_reset.vhd#71</linty-anchor>|
|LINK_INIT_ST|CONF_RST_ST|INTERFACE_RESET_MIB: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#52">data_link_reset.vhd#52</linty-anchor>|
|LINK_INIT_ST|NEAR_END_RST_ST|FAR_END_CAPA_PPL: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#49">data_link_reset.vhd#49</linty-anchor><br>INTERFACE_RESET_MIB: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#52">data_link_reset.vhd#52</linty-anchor><br>LANE_ACTIVE_PPL: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#48">data_link_reset.vhd#48</linty-anchor><br>LINK_RESET_DERRM: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#44">data_link_reset.vhd#44</linty-anchor><br>LINK_RESET_DIBUF: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#42">data_link_reset.vhd#42</linty-anchor><br>LINK_RESET_MIB: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#53">data_link_reset.vhd#53</linty-anchor><br>lane_active_ppl_r: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#71">data_link_reset.vhd#71</linty-anchor>|
|LINK_INIT_ST|NEAR_END_RST_ST|FAR_END_CAPA_PPL: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#49">data_link_reset.vhd#49</linty-anchor><br>INTERFACE_RESET_MIB: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#52">data_link_reset.vhd#52</linty-anchor><br>LANE_ACTIVE_PPL: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#48">data_link_reset.vhd#48</linty-anchor><br>LINK_RESET_MIB: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#53">data_link_reset.vhd#53</linty-anchor><br>lane_active_ppl_r: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#71">data_link_reset.vhd#71</linty-anchor>|
|LINK_INIT_ST|NEAR_END_RST_ST|INTERFACE_RESET_MIB: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#52">data_link_reset.vhd#52</linty-anchor><br>LINK_RESET_MIB: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#53">data_link_reset.vhd#53</linty-anchor>|
|LINK_INIT_ST|LINK_INIT_ST|FAR_END_CAPA_PPL: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#49">data_link_reset.vhd#49</linty-anchor><br>INTERFACE_RESET_MIB: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#52">data_link_reset.vhd#52</linty-anchor><br>LANE_ACTIVE_PPL: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#48">data_link_reset.vhd#48</linty-anchor><br>LINK_RESET_DERRM: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#44">data_link_reset.vhd#44</linty-anchor><br>LINK_RESET_DIBUF: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#42">data_link_reset.vhd#42</linty-anchor><br>LINK_RESET_MIB: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#53">data_link_reset.vhd#53</linty-anchor><br>lane_active_ppl_r: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#71">data_link_reset.vhd#71</linty-anchor>|


<br>

[Back to FSM Report](../finite_state_machines.md)