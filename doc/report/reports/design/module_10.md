[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)

<br>

# Entity - data_desencapsulation

## Summary

| Name | Location | Description |
| --- | --- | --- |
|data_desencapsulation|<linty-anchor href="//src/module_data_link/data_desencapsulation.vhd#32">data_desencapsulation.vhd#32</linty-anchor>||
## Instantiations

Count: 1

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| inst_data_desencapsulation | <linty-anchor href="//src/module_data_link/data_link.vhd#824">data_link.vhd#824</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_10/instantiation_1.md) |


## Generics

Count: 1

| Name | Type | Default value | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/module_data_link/data_desencapsulation.vhd#34">G_VC_NUM</linty-anchor>|integer|8|Number of virtual channels|
## Ports

Count: 7

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/module_data_link/data_desencapsulation.vhd#37">CLK</linty-anchor>|in|std_logic|Global Clock|
|<linty-anchor href="//src/module_data_link/data_desencapsulation.vhd#39">LINK_RESET_DLRE</linty-anchor>|in|std_logic|Link Reset command|
|<linty-anchor href="//src/module_data_link/data_desencapsulation.vhd#41">DATA_DMBUF</linty-anchor>|in|std_logic_vector ( C_DATA_K_WIDTH - 1 downto 0 )|Data parallel (K character + DATA) from data_mid_buffer|
|<linty-anchor href="//src/module_data_link/data_desencapsulation.vhd#42">DATA_RD_DDES</linty-anchor>|out|std_logic|Read command|
|<linty-anchor href="//src/module_data_link/data_desencapsulation.vhd#43">DATA_VALID_DMBUF</linty-anchor>|in|std_logic|Data valid flag associated with DATA_DMBUF|
|<linty-anchor href="//src/module_data_link/data_desencapsulation.vhd#45">DATA_DDES</linty-anchor>|out|vc_data_k_array ( G_VC_NUM - 1 downto 0 )|Data parallel (K character + DATA) to each data_in_buf (1 per VC)|
|<linty-anchor href="//src/module_data_link/data_desencapsulation.vhd#46">DATA_EN_DDES</linty-anchor>|out|std_logic_vector ( G_VC_NUM - 1 downto 0 )|Data valid flag associated with DATA_DDES|


<br>

[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)