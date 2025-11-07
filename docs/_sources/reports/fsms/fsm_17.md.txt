<a href="/spacefibrelight/reports/finite_state_machines.html">Back to FSM Report</a>

<br>

# FSM #17: current_state

## Summary

|Name|Location|Graph|Reset State|States|Input Signals|Output Signals|
|---|---|:---:|---|---|---:|---:|
current_state|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#70">ppl_64_word_alignment.vhd#70</linty-anchor>|<a href="/spacefibrelight/graphs/fsm_states_17_graph.html"><img title="Open FSM Diagram" src="/spacefibrelight/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open FSM Diagram"></a>|INIT_ST| Count: 3<br>ALIGNED_ST<br>INIT_ST<br>WAITING_COMMA_ST|4|10||

<br>

## Input Signals

Count: 4

|Name|Declaration|
|---|---|
|COMMA_DET_HSSL|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#53">ppl_64_word_alignment.vhd#53</linty-anchor>|
|RX_VALID_REALIGN_HSSL|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#52">ppl_64_word_alignment.vhd#52</linty-anchor>|
|RX_WORD_IS_ALIGNED_HSSL|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor>|
|alignment_byte|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#75">ppl_64_word_alignment.vhd#75</linty-anchor>||

## Output Signals

Count: 10

|Name|Declaration|
|---|---|
|DATA_RDY_PLWA|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#40">ppl_64_word_alignment.vhd#40</linty-anchor>|
|DATA_RX_PLWA|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#38">ppl_64_word_alignment.vhd#38</linty-anchor>|
|DISPARITY_ERR_PLWA|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#42">ppl_64_word_alignment.vhd#42</linty-anchor>|
|INVALID_CHAR_PLWA|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#41">ppl_64_word_alignment.vhd#41</linty-anchor>|
|VALID_K_CHARAC_PLWA|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#39">ppl_64_word_alignment.vhd#39</linty-anchor>|
|alignment_byte|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#75">ppl_64_word_alignment.vhd#75</linty-anchor>|
|reg_data|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#71">ppl_64_word_alignment.vhd#71</linty-anchor>|
|reg_disp_err|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#74">ppl_64_word_alignment.vhd#74</linty-anchor>|
|reg_invalid_k_char|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#73">ppl_64_word_alignment.vhd#73</linty-anchor>|
|reg_k_char|<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#72">ppl_64_word_alignment.vhd#72</linty-anchor>|

## Transition table

|From|To|Input Control Signals|
|---|---|---|
|INIT_ST|INIT_ST|RX_VALID_REALIGN_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#52">ppl_64_word_alignment.vhd#52</linty-anchor><br>RX_WORD_IS_ALIGNED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor>|
|INIT_ST|WAITING_COMMA_ST|RX_VALID_REALIGN_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#52">ppl_64_word_alignment.vhd#52</linty-anchor><br>RX_WORD_IS_ALIGNED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor>|
|WAITING_COMMA_ST|INIT_ST|RX_WORD_IS_ALIGNED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor>|
|WAITING_COMMA_ST|WAITING_COMMA_ST|COMMA_DET_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#53">ppl_64_word_alignment.vhd#53</linty-anchor><br>RX_WORD_IS_ALIGNED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor>|
|WAITING_COMMA_ST|ALIGNED_ST|COMMA_DET_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#53">ppl_64_word_alignment.vhd#53</linty-anchor><br>RX_WORD_IS_ALIGNED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor>|
|WAITING_COMMA_ST|ALIGNED_ST|COMMA_DET_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#53">ppl_64_word_alignment.vhd#53</linty-anchor><br>RX_WORD_IS_ALIGNED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor>|
|WAITING_COMMA_ST|ALIGNED_ST|COMMA_DET_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#53">ppl_64_word_alignment.vhd#53</linty-anchor><br>RX_WORD_IS_ALIGNED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor>|
|WAITING_COMMA_ST|ALIGNED_ST|COMMA_DET_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#53">ppl_64_word_alignment.vhd#53</linty-anchor><br>RX_WORD_IS_ALIGNED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor>|
|WAITING_COMMA_ST|ALIGNED_ST|COMMA_DET_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#53">ppl_64_word_alignment.vhd#53</linty-anchor><br>RX_WORD_IS_ALIGNED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor>|
|WAITING_COMMA_ST|ALIGNED_ST|COMMA_DET_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#53">ppl_64_word_alignment.vhd#53</linty-anchor><br>RX_WORD_IS_ALIGNED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor>|
|WAITING_COMMA_ST|ALIGNED_ST|COMMA_DET_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#53">ppl_64_word_alignment.vhd#53</linty-anchor><br>RX_WORD_IS_ALIGNED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor>|
|WAITING_COMMA_ST|ALIGNED_ST|COMMA_DET_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#53">ppl_64_word_alignment.vhd#53</linty-anchor><br>RX_WORD_IS_ALIGNED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor>|
|ALIGNED_ST|INIT_ST|RX_WORD_IS_ALIGNED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor>|
|ALIGNED_ST|WAITING_COMMA_ST|COMMA_DET_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#53">ppl_64_word_alignment.vhd#53</linty-anchor><br>RX_WORD_IS_ALIGNED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor><br>alignment_byte: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#75">ppl_64_word_alignment.vhd#75</linty-anchor>|
|ALIGNED_ST|WAITING_COMMA_ST|COMMA_DET_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#53">ppl_64_word_alignment.vhd#53</linty-anchor><br>RX_WORD_IS_ALIGNED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor><br>alignment_byte: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#75">ppl_64_word_alignment.vhd#75</linty-anchor>|
|ALIGNED_ST|ALIGNED_ST|COMMA_DET_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#53">ppl_64_word_alignment.vhd#53</linty-anchor><br>RX_WORD_IS_ALIGNED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor><br>alignment_byte: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#75">ppl_64_word_alignment.vhd#75</linty-anchor>|
|ALIGNED_ST|ALIGNED_ST|COMMA_DET_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#53">ppl_64_word_alignment.vhd#53</linty-anchor><br>RX_WORD_IS_ALIGNED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor><br>alignment_byte: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#75">ppl_64_word_alignment.vhd#75</linty-anchor>|
|ALIGNED_ST|ALIGNED_ST|COMMA_DET_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#53">ppl_64_word_alignment.vhd#53</linty-anchor><br>RX_WORD_IS_ALIGNED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor><br>alignment_byte: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#75">ppl_64_word_alignment.vhd#75</linty-anchor>|
|ALIGNED_ST|ALIGNED_ST|COMMA_DET_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#53">ppl_64_word_alignment.vhd#53</linty-anchor><br>RX_WORD_IS_ALIGNED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor><br>alignment_byte: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#75">ppl_64_word_alignment.vhd#75</linty-anchor>|
|ALIGNED_ST|ALIGNED_ST|COMMA_DET_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#53">ppl_64_word_alignment.vhd#53</linty-anchor><br>RX_WORD_IS_ALIGNED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor><br>alignment_byte: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#75">ppl_64_word_alignment.vhd#75</linty-anchor>|
|ALIGNED_ST|ALIGNED_ST|COMMA_DET_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#53">ppl_64_word_alignment.vhd#53</linty-anchor><br>RX_WORD_IS_ALIGNED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor><br>alignment_byte: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#75">ppl_64_word_alignment.vhd#75</linty-anchor>|
|ALIGNED_ST|ALIGNED_ST|COMMA_DET_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#53">ppl_64_word_alignment.vhd#53</linty-anchor><br>RX_WORD_IS_ALIGNED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor><br>alignment_byte: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#75">ppl_64_word_alignment.vhd#75</linty-anchor>|
|ALIGNED_ST|ALIGNED_ST|COMMA_DET_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#53">ppl_64_word_alignment.vhd#53</linty-anchor><br>RX_WORD_IS_ALIGNED_HSSL: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#51">ppl_64_word_alignment.vhd#51</linty-anchor><br>alignment_byte: <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#75">ppl_64_word_alignment.vhd#75</linty-anchor>|


<br>

<a href="/spacefibrelight/reports/finite_state_machines.html">Back to FSM Report</a>