[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)

<br>

# Entity - data_out_buff

## Summary

| Name | Location | Description |
| --- | --- | --- |
|data_out_buff|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#33">data_out_buf.vhd#33</linty-anchor>||
## Instantiations

Count: 8

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| gen_data_out_buff(0)\.inst_data_out_buff | <linty-anchor href="//src/module_data_link/data_link.vhd#1041">data_link.vhd#1041</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_20/instantiation_1.md) |
| gen_data_out_buff(1)\.inst_data_out_buff | <linty-anchor href="//src/module_data_link/data_link.vhd#1041">data_link.vhd#1041</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_20/instantiation_2.md) |
| gen_data_out_buff(2)\.inst_data_out_buff | <linty-anchor href="//src/module_data_link/data_link.vhd#1041">data_link.vhd#1041</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_20/instantiation_3.md) |
| gen_data_out_buff(3)\.inst_data_out_buff | <linty-anchor href="//src/module_data_link/data_link.vhd#1041">data_link.vhd#1041</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_20/instantiation_4.md) |
| gen_data_out_buff(4)\.inst_data_out_buff | <linty-anchor href="//src/module_data_link/data_link.vhd#1041">data_link.vhd#1041</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_20/instantiation_5.md) |
| gen_data_out_buff(5)\.inst_data_out_buff | <linty-anchor href="//src/module_data_link/data_link.vhd#1041">data_link.vhd#1041</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_20/instantiation_6.md) |
| gen_data_out_buff(6)\.inst_data_out_buff | <linty-anchor href="//src/module_data_link/data_link.vhd#1041">data_link.vhd#1041</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_20/instantiation_7.md) |
| gen_data_out_buff(7)\.inst_data_out_buff | <linty-anchor href="//src/module_data_link/data_link.vhd#1041">data_link.vhd#1041</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_20/instantiation_8.md) |


## Generics

Count: 0

## Ports

Count: 22

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#35">RST_N</linty-anchor>|in|std_logic|Global reset (Active-low)|
|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#36">CLK</linty-anchor>|in|std_logic|Global Clock|
|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#38">LANE_ACTIVE_ST_PPL</linty-anchor>|in|std_logic|Lane Active state flag|
|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#40">LINK_RESET_DLRE</linty-anchor>|in|std_logic|Link Reset command|
|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#42">S_AXIS_ARSTN_NW</linty-anchor>|in|std_logic|Active-low asynchronous reset signal for the AXI-Stream i|
|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#43">S_AXIS_ACLK_NW</linty-anchor>|in|std_logic|Clock signal for the AXI-Stream interface|
|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#44">S_AXIS_TREADY_DL</linty-anchor>|out|std_logic|Ready signal from the slave indicating it can accept data|
|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#45">S_AXIS_TDATA_NW</linty-anchor>|in|std_logic_vector ( C_DATA_LENGTH - 1 downto 0 )|Data bus carrying the actual payload|
|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#46">S_AXIS_TUSER_NW</linty-anchor>|in|std_logic_vector ( C_BYTE_BY_WORD_LENGTH - 1 downto 0 )|User-defined sideband information (optional)|
|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#47">S_AXIS_TLAST_NW</linty-anchor>|in|std_logic|Signal indicating the last transfer in a packet|
|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#48">S_AXIS_TVALID_NW</linty-anchor>|in|std_logic|Valid signal indicating that the data on TDATA is valid|
|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#50">VC_READY_DOBUF</linty-anchor>|out|std_logic|Virtual Channel ready flag|
|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#51">DATA_DOBUF</linty-anchor>|out|std_logic_vector ( C_DATA_LENGTH - 1 downto 0 )|Data parallel to data_mac|
|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#52">VALID_K_CHARAC_DOBUF</linty-anchor>|out|std_logic_vector ( C_BYTE_BY_WORD_LENGTH - 1 downto 0 )|K character valid in the 32-bit DATA_DOBUF vector|
|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#53">DATA_VALID_DOBUF</linty-anchor>|out|std_logic|Data valid flag associated with DATA_DOBUF|
|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#54">END_PACKET_DOBUF</linty-anchor>|out|std_logic|End packet flag|
|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#55">VC_RD_EN_DMAC</linty-anchor>|in|std_logic|Read command from data_mac|
|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#57">M_VAL_DSCHECK</linty-anchor>|in|std_logic_vector ( C_M_SIZE - 1 downto 0 )|M value associated with FCT_FAR_END_DSCHECK|
|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#58">FCT_FAR_END_DSCHECK</linty-anchor>|in|std_logic|FCT Fare-end received flag|
|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#60">FCT_CC_OVF_DOBUF</linty-anchor>|out|std_logic|FCT credit counter overflow flag|
|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#61">CREDIT_VC_DOBUF</linty-anchor>|out|std_logic|Has credit flag (crdit counter > 0)|
|<linty-anchor href="//src/module_data_link/data_out_buf.vhd#62">VC_CONT_MODE_MIB</linty-anchor>|in|std_logic|Continuous mode command|


<br>

[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)