<a href="/spacefibrelight/reports/design_hierarchy.html#vhdl-entities">Back to Design Hierarchy Report</a>

<br>

# Entity - reset_gen

## Summary

| Name | Location | Description |
| --- | --- | --- |
|reset_gen|<linty-anchor href="//src/ip_spacefibre_light_top/reset_gen.vhd#30">reset_gen.vhd#30</linty-anchor>||
## Instantiations

Count: 1

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| inst_reset_sync_clk_from_GTY | <linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#615">spacefibre_light_top.vhd#615</linty-anchor> |  | <a href="/spacefibrelight/reports/design/module_46/instantiation_1.html"><img title="View Instantiation Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details"></a> |


## Generics

Count: 0

## Ports

Count: 5

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/ip_spacefibre_light_top/reset_gen.vhd#32">RST_N</linty-anchor>|in|std_logic|global reset|
|<linty-anchor href="//src/ip_spacefibre_light_top/reset_gen.vhd#33">CLK</linty-anchor>|in|std_logic|General clock|
|<linty-anchor href="//src/ip_spacefibre_light_top/reset_gen.vhd#34">RST_TX_DONE</linty-anchor>|in|std_logic|Reset tx of IP GTY done flag|
|<linty-anchor href="//src/ip_spacefibre_light_top/reset_gen.vhd#35">LANE_RESET</linty-anchor>|in|std_logic|LANE RESET command|
|<linty-anchor href="//src/ip_spacefibre_light_top/reset_gen.vhd#36">INTERNAL_SYNC_RST_N</linty-anchor>|out|std_logic|Internal reset resynchronized on 150MHz internal clock|


<br>

<a href="/spacefibrelight/reports/design_hierarchy.html#vhdl-entities">Back to Design Hierarchy Report</a>