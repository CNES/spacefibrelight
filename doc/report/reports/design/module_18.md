[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)

<br>

# Entity - data_mac

## Summary

| Name | Location | Description |
| --- | --- | --- |
|data_mac|<linty-anchor href="//src/module_data_link/data_mac.vhd#32">data_mac.vhd#32</linty-anchor>||
## Instantiations

Count: 1

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| inst_data_mac | <linty-anchor href="//src/module_data_link/data_link.vhd#1067">data_link.vhd#1067</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_18/instantiation_1.md) |


## Generics

Count: 1

| Name | Type | Default value | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/module_data_link/data_mac.vhd#34">G_VC_NUM</linty-anchor>|integer|8|Number of virtual channel|
## Ports

Count: 35

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/module_data_link/data_mac.vhd#37">CLK</linty-anchor>|in|std_logic|Global Clock|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#39">LINK_RESET_DLRE</linty-anchor>|in|std_logic|Link Reset command|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#41">LANE_ACTIVE_PPL</linty-anchor>|in|std_logic|Lane Active flag for the DATA Link Layer|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#43">REQ_ACK_DERRM</linty-anchor>|in|std_logic|ACK request from data_err_management|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#44">REQ_NACK_DERRM</linty-anchor>|in|std_logic|NACK request from data_err_management|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#45">TRANS_POL_FLG_DERRM</linty-anchor>|in|std_logic|Transmission polarity flag from data_err_management|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#46">REQ_ACK_DONE_DMAC</linty-anchor>|out|std_logic|Acknowledge done signal to data_err_management|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#47">SEQ_NUM_ACK_DERRM</linty-anchor>|in|std_logic_vector ( 7 downto 0 )|SEQ_NUM ACK value from data_err_management|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#49">REQ_FCT_DIBUF</linty-anchor>|in|std_logic_vector ( G_VC_NUM - 1 downto 0 )|FCT request from data_in_buf|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#50">REQ_FCT_DONE_DMAC</linty-anchor>|out|std_logic_vector ( G_VC_NUM - 1 downto 0 )|FCT request done flag to data_in_buf|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#52">VC_READY_DOBUF</linty-anchor>|in|std_logic_vector ( G_VC_NUM downto 0 )|Virtual Channel ready flag vector|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#53">VC_DATA_DOBUF</linty-anchor>|in|vc_data_array ( G_VC_NUM downto 0 )|Array of data vector for each Virtual Channel|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#54">VC_VALID_K_CHAR_DOBUF</linty-anchor>|in|vc_k_array ( G_VC_NUM downto 0 )|Array of K character valid in the 32-bit VC_DATA_DOBUF|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#55">VC_DATA_VALID_DOBUF</linty-anchor>|in|std_logic_vector ( G_VC_NUM downto 0 )|Data valid flag associated with VC_DATA_DOBUF|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#56">VC_END_PACKET_DOBUF</linty-anchor>|in|std_logic_vector ( G_VC_NUM downto 0 )|End packet flag vector for each Virtual Channel|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#57">VC_RD_EN_DMAC</linty-anchor>|out|std_logic_vector ( G_VC_NUM downto 0 )|Read command vector for each Virtual Channel|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#59">VC_PAUSE_MIB</linty-anchor>|in|std_logic_vector ( G_VC_NUM downto 0 )|Pause the corresponding virtual channel after the end of current transmission|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#60">VC_END_EMISSION_DMAC</linty-anchor>|out|std_logic_vector ( G_VC_NUM downto 0 )|Indicates that corresponding channel finished emitting a frame|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#61">VC_RUN_EMISSION_DMAC</linty-anchor>|out|std_logic_vector ( G_VC_NUM downto 0 )|Indicates that corresponding channel is emitting a frame|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#62">DATA_COUNTER_TX_DMAC</linty-anchor>|out|std_logic_vector ( 6 downto 0 )|Indicate the number of data transmitted in last frame emitted|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#63">ACK_COUNTER_TX_DMAC</linty-anchor>|out|std_logic_vector ( 2 downto 0 )|ACK counter TX|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#64">NACK_COUNTER_TX_DMAC</linty-anchor>|out|std_logic_vector ( 2 downto 0 )|NACK counter TX|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#65">FCT_COUNTER_TX_DMAC</linty-anchor>|out|std_logic_vector ( 3 downto 0 )|FCT counter TX|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#67">DATA_DMAC</linty-anchor>|out|std_logic_vector ( C_DATA_LENGTH - 1 downto 0 )|Data parallel to data_encapsulation|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#68">VALID_K_CHAR_DMAC</linty-anchor>|out|std_logic_vector ( C_BYTE_BY_WORD_LENGTH - 1 downto 0 )|K charachter valid in the 32-bit DATA_DMAC vector|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#69">NEW_WORD_DMAC</linty-anchor>|out|std_logic|New word Flag to data_encapsulation|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#70">END_PACKET_DMAC</linty-anchor>|out|std_logic|End frame/control word to data_encapsulation|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#71">TYPE_FRAME_DMAC</linty-anchor>|out|std_logic_vector ( C_TYPE_FRAME_LENGTH - 1 downto 0 )|Type of the frame associated with DATA_DMAC|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#72">VIRTUAL_CHANNEL_DMAC</linty-anchor>|out|std_logic_vector ( G_VC_NUM - 1 downto 0 )|Virtual channel of the frame associated with DATA_DMAC|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#73">BC_TYPE_DMAC</linty-anchor>|out|std_logic_vector ( G_VC_NUM - 1 downto 0 )|BROADCAST Type|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#74">BC_CHANNEL_DMAC</linty-anchor>|out|std_logic_vector ( G_VC_NUM - 1 downto 0 )|BROADCAST Channel (one channel in this implementation)|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#75">BC_STATUS_DMAC</linty-anchor>|out|std_logic_vector ( 2 - 1 downto 0 )|BOADCAST status|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#76">MULT_CHANNEL_DMAC</linty-anchor>|out|std_logic_vector ( G_VC_NUM - 1 downto 0 )|Multiplier and Channel field for FCT word|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#77">TRANS_POL_FLG_DMAC</linty-anchor>|out|std_logic|Transmission polarity flag|
|<linty-anchor href="//src/module_data_link/data_mac.vhd#78">SEQ_NUM_ACK_DMAC</linty-anchor>|out|std_logic_vector ( 7 downto 0 )|SEQ_NUM ACK value|


<br>

[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)