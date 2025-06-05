[Back to CDC Report](../clock_domain_crossings.md)

<br>

# CDC #69

## Origin Flip-flop

|Graph|Signal|Clock Domain|Flip-flop|
|:---:|---|---|---|
|<a href="/graphs/cdcs/cdc_69_graph.html"><img title="Open CDC Graph" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open CDC Graph"></a>|Signal: `inst_data_link.inst_data_in_bc_buf.ints_fifo_dc_axis_m.fifo_dc_inst.cmd_flush_req`<br>Usage:<br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#441">fifo_dc.vhd#441</linty-anchor><br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#456">fifo_dc.vhd#456</linty-anchor><br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#474">fifo_dc.vhd#474</linty-anchor>|<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#45">CLK (rising)</linty-anchor>|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#750">inst_data_in_bc_buf</linty-anchor> (<linty-anchor href="//src/module_data_link/data_in_bc_buf.vhd#32">data_in_bc_buf</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_in_bc_buf.vhd#121">ints_fifo_dc_axis_m</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#36">FIFO_DC_AXIS_M</linty-anchor>) > <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#174">fifo_dc_inst</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#36">FIFO_DC</linty-anchor>) > <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#440">fifo_dc.vhd#440</linty-anchor>|


## Target Flip-flop

|Graph|Signal|Clock Domain|Flip-flop|
|:---:|---|---|---|
|<a href="/graphs/cdcs/cdc_69_graph.html"><img title="Open CDC Graph" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open CDC Graph"></a>|Signal: `inst_data_link.inst_data_in_bc_buf.ints_fifo_dc_axis_m.fifo_dc_inst.empty`<br>Usage:<br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#379">fifo_dc.vhd#379</linty-anchor><br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#384">fifo_dc.vhd#384</linty-anchor><br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#386">fifo_dc.vhd#386</linty-anchor>|<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#65">AXIS_ACLK_RX_DL (rising)</linty-anchor>|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#750">inst_data_in_bc_buf</linty-anchor> (<linty-anchor href="//src/module_data_link/data_in_bc_buf.vhd#32">data_in_bc_buf</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_in_bc_buf.vhd#121">ints_fifo_dc_axis_m</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#36">FIFO_DC_AXIS_M</linty-anchor>) > <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#174">fifo_dc_inst</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#36">FIFO_DC</linty-anchor>) > <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#378">fifo_dc.vhd#378</linty-anchor>|


<br>

[Back to CDC Report](../clock_domain_crossings.md)