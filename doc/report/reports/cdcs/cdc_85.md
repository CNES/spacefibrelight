[Back to CDC Report](../clock_domain_crossings.md)

<br>

# CDC #85

## Origin Flip-flop

|Graph|Signal|Clock Domain|Flip-flop|
|:---:|---|---|---|
|<a href="/graphs/cdcs/cdc_85_graph.html"><img title="Open CDC Graph" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open CDC Graph"></a>|Signal: `inst_mux_tx.LANE_RESET_MUX`<br>Usage:<br>- <linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#82">mux_tx.vhd#82</linty-anchor><br>- <linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#90">mux_tx.vhd#90</linty-anchor><br>- <linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#97">mux_tx.vhd#97</linty-anchor>|<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#45">CLK (rising)</linty-anchor>|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#750">inst_mux_tx</linty-anchor> (<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#32">mux_tx</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#75">mux_tx.vhd#75</linty-anchor>|


## Target Flip-flop

|Graph|Signal|Clock Domain|Flip-flop|
|:---:|---|---|---|
|<a href="/graphs/cdcs/cdc_85_graph.html"><img title="Open CDC Graph" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open CDC Graph"></a>|Signal: `inst_phy_plus_lane.inst_fifo_rx_data.flush_ack_rd`<br>Usage:<br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#446">fifo_dc.vhd#446</linty-anchor><br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#467">fifo_dc.vhd#467</linty-anchor><br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#471">fifo_dc.vhd#471</linty-anchor><br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#472">fifo_dc.vhd#472</linty-anchor>|<linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#614">inst_phy_plus_lane.clk_tx (rising)</linty-anchor>|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#802">inst_phy_plus_lane</linty-anchor> (<linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#41">phy_plus_lane</linty-anchor>) > <linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#885">inst_fifo_rx_data</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#36">FIFO_DC</linty-anchor>) > <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#440">fifo_dc.vhd#440</linty-anchor>|


<br>

[Back to CDC Report](../clock_domain_crossings.md)