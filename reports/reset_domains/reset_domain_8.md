<a href="/spacefibrelight/reports/reset_domains.html">Back to Reset Domains Report</a>

<br>

# Reset Domain Details

## Summary

| Name: Origin | Graph | Global | Local | Asynchronous | Synchronous | Active&nbsp;High | Active&nbsp;Low | Number of flip-flops<br>using this reset domain | Number of instances<br>using this reset domain |
| --- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | ---: | ---: |
|**<linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#540">gen_inst_phy_plus_lane.inst_phy_plus_lane.clk_tx</linty-anchor>**<br>&nbsp;&nbsp;-&nbsp;**hssl_clock_o**: <linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#156"> hssl_SpaceFibre_64b.vhd#156 (Blackbox port: hssl_clock_o)</linty-anchor>|<a href="/spacefibrelight/graphs/reset_hierarchy_graph.html"><img title="Open Reset Hierarchy Graph" src="/spacefibrelight/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open Reset Hierarchy Graph"></a>|&#10007;|&#10004;|&#10004;|&#10007;|&#10007;|&#10004;|**3**/1320 (0.23%)|**1**/109|


## Instances using this reset domain

**Count: 1**

| Instance | Asynchronous | Synchronous | Active&nbsp;High | Active&nbsp;Low
| --- | :---: | :---: | :---: | :---: |
|TOP (<linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#153">spacefibre_light_top</linty-anchor>) > <linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#910">gen_inst_phy_plus_lane.inst_phy_plus_lane</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#35">phy_plus_lane_64b</linty-anchor>) > <linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#862">inst_ppl_64_parallel_loopback</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_parallel_loopback.vhd#32">ppl_64_parallel_loopback</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|


## Flip-flops using this reset domain

**Count: 3**

### Asynchronous usage

| Count: 3 |
| --- |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_parallel_loopback.vhd#75">ppl_64_parallel_loopback.vhd#75</linty-anchor> |

### Synchronous usage

| Count: 0 |
| --- |


### Active-high usage

| Count: 0 |
| --- |


### Active-low usage

| Count: 3 |
| --- |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_parallel_loopback.vhd#75">ppl_64_parallel_loopback.vhd#75</linty-anchor> |



<br>

Note that there could be fewer source code locations than the number of flip-flops because several flip-flops can be inferred from the same piece of code.<br>
<br>



<br>

<a href="/spacefibrelight/reports/reset_domains.html">Back to Reset Domains Report</a>