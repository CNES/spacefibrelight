[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)

<br>

# Entity - data_link_reset

## Summary

| Name | Location | Description |
| --- | --- | --- |
|data_link_reset|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#32">data_link_reset.vhd#32</linty-anchor>||
## Instantiations

Count: 1

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| inst_data_link_reset | <linty-anchor href="//src/module_data_link/data_link.vhd#1002">data_link.vhd#1002</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_17/instantiation_1.md) |


## Generics

Count: 1

| Name | Type | Default value | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#34">G_VC_NUM</linty-anchor>|integer|8|Number of virtual channels|
## Ports

Count: 12

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#37">RST_N</linty-anchor>|in|std_logic|Global reset (Active-low)|
|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#38">CLK</linty-anchor>|in|std_logic|Global clock|
|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#40">LINK_RESET_DLRE</linty-anchor>|out|std_logic|Link Reset command|
|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#42">LINK_RESET_DIBUF</linty-anchor>|in|std_logic_vector ( G_VC_NUM - 1 downto 0 )|Link Reset request from data_in_buf|
|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#44">LINK_RESET_DERRM</linty-anchor>|in|std_logic|Link Reset request from data_err_management|
|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#46">LANE_RESET_DLRE</linty-anchor>|out|std_logic|Lane Reset command|
|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#47">NEAR_END_CAPA_DLRE</linty-anchor>|out|std_logic_vector ( 7 downto 0 )|Near-end capability|
|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#48">LANE_ACTIVE_PPL</linty-anchor>|in|std_logic|Lane active flag|
|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#49">FAR_END_CAPA_PPL</linty-anchor>|in|std_logic_vector ( 7 downto 0 )|Far-end capability|
|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#51">RESET_PARAM_DLRE</linty-anchor>|out|std_logic|Reset all MIB parameters command|
|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#52">INTERFACE_RESET_MIB</linty-anchor>|in|std_logic|Interface Reset request|
|<linty-anchor href="//src/module_data_link/data_link_reset.vhd#53">LINK_RESET_MIB</linty-anchor>|in|std_logic|Link Reset request|


<br>

[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)