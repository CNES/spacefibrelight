[Back to Reset Domains Report](../reset_domains.md)

<br>

# Reset Domain Details

## Summary

| Name: Origin | Graph | Global | Local | Asynchronous | Synchronous | Active&nbsp;High | Active&nbsp;Low | Number of flip-flops<br>using this reset domain | Number of instances<br>using this reset domain |
| --- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | ---: | ---: |
|**Complex:** ****<br>&nbsp;&nbsp;-&nbsp;**AXIS_ARSTN_TX_DL**: <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#57"> spacefibre_light_top.vhd#57 (Port)</linty-anchor><br>&nbsp;&nbsp;-&nbsp;**RST_N**: <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#44"> spacefibre_light_top.vhd#44 (Port)</linty-anchor>|<a href="/graphs/reset_hierarchy_graph.html"><img title="Open Reset Hierarchy Graph" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open Reset Hierarchy Graph"></a>|&#10007;|&#10004;|&#10004;|&#10007;|&#10004;|&#10007;|**13**/1245 (1.04%)|**1**/103|


## Instances using this reset domain

**Count: 1**

| Instance | Asynchronous | Synchronous | Active&nbsp;High | Active&nbsp;Low
| --- | :---: | :---: | :---: | :---: |
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#1041">gen_data_out_buff(2)\.inst_data_out_buff</linty-anchor> (<linty-anchor href="//src/module_data_link/data_out_buf.vhd#33">data_out_buff</linty-anchor>)|&#10004;|&#10007;|&#10004;|&#10007;|


## Flip-flops using this reset domain

**Count: 13**

### Asynchronous usage

| Count: 13 |
| --- |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#225">data_out_buf.vhd#225</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#237">data_out_buf.vhd#237</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#266">data_out_buf.vhd#266</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#372">data_out_buf.vhd#372</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#521">data_out_buf.vhd#521</linty-anchor> |

### Synchronous usage

| Count: 0 |
| --- |


### Active-high usage

| Count: 13 |
| --- |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#225">data_out_buf.vhd#225</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#237">data_out_buf.vhd#237</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#266">data_out_buf.vhd#266</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#372">data_out_buf.vhd#372</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#521">data_out_buf.vhd#521</linty-anchor> |

### Active-low usage

| Count: 0 |
| --- |




<br>

Note that there could be fewer source code locations than the number of flip-flops because several flip-flops can be inferred from the same piece of code.<br>
<br>



<br>

[Back to Reset Domains Report](../reset_domains.md)