[Back to Clock Domains Report](../clock_domains.md)

<br>

# Clock Domain Details

## Summary

| Name: Origin | Graph | Rising | Falling | Number of flip-flops<br>using this clock domain | Number of instances<br>using this clock domain |
| --- | :---: | :---: | :---: | ---: | ---: |
|**<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#65">AXIS_ACLK_RX_DL</linty-anchor>**<br>&nbsp;&nbsp;-&nbsp;**AXIS_ACLK_RX_DL**: <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#65"> spacefibre_light_top.vhd#65 (Port)</linty-anchor>|<a href="/graphs/clock_hierarchy_graph.html"><img title="Open Clock Hierarchy Graph" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open Clock Hierarchy Graph"></a>|&#10004;|&#10007;|**20**/1245 (1.61%)|**3**/103|


## Instances using this clock domain

**Count: 3**

| Instance | Rising | Falling |
| --- | :---: | :---: |
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#803">gen_data_in_buff(1)\.inst_data_in_buf</linty-anchor> (<linty-anchor href="//src/module_data_link/data_in_buf.vhd#33">data_in_buf</linty-anchor>)|&#10004;|&#10007;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#803">gen_data_in_buff(1)\.inst_data_in_buf</linty-anchor> (<linty-anchor href="//src/module_data_link/data_in_buf.vhd#33">data_in_buf</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_in_buf.vhd#157">ints_fifo_dc_axis_m</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#36">FIFO_DC_AXIS_M</linty-anchor>) > <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#154">AXIS_MASTER_inst</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#19">AXIS_MASTER</linty-anchor>)|&#10004;|&#10007;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#803">gen_data_in_buff(1)\.inst_data_in_buf</linty-anchor> (<linty-anchor href="//src/module_data_link/data_in_buf.vhd#33">data_in_buf</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_in_buf.vhd#157">ints_fifo_dc_axis_m</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#36">FIFO_DC_AXIS_M</linty-anchor>) > <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd#174">fifo_dc_inst</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#36">FIFO_DC</linty-anchor>)|&#10004;|&#10007;|


## Flip-flops using this clock domain

**Count: 20**

### Rising-edge usage

| Count: 20 |
| --- |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#300">fifo_dc.vhd#300</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#321">fifo_dc.vhd#321</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#344">fifo_dc.vhd#344</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#362">fifo_dc.vhd#362</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#378">fifo_dc.vhd#378</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#84">AXIS_MASTER.vhd#84</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd#98">AXIS_MASTER.vhd#98</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_in_buf.vhd#194">data_in_buf.vhd#194</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_in_buf.vhd#276">data_in_buf.vhd#276</linty-anchor> |

### Falling-edge usage

| Count: 0 |
| --- |


<br>

Note that there could be fewer source code locations than the number of flip-flops because several flip-flops can be inferred from the same piece of code.<br>
<br>



<br>

[Back to Clock Domains Report](../clock_domains.md)