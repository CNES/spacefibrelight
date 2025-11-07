<a href="/spacefibrelight/reports/design_hierarchy.html#vhdl-entities">Back to Design Hierarchy Report</a>

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
| inst_demux_rx | <linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#837">spacefibre_light_top.vhd#837</linty-anchor> |  | <a href="/spacefibrelight/reports/design/module_25/instantiation_1.html"><img title="View Instantiation Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details"></a> |


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

<a href="/spacefibrelight/reports/design_hierarchy.html#vhdl-entities">Back to Design Hierarchy Report</a>