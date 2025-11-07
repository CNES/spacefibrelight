<a href="/spacefibrelight/reports/clock_domain_crossings.html">Back to Clock Domain Crossings (CDC) Report</a>

<br>

# gen_inst_phy_plus_lane.inst_phy_plus_lane.clk_tx (rising) => inst_reset_sync_clk_from_GTY.reset_gen_rr_n (rising)

|Origin Clock Domain|Target Clock Domain|Number of CDCs|Graph|
|---|---|---:|:---:|
|<linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#540">gen_inst_phy_plus_lane.inst_phy_plus_lane.clk_tx (rising)</linty-anchor>|<linty-anchor href="/src/ip_spacefibre_light_top/reset_gen.vhd#46">inst_reset_sync_clk_from_GTY.reset_gen_rr_n (rising)</linty-anchor>|1|<a href="/spacefibrelight/graphs/cdcs/cdcs_gen_inst_phy_plus_lane.inst_phy_plus_lane.clk_tx (rising);inst_reset_sync_clk_from_GTY.reset_gen_rr_n (rising)_graph.html"><img title="Open CDCs Graph" src="/spacefibrelight/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open CDCs Graph"></a>|


## CDCs



### Summary

|ID|Graph|Origin Signal|Target Signal|Details|
|---:|:---:|---|---|:---:|
|174|<a href="/spacefibrelight/graphs/cdcs/cdc_174_graph.html"><img title="Open CDC Graph" src="/spacefibrelight/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open CDC Graph"></a>|`gen_inst_phy_plus_lane.inst_phy_plus_lane.inst_ppl_64_skip_insertion.WAIT_SEND_DATA_PLSI`|`gen_inst_phy_plus_lane.inst_phy_plus_lane.inst_ppl_64_parallel_loopback.wait_send_data_r`|<a href="#cdc-174"><img title="View CDC Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View CDC Details"></a>|
### CDC #174

#### Origin Flip-flop

|Graph|Signal|Clock Domain|Flip-flop|
|:---:|---|---|---|
|<a href="/spacefibrelight/graphs/cdcs/cdc_174_graph.html"><img title="Open CDC Graph" src="/spacefibrelight/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open CDC Graph"></a>|Signal: `gen_inst_phy_plus_lane.inst_phy_plus_lane.inst_ppl_64_skip_insertion.WAIT_SEND_DATA_PLSI`<br>Usage:<br>- <linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#152">ppl_64_skip_insertion.vhd#152</linty-anchor><br>- <linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#94">ppl_64_skip_insertion.vhd#94</linty-anchor><br>- <linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#96">ppl_64_skip_insertion.vhd#96</linty-anchor>|<linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#540">gen_inst_phy_plus_lane.inst_phy_plus_lane.clk_tx (rising)</linty-anchor>|TOP (<linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#153">spacefibre_light_top</linty-anchor>) > <linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#910">gen_inst_phy_plus_lane.inst_phy_plus_lane</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#35">phy_plus_lane_64b</linty-anchor>) > <linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#843">inst_ppl_64_skip_insertion</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#30">ppl_64_skip_insertion</linty-anchor>) > <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#83">ppl_64_skip_insertion.vhd#83</linty-anchor>|


#### Target Flip-flop

|Graph|Signal|Clock Domain|Flip-flop|
|:---:|---|---|---|
|<a href="/spacefibrelight/graphs/cdcs/cdc_174_graph.html"><img title="Open CDC Graph" src="/spacefibrelight/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open CDC Graph"></a>|Signal: `gen_inst_phy_plus_lane.inst_phy_plus_lane.inst_ppl_64_parallel_loopback.wait_send_data_r`<br>Usage:<br>- <linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_parallel_loopback.vhd#76">ppl_64_parallel_loopback.vhd#76</linty-anchor><br>- <linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_parallel_loopback.vhd#77">ppl_64_parallel_loopback.vhd#77</linty-anchor><br>- <linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_parallel_loopback.vhd#78">ppl_64_parallel_loopback.vhd#78</linty-anchor><br>- <linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_parallel_loopback.vhd#80">ppl_64_parallel_loopback.vhd#80</linty-anchor><br>- <linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_parallel_loopback.vhd#81">ppl_64_parallel_loopback.vhd#81</linty-anchor><br>- <linty-anchor href="//src/module_phy_plus_lane_64b/ppl_64_parallel_loopback.vhd#82">ppl_64_parallel_loopback.vhd#82</linty-anchor>|<linty-anchor href="/src/ip_spacefibre_light_top/reset_gen.vhd#46">inst_reset_sync_clk_from_GTY.reset_gen_rr_n (rising)</linty-anchor>|TOP (<linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#153">spacefibre_light_top</linty-anchor>) > <linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#910">gen_inst_phy_plus_lane.inst_phy_plus_lane</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#35">phy_plus_lane_64b</linty-anchor>) > <linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#862">inst_ppl_64_parallel_loopback</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_parallel_loopback.vhd#32">ppl_64_parallel_loopback</linty-anchor>) > <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_parallel_loopback.vhd#75">ppl_64_parallel_loopback.vhd#75</linty-anchor>|


<br>

<a href="/spacefibrelight/reports/clock_domain_crossings.html">Back to Clock Domain Crossings (CDC) Report</a>