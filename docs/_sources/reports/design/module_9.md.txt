[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)

<br>

# Entity - data_crc_compute

## Summary

| Name | Location | Description |
| --- | --- | --- |
|data_crc_compute|<linty-anchor href="//src/module_data_link/data_crc_compute.vhd#32">data_crc_compute.vhd#32</linty-anchor>||
## Instantiations

Count: 1

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| inst_data_crc_compute | <linty-anchor href="//src/module_data_link/data_link.vhd#1158">data_link.vhd#1158</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_9/instantiation_1.md) |


## Generics

Count: 0

## Ports

Count: 12

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/module_data_link/data_crc_compute.vhd#34">CLK</linty-anchor>|in|std_logic|Global Clock|
|<linty-anchor href="//src/module_data_link/data_crc_compute.vhd#36">LINK_RESET_DLRE</linty-anchor>|in|std_logic|Link Reset command|
|<linty-anchor href="//src/module_data_link/data_crc_compute.vhd#38">LANE_ACTIVE_PPL</linty-anchor>|in|std_logic|Lane Active flag for the DATA Link Layer|
|<linty-anchor href="//src/module_data_link/data_crc_compute.vhd#40">NEW_WORD_DSCOM</linty-anchor>|in|std_logic|New word flag associated with DATA_DSCOM|
|<linty-anchor href="//src/module_data_link/data_crc_compute.vhd#41">DATA_DSCOM</linty-anchor>|in|std_logic_vector ( C_DATA_LENGTH - 1 downto 0 )|Data parallel from data_seq_compute|
|<linty-anchor href="//src/module_data_link/data_crc_compute.vhd#42">VALID_K_CHARAC_DSCOM</linty-anchor>|in|std_logic_vector ( C_BYTE_BY_WORD_LENGTH - 1 downto 0 )|K charachter valid in the 32-bit DATA_DSCOM vector|
|<linty-anchor href="//src/module_data_link/data_crc_compute.vhd#43">TYPE_FRAME_DSCOM</linty-anchor>|in|std_logic_vector ( C_TYPE_FRAME_LENGTH - 1 downto 0 )|Type of the frame associated with DATA_DSCOM|
|<linty-anchor href="//src/module_data_link/data_crc_compute.vhd#44">END_FRAME_DSCOM</linty-anchor>|in|std_logic|End frame/control word associated with DATA_DSCOM|
|<linty-anchor href="//src/module_data_link/data_crc_compute.vhd#46">FIFO_FULL_TX_LANE</linty-anchor>|in|std_logic|Fifo TX full flag from the lane layer|
|<linty-anchor href="//src/module_data_link/data_crc_compute.vhd#47">VALID_K_CHARAC_DCCOM</linty-anchor>|out|std_logic_vector ( C_BYTE_BY_WORD_LENGTH - 1 downto 0 )|Data parallel to lane layer|
|<linty-anchor href="//src/module_data_link/data_crc_compute.vhd#48">DATA_DCCOM</linty-anchor>|out|std_logic_vector ( C_DATA_LENGTH - 1 downto 0 )|K charachter valid in the 32-bit DATA_DCCOM vector|
|<linty-anchor href="//src/module_data_link/data_crc_compute.vhd#49">NEW_WORD_DCCOM</linty-anchor>|out|std_logic|New word Flag associated with DATA_DCCOM|


<br>

[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)