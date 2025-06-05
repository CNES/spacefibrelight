[Back to Reset Domains Report](../reset_domains.md)

<br>

# Reset Domain Details

## Summary

| Name: Origin | Graph | Global | Local | Asynchronous | Synchronous | Active&nbsp;High | Active&nbsp;Low | Number of flip-flops<br>using this reset domain | Number of instances<br>using this reset domain |
| --- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | ---: | ---: |
|**<linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#118">inst_data_link.inst_data_out_bc_buf.rst_n_fifo</linty-anchor>**<br>&nbsp;&nbsp;-&nbsp;**inst_data_link.inst_data_out_bc_buf.rst_n_fifo**: <linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#172"> data_out_bc_buf.vhd#172 (Flip-flop)</linty-anchor>|<a href="/graphs/reset_hierarchy_graph.html"><img title="Open Reset Hierarchy Graph" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open Reset Hierarchy Graph"></a>|&#10004;|&#10007;|&#10004;|&#10007;|&#10007;|&#10004;|**22**/1245 (1.77%)|**2**/103|


## Instances using this reset domain

**Count: 2**

| Instance | Asynchronous | Synchronous | Active&nbsp;High | Active&nbsp;Low
| --- | :---: | :---: | :---: | :---: |
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#1020">inst_data_out_bc_buf</linty-anchor> (<linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#32">data_out_bc_buf</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#133">ints_fifo_dc_axis_s</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#36">FIFO_DC_AXIS_S</linty-anchor>) > <linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#162">AXIS_SLAVE_inst</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/AXIS_SLAVE.vhd#19">AXIS_SLAVE</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#1020">inst_data_out_bc_buf</linty-anchor> (<linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#32">data_out_bc_buf</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#133">ints_fifo_dc_axis_s</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#36">FIFO_DC_AXIS_S</linty-anchor>) > <linty-anchor href="//src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd#183">fifo_dc_inst</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#36">FIFO_DC</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|


## Flip-flops using this reset domain

**Count: 22**

### Asynchronous usage

| Count: 22 |
| --- |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#199">fifo_dc.vhd#199</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#222">fifo_dc.vhd#222</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#240">fifo_dc.vhd#240</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#256">fifo_dc.vhd#256</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#300">fifo_dc.vhd#300</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#321">fifo_dc.vhd#321</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#344">fifo_dc.vhd#344</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#362">fifo_dc.vhd#362</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#378">fifo_dc.vhd#378</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#440">fifo_dc.vhd#440</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc_axis_to_custom/AXIS_SLAVE.vhd#56">AXIS_SLAVE.vhd#56</linty-anchor> |

### Synchronous usage

| Count: 0 |
| --- |


### Active-high usage

| Count: 0 |
| --- |


### Active-low usage

| Count: 22 |
| --- |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#199">fifo_dc.vhd#199</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#222">fifo_dc.vhd#222</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#240">fifo_dc.vhd#240</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#256">fifo_dc.vhd#256</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#300">fifo_dc.vhd#300</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#321">fifo_dc.vhd#321</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#344">fifo_dc.vhd#344</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#362">fifo_dc.vhd#362</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#378">fifo_dc.vhd#378</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#440">fifo_dc.vhd#440</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc_axis_to_custom/AXIS_SLAVE.vhd#56">AXIS_SLAVE.vhd#56</linty-anchor> |



<br>

Note that there could be fewer source code locations than the number of flip-flops because several flip-flops can be inferred from the same piece of code.<br>
<br>



<br>

[Back to Reset Domains Report](../reset_domains.md)