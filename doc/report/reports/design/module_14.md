[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)

<br>

# Entity - data_in_bc_buf

## Summary

| Name | Location | Description |
| --- | --- | --- |
|data_in_bc_buf|<linty-anchor href="//src/module_data_link/data_in_bc_buf.vhd#32">data_in_bc_buf.vhd#32</linty-anchor>||
## Instantiations

Count: 1

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| inst_data_in_bc_buf | <linty-anchor href="//src/module_data_link/data_link.vhd#750">data_link.vhd#750</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_14/instantiation_1.md) |


## Generics

Count: 0

## Ports

Count: 12

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/module_data_link/data_in_bc_buf.vhd#34">RST_N</linty-anchor>|in|std_logic|Global reset (Active-low)|
|<linty-anchor href="//src/module_data_link/data_in_bc_buf.vhd#35">CLK</linty-anchor>|in|std_logic|Global Clock|
|<linty-anchor href="//src/module_data_link/data_in_bc_buf.vhd#37">LINK_RESET_DLRE</linty-anchor>|in|std_logic|Link Reset command|
|<linty-anchor href="//src/module_data_link/data_in_bc_buf.vhd#39">M_AXIS_ARSTN_NW</linty-anchor>|in|std_logic|Active-low asynchronous reset for the AXI-Stream interface|
|<linty-anchor href="//src/module_data_link/data_in_bc_buf.vhd#40">M_AXIS_ACLK_NW</linty-anchor>|in|std_logic|Clock signal for the AXI-Stream interface|
|<linty-anchor href="//src/module_data_link/data_in_bc_buf.vhd#41">M_AXIS_TVALID_DIBUF</linty-anchor>|out|std_logic|Indicates that TDATA, TUSER, and TLAST are valid|
|<linty-anchor href="//src/module_data_link/data_in_bc_buf.vhd#42">M_AXIS_TDATA_DIBUF</linty-anchor>|out|std_logic_vector ( C_DATA_LENGTH - 1 downto 0 )|AXI-Stream data bus|
|<linty-anchor href="//src/module_data_link/data_in_bc_buf.vhd#43">M_AXIS_TLAST_DIBUF</linty-anchor>|out|std_logic|Indicates the end of a data packet|
|<linty-anchor href="//src/module_data_link/data_in_bc_buf.vhd#44">M_AXIS_TREADY_NW</linty-anchor>|in|std_logic|Receiver ready signal (slave is ready to accept data)|
|<linty-anchor href="//src/module_data_link/data_in_bc_buf.vhd#45">M_AXIS_TUSER_DIBUF</linty-anchor>|out|std_logic_vector ( C_BYTE_BY_WORD_LENGTH - 1 downto 0 )|AXI-Stream user-defined sideband signal|
|<linty-anchor href="//src/module_data_link/data_in_bc_buf.vhd#47">DATA_DDESBC</linty-anchor>|in|std_logic_vector ( C_DATA_K_WIDTH - 1 downto 0 )|Data parallel (K character + DATA) from data_desencapsulation_bc|
|<linty-anchor href="//src/module_data_link/data_in_bc_buf.vhd#48">DATA_EN_DDESBC</linty-anchor>|in|std_logic|Data valid flag associated with DDESBC|


<br>

[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)