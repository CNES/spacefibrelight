[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)

<br>

# Entity - FIFO_DC_DROP_BAD_FRAME

## Summary

| Name | Location | Description |
| --- | --- | --- |
|FIFO_DC_DROP_BAD_FRAME|<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#36">fifo_dc_drop_bad_frame.vhd#36</linty-anchor>||
## Instantiations

Count: 2

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| inst_mid_buf_bc | <linty-anchor href="//src/module_data_link/data_link.vhd#776">data_link.vhd#776</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_6/instantiation_1.md) |
| inst_mid_buf | <linty-anchor href="//src/module_data_link/data_link.vhd#837">data_link.vhd#837</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_6/instantiation_2.md) |


## Generics

Count: 4

| Name | Type | Default value | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#38">G_DWIDTH</linty-anchor>|integer|8|Data bus fifo length|
|<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#39">G_AWIDTH</linty-anchor>|integer|8|Address bus fifo length|
|<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#40">G_THRESHOLD_HIGH</linty-anchor>|integer|2**8|high threshold|
|<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#41">G_THRESHOLD_LOW</linty-anchor>|integer|0|low threshold|
## Ports

Count: 18

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#44">RST_N</linty-anchor>|in|std_logic||
|<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#46">WR_CLK</linty-anchor>|in|std_logic|Clock|
|<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#47">WR_DATA</linty-anchor>|in|std_logic_vector ( G_DWIDTH - 1 downto 0 )|Data write bus|
|<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#48">WR_DATA_EN</linty-anchor>|in|std_logic|Write command|
|<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#50">FRAME_ERROR</linty-anchor>|in|std_logic|Valid received data|
|<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#51">END_FRAME</linty-anchor>|in|std_logic|End of frame|
|<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#54">RD_CLK</linty-anchor>|in|std_logic|Clock|
|<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#55">RD_DATA</linty-anchor>|out|std_logic_vector ( G_DWIDTH - 1 downto 0 )|Data read bus|
|<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#56">RD_DATA_EN</linty-anchor>|in|std_logic|Read command|
|<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#57">RD_DATA_VLD</linty-anchor>|out|std_logic|Data valid|
|<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#59">CMD_FLUSH</linty-anchor>|in|std_logic|fifo flush|
|<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#60">STATUS_BUSY_FLUSH</linty-anchor>|out|std_logic|fifo is flushing|
|<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#62">STATUS_THRESHOLD_HIGH</linty-anchor>|out|std_logic|threshold high reached flag (on WR_CLK)|
|<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#63">STATUS_THRESHOLD_LOW</linty-anchor>|out|std_logic|threshold low reached flag (on RD_CLK)|
|<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#64">STATUS_FULL</linty-anchor>|out|std_logic|full fifo flag (on WR_CLK)|
|<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#65">STATUS_EMPTY</linty-anchor>|out|std_logic|empty fifo flag (on RD_CLK)|
|<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#66">STATUS_LEVEL_WR</linty-anchor>|out|std_logic_vector ( G_AWIDTH - 1 downto 0 )|FIFO fill level (on WR_CLK)|
|<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#67">STATUS_LEVEL_RD</linty-anchor>|out|std_logic_vector ( G_AWIDTH - 1 downto 0 )|FIFO fill level (on RD_CLK)|


<br>

[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)