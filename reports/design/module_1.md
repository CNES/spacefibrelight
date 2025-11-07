<a href="/spacefibrelight/reports/design_hierarchy.html#vhdl-entities">Back to Design Hierarchy Report</a>

<br>

# Entity - AXIS_MASTER

## Summary

| Name | Location | Description |
| --- | --- | --- |
|AXIS_MASTER|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#19">AXIS_MASTER.vhd#19</linty-anchor>||
## Instantiations

Count: 9

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| AXIS_MASTER_inst | <linty-anchor href="/src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#154">FIFO_DC_AXIS_M.vhd#154</linty-anchor> |  | <a href="/spacefibrelight/reports/design/module_1/instantiation_1.html"><img title="View Instantiation Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details"></a> |
| AXIS_MASTER_inst | <linty-anchor href="/src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#154">FIFO_DC_AXIS_M.vhd#154</linty-anchor> |  | <a href="/spacefibrelight/reports/design/module_1/instantiation_2.html"><img title="View Instantiation Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details"></a> |
| AXIS_MASTER_inst | <linty-anchor href="/src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#154">FIFO_DC_AXIS_M.vhd#154</linty-anchor> |  | <a href="/spacefibrelight/reports/design/module_1/instantiation_3.html"><img title="View Instantiation Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details"></a> |
| AXIS_MASTER_inst | <linty-anchor href="/src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#154">FIFO_DC_AXIS_M.vhd#154</linty-anchor> |  | <a href="/spacefibrelight/reports/design/module_1/instantiation_4.html"><img title="View Instantiation Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details"></a> |
| AXIS_MASTER_inst | <linty-anchor href="/src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#154">FIFO_DC_AXIS_M.vhd#154</linty-anchor> |  | <a href="/spacefibrelight/reports/design/module_1/instantiation_5.html"><img title="View Instantiation Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details"></a> |
| AXIS_MASTER_inst | <linty-anchor href="/src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#154">FIFO_DC_AXIS_M.vhd#154</linty-anchor> |  | <a href="/spacefibrelight/reports/design/module_1/instantiation_6.html"><img title="View Instantiation Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details"></a> |
| AXIS_MASTER_inst | <linty-anchor href="/src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#154">FIFO_DC_AXIS_M.vhd#154</linty-anchor> |  | <a href="/spacefibrelight/reports/design/module_1/instantiation_7.html"><img title="View Instantiation Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details"></a> |
| AXIS_MASTER_inst | <linty-anchor href="/src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#154">FIFO_DC_AXIS_M.vhd#154</linty-anchor> |  | <a href="/spacefibrelight/reports/design/module_1/instantiation_8.html"><img title="View Instantiation Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details"></a> |
| AXIS_MASTER_inst | <linty-anchor href="/src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#154">FIFO_DC_AXIS_M.vhd#154</linty-anchor> |  | <a href="/spacefibrelight/reports/design/module_1/instantiation_9.html"><img title="View Instantiation Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details"></a> |


## Generics

Count: 3

| Name | Type | Default value | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#22">G_DWIDTH</linty-anchor>|integer|36|Total data width|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#26">M_AXIS_TDATA_WIDTH</linty-anchor>|integer|32|TData Width|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#27">M_AXIS_TUSER_WIDTH</linty-anchor>|integer|4|TUser Width|
## Ports

Count: 10

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#31">rd_data</linty-anchor>|in|std_logic_vector ( G_DWIDTH - 1 downto 0 )|Data read bus|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#32">rd_data_vld</linty-anchor>|in|std_logic|Read command|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#33">rd_data_en</linty-anchor>|out|std_logic|Data valid|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#37">m00_axis_aclk</linty-anchor>|in|std_logic|Clock input for the AXI Stream Master interface|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#38">m00_axis_aresetn</linty-anchor>|in|std_logic|Active-low reset input for the AXI Stream Master interface|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#39">m00_axis_tvalid</linty-anchor>|out|std_logic|Indicates that the data on m00_axis_tdata is valid|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#40">m00_axis_tdata</linty-anchor>|out|std_logic_vector ( M_AXIS_TDATA_WIDTH - 1 downto 0 )|Data output bus for the AXI Stream Master interface|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#41">m00_axis_tlast</linty-anchor>|out|std_logic|Indicates the last transfer in a packet|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#42">m00_axis_tready</linty-anchor>|in|std_logic|Indicates that the receiver is ready to accept data|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#43">m00_axis_tuser</linty-anchor>|out|std_logic_vector ( M_AXIS_TUSER_WIDTH - 1 downto 0 )|User-defined data output bus for the AXI Stream Master interface|


<br>

<a href="/spacefibrelight/reports/design_hierarchy.html#vhdl-entities">Back to Design Hierarchy Report</a>