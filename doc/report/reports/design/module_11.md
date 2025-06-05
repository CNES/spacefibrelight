[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)

<br>

# Entity - data_desencapsulation_bc

## Summary

| Name | Location | Description |
| --- | --- | --- |
|data_desencapsulation_bc|<linty-anchor href="//src/module_data_link/data_desencapsulation_bc.vhd#32">data_desencapsulation_bc.vhd#32</linty-anchor>||
## Instantiations

Count: 1

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| inst_data_desencapsulation_bc | <linty-anchor href="//src/module_data_link/data_link.vhd#765">data_link.vhd#765</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_11/instantiation_1.md) |


## Generics

Count: 0

## Ports

Count: 7

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/module_data_link/data_desencapsulation_bc.vhd#34">CLK</linty-anchor>|in|std_logic|Global Clock|
|<linty-anchor href="//src/module_data_link/data_desencapsulation_bc.vhd#36">LINK_RESET_DLRE</linty-anchor>|in|std_logic|Link Reset command|
|<linty-anchor href="//src/module_data_link/data_desencapsulation_bc.vhd#38">DATA_DMBUFBC</linty-anchor>|in|std_logic_vector ( C_DATA_K_WIDTH - 1 downto 0 )|Data parallel (K character + DATA) from data_mid_buffer_bc|
|<linty-anchor href="//src/module_data_link/data_desencapsulation_bc.vhd#39">DATA_RD_DDESBC</linty-anchor>|out|std_logic|Read command|
|<linty-anchor href="//src/module_data_link/data_desencapsulation_bc.vhd#40">DATA_VALID_DMBUFBC</linty-anchor>|in|std_logic|Data valid flag associated with DATA_DMBUFBC|
|<linty-anchor href="//src/module_data_link/data_desencapsulation_bc.vhd#42">DATA_DDESBC</linty-anchor>|out|std_logic_vector ( C_DATA_K_WIDTH - 1 downto 0 )|Data parallel (K character + DATA) to data_in_bc_buf (BRODACST channel)|
|<linty-anchor href="//src/module_data_link/data_desencapsulation_bc.vhd#43">DATA_EN_DDESBC</linty-anchor>|out|std_logic|Data valid flag associated with DATA_DDESBC|


<br>

[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)