[Back to CDC Report](../clock_domain_crossings.md)

<br>

# CDC #83

## Origin Flip-flop

|Graph|Signal|Clock Domain|Flip-flop|
|:---:|---|---|---|
|<a href="/graphs/cdcs/cdc_83_graph.html"><img title="Open CDC Graph" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open CDC Graph"></a>|Signal: `inst_data_link.gen_data_in_buff(7)\.inst_data_in_buf.last_k_char`<br>Usage:<br>- <linty-anchor href="//src/module_data_link/data_in_buf.vhd#277">data_in_buf.vhd#277</linty-anchor><br>- <linty-anchor href="//src/module_data_link/data_in_buf.vhd#283">data_in_buf.vhd#283</linty-anchor><br>- <linty-anchor href="//src/module_data_link/data_in_buf.vhd#285">data_in_buf.vhd#285</linty-anchor>|<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#65">AXIS_ACLK_RX_DL (rising)</linty-anchor>|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#803">gen_data_in_buff(7)\.inst_data_in_buf</linty-anchor> (<linty-anchor href="//src/module_data_link/data_in_buf.vhd#33">data_in_buf</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_in_buf.vhd#276">data_in_buf.vhd#276</linty-anchor>|


## Target Flip-flop

|Graph|Signal|Clock Domain|Flip-flop|
|:---:|---|---|---|
|<a href="/graphs/cdcs/cdc_83_graph.html"><img title="Open CDC Graph" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open CDC Graph"></a>|Signal: `inst_data_link.gen_data_in_buff(7)\.inst_data_in_buf.last_k_char_reg1`<br>Usage:<br>- <linty-anchor href="//src/module_data_link/data_in_buf.vhd#232">data_in_buf.vhd#232</linty-anchor><br>- <linty-anchor href="//src/module_data_link/data_in_buf.vhd#233">data_in_buf.vhd#233</linty-anchor>|<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#45">CLK (rising)</linty-anchor>|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#803">gen_data_in_buff(7)\.inst_data_in_buf</linty-anchor> (<linty-anchor href="//src/module_data_link/data_in_buf.vhd#33">data_in_buf</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_in_buf.vhd#225">data_in_buf.vhd#225</linty-anchor>|


<br>

[Back to CDC Report](../clock_domain_crossings.md)