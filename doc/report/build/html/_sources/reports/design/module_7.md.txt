[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)

<br>

# Entity - data_crc_check

## Summary

| Name | Location | Description |
| --- | --- | --- |
|data_crc_check|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#32">data_crc_check.vhd#32</linty-anchor>||
## Instantiations

Count: 1

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| inst_data_crc_check | <linty-anchor href="//src/module_data_link/data_link.vhd#918">data_link.vhd#918</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_7/instantiation_1.md) |


## Generics

Count: 0

## Ports

Count: 30

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#34">CLK</linty-anchor>|in|std_logic|Global clock|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#36">LINK_RESET_DLRE</linty-anchor>|in|std_logic|Link Reset command|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#38">DATA_DWI</linty-anchor>|in|std_logic_vector ( C_DATA_LENGTH - 1 downto 0 )|Data parallel from data_word_id_fsm|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#39">VALID_K_CHARAC_DWI</linty-anchor>|in|std_logic_vector ( C_BYTE_BY_WORD_LENGTH - 1 downto 0 )|K character valid in the 32-bit DATA_DWI vector|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#40">NEW_WORD_DWI</linty-anchor>|in|std_logic|New word Flag from data_word_id_fsm|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#41">END_FRAME_DWI</linty-anchor>|in|std_logic|End frame/control word from data_word_id_fsm|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#42">SEQ_NUM_DWI</linty-anchor>|in|std_logic_vector ( 7 downto 0 )|SEQ_NUM from data_word_id_fsm|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#43">CRC_16B_DWI</linty-anchor>|in|std_logic_vector ( 15 downto 0 )|16-bit CRC (data frame)  from data_word_id_fsm|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#44">CRC_8B_DWI</linty-anchor>|in|std_logic_vector ( 7 downto 0 )|8-bit CRC from data_word_id_fsm|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#45">TYPE_FRAME_DWI</linty-anchor>|in|std_logic_vector ( C_TYPE_FRAME_LENGTH - 1 downto 0 )|Current frame/control word type from data_word_id_fsm|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#46">FRAME_ERR_DWI</linty-anchor>|in|std_logic|Frame error flag from data_word_id_fsm|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#47">MULTIPLIER_DWI</linty-anchor>|in|std_logic_vector ( C_MULT_SIZE - 1 downto 0 )|Multiplier value of the current FCT word|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#48">VC_DWI</linty-anchor>|in|std_logic_vector ( C_CHANNEL_SIZE - 1 downto 0 )|Virtual Channel of the current FCT word|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#49">RXERR_DWI</linty-anchor>|in|std_logic|RXERR flag detection|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#50">RXERR_ALL_DWI</linty-anchor>|in|std_logic|RXERR flag detection during broadcast and data frame status|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#51">RXNOTHING_ACTIVE_DWI</linty-anchor>|in|std_logic|RXNOTHING state of the data_word_id_fsm flag|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#53">NEW_WORD_DCCHECK</linty-anchor>|out|std_logic|New word flag associated with DATA_DCCHECK|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#54">DATA_DCCHECK</linty-anchor>|out|std_logic_vector ( C_DATA_LENGTH - 1 downto 0 )|Data parallel to data_seq_check|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#55">VALID_K_CHARAC_DCCHECK</linty-anchor>|out|std_logic_vector ( C_BYTE_BY_WORD_LENGTH - 1 downto 0 )|K character valid in the 32-bit DATA_DCCHECK vector|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#56">END_FRAME_DCCHECK</linty-anchor>|out|std_logic|End frame/control word flag|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#57">TYPE_FRAME_DCCHECK</linty-anchor>|out|std_logic_vector ( C_TYPE_FRAME_LENGTH - 1 downto 0 )|Current frame/control word type|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#58">SEQ_NUM_DCCHECK</linty-anchor>|out|std_logic_vector ( 7 downto 0 )|SEQ_NUM value|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#59">CRC_ERR_DCCHECK</linty-anchor>|out|std_logic|CRC error flag|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#60">FRAME_ERR_DCCHECK</linty-anchor>|out|std_logic|Frame error flag for the current frame|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#61">MULTIPLIER_DCCHECK</linty-anchor>|out|std_logic_vector ( C_MULT_SIZE - 1 downto 0 )|Multiplier value of the current FCT word|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#62">VC_DCCHECK</linty-anchor>|out|std_logic_vector ( C_CHANNEL_SIZE - 1 downto 0 )|Virtual Channel of the current FCT word|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#63">RXERR_DCCHECK</linty-anchor>|out|std_logic|RXERR flag for the current frame|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#64">RXERR_ALL_DCCHECK</linty-anchor>|out|std_logic|RXERR flag during broadcast and data frame status|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#66">CRC_LONG_ERR_DCCHECK</linty-anchor>|out|std_logic|CRC 16-bit error flag|
|<linty-anchor href="//src/module_data_link/data_crc_check.vhd#67">CRC_SHORT_ERR_DCCHECK</linty-anchor>|out|std_logic|CRC 8-bit error flag|


<br>

[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)