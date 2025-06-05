[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)

<br>

# Entity - data_out_bc_buf

## Summary

| Name | Location | Description |
| --- | --- | --- |
|data_out_bc_buf|<linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#32">data_out_bc_buf.vhd#32</linty-anchor>||
## Instantiations

Count: 1

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| inst_data_out_bc_buf | <linty-anchor href="//src/module_data_link/data_link.vhd#1020">data_link.vhd#1020</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_19/instantiation_1.md) |


## Generics

Count: 0

## Ports

Count: 16

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#34">RST_N</linty-anchor>|in|std_logic|Global reset (Active-low)|
|<linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#35">CLK</linty-anchor>|in|std_logic|Global Clock|
|<linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#37">LINK_RESET_DLRE</linty-anchor>|in|std_logic|Link Reset command|
|<linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#39">S_AXIS_ARSTN_NW</linty-anchor>|in|std_logic|Active-low asynchronous reset for the AXI-Stream interface|
|<linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#40">S_AXIS_ACLK_NW</linty-anchor>|in|std_logic|Clock signal for the AXI-Stream interface|
|<linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#41">S_AXIS_TREADY_DL</linty-anchor>|out|std_logic|Indicates that TDATA, TUSER, and TLAST are valid|
|<linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#42">S_AXIS_TDATA_NW</linty-anchor>|in|std_logic_vector ( C_DATA_LENGTH - 1 downto 0 )|AXI-Stream data bus|
|<linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#43">S_AXIS_TUSER_NW</linty-anchor>|in|std_logic_vector ( C_BYTE_BY_WORD_LENGTH - 1 downto 0 )|Indicates the end of a data packet|
|<linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#44">S_AXIS_TLAST_NW</linty-anchor>|in|std_logic|Receiver ready signal (slave is ready to accept data)|
|<linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#45">S_AXIS_TVALID_NW</linty-anchor>|in|std_logic|AXI-Stream user-defined sideband signal|
|<linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#47">VC_READY_DOBUF</linty-anchor>|out|std_logic|Virtual Channel ready flag|
|<linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#48">DATA_DOBUF</linty-anchor>|out|std_logic_vector ( C_DATA_LENGTH - 1 downto 0 )|Data parallel to data_mac|
|<linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#49">VALID_K_CHARAC_DOBUF</linty-anchor>|out|std_logic_vector ( C_BYTE_BY_WORD_LENGTH - 1 downto 0 )|K character valid in the 32-bit DATA_DOBUF vector|
|<linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#50">DATA_VALID_DOBUF</linty-anchor>|out|std_logic|Data valid flag associated with DATA_DOBUF|
|<linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#51">END_PACKET_DOBUF</linty-anchor>|out|std_logic|End packet flag|
|<linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#52">VC_RD_EN_DMAC</linty-anchor>|in|std_logic|Read command from data_mac|


<br>

[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)