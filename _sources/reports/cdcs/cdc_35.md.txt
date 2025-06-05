[Back to CDC Report](../clock_domain_crossings.md)

<br>

# CDC #35

## Origin Flip-flop

|Graph|Signal|Clock Domain|Flip-flop|
|:---:|---|---|---|
|<a href="/graphs/cdcs/cdc_35_graph.html"><img title="Open CDC Graph" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open CDC Graph"></a>|Signal: `inst_phy_plus_lane.inst_fifo_out_ctrl.flush_ack_rd`<br>Usage:<br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#446">fifo_dc.vhd#446</linty-anchor><br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#467">fifo_dc.vhd#467</linty-anchor><br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#471">fifo_dc.vhd#471</linty-anchor><br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#472">fifo_dc.vhd#472</linty-anchor>|<linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#614">inst_phy_plus_lane.clk_tx (rising)</linty-anchor>|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#802">inst_phy_plus_lane</linty-anchor> (<linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#41">phy_plus_lane</linty-anchor>) > <linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#920">inst_fifo_out_ctrl</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#36">FIFO_DC</linty-anchor>) > <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#440">fifo_dc.vhd#440</linty-anchor>|


## Target Flip-flop

|Graph|Signal|Clock Domain|Flip-flop|
|:---:|---|---|---|
|<a href="/graphs/cdcs/cdc_35_graph.html"><img title="Open CDC Graph" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open CDC Graph"></a>|Signal: `inst_phy_plus_lane.inst_fifo_out_ctrl.empty`<br>Usage:<br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#379">fifo_dc.vhd#379</linty-anchor><br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#384">fifo_dc.vhd#384</linty-anchor><br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#386">fifo_dc.vhd#386</linty-anchor>|<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#45">CLK (rising)</linty-anchor>|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#802">inst_phy_plus_lane</linty-anchor> (<linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#41">phy_plus_lane</linty-anchor>) > <linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#920">inst_fifo_out_ctrl</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#36">FIFO_DC</linty-anchor>) > <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#378">fifo_dc.vhd#378</linty-anchor>|


<br>

[Back to CDC Report](../clock_domain_crossings.md)