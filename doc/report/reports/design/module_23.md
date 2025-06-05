[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)

<br>

# Entity - data_word_id_fsm

## Summary

| Name | Location | Description |
| --- | --- | --- |
|data_word_id_fsm|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#32">data_word_id_fsm.vhd#32</linty-anchor>||
## Instantiations

Count: 1

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| inst_data_word_id_fsm | <linty-anchor href="//src/module_data_link/data_link.vhd#951">data_link.vhd#951</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_23/instantiation_1.md) |


## Generics

Count: 0

## Ports

Count: 26

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#34">CLK</linty-anchor>|in|std_logic|Global clock|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#36">LINK_RESET_DLRE</linty-anchor>|in|std_logic|Link Reset command|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#38">FIFO_RX_DATA_VALID_PPL</linty-anchor>|in|std_logic|Flag DATA_VALID of the FIFO RX from Lane layer|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#39">FIFO_RX_RD_EN_DL</linty-anchor>|out|std_logic|Flag to read data in FIFO RX|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#40">DATA_RX_PPL</linty-anchor>|in|std_logic_vector ( C_DATA_LENGTH - 1 downto 0 )|Data parallel from Lane Layer|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#41">VALID_K_CHARAC_PPL</linty-anchor>|in|std_logic_vector ( C_BYTE_BY_WORD_LENGTH - 1 downto 0 )|K character valid in the 32-bit DATA_RX_PPL vector|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#43">TYPE_FRAME_DWI</linty-anchor>|out|std_logic_vector ( C_TYPE_FRAME_LENGTH - 1 downto 0 )|Current frame/control word type|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#44">NEW_WORD_DWI</linty-anchor>|out|std_logic|New word flag associated to DATA_DWI|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#45">END_FRAME_DWI</linty-anchor>|out|std_logic|End frame/control word flag|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#46">DATA_DWI</linty-anchor>|out|std_logic_vector ( C_DATA_LENGTH - 1 downto 0 )|Data parallel to data_crc_check|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#47">VALID_K_CHARAC_DWI</linty-anchor>|out|std_logic_vector ( C_BYTE_BY_WORD_LENGTH - 1 downto 0 )|K character valid in the 32-bit DATA_DWI vector|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#48">SEQ_NUM_DWI</linty-anchor>|out|std_logic_vector ( 7 downto 0 )|SEQ_NUM of the current control word|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#49">CRC_16B_DWI</linty-anchor>|out|std_logic_vector ( 15 downto 0 )|16-bit CRC (data frame)  of the current control word|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#50">CRC_8B_DWI</linty-anchor>|out|std_logic_vector ( 7 downto 0 )|8-bit CRC of the current control word|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#51">MULTIPLIER_DWI</linty-anchor>|out|std_logic_vector ( C_MULT_SIZE - 1 downto 0 )|Multiplier value of the current FCT word|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#52">VC_DWI</linty-anchor>|out|std_logic_vector ( C_CHANNEL_SIZE - 1 downto 0 )|Virtual Channel of the current FCT word|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#53">RXNOTHING_ACTIVE_DWI</linty-anchor>|out|std_logic|RXNOTHING state of the data_word_id_fsm flag|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#54">RXERR_DWI</linty-anchor>|out|std_logic|RXERR flag detection|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#55">RXERR_ALL_DWI</linty-anchor>|out|std_logic|RXERR flag detection during broadcast and data frame status|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#57">CRC_ERR_DCCHECK</linty-anchor>|in|std_logic|CRC error flag from data_crc_check|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#58">SEQ_ERR_DSCHECK</linty-anchor>|in|std_logic|SEQ_NUM error flag from data_seq_check|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#59">FRAME_ERR_DWI</linty-anchor>|out|std_logic|Frame error flag|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#61">DATA_COUNTER_RX_DWI</linty-anchor>|out|std_logic_vector ( 6 downto 0 )|Data counter RX|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#62">RETRY_COUNTER_RX_DWI</linty-anchor>|out|std_logic_vector ( 1 downto 0 )|RETRY counter RX|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#63">DATA_PULSE_RX_DWI</linty-anchor>|out|std_logic|New data received flag|
|<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#64">RETRY_PULSE_RX_DWI</linty-anchor>|out|std_logic|New RETRY received flag|


<br>

[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)