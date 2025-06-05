[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)

<br>

# Entity - FIFO_DC_AXIS_S

## Summary

| Name | Location | Description |
| --- | --- | --- |
|FIFO_DC_AXIS_S|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#36">FIFO_DC_AXIS_S.vhd#36</linty-anchor>||
## Instantiations

Count: 9

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| ints_fifo_dc_axis_s | <linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#133">data_out_bc_buf.vhd#133</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_5/instantiation_1.md) |
| ints_fifo_dc_axis_s | <linty-anchor href="//src/module_data_link/data_out_buf.vhd#186">data_out_buf.vhd#186</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_5/instantiation_2.md) |
| ints_fifo_dc_axis_s | <linty-anchor href="//src/module_data_link/data_out_buf.vhd#186">data_out_buf.vhd#186</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_5/instantiation_3.md) |
| ints_fifo_dc_axis_s | <linty-anchor href="//src/module_data_link/data_out_buf.vhd#186">data_out_buf.vhd#186</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_5/instantiation_4.md) |
| ints_fifo_dc_axis_s | <linty-anchor href="//src/module_data_link/data_out_buf.vhd#186">data_out_buf.vhd#186</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_5/instantiation_5.md) |
| ints_fifo_dc_axis_s | <linty-anchor href="//src/module_data_link/data_out_buf.vhd#186">data_out_buf.vhd#186</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_5/instantiation_6.md) |
| ints_fifo_dc_axis_s | <linty-anchor href="//src/module_data_link/data_out_buf.vhd#186">data_out_buf.vhd#186</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_5/instantiation_7.md) |
| ints_fifo_dc_axis_s | <linty-anchor href="//src/module_data_link/data_out_buf.vhd#186">data_out_buf.vhd#186</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_5/instantiation_8.md) |
| ints_fifo_dc_axis_s | <linty-anchor href="//src/module_data_link/data_out_buf.vhd#186">data_out_buf.vhd#186</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_5/instantiation_9.md) |


## Generics

Count: 6

| Name | Type | Default value | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#39">G_DWIDTH</linty-anchor>|integer|36|Data bus FIFO length|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#40">G_AWIDTH</linty-anchor>|integer|10|Address bus FIFO length|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#41">G_THRESHOLD_HIGH</linty-anchor>|integer|2**10|High threshold|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#42">G_THRESHOLD_LOW</linty-anchor>|integer|0|Low threshold|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#44">S_AXIS_TDATA_WIDTH</linty-anchor>|integer|32|Data AXIS length|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#45">S_AXIS_TUSER_WIDTH</linty-anchor>|integer|4|User AXIS length|
## Ports

Count: 19

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#49">aresetn</linty-anchor>|in|std_logic|Active-low reset|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#51">RD_CLK</linty-anchor>|in|std_logic|Clock|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#52">RD_DATA</linty-anchor>|out|std_logic_vector ( G_DWIDTH - 1 downto 0 )|Data read bus|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#53">RD_DATA_EN</linty-anchor>|in|std_logic|Read command|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#54">RD_DATA_VLD</linty-anchor>|out|std_logic|Data valid|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#56">CMD_FLUSH</linty-anchor>|in|std_logic|FIFO flush command|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#57">STATUS_BUSY_FLUSH</linty-anchor>|out|std_logic|FIFO is flushing|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#58">STATUS_THRESHOLD_HIGH</linty-anchor>|out|std_logic|High threshold reached flag (on WR_CLK)|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#59">STATUS_THRESHOLD_LOW</linty-anchor>|out|std_logic|Low threshold reached flag (on RD_CLK)|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#60">STATUS_FULL</linty-anchor>|out|std_logic|Full FIFO flag (on WR_CLK)|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#61">STATUS_EMPTY</linty-anchor>|out|std_logic|Empty FIFO flag (on RD_CLK)|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#62">STATUS_LEVEL_WR</linty-anchor>|out|std_logic_vector ( G_AWIDTH - 1 downto 0 )|FIFO fill level (on WR_CLK)|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#63">STATUS_LEVEL_RD</linty-anchor>|out|std_logic_vector ( G_AWIDTH - 1 downto 0 )|FIFO fill level (on RD_CLK)|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#67">S_AXIS_ACLK</linty-anchor>|in|std_logic|AXI4Stream Clock|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#68">S_AXIS_TREADY</linty-anchor>|out|std_logic|Ready to accept data|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#69">S_AXIS_TDATA</linty-anchor>|in|std_logic_vector ( S_AXIS_TDATA_WIDTH - 1 downto 0 )|Data input bus|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#70">S_AXIS_TUSER</linty-anchor>|in|std_logic_vector ( S_AXIS_TUSER_WIDTH - 1 downto 0 )|User-defined data input bus|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#71">S_AXIS_TLAST</linty-anchor>|in|std_logic|Indicates boundary of last packet|
|<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#72">S_AXIS_TVALID</linty-anchor>|in|std_logic|Data is valid|


<br>

[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)