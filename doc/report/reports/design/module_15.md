[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)

<br>

# Entity - data_in_buf

## Summary

| Name | Location | Description |
| --- | --- | --- |
|data_in_buf|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#33">data_in_buf.vhd#33</linty-anchor>||
## Instantiations

Count: 8

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| gen_data_in_buff(0)\.inst_data_in_buf | <linty-anchor href="//src/module_data_link/data_link.vhd#803">data_link.vhd#803</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_15/instantiation_1.md) |
| gen_data_in_buff(1)\.inst_data_in_buf | <linty-anchor href="//src/module_data_link/data_link.vhd#803">data_link.vhd#803</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_15/instantiation_2.md) |
| gen_data_in_buff(2)\.inst_data_in_buf | <linty-anchor href="//src/module_data_link/data_link.vhd#803">data_link.vhd#803</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_15/instantiation_3.md) |
| gen_data_in_buff(3)\.inst_data_in_buf | <linty-anchor href="//src/module_data_link/data_link.vhd#803">data_link.vhd#803</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_15/instantiation_4.md) |
| gen_data_in_buff(4)\.inst_data_in_buf | <linty-anchor href="//src/module_data_link/data_link.vhd#803">data_link.vhd#803</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_15/instantiation_5.md) |
| gen_data_in_buff(5)\.inst_data_in_buf | <linty-anchor href="//src/module_data_link/data_link.vhd#803">data_link.vhd#803</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_15/instantiation_6.md) |
| gen_data_in_buff(6)\.inst_data_in_buf | <linty-anchor href="//src/module_data_link/data_link.vhd#803">data_link.vhd#803</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_15/instantiation_7.md) |
| gen_data_in_buff(7)\.inst_data_in_buf | <linty-anchor href="//src/module_data_link/data_link.vhd#803">data_link.vhd#803</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_15/instantiation_8.md) |


## Generics

Count: 0

## Ports

Count: 16

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#35">RST_N</linty-anchor>|in|std_logic|Global reset (Active-low)|
|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#36">CLK</linty-anchor>|in|std_logic|Global Clock|
|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#38">LINK_RESET_DLRE</linty-anchor>|in|std_logic|Link Reset command|
|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#39">LINK_RESET_DIBUF</linty-anchor>|out|std_logic|Link Reset request to data_link_reset|
|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#41">M_AXIS_ARSTN_NW</linty-anchor>|in|std_logic|Active-low asynchronous reset for the AXI-Stream interface|
|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#42">M_AXIS_ACLK_NW</linty-anchor>|in|std_logic|Clock signal for the AXI-Stream interface|
|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#43">M_AXIS_TVALID_DIBUF</linty-anchor>|out|std_logic|Indicates that TDATA, TUSER, and TLAST are valid|
|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#44">M_AXIS_TDATA_DIBUF</linty-anchor>|out|std_logic_vector ( C_DATA_LENGTH - 1 downto 0 )|AXI-Stream data bus|
|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#45">M_AXIS_TLAST_DIBUF</linty-anchor>|out|std_logic|Indicates the end of a data packet|
|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#46">M_AXIS_TREADY_NW</linty-anchor>|in|std_logic|Receiver ready signal (slave is ready to accept data)|
|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#47">M_AXIS_TUSER_DIBUF</linty-anchor>|out|std_logic_vector ( C_BYTE_BY_WORD_LENGTH - 1 downto 0 )|AXI-Stream user-defined sideband signal|
|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#49">DATA_DDES</linty-anchor>|in|std_logic_vector ( C_DATA_K_WIDTH - 1 downto 0 )|Data parallel (K character + DATA) from data_desencapsulation|
|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#50">DATA_EN_DDES</linty-anchor>|in|std_logic|Data valid flag associated with DATA_DDES|
|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#52">REQ_FCT_DIBUF</linty-anchor>|out|std_logic|FCT request to data_mac|
|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#53">REQ_FCT_DONE_DMAC</linty-anchor>|in|std_logic|FCT request done flag from data_mac|
|<linty-anchor href="//src/module_data_link/data_in_buf.vhd#55">INPUT_BUF_OVF_DIBUF</linty-anchor>|out|std_logic|Input buffer oveflow flag|


<br>

[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)