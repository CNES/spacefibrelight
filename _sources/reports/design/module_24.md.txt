[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)

<br>

# Entity - demux_rx

## Summary

| Name | Location | Description |
| --- | --- | --- |
|demux_rx|<linty-anchor href="//src/ip_spacefibre_light_top/demux_rx.vhd#32">demux_rx.vhd#32</linty-anchor>||
## Instantiations

Count: 1

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| inst_demux_rx | <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#778">spacefibre_light_top.vhd#778</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_24/instantiation_1.md) |


## Generics

Count: 0

## Ports

Count: 6

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/ip_spacefibre_light_top/demux_rx.vhd#34">RST_N</linty-anchor>|in|std_logic|Global reset|
|<linty-anchor href="//src/ip_spacefibre_light_top/demux_rx.vhd#35">CLK</linty-anchor>|in|std_logic|Global Clock|
|<linty-anchor href="//src/ip_spacefibre_light_top/demux_rx.vhd#37">ENABLE_SPY</linty-anchor>|in|std_logic|Enable Spy read command|
|<linty-anchor href="//src/ip_spacefibre_light_top/demux_rx.vhd#39">FIFO_RX_RD_EN_DL</linty-anchor>|in|std_logic|Flag to read data in FIFO RX from Data-Link|
|<linty-anchor href="//src/ip_spacefibre_light_top/demux_rx.vhd#41">FIFO_RX_RD_EN_SPY</linty-anchor>|in|std_logic|Flag to read data in FIFO RX from Spy|
|<linty-anchor href="//src/ip_spacefibre_light_top/demux_rx.vhd#43">FIFO_RX_RD_EN_DEMUX</linty-anchor>|out|std_logic|Flag to read data in FIFO RX to PPL|


<br>

[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)