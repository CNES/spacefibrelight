<a href="/spacefibrelight/reports/reset_domains.html">Back to Reset Domains Report</a>

<br>

# Reset Domain Details

## Summary

| Name: Origin | Graph | Global | Local | Asynchronous | Synchronous | Active&nbsp;High | Active&nbsp;Low | Number of flip-flops<br>using this reset domain | Number of instances<br>using this reset domain |
| --- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | ---: | ---: |
|**Complex:** ****<br>&nbsp;&nbsp;-&nbsp;**LANE_RESET**: <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#139"> spacefibre_light_top.vhd#139 (Port)</linty-anchor><br>&nbsp;&nbsp;-&nbsp;**RST_N**: <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#50"> spacefibre_light_top.vhd#50 (Port)</linty-anchor><br>&nbsp;&nbsp;-&nbsp;**gen_inst_phy_plus_lane.inst_phy_plus_lane.lane_reset_dl_i**: <linty-anchor href="//src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#722"> phy_plus_lane_64b.vhd#722 (Flip-flop)</linty-anchor>|<a href="/spacefibrelight/graphs/reset_hierarchy_graph.html"><img title="Open Reset Hierarchy Graph" src="/spacefibrelight/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open Reset Hierarchy Graph"></a>|&#10007;|&#10004;|&#10004;|&#10007;|&#10004;|&#10007;|**3**/1320 (0.23%)|**1**/109|


## Instances using this reset domain

**Count: 1**

| Instance | Asynchronous | Synchronous | Active&nbsp;High | Active&nbsp;Low
| --- | :---: | :---: | :---: | :---: |
|TOP (<linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#153">spacefibre_light_top</linty-anchor>) > <linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#615">inst_reset_sync_clk_from_GTY</linty-anchor> (<linty-anchor href="/src/ip_spacefibre_light_top/reset_gen.vhd#30">reset_gen</linty-anchor>)|&#10004;|&#10007;|&#10004;|&#10007;|


## Flip-flops using this reset domain

**Count: 3**

### Asynchronous usage

| Count: 3 |
| --- |
| <linty-anchor href="/src/ip_spacefibre_light_top/reset_gen.vhd#56">reset_gen.vhd#56</linty-anchor> |

### Synchronous usage

| Count: 0 |
| --- |


### Active-high usage

| Count: 3 |
| --- |
| <linty-anchor href="/src/ip_spacefibre_light_top/reset_gen.vhd#56">reset_gen.vhd#56</linty-anchor> |

### Active-low usage

| Count: 0 |
| --- |




<br>

Note that there could be fewer source code locations than the number of flip-flops because several flip-flops can be inferred from the same piece of code.<br>
<br>



<br>

<a href="/spacefibrelight/reports/reset_domains.html">Back to Reset Domains Report</a>