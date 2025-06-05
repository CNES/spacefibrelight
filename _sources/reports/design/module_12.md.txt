[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)

<br>

# Entity - data_encapsulation

## Summary

| Name | Location | Description |
| --- | --- | --- |
|data_encapsulation|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#32">data_encapsulation.vhd#32</linty-anchor>||
## Instantiations

Count: 1

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| inst_data_encapsulation | <linty-anchor href="//src/module_data_link/data_link.vhd#1109">data_link.vhd#1109</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_12/instantiation_1.md) |


## Generics

Count: 1

| Name | Type | Default value | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#34">G_VC_NUM</linty-anchor>|integer|8|Number of virtual channel|
## Ports

Count: 22

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#37">CLK</linty-anchor>|in|std_logic|Global Clock|
|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#39">LINK_RESET_DLRE</linty-anchor>|in|std_logic|Link Reset command|
|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#41">LANE_ACTIVE_PPL</linty-anchor>|in|std_logic|Lane Active flag for the DATA Link Layer|
|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#43">DATA_DMAC</linty-anchor>|in|std_logic_vector ( C_DATA_LENGTH - 1 downto 0 )|Data parallel from data_mac|
|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#44">VALID_K_CHAR_DMAC</linty-anchor>|in|std_logic_vector ( C_BYTE_BY_WORD_LENGTH - 1 downto 0 )|K charachter valid in the 32-bit DATA_DMAC vector|
|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#45">NEW_WORD_DMAC</linty-anchor>|in|std_logic|New word flag from data_mac|
|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#46">END_PACKET_DMAC</linty-anchor>|in|std_logic|End frame/control word from data_mac|
|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#47">TYPE_FRAME_DMAC</linty-anchor>|in|std_logic_vector ( C_TYPE_FRAME_LENGTH - 1 downto 0 )|Type of the frame associated with DATA_DMAC|
|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#48">VIRTUAL_CHANNEL_DMAC</linty-anchor>|in|std_logic_vector ( G_VC_NUM - 1 downto 0 )|Virtual channel of the frame associated with DATA_DMAC|
|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#49">BC_TYPE_DMAC</linty-anchor>|in|std_logic_vector ( G_VC_NUM - 1 downto 0 )|BROADCAST Type|
|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#50">BC_CHANNEL_DMAC</linty-anchor>|in|std_logic_vector ( G_VC_NUM - 1 downto 0 )|BROADCAST Channel (one channel in this implementation)|
|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#51">BC_STATUS_DMAC</linty-anchor>|in|std_logic_vector ( 2 - 1 downto 0 )|BOADCAST status|
|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#52">MULT_CHANNEL_DMAC</linty-anchor>|in|std_logic_vector ( G_VC_NUM - 1 downto 0 )|Multiplier and Channel field for FCT word|
|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#53">SEQ_NUM_ACK_DMAC</linty-anchor>|in|std_logic_vector ( 7 downto 0 )|SEQ_NUM ACK value|
|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#54">TRANS_POL_FLG_DMAC</linty-anchor>|in|std_logic|Transmission polarity flag|
|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#56">NEW_WORD_DENC</linty-anchor>|out|std_logic|New word flag to data_seq_compute|
|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#57">DATA_DENC</linty-anchor>|out|std_logic_vector ( C_DATA_LENGTH - 1 downto 0 )|Data parallel to data_seq_compute|
|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#58">VALID_K_CHARAC_DENC</linty-anchor>|out|std_logic_vector ( C_BYTE_BY_WORD_LENGTH - 1 downto 0 )|K charachter valid in the 32-bit DATA_DENC vector|
|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#59">TYPE_FRAME_DENC</linty-anchor>|out|std_logic_vector ( C_TYPE_FRAME_LENGTH - 1 downto 0 )|Type of the frame associated with DATA_DENC|
|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#60">END_FRAME_DENC</linty-anchor>|out|std_logic|End frame/control word associated with DATA_DENC|
|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#61">SEQ_NUM_ACK_DENC</linty-anchor>|out|std_logic_vector ( 7 downto 0 )|SEQ_NUM ACK value|
|<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#62">TRANS_POL_FLG_DENC</linty-anchor>|out|std_logic|Transmission polarity flag|


<br>

[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)