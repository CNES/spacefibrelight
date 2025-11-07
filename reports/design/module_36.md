<a href="/spacefibrelight/reports/design_hierarchy.html#vhdl-entities">Back to Design Hierarchy Report</a>

<br>

# Entity - ppl_64_bus_split_rx

## Summary

| Name | Location | Description |
| --- | --- | --- |
|ppl_64_bus_split_rx|<linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#33">ppl_64_bus_split_rx.vhd#33</linty-anchor>||
## Instantiations

Count: 1

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| inst_ppl_64_bus_split_rx | <linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#1181">phy_plus_lane_64b.vhd#1181</linty-anchor> |  | <a href="/spacefibrelight/reports/design/module_36/instantiation_1.html"><img title="View Instantiation Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details"></a> |


## Generics

Count: 0

## Ports

Count: 16

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#35">RST_N</linty-anchor>|in|std_logic|global reset|
|<linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#36">CLK</linty-anchor>|in|std_logic|Clock synchronous of the Data-link layer|
|<linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#38">FIFO_RX_RD_EN_DL</linty-anchor>|in|std_logic|FIFO RX read enable flag from the Data-link layer|
|<linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#39">DATA_RX_PLBSR</linty-anchor>|out|std_logic_vector ( 31 downto 0 )|32-bit Data parallel|
|<linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#40">FIFO_RX_DATA_VALID_PLBSR</linty-anchor>|out|std_logic|Flag new data|
|<linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#41">VALID_K_CHARAC_RX_PLBSR</linty-anchor>|out|std_logic_vector ( 3 downto 0 )|4-bit valid K character|
|<linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#42">FAR_END_CAPA_PLBSR</linty-anchor>|out|std_logic_vector ( 7 downto 0 )|Capability field received in INIT3 control word|
|<linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#43">LANE_ACTIVE_PLBSR</linty-anchor>|out|std_logic|Lane Active flag|
|<linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#45">FIFO_RX_RD_EN_PLBSR</linty-anchor>|out|std_logic|FIFO RX read enable flag|
|<linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#46">DATA_RX_PLFRD</linty-anchor>|in|std_logic_vector ( C_DATA_WIDTH - 1 downto 0 )|64-bit Data parallel|
|<linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#47">FIFO_RX_DATA_VALID_PLFRD</linty-anchor>|in|std_logic|Flag new data|
|<linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#48">FIFO_RX_EMPTY_PLFRD</linty-anchor>|in|std_logic|Flag FIFO Empty|
|<linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#49">VALID_K_CHARAC_RX_PLFRD</linty-anchor>|in|std_logic_vector ( C_K_CHAR_WIDTH - 1 downto 0 )|8-bit valid K character flags|
|<linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#50">DATA_RDY_RX_PLFRD</linty-anchor>|in|std_logic_vector ( 1 downto 0 )|Data valid flag|
|<linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#52">FAR_END_CAPA_PLFRC</linty-anchor>|in|std_logic_vector ( 7 downto 0 )|Capability field received in INIT3 control word|
|<linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#53">LANE_ACTIVE_PLFRC</linty-anchor>|in|std_logic|Lane Active flag|


<br>

<a href="/spacefibrelight/reports/design_hierarchy.html#vhdl-entities">Back to Design Hierarchy Report</a>