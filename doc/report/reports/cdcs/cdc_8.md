[Back to CDC Report](../clock_domain_crossings.md)

<br>

# CDC #8

## Origin Flip-flop

|Graph|Signal|Clock Domain|Flip-flop|
|:---:|---|---|---|
|<a href="/graphs/cdcs/cdc_8_graph.html"><img title="Open CDC Graph" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open CDC Graph"></a>|Signal: `inst_data_link.inst_data_out_bc_buf.cmd_flush`<br>Usage:<br>- <linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#185">data_out_bc_buf.vhd#185</linty-anchor><br>- <linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#186">data_out_bc_buf.vhd#186</linty-anchor><br>- <linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#188">data_out_bc_buf.vhd#188</linty-anchor><br>- <linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#189">data_out_bc_buf.vhd#189</linty-anchor><br>- <linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#190">data_out_bc_buf.vhd#190</linty-anchor><br>- <linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#192">data_out_bc_buf.vhd#192</linty-anchor><br>- <linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#193">data_out_bc_buf.vhd#193</linty-anchor><br>- <linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#194">data_out_bc_buf.vhd#194</linty-anchor><br>- <linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#195">data_out_bc_buf.vhd#195</linty-anchor><br>- <linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#197">data_out_bc_buf.vhd#197</linty-anchor><br>- <linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#198">data_out_bc_buf.vhd#198</linty-anchor>|<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#45">CLK (rising)</linty-anchor>|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#1020">inst_data_out_bc_buf</linty-anchor> (<linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#32">data_out_bc_buf</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#184">data_out_bc_buf.vhd#184</linty-anchor>|


## Target Flip-flop

|Graph|Signal|Clock Domain|Flip-flop|
|:---:|---|---|---|
|<a href="/graphs/cdcs/cdc_8_graph.html"><img title="Open CDC Graph" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open CDC Graph"></a>|Signal: `inst_data_link.inst_data_out_bc_buf.ints_fifo_dc_axis_s.fifo_dc_inst.flush_ack_wr`<br>Usage:<br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#445">fifo_dc.vhd#445</linty-anchor><br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#462">fifo_dc.vhd#462</linty-anchor><br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#471">fifo_dc.vhd#471</linty-anchor><br>- <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#473">fifo_dc.vhd#473</linty-anchor>|<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#58">AXIS_ACLK_TX_DL (rising)</linty-anchor>|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#1020">inst_data_out_bc_buf</linty-anchor> (<linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#32">data_out_bc_buf</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#133">ints_fifo_dc_axis_s</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#36">FIFO_DC_AXIS_S</linty-anchor>) > <linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#183">fifo_dc_inst</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#36">FIFO_DC</linty-anchor>) > <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#440">fifo_dc.vhd#440</linty-anchor>|


<br>

[Back to CDC Report](../clock_domain_crossings.md)