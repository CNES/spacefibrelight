[Back to CDC Report](../clock_domain_crossings.md)

<br>

# CDC #56

## Origin Flip-flop

|Graph|Signal|Clock Domain|Flip-flop|
|:---:|---|---|---|
|<a href="/graphs/cdcs/cdc_56_graph.html"><img title="Open CDC Graph" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open CDC Graph"></a>|Signal: `inst_phy_plus_lane.inst_fifo_rx_data.cmd_flush_req`<br>Usage:<br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#441">fifo_dc.vhd#441</linty-anchor><br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#456">fifo_dc.vhd#456</linty-anchor><br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#474">fifo_dc.vhd#474</linty-anchor>|<linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#614">inst_phy_plus_lane.clk_tx (rising)</linty-anchor>|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#802">inst_phy_plus_lane</linty-anchor> (<linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#41">phy_plus_lane</linty-anchor>) > <linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#885">inst_fifo_rx_data</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#36">FIFO_DC</linty-anchor>) > <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#440">fifo_dc.vhd#440</linty-anchor>|


## Target Flip-flop

|Graph|Signal|Clock Domain|Flip-flop|
|:---:|---|---|---|
|<a href="/graphs/cdcs/cdc_56_graph.html"><img title="Open CDC Graph" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open CDC Graph"></a>|Signal: `inst_phy_plus_lane.inst_fifo_rx_data.empty`<br>Usage:<br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#379">fifo_dc.vhd#379</linty-anchor><br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#384">fifo_dc.vhd#384</linty-anchor><br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#386">fifo_dc.vhd#386</linty-anchor>|<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#45">CLK (rising)</linty-anchor>|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#802">inst_phy_plus_lane</linty-anchor> (<linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#41">phy_plus_lane</linty-anchor>) > <linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#885">inst_fifo_rx_data</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#36">FIFO_DC</linty-anchor>) > <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#378">fifo_dc.vhd#378</linty-anchor>|


<br>

[Back to CDC Report](../clock_domain_crossings.md)