<a href="/spacefibrelight/reports/design_hierarchy.html#vhdl-entities">Back to Design Hierarchy Report</a>

<br>

# Entity - AXIS_SLAVE

## Summary

| Name | Location | Description |
| --- | --- | --- |
|AXIS_SLAVE|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/AXIS_SLAVE.vhd#19">AXIS_SLAVE.vhd#19</linty-anchor>||
## Instantiations

Count: 9

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| AXIS_SLAVE_inst | <linty-anchor href="/src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#162">FIFO_DC_AXIS_S.vhd#162</linty-anchor> |  | <a href="/spacefibrelight/reports/design/module_2/instantiation_1.html"><img title="View Instantiation Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details"></a> |
| AXIS_SLAVE_inst | <linty-anchor href="/src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#162">FIFO_DC_AXIS_S.vhd#162</linty-anchor> |  | <a href="/spacefibrelight/reports/design/module_2/instantiation_2.html"><img title="View Instantiation Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details"></a> |
| AXIS_SLAVE_inst | <linty-anchor href="/src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#162">FIFO_DC_AXIS_S.vhd#162</linty-anchor> |  | <a href="/spacefibrelight/reports/design/module_2/instantiation_3.html"><img title="View Instantiation Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details"></a> |
| AXIS_SLAVE_inst | <linty-anchor href="/src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#162">FIFO_DC_AXIS_S.vhd#162</linty-anchor> |  | <a href="/spacefibrelight/reports/design/module_2/instantiation_4.html"><img title="View Instantiation Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details"></a> |
| AXIS_SLAVE_inst | <linty-anchor href="/src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#162">FIFO_DC_AXIS_S.vhd#162</linty-anchor> |  | <a href="/spacefibrelight/reports/design/module_2/instantiation_5.html"><img title="View Instantiation Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details"></a> |
| AXIS_SLAVE_inst | <linty-anchor href="/src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#162">FIFO_DC_AXIS_S.vhd#162</linty-anchor> |  | <a href="/spacefibrelight/reports/design/module_2/instantiation_6.html"><img title="View Instantiation Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details"></a> |
| AXIS_SLAVE_inst | <linty-anchor href="/src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#162">FIFO_DC_AXIS_S.vhd#162</linty-anchor> |  | <a href="/spacefibrelight/reports/design/module_2/instantiation_7.html"><img title="View Instantiation Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details"></a> |
| AXIS_SLAVE_inst | <linty-anchor href="/src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#162">FIFO_DC_AXIS_S.vhd#162</linty-anchor> |  | <a href="/spacefibrelight/reports/design/module_2/instantiation_8.html"><img title="View Instantiation Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details"></a> |
| AXIS_SLAVE_inst | <linty-anchor href="/src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#162">FIFO_DC_AXIS_S.vhd#162</linty-anchor> |  | <a href="/spacefibrelight/reports/design/module_2/instantiation_9.html"><img title="View Instantiation Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details"></a> |


## Generics

Count: 3

| Name | Type | Default value | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/AXIS_SLAVE.vhd#22">G_DWIDTH</linty-anchor>|integer|36|Total data width|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/AXIS_SLAVE.vhd#25">S_AXIS_TDATA_WIDTH</linty-anchor>|integer|32|TData Width|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/AXIS_SLAVE.vhd#26">S_AXIS_TUSER_WIDTH</linty-anchor>|integer|4|TUser Width|
## Ports

Count: 11

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/AXIS_SLAVE.vhd#30">wr_data</linty-anchor>|out|std_logic_vector ( G_DWIDTH - 1 downto 0 )|Data write bus|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/AXIS_SLAVE.vhd#31">wr_enable</linty-anchor>|out|std_logic|Write enable|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/AXIS_SLAVE.vhd#32">status_full</linty-anchor>|in|std_logic|Status indicating FIFO is full|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/AXIS_SLAVE.vhd#33">status_busy_flush</linty-anchor>|in|std_logic|Status indicating FIFO is busy flushing|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/AXIS_SLAVE.vhd#36">s00_axis_aclk</linty-anchor>|in|std_logic|AXI4Stream sink: Clock|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/AXIS_SLAVE.vhd#37">s00_axis_aresetn</linty-anchor>|in|std_logic|AXI4Stream sink: Reset|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/AXIS_SLAVE.vhd#38">s00_axis_tready</linty-anchor>|out|std_logic|Ready to accept data in|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/AXIS_SLAVE.vhd#39">s00_axis_tdata</linty-anchor>|in|std_logic_vector ( S_AXIS_TDATA_WIDTH - 1 downto 0 )|Data input bus|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/AXIS_SLAVE.vhd#40">s00_axis_tuser</linty-anchor>|in|std_logic_vector ( S_AXIS_TUSER_WIDTH - 1 downto 0 )|User-defined data input bus|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/AXIS_SLAVE.vhd#41">s00_axis_tlast</linty-anchor>|in|std_logic|Indicates boundary of last packet|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/AXIS_SLAVE.vhd#42">s00_axis_tvalid</linty-anchor>|in|std_logic|Data is valid|


<br>

<a href="/spacefibrelight/reports/design_hierarchy.html#vhdl-entities">Back to Design Hierarchy Report</a>