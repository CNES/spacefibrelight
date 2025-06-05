[Back to FSM Report](../finite_state_machines.md)

<br>

# FSM #1: mst_exec_state

## Summary

|Name|Location|Graph|Reset State|States|Input Signals|Output Signals|
|---|---|:---:|---|---|---:|---:|
mst_exec_state|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#57">AXIS_MASTER.vhd#57</linty-anchor>|<a href="/graphs/fsm_states_1_graph.html"><img title="Open FSM Diagram" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open FSM Diagram"></a>|IDLE| Count: 3<br>IDLE<br>SEND_STREAM<br>WAIT_READY|7|10||

<br>

## Input Signals

Count: 7

|Name|Declaration|
|---|---|
|axis_tvalid|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#60">AXIS_MASTER.vhd#60</linty-anchor>|
|end_frame|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#70">AXIS_MASTER.vhd#70</linty-anchor>|
|m00_axis_tready|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#42">AXIS_MASTER.vhd#42</linty-anchor>|
|m00_axis_tvalid|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#39">AXIS_MASTER.vhd#39</linty-anchor>|
|rd_data_en|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#33">AXIS_MASTER.vhd#33</linty-anchor>|
|rd_data_vld|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#32">AXIS_MASTER.vhd#32</linty-anchor>|
|start_frame|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#69">AXIS_MASTER.vhd#69</linty-anchor>||

## Output Signals

Count: 10

|Name|Declaration|
|---|---|
|axis_tlast|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#61">AXIS_MASTER.vhd#61</linty-anchor>|
|axis_tvalid|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#60">AXIS_MASTER.vhd#60</linty-anchor>|
|end_frame|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#70">AXIS_MASTER.vhd#70</linty-anchor>|
|m00_axis_tdata|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#40">AXIS_MASTER.vhd#40</linty-anchor>|
|m00_axis_tlast|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#41">AXIS_MASTER.vhd#41</linty-anchor>|
|m00_axis_tuser|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#43">AXIS_MASTER.vhd#43</linty-anchor>|
|m00_axis_tvalid|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#39">AXIS_MASTER.vhd#39</linty-anchor>|
|start_frame|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#69">AXIS_MASTER.vhd#69</linty-anchor>|
|stream_data_out|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#64">AXIS_MASTER.vhd#64</linty-anchor>|
|stream_user_out|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#67">AXIS_MASTER.vhd#67</linty-anchor>|

## Transition table

|From|To|Input Control Signals|
|---|---|---|
|IDLE|IDLE|end_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#70">AXIS_MASTER.vhd#70</linty-anchor><br>m00_axis_tready: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#42">AXIS_MASTER.vhd#42</linty-anchor><br>rd_data_en: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#33">AXIS_MASTER.vhd#33</linty-anchor><br>rd_data_vld: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#32">AXIS_MASTER.vhd#32</linty-anchor>|
|IDLE|IDLE|end_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#70">AXIS_MASTER.vhd#70</linty-anchor><br>m00_axis_tready: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#42">AXIS_MASTER.vhd#42</linty-anchor><br>rd_data_en: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#33">AXIS_MASTER.vhd#33</linty-anchor><br>rd_data_vld: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#32">AXIS_MASTER.vhd#32</linty-anchor>|
|IDLE|SEND_STREAM|end_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#70">AXIS_MASTER.vhd#70</linty-anchor><br>m00_axis_tready: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#42">AXIS_MASTER.vhd#42</linty-anchor><br>rd_data_en: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#33">AXIS_MASTER.vhd#33</linty-anchor><br>rd_data_vld: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#32">AXIS_MASTER.vhd#32</linty-anchor>|
|IDLE|WAIT_READY|end_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#70">AXIS_MASTER.vhd#70</linty-anchor><br>m00_axis_tready: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#42">AXIS_MASTER.vhd#42</linty-anchor><br>rd_data_en: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#33">AXIS_MASTER.vhd#33</linty-anchor><br>rd_data_vld: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#32">AXIS_MASTER.vhd#32</linty-anchor>|
|IDLE|WAIT_READY|end_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#70">AXIS_MASTER.vhd#70</linty-anchor><br>m00_axis_tready: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#42">AXIS_MASTER.vhd#42</linty-anchor><br>rd_data_en: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#33">AXIS_MASTER.vhd#33</linty-anchor><br>rd_data_vld: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#32">AXIS_MASTER.vhd#32</linty-anchor>|
|SEND_STREAM|IDLE|m00_axis_tready: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#42">AXIS_MASTER.vhd#42</linty-anchor><br>rd_data_en: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#33">AXIS_MASTER.vhd#33</linty-anchor><br>rd_data_vld: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#32">AXIS_MASTER.vhd#32</linty-anchor><br>start_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#69">AXIS_MASTER.vhd#69</linty-anchor>|
|SEND_STREAM|SEND_STREAM|m00_axis_tready: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#42">AXIS_MASTER.vhd#42</linty-anchor><br>rd_data_en: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#33">AXIS_MASTER.vhd#33</linty-anchor><br>rd_data_vld: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#32">AXIS_MASTER.vhd#32</linty-anchor><br>start_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#69">AXIS_MASTER.vhd#69</linty-anchor>|
|SEND_STREAM|WAIT_READY|m00_axis_tready: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#42">AXIS_MASTER.vhd#42</linty-anchor><br>rd_data_en: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#33">AXIS_MASTER.vhd#33</linty-anchor><br>rd_data_vld: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#32">AXIS_MASTER.vhd#32</linty-anchor><br>start_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#69">AXIS_MASTER.vhd#69</linty-anchor>|
|SEND_STREAM|WAIT_READY|m00_axis_tready: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#42">AXIS_MASTER.vhd#42</linty-anchor><br>rd_data_en: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#33">AXIS_MASTER.vhd#33</linty-anchor><br>rd_data_vld: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#32">AXIS_MASTER.vhd#32</linty-anchor><br>start_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#69">AXIS_MASTER.vhd#69</linty-anchor>|
|SEND_STREAM|WAIT_READY|m00_axis_tready: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#42">AXIS_MASTER.vhd#42</linty-anchor><br>rd_data_en: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#33">AXIS_MASTER.vhd#33</linty-anchor><br>rd_data_vld: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#32">AXIS_MASTER.vhd#32</linty-anchor><br>start_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#69">AXIS_MASTER.vhd#69</linty-anchor>|
|SEND_STREAM|WAIT_READY|m00_axis_tready: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#42">AXIS_MASTER.vhd#42</linty-anchor><br>rd_data_en: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#33">AXIS_MASTER.vhd#33</linty-anchor><br>rd_data_vld: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#32">AXIS_MASTER.vhd#32</linty-anchor><br>start_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#69">AXIS_MASTER.vhd#69</linty-anchor>|
|WAIT_READY|IDLE|axis_tvalid: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#60">AXIS_MASTER.vhd#60</linty-anchor><br>end_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#70">AXIS_MASTER.vhd#70</linty-anchor><br>m00_axis_tready: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#42">AXIS_MASTER.vhd#42</linty-anchor><br>m00_axis_tvalid: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#39">AXIS_MASTER.vhd#39</linty-anchor><br>rd_data_en: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#33">AXIS_MASTER.vhd#33</linty-anchor><br>start_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#69">AXIS_MASTER.vhd#69</linty-anchor>|
|WAIT_READY|IDLE|end_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#70">AXIS_MASTER.vhd#70</linty-anchor><br>m00_axis_tready: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#42">AXIS_MASTER.vhd#42</linty-anchor><br>rd_data_en: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#33">AXIS_MASTER.vhd#33</linty-anchor><br>start_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#69">AXIS_MASTER.vhd#69</linty-anchor>|
|WAIT_READY|SEND_STREAM|axis_tvalid: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#60">AXIS_MASTER.vhd#60</linty-anchor><br>end_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#70">AXIS_MASTER.vhd#70</linty-anchor><br>m00_axis_tready: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#42">AXIS_MASTER.vhd#42</linty-anchor><br>m00_axis_tvalid: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#39">AXIS_MASTER.vhd#39</linty-anchor><br>rd_data_en: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#33">AXIS_MASTER.vhd#33</linty-anchor><br>start_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#69">AXIS_MASTER.vhd#69</linty-anchor>|
|WAIT_READY|SEND_STREAM|axis_tvalid: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#60">AXIS_MASTER.vhd#60</linty-anchor><br>end_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#70">AXIS_MASTER.vhd#70</linty-anchor><br>m00_axis_tready: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#42">AXIS_MASTER.vhd#42</linty-anchor><br>m00_axis_tvalid: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#39">AXIS_MASTER.vhd#39</linty-anchor><br>rd_data_en: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#33">AXIS_MASTER.vhd#33</linty-anchor><br>start_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#69">AXIS_MASTER.vhd#69</linty-anchor>|
|WAIT_READY|SEND_STREAM|axis_tvalid: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#60">AXIS_MASTER.vhd#60</linty-anchor><br>end_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#70">AXIS_MASTER.vhd#70</linty-anchor><br>m00_axis_tready: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#42">AXIS_MASTER.vhd#42</linty-anchor><br>m00_axis_tvalid: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#39">AXIS_MASTER.vhd#39</linty-anchor><br>rd_data_en: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#33">AXIS_MASTER.vhd#33</linty-anchor><br>start_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#69">AXIS_MASTER.vhd#69</linty-anchor>|
|WAIT_READY|SEND_STREAM|axis_tvalid: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#60">AXIS_MASTER.vhd#60</linty-anchor><br>end_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#70">AXIS_MASTER.vhd#70</linty-anchor><br>m00_axis_tready: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#42">AXIS_MASTER.vhd#42</linty-anchor><br>m00_axis_tvalid: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#39">AXIS_MASTER.vhd#39</linty-anchor><br>rd_data_en: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#33">AXIS_MASTER.vhd#33</linty-anchor><br>start_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#69">AXIS_MASTER.vhd#69</linty-anchor>|
|WAIT_READY|WAIT_READY|axis_tvalid: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#60">AXIS_MASTER.vhd#60</linty-anchor><br>end_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#70">AXIS_MASTER.vhd#70</linty-anchor><br>m00_axis_tready: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#42">AXIS_MASTER.vhd#42</linty-anchor><br>m00_axis_tvalid: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#39">AXIS_MASTER.vhd#39</linty-anchor><br>rd_data_en: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#33">AXIS_MASTER.vhd#33</linty-anchor><br>start_frame: <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#69">AXIS_MASTER.vhd#69</linty-anchor>|


<br>

[Back to FSM Report](../finite_state_machines.md)