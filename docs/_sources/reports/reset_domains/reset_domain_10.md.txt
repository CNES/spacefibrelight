<a href="/spacefibrelight/reports/reset_domains.html">Back to Reset Domains Report</a>

<br>

# Reset Domain Details

## Summary

| Name: Origin | Graph | Global | Local | Asynchronous | Synchronous | Active&nbsp;High | Active&nbsp;Low | Number of flip-flops<br>using this reset domain | Number of instances<br>using this reset domain |
| --- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | ---: | ---: |
|**<linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#618">gen_inst_phy_plus_lane.inst_phy_plus_lane.rst_lane_reset_dl_i</linty-anchor>**<br>&nbsp;&nbsp;-&nbsp;**gen_inst_phy_plus_lane.inst_phy_plus_lane.inst_lane_init_fsm.LANE_STATE_PLIF**: <linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#295"> ppl_64_lane_init_fsm.vhd#295 (Flip-flop)</linty-anchor>|<a href="/spacefibrelight/graphs/reset_hierarchy_graph.html"><img title="Open Reset Hierarchy Graph" src="/spacefibrelight/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open Reset Hierarchy Graph"></a>|&#10007;|&#10004;|&#10004;|&#10007;|&#10004;|&#10007;|**1**/1320 (0.08%)|**1**/109|


## Instances using this reset domain

**Count: 1**

| Instance | Asynchronous | Synchronous | Active&nbsp;High | Active&nbsp;Low
| --- | :---: | :---: | :---: | :---: |
|TOP (<linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#153">spacefibre_light_top</linty-anchor>) > <linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#910">gen_inst_phy_plus_lane.inst_phy_plus_lane</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#35">phy_plus_lane_64b</linty-anchor>)|&#10004;|&#10007;|&#10004;|&#10007;|


## Flip-flops using this reset domain

**Count: 1**

### Asynchronous usage

| Count: 1 |
| --- |
| <linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#722">phy_plus_lane_64b.vhd#722</linty-anchor> |

### Synchronous usage

| Count: 0 |
| --- |


### Active-high usage

| Count: 1 |
| --- |
| <linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#722">phy_plus_lane_64b.vhd#722</linty-anchor> |

### Active-low usage

| Count: 0 |
| --- |




<br>

Note that there could be fewer source code locations than the number of flip-flops because several flip-flops can be inferred from the same piece of code.<br>
<br>



<br>

<a href="/spacefibrelight/reports/reset_domains.html">Back to Reset Domains Report</a>