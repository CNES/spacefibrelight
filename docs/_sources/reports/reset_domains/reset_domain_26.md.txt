<a href="/spacefibrelight/reports/reset_domains.html">Back to Reset Domains Report</a>

<br>

# Reset Domain Details

## Summary

| Name: Origin | Graph | Global | Local | Asynchronous | Synchronous | Active&nbsp;High | Active&nbsp;Low | Number of flip-flops<br>using this reset domain | Number of instances<br>using this reset domain |
| --- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | ---: | ---: |
|**Complex:** ****<br>&nbsp;&nbsp;-&nbsp;**gen_inst_phy_plus_lane.inst_phy_plus_lane.inst_ppl_64_bus_split_rx.LANE_ACTIVE_PLBSR**: <linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd#276"> ppl_64_bus_split_rx.vhd#276 (Flip-flop)</linty-anchor><br>&nbsp;&nbsp;-&nbsp;**inst_data_link.inst_data_link_reset.lane_reset_dlre_i**: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#92"> data_link_reset.vhd#92 (Flip-flop)</linty-anchor>|<a href="/spacefibrelight/graphs/reset_hierarchy_graph.html"><img title="Open Reset Hierarchy Graph" src="/spacefibrelight/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open Reset Hierarchy Graph"></a>|&#10007;|&#10004;|&#10007;|&#10004;|&#10004;|&#10007;|**2**/1320 (0.15%)|**1**/109|


## Instances using this reset domain

**Count: 1**

| Instance | Asynchronous | Synchronous | Active&nbsp;High | Active&nbsp;Low
| --- | :---: | :---: | :---: | :---: |
|TOP (<linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#153">spacefibre_light_top</linty-anchor>) > <linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#626">inst_data_link</linty-anchor> (<linty-anchor href="/src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="/src/module_data_link/data_link.vhd#1164">inst_data_crc_compute</linty-anchor> (<linty-anchor href="/src/module_data_link/data_crc_compute.vhd#32">data_crc_compute</linty-anchor>)|&#10007;|&#10004;|&#10004;|&#10007;|


## Flip-flops using this reset domain

**Count: 2**

### Asynchronous usage

| Count: 0 |
| --- |


### Synchronous usage

| Count: 2 |
| --- |
| <linty-anchor href="/src/module_data_link/data_crc_compute.vhd#183">data_crc_compute.vhd#183</linty-anchor> |

### Active-high usage

| Count: 2 |
| --- |
| <linty-anchor href="/src/module_data_link/data_crc_compute.vhd#183">data_crc_compute.vhd#183</linty-anchor> |

### Active-low usage

| Count: 0 |
| --- |




<br>

Note that there could be fewer source code locations than the number of flip-flops because several flip-flops can be inferred from the same piece of code.<br>
<br>



<br>

<a href="/spacefibrelight/reports/reset_domains.html">Back to Reset Domains Report</a>