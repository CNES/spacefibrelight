<a href="/spacefibrelight/reports/clock_domains.html">Back to Clock Domains Report</a>

<br>

# Clock Domain Details

## Summary

| Name: Origin | Graph | Rising | Falling | Number of flip-flops<br>using this clock domain | Number of instances<br>using this clock domain |
| --- | :---: | :---: | :---: | ---: | ---: |
|**<linty-anchor href="/src/ip_spacefibre_light_top/reset_gen.vhd#46">inst_reset_sync_clk_from_GTY.reset_gen_rr_n</linty-anchor>**<br>&nbsp;&nbsp;-&nbsp;**inst_reset_sync_clk_from_GTY.reset_gen_rr_n**: <linty-anchor href="//src/ip_spacefibre_light_top/reset_gen.vhd#56"> reset_gen.vhd#56 (Flip-flop)</linty-anchor>|<a href="/spacefibrelight/graphs/clock_hierarchy_graph.html"><img title="Open Clock Hierarchy Graph" src="/spacefibrelight/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open Clock Hierarchy Graph"></a>|&#10004;|&#10007;|**3**/1320 (0.23%)|**1**/109|


## Instances using this clock domain

**Count: 1**

| Instance | Rising | Falling |
| --- | :---: | :---: |
|TOP (<linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#153">spacefibre_light_top</linty-anchor>) > <linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#910">gen_inst_phy_plus_lane.inst_phy_plus_lane</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#35">phy_plus_lane_64b</linty-anchor>) > <linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#862">inst_ppl_64_parallel_loopback</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_parallel_loopback.vhd#32">ppl_64_parallel_loopback</linty-anchor>)|&#10004;|&#10007;|


## Flip-flops using this clock domain

**Count: 3**

### Rising-edge usage

| Count: 3 |
| --- |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_parallel_loopback.vhd#75">ppl_64_parallel_loopback.vhd#75</linty-anchor> |

### Falling-edge usage

| Count: 0 |
| --- |


<br>

Note that there could be fewer source code locations than the number of flip-flops because several flip-flops can be inferred from the same piece of code.<br>
<br>



<br>

<a href="/spacefibrelight/reports/clock_domains.html">Back to Clock Domains Report</a>