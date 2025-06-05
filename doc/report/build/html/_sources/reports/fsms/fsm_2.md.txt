[Back to FSM Report](../finite_state_machines.md)

<br>

# FSM #2: current_state

## Summary

|Name|Location|Graph|Reset State|States|Input Signals|Output Signals|
|---|---|:---:|---|---|---:|---:|
current_state|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#77">data_encapsulation.vhd#77</linty-anchor>|<a href="/graphs/fsm_states_2_graph.html"><img title="Open FSM Diagram" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open FSM Diagram"></a>|START_FRAME_ST| Count: 3<br>END_FRAME_ST<br>START_FRAME_ST<br>TRANSFER_ST|6|8||

<br>

## Input Signals

Count: 6

|Name|Declaration|
|---|---|
|END_PACKET_DMAC|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#46">data_encapsulation.vhd#46</linty-anchor>|
|LANE_ACTIVE_PPL|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#41">data_encapsulation.vhd#41</linty-anchor>|
|LINK_RESET_DLRE|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#39">data_encapsulation.vhd#39</linty-anchor>|
|NEW_WORD_DMAC|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#45">data_encapsulation.vhd#45</linty-anchor>|
|TYPE_FRAME_DMAC|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#47">data_encapsulation.vhd#47</linty-anchor>|
|sif_done|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#79">data_encapsulation.vhd#79</linty-anchor>||

## Output Signals

Count: 8

|Name|Declaration|
|---|---|
|DATA_DENC|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#57">data_encapsulation.vhd#57</linty-anchor>|
|END_FRAME_DENC|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#60">data_encapsulation.vhd#60</linty-anchor>|
|NEW_WORD_DENC|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#56">data_encapsulation.vhd#56</linty-anchor>|
|SEQ_NUM_ACK_DENC|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#61">data_encapsulation.vhd#61</linty-anchor>|
|TYPE_FRAME_DENC|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#59">data_encapsulation.vhd#59</linty-anchor>|
|VALID_K_CHARAC_DENC|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#58">data_encapsulation.vhd#58</linty-anchor>|
|current_state_r|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#78">data_encapsulation.vhd#78</linty-anchor>|
|sif_done|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#79">data_encapsulation.vhd#79</linty-anchor>|

## Transition table

|From|To|Input Control Signals|
|---|---|---|
|START_FRAME_ST|START_FRAME_ST|LANE_ACTIVE_PPL: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#41">data_encapsulation.vhd#41</linty-anchor><br>LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#39">data_encapsulation.vhd#39</linty-anchor>|
|START_FRAME_ST|START_FRAME_ST|LANE_ACTIVE_PPL: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#41">data_encapsulation.vhd#41</linty-anchor><br>LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#39">data_encapsulation.vhd#39</linty-anchor><br>NEW_WORD_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#45">data_encapsulation.vhd#45</linty-anchor><br>TYPE_FRAME_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#47">data_encapsulation.vhd#47</linty-anchor><br>sif_done: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#79">data_encapsulation.vhd#79</linty-anchor>|
|START_FRAME_ST|START_FRAME_ST|LANE_ACTIVE_PPL: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#41">data_encapsulation.vhd#41</linty-anchor><br>LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#39">data_encapsulation.vhd#39</linty-anchor><br>NEW_WORD_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#45">data_encapsulation.vhd#45</linty-anchor><br>TYPE_FRAME_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#47">data_encapsulation.vhd#47</linty-anchor><br>sif_done: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#79">data_encapsulation.vhd#79</linty-anchor>|
|START_FRAME_ST|START_FRAME_ST|LANE_ACTIVE_PPL: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#41">data_encapsulation.vhd#41</linty-anchor><br>LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#39">data_encapsulation.vhd#39</linty-anchor><br>NEW_WORD_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#45">data_encapsulation.vhd#45</linty-anchor><br>TYPE_FRAME_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#47">data_encapsulation.vhd#47</linty-anchor><br>sif_done: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#79">data_encapsulation.vhd#79</linty-anchor>|
|START_FRAME_ST|START_FRAME_ST|LANE_ACTIVE_PPL: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#41">data_encapsulation.vhd#41</linty-anchor><br>LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#39">data_encapsulation.vhd#39</linty-anchor><br>NEW_WORD_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#45">data_encapsulation.vhd#45</linty-anchor><br>TYPE_FRAME_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#47">data_encapsulation.vhd#47</linty-anchor><br>sif_done: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#79">data_encapsulation.vhd#79</linty-anchor>|
|START_FRAME_ST|START_FRAME_ST|LANE_ACTIVE_PPL: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#41">data_encapsulation.vhd#41</linty-anchor><br>LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#39">data_encapsulation.vhd#39</linty-anchor><br>NEW_WORD_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#45">data_encapsulation.vhd#45</linty-anchor><br>TYPE_FRAME_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#47">data_encapsulation.vhd#47</linty-anchor><br>sif_done: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#79">data_encapsulation.vhd#79</linty-anchor>|
|START_FRAME_ST|START_FRAME_ST|LANE_ACTIVE_PPL: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#41">data_encapsulation.vhd#41</linty-anchor><br>LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#39">data_encapsulation.vhd#39</linty-anchor><br>NEW_WORD_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#45">data_encapsulation.vhd#45</linty-anchor><br>TYPE_FRAME_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#47">data_encapsulation.vhd#47</linty-anchor><br>sif_done: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#79">data_encapsulation.vhd#79</linty-anchor>|
|START_FRAME_ST|START_FRAME_ST|LANE_ACTIVE_PPL: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#41">data_encapsulation.vhd#41</linty-anchor><br>LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#39">data_encapsulation.vhd#39</linty-anchor><br>NEW_WORD_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#45">data_encapsulation.vhd#45</linty-anchor><br>TYPE_FRAME_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#47">data_encapsulation.vhd#47</linty-anchor><br>sif_done: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#79">data_encapsulation.vhd#79</linty-anchor>|
|START_FRAME_ST|START_FRAME_ST|LANE_ACTIVE_PPL: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#41">data_encapsulation.vhd#41</linty-anchor><br>LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#39">data_encapsulation.vhd#39</linty-anchor><br>TYPE_FRAME_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#47">data_encapsulation.vhd#47</linty-anchor><br>sif_done: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#79">data_encapsulation.vhd#79</linty-anchor>|
|START_FRAME_ST|START_FRAME_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#39">data_encapsulation.vhd#39</linty-anchor>|
|START_FRAME_ST|TRANSFER_ST|LANE_ACTIVE_PPL: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#41">data_encapsulation.vhd#41</linty-anchor><br>LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#39">data_encapsulation.vhd#39</linty-anchor><br>NEW_WORD_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#45">data_encapsulation.vhd#45</linty-anchor><br>TYPE_FRAME_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#47">data_encapsulation.vhd#47</linty-anchor><br>sif_done: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#79">data_encapsulation.vhd#79</linty-anchor>|
|START_FRAME_ST|TRANSFER_ST|LANE_ACTIVE_PPL: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#41">data_encapsulation.vhd#41</linty-anchor><br>LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#39">data_encapsulation.vhd#39</linty-anchor><br>NEW_WORD_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#45">data_encapsulation.vhd#45</linty-anchor><br>TYPE_FRAME_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#47">data_encapsulation.vhd#47</linty-anchor><br>sif_done: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#79">data_encapsulation.vhd#79</linty-anchor>|
|TRANSFER_ST|START_FRAME_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#39">data_encapsulation.vhd#39</linty-anchor>|
|TRANSFER_ST|TRANSFER_ST|END_PACKET_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#46">data_encapsulation.vhd#46</linty-anchor><br>LANE_ACTIVE_PPL: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#41">data_encapsulation.vhd#41</linty-anchor><br>LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#39">data_encapsulation.vhd#39</linty-anchor><br>TYPE_FRAME_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#47">data_encapsulation.vhd#47</linty-anchor>|
|TRANSFER_ST|TRANSFER_ST|LANE_ACTIVE_PPL: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#41">data_encapsulation.vhd#41</linty-anchor><br>LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#39">data_encapsulation.vhd#39</linty-anchor>|
|TRANSFER_ST|TRANSFER_ST|LANE_ACTIVE_PPL: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#41">data_encapsulation.vhd#41</linty-anchor><br>LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#39">data_encapsulation.vhd#39</linty-anchor><br>TYPE_FRAME_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#47">data_encapsulation.vhd#47</linty-anchor>|
|TRANSFER_ST|END_FRAME_ST|END_PACKET_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#46">data_encapsulation.vhd#46</linty-anchor><br>LANE_ACTIVE_PPL: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#41">data_encapsulation.vhd#41</linty-anchor><br>LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#39">data_encapsulation.vhd#39</linty-anchor><br>TYPE_FRAME_DMAC: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#47">data_encapsulation.vhd#47</linty-anchor>|
|END_FRAME_ST|START_FRAME_ST|LANE_ACTIVE_PPL: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#41">data_encapsulation.vhd#41</linty-anchor><br>LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#39">data_encapsulation.vhd#39</linty-anchor>|
|END_FRAME_ST|START_FRAME_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#39">data_encapsulation.vhd#39</linty-anchor>|
|END_FRAME_ST|END_FRAME_ST|LANE_ACTIVE_PPL: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#41">data_encapsulation.vhd#41</linty-anchor><br>LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#39">data_encapsulation.vhd#39</linty-anchor>|


<br>

[Back to FSM Report](../finite_state_machines.md)