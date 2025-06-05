[Back to FSM Report](../finite_state_machines.md)

<br>

# FSM #3: state

## Summary

|Name|Location|Graph|Reset State|States|Input Signals|Output Signals|
|---|---|:---:|---|---|---:|---:|
state|<linty-anchor href="//src/module_data_link/data_err_management.vhd#71">data_err_management.vhd#71</linty-anchor>|<a href="/graphs/fsm_states_3_graph.html"><img title="Open FSM Diagram" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open FSM Diagram"></a>|VALID_POSITIVE_ST| Count: 4<br>ERROR_NEGATIVE_ST<br>ERROR_POSITIVE_ST<br>VALID_NEGATIVE_ST<br>VALID_POSITIVE_ST|5|4||

<br>

## Input Signals

Count: 5

|Name|Declaration|
|---|---|
|LINK_RESET_DLRE|<linty-anchor href="//src/module_data_link/data_err_management.vhd#36">data_err_management.vhd#36</linty-anchor>|
|s_ack_request|<linty-anchor href="//src/module_data_link/data_err_management.vhd#74">data_err_management.vhd#74</linty-anchor>|
|s_far_end_rpf|<linty-anchor href="//src/module_data_link/data_err_management.vhd#79">data_err_management.vhd#79</linty-anchor>|
|s_nack_request|<linty-anchor href="//src/module_data_link/data_err_management.vhd#73">data_err_management.vhd#73</linty-anchor>|
|s_seq_err|<linty-anchor href="//src/module_data_link/data_err_management.vhd#80">data_err_management.vhd#80</linty-anchor>||

## Output Signals

Count: 4

|Name|Declaration|
|---|---|
|NEAR_END_RPF_DERRM|<linty-anchor href="//src/module_data_link/data_err_management.vhd#44">data_err_management.vhd#44</linty-anchor>|
|SEQ_NUM_ACK_DERRM|<linty-anchor href="//src/module_data_link/data_err_management.vhd#52">data_err_management.vhd#52</linty-anchor>|
|ack_pol_flg|<linty-anchor href="//src/module_data_link/data_err_management.vhd#87">data_err_management.vhd#87</linty-anchor>|
|near_end_rpf|<linty-anchor href="//src/module_data_link/data_err_management.vhd#85">data_err_management.vhd#85</linty-anchor>|

## Transition table

|From|To|Input Control Signals|
|---|---|---|
|VALID_POSITIVE_ST|VALID_POSITIVE_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_err_management.vhd#36">data_err_management.vhd#36</linty-anchor>|
|VALID_POSITIVE_ST|VALID_POSITIVE_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_err_management.vhd#36">data_err_management.vhd#36</linty-anchor><br>s_nack_request: <linty-anchor href="//src/module_data_link/data_err_management.vhd#73">data_err_management.vhd#73</linty-anchor>|
|VALID_POSITIVE_ST|ERROR_NEGATIVE_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_err_management.vhd#36">data_err_management.vhd#36</linty-anchor><br>s_nack_request: <linty-anchor href="//src/module_data_link/data_err_management.vhd#73">data_err_management.vhd#73</linty-anchor>|
|VALID_NEGATIVE_ST|VALID_POSITIVE_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_err_management.vhd#36">data_err_management.vhd#36</linty-anchor>|
|VALID_NEGATIVE_ST|VALID_NEGATIVE_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_err_management.vhd#36">data_err_management.vhd#36</linty-anchor><br>s_nack_request: <linty-anchor href="//src/module_data_link/data_err_management.vhd#73">data_err_management.vhd#73</linty-anchor>|
|VALID_NEGATIVE_ST|ERROR_POSITIVE_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_err_management.vhd#36">data_err_management.vhd#36</linty-anchor><br>s_nack_request: <linty-anchor href="//src/module_data_link/data_err_management.vhd#73">data_err_management.vhd#73</linty-anchor>|
|ERROR_POSITIVE_ST|VALID_POSITIVE_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_err_management.vhd#36">data_err_management.vhd#36</linty-anchor>|
|ERROR_POSITIVE_ST|VALID_POSITIVE_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_err_management.vhd#36">data_err_management.vhd#36</linty-anchor><br>s_ack_request: <linty-anchor href="//src/module_data_link/data_err_management.vhd#74">data_err_management.vhd#74</linty-anchor>|
|ERROR_POSITIVE_ST|ERROR_POSITIVE_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_err_management.vhd#36">data_err_management.vhd#36</linty-anchor><br>s_ack_request: <linty-anchor href="//src/module_data_link/data_err_management.vhd#74">data_err_management.vhd#74</linty-anchor><br>s_far_end_rpf: <linty-anchor href="//src/module_data_link/data_err_management.vhd#79">data_err_management.vhd#79</linty-anchor><br>s_seq_err: <linty-anchor href="//src/module_data_link/data_err_management.vhd#80">data_err_management.vhd#80</linty-anchor>|
|ERROR_POSITIVE_ST|ERROR_NEGATIVE_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_err_management.vhd#36">data_err_management.vhd#36</linty-anchor><br>s_ack_request: <linty-anchor href="//src/module_data_link/data_err_management.vhd#74">data_err_management.vhd#74</linty-anchor><br>s_far_end_rpf: <linty-anchor href="//src/module_data_link/data_err_management.vhd#79">data_err_management.vhd#79</linty-anchor><br>s_seq_err: <linty-anchor href="//src/module_data_link/data_err_management.vhd#80">data_err_management.vhd#80</linty-anchor>|
|ERROR_NEGATIVE_ST|VALID_POSITIVE_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_err_management.vhd#36">data_err_management.vhd#36</linty-anchor>|
|ERROR_NEGATIVE_ST|VALID_NEGATIVE_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_err_management.vhd#36">data_err_management.vhd#36</linty-anchor><br>s_ack_request: <linty-anchor href="//src/module_data_link/data_err_management.vhd#74">data_err_management.vhd#74</linty-anchor>|
|ERROR_NEGATIVE_ST|ERROR_POSITIVE_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_err_management.vhd#36">data_err_management.vhd#36</linty-anchor><br>s_ack_request: <linty-anchor href="//src/module_data_link/data_err_management.vhd#74">data_err_management.vhd#74</linty-anchor><br>s_far_end_rpf: <linty-anchor href="//src/module_data_link/data_err_management.vhd#79">data_err_management.vhd#79</linty-anchor><br>s_seq_err: <linty-anchor href="//src/module_data_link/data_err_management.vhd#80">data_err_management.vhd#80</linty-anchor>|
|ERROR_NEGATIVE_ST|ERROR_NEGATIVE_ST|LINK_RESET_DLRE: <linty-anchor href="//src/module_data_link/data_err_management.vhd#36">data_err_management.vhd#36</linty-anchor><br>s_ack_request: <linty-anchor href="//src/module_data_link/data_err_management.vhd#74">data_err_management.vhd#74</linty-anchor><br>s_far_end_rpf: <linty-anchor href="//src/module_data_link/data_err_management.vhd#79">data_err_management.vhd#79</linty-anchor><br>s_seq_err: <linty-anchor href="//src/module_data_link/data_err_management.vhd#80">data_err_management.vhd#80</linty-anchor>|


<br>

[Back to FSM Report](../finite_state_machines.md)