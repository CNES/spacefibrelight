[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)

<br>

# Entity - data_err_management

## Summary

| Name | Location | Description |
| --- | --- | --- |
|data_err_management|<linty-anchor href="//src/module_data_link/data_err_management.vhd#32">data_err_management.vhd#32</linty-anchor>||
## Instantiations

Count: 1

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| inst_data_err_management | <linty-anchor href="//src/module_data_link/data_link.vhd#980">data_link.vhd#980</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_13/instantiation_1.md) |


## Generics

Count: 0

## Ports

Count: 19

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/module_data_link/data_err_management.vhd#34">CLK</linty-anchor>|in|std_logic|Global Clock|
|<linty-anchor href="//src/module_data_link/data_err_management.vhd#36">LINK_RESET_DLRE</linty-anchor>|in|std_logic|Link Reset command|
|<linty-anchor href="//src/module_data_link/data_err_management.vhd#37">LINK_RESET_DERRM</linty-anchor>|out|std_logic|Link Reset request|
|<linty-anchor href="//src/module_data_link/data_err_management.vhd#39">TYPE_FRAME_DSCHECK</linty-anchor>|in|std_logic_vector ( 3 downto 0 )|Current frame/control word type from data_seq_check|
|<linty-anchor href="//src/module_data_link/data_err_management.vhd#40">END_FRAME_DSCHECK</linty-anchor>|in|std_logic|End flag of the current frame/control word from data_seq_check|
|<linty-anchor href="//src/module_data_link/data_err_management.vhd#41">SEQ_ERR_DSCHECK</linty-anchor>|in|std_logic|SEQ_NUM error for the current frame/control word from data_seq_check|
|<linty-anchor href="//src/module_data_link/data_err_management.vhd#42">SEQ_NUM_ACK_DSCHECK</linty-anchor>|in|std_logic_vector ( 6 downto 0 )|SEQ_NUM ACK value from data_seq_check|
|<linty-anchor href="//src/module_data_link/data_err_management.vhd#43">FAR_END_RPF_DSCHECK</linty-anchor>|in|std_logic|Far-end RPF flag|
|<linty-anchor href="//src/module_data_link/data_err_management.vhd#44">NEAR_END_RPF_DERRM</linty-anchor>|out|std_logic|Near-end RPF flag|
|<linty-anchor href="//src/module_data_link/data_err_management.vhd#45">CRC_ERR_DSCHECK</linty-anchor>|in|std_logic|CRC error flag for the current frame/control word from data_seq_check|
|<linty-anchor href="//src/module_data_link/data_err_management.vhd#46">FRAME_ERR_DSCHECK</linty-anchor>|in|std_logic|Frame error flag for the current frame/control word from data_seq_check|
|<linty-anchor href="//src/module_data_link/data_err_management.vhd#47">RXERR_DSCHECK</linty-anchor>|in|std_logic|Receive error flag from data_word_interface|
|<linty-anchor href="//src/module_data_link/data_err_management.vhd#49">REQ_ACK_DERRM</linty-anchor>|out|std_logic|ACK request to data_mac|
|<linty-anchor href="//src/module_data_link/data_err_management.vhd#50">REQ_NACK_DERRM</linty-anchor>|out|std_logic|NACK request to data_mac|
|<linty-anchor href="//src/module_data_link/data_err_management.vhd#51">TRANS_POL_FLG_DERRM</linty-anchor>|out|std_logic|Transmission polarity flag to data_mac|
|<linty-anchor href="//src/module_data_link/data_err_management.vhd#52">SEQ_NUM_ACK_DERRM</linty-anchor>|out|std_logic_vector ( 7 downto 0 )|SEQ_NUM ACK value to data_mac|
|<linty-anchor href="//src/module_data_link/data_err_management.vhd#53">REQ_ACK_DONE_DMAC</linty-anchor>|in|std_logic|Acknowledge done signal from data_mac|
|<linty-anchor href="//src/module_data_link/data_err_management.vhd#55">NACK_RST_EN_MIB</linty-anchor>|in|std_logic|Enable automatic link reset on NACK reception|
|<linty-anchor href="//src/module_data_link/data_err_management.vhd#56">NACK_RST_MODE_MIB</linty-anchor>|in|std_logic|Up for instant link reset on NACK reception, down for link reset at the end of the current received frame on NACK reception|


<br>

[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)