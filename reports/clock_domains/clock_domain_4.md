<a href="/spacefibrelight/reports/clock_domains.html">Back to Clock Domains Report</a>

<br>

# Clock Domain Details

## Summary

| Name: Origin | Graph | Rising | Falling | Number of flip-flops<br>using this clock domain | Number of instances<br>using this clock domain |
| --- | :---: | :---: | :---: | ---: | ---: |
|**<linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#65">AXIS_ACLK_TX_DL</linty-anchor>**<br>&nbsp;&nbsp;-&nbsp;**AXIS_ACLK_TX_DL**: <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#65"> spacefibre_light_top.vhd#65 (Port)</linty-anchor>|<a href="/spacefibrelight/graphs/clock_hierarchy_graph.html"><img title="Open Clock Hierarchy Graph" src="/spacefibrelight/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open Clock Hierarchy Graph"></a>|&#10004;|&#10007;|**14**/1320 (1.06%)|**2**/109|


## Instances using this clock domain

**Count: 2**

| Instance | Rising | Falling |
| --- | :---: | :---: |
|TOP (<linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#153">spacefibre_light_top</linty-anchor>) > <linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#626">inst_data_link</linty-anchor> (<linty-anchor href="/src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="/src/module_data_link/data_link.vhd#1026">inst_data_out_bc_buf</linty-anchor> (<linty-anchor href="/src/module_data_link/data_out_bc_buf.vhd#32">data_out_bc_buf</linty-anchor>) > <linty-anchor href="/src/module_data_link/data_out_bc_buf.vhd#133">ints_fifo_dc_axis_s</linty-anchor> (<linty-anchor href="/src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#36">FIFO_DC_AXIS_S</linty-anchor>) > <linty-anchor href="/src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#162">AXIS_SLAVE_inst</linty-anchor> (<linty-anchor href="/src/ip/fifo_dc_axis_to_custom/AXIS_SLAVE.vhd#19">AXIS_SLAVE</linty-anchor>)|&#10004;|&#10007;|
|TOP (<linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#153">spacefibre_light_top</linty-anchor>) > <linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#626">inst_data_link</linty-anchor> (<linty-anchor href="/src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="/src/module_data_link/data_link.vhd#1026">inst_data_out_bc_buf</linty-anchor> (<linty-anchor href="/src/module_data_link/data_out_bc_buf.vhd#32">data_out_bc_buf</linty-anchor>) > <linty-anchor href="/src/module_data_link/data_out_bc_buf.vhd#133">ints_fifo_dc_axis_s</linty-anchor> (<linty-anchor href="/src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#36">FIFO_DC_AXIS_S</linty-anchor>) > <linty-anchor href="/src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#183">fifo_dc_inst</linty-anchor> (<linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#36">FIFO_DC</linty-anchor>)|&#10004;|&#10007;|


## Flip-flops using this clock domain

**Count: 14**

### Rising-edge usage

| Count: 14 |
| --- |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#199">fifo_dc.vhd#199</linty-anchor> |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#222">fifo_dc.vhd#222</linty-anchor> |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#240">fifo_dc.vhd#240</linty-anchor> |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#256">fifo_dc.vhd#256</linty-anchor> |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#440">fifo_dc.vhd#440</linty-anchor> |
| <linty-anchor href="/src/ip/fifo_dc_axis_to_custom/AXIS_SLAVE.vhd#56">AXIS_SLAVE.vhd#56</linty-anchor> |

### Falling-edge usage

| Count: 0 |
| --- |


<br>

Note that there could be fewer source code locations than the number of flip-flops because several flip-flops can be inferred from the same piece of code.<br>
<br>



<br>

<a href="/spacefibrelight/reports/clock_domains.html">Back to Clock Domains Report</a>