[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)

<br>

# Entity - FIFO_DC_AXIS_M

## Summary

| Name | Location | Description |
| --- | --- | --- |
|FIFO_DC_AXIS_M|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#36">FIFO_DC_AXIS_M.vhd#36</linty-anchor>||
## Instantiations

Count: 9

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| ints_fifo_dc_axis_m | <linty-anchor href="//src/module_data_link/data_in_bc_buf.vhd#121">data_in_bc_buf.vhd#121</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_4/instantiation_1.md) |
| ints_fifo_dc_axis_m | <linty-anchor href="//src/module_data_link/data_in_buf.vhd#157">data_in_buf.vhd#157</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_4/instantiation_2.md) |
| ints_fifo_dc_axis_m | <linty-anchor href="//src/module_data_link/data_in_buf.vhd#157">data_in_buf.vhd#157</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_4/instantiation_3.md) |
| ints_fifo_dc_axis_m | <linty-anchor href="//src/module_data_link/data_in_buf.vhd#157">data_in_buf.vhd#157</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_4/instantiation_4.md) |
| ints_fifo_dc_axis_m | <linty-anchor href="//src/module_data_link/data_in_buf.vhd#157">data_in_buf.vhd#157</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_4/instantiation_5.md) |
| ints_fifo_dc_axis_m | <linty-anchor href="//src/module_data_link/data_in_buf.vhd#157">data_in_buf.vhd#157</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_4/instantiation_6.md) |
| ints_fifo_dc_axis_m | <linty-anchor href="//src/module_data_link/data_in_buf.vhd#157">data_in_buf.vhd#157</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_4/instantiation_7.md) |
| ints_fifo_dc_axis_m | <linty-anchor href="//src/module_data_link/data_in_buf.vhd#157">data_in_buf.vhd#157</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_4/instantiation_8.md) |
| ints_fifo_dc_axis_m | <linty-anchor href="//src/module_data_link/data_in_buf.vhd#157">data_in_buf.vhd#157</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_4/instantiation_9.md) |


## Generics

Count: 6

| Name | Type | Default value | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#39">G_DWIDTH</linty-anchor>|integer|36|Data bus FIFO length|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#40">G_AWIDTH</linty-anchor>|integer|10|Address bus FIFO length|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#41">G_THRESHOLD_HIGH</linty-anchor>|integer|2**10|High threshold|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#42">G_THRESHOLD_LOW</linty-anchor>|integer|0|Low threshold|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#44">M_AXIS_TDATA_WIDTH</linty-anchor>|integer|32|Data AXIS length|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#45">M_AXIS_TUSER_WIDTH</linty-anchor>|integer|4|User AXIS length|
## Ports

Count: 18

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#49">aresetn</linty-anchor>|in|std_logic|Active-low reset|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#51">WR_CLK</linty-anchor>|in|std_logic|Clock|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#52">WR_DATA</linty-anchor>|in|std_logic_vector ( G_DWIDTH - 1 downto 0 )|Data write bus|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#53">WR_DATA_EN</linty-anchor>|in|std_logic|Write command|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#55">CMD_FLUSH</linty-anchor>|in|std_logic|FIFO flush command|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#56">STATUS_BUSY_FLUSH</linty-anchor>|out|std_logic|FIFO is flushing|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#57">STATUS_THRESHOLD_HIGH</linty-anchor>|out|std_logic|High threshold reached flag (on WR_CLK)|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#58">STATUS_THRESHOLD_LOW</linty-anchor>|out|std_logic|Low threshold reached flag (on RD_CLK)|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#59">STATUS_FULL</linty-anchor>|out|std_logic|Full FIFO flag (on WR_CLK)|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#60">STATUS_EMPTY</linty-anchor>|out|std_logic|Empty FIFO flag (on RD_CLK)|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#61">STATUS_LEVEL_WR</linty-anchor>|out|std_logic_vector ( G_AWIDTH - 1 downto 0 )|FIFO fill level (on WR_CLK)|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#62">STATUS_LEVEL_RD</linty-anchor>|out|std_logic_vector ( G_AWIDTH - 1 downto 0 )|FIFO fill level (on RD_CLK)|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#66">M_AXIS_ACLK</linty-anchor>|in|std_logic|Clock input for the AXI Stream Master interface|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#67">M_AXIS_TVALID</linty-anchor>|out|std_logic|Indicates that the data on M_AXIS_TDATA is valid|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#68">M_AXIS_TDATA</linty-anchor>|out|std_logic_vector ( M_AXIS_TDATA_WIDTH - 1 downto 0 )|Data output bus for the AXI Stream Master interface|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#69">M_AXIS_TLAST</linty-anchor>|out|std_logic|Indicates the last transfer in a packet|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#70">M_AXIS_TREADY</linty-anchor>|in|std_logic|Indicates that the receiver is ready to accept data|
|<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#71">M_AXIS_TUSER</linty-anchor>|out|std_logic_vector ( M_AXIS_TUSER_WIDTH - 1 downto 0 )|User-defined data output bus for the AXI Stream Master interface|


<br>

[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)