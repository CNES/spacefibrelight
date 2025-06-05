[Back to Clock Domains Report](../clock_domains.md)

<br>

# Clock Domain Details

## Summary

| Name: Origin | Graph | Rising | Falling | Number of flip-flops<br>using this clock domain | Number of instances<br>using this clock domain |
| --- | :---: | :---: | :---: | ---: | ---: |
|**<linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#614">inst_phy_plus_lane.clk_tx</linty-anchor>**<br>&nbsp;&nbsp;-&nbsp;**O**: <linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#954"> phy_plus_lane.vhd#954 (Blackbox port: O)</linty-anchor>|<a href="/graphs/clock_hierarchy_graph.html"><img title="Open Clock Hierarchy Graph" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open Clock Hierarchy Graph"></a>|&#10004;|&#10007;|**129**/1245 (10.36%)|**11**/103|


## Instances using this clock domain

**Count: 11**

| Instance | Rising | Falling |
| --- | :---: | :---: |
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#556">inst_reset_sync_clk_from_GTY</linty-anchor> (<linty-anchor href="//src/ip_spacefibre_light_top/reset_gen.vhd#30">reset_gen</linty-anchor>)|&#10004;|&#10007;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#802">inst_phy_plus_lane</linty-anchor> (<linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#41">phy_plus_lane</linty-anchor>) > <linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#632">inst_lane_init_fsm</linty-anchor> (<linty-anchor href="//src/module_phy_plus_lane/lane_init_fsm.vhd#32">lane_init_fsm</linty-anchor>)|&#10004;|&#10007;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#802">inst_phy_plus_lane</linty-anchor> (<linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#41">phy_plus_lane</linty-anchor>) > <linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#681">inst_fifo_in_ctrl</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#36">FIFO_DC</linty-anchor>)|&#10004;|&#10007;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#802">inst_phy_plus_lane</linty-anchor> (<linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#41">phy_plus_lane</linty-anchor>) > <linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#713">inst_fifo_tx_data</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#36">FIFO_DC</linty-anchor>)|&#10004;|&#10007;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#802">inst_phy_plus_lane</linty-anchor> (<linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#41">phy_plus_lane</linty-anchor>) > <linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#746">inst_lane_ctrl_word_insert</linty-anchor> (<linty-anchor href="//src/module_phy_plus_lane/lane_ctrl_word_insert.vhd#33">lane_ctrl_word_insert</linty-anchor>)|&#10004;|&#10007;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#802">inst_phy_plus_lane</linty-anchor> (<linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#41">phy_plus_lane</linty-anchor>) > <linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#778">inst_skip_insertion</linty-anchor> (<linty-anchor href="//src/module_phy_plus_lane/skip_insertion.vhd#33">skip_insertion</linty-anchor>)|&#10004;|&#10007;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#802">inst_phy_plus_lane</linty-anchor> (<linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#41">phy_plus_lane</linty-anchor>) > <linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#797">inst_parallel_loopback</linty-anchor> (<linty-anchor href="//src/module_phy_plus_lane/parallel_loopback.vhd#32">parallel_loopback</linty-anchor>)|&#10004;|&#10007;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#802">inst_phy_plus_lane</linty-anchor> (<linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#41">phy_plus_lane</linty-anchor>) > <linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#823">inst_rx_sync_fsm</linty-anchor> (<linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#32">rx_sync_fsm</linty-anchor>)|&#10004;|&#10007;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#802">inst_phy_plus_lane</linty-anchor> (<linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#41">phy_plus_lane</linty-anchor>) > <linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#849">inst_lane_ctrl_word_detect</linty-anchor> (<linty-anchor href="//src/module_phy_plus_lane/lane_ctrl_word_detect.vhd#33">lane_ctrl_word_detect</linty-anchor>)|&#10004;|&#10007;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#802">inst_phy_plus_lane</linty-anchor> (<linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#41">phy_plus_lane</linty-anchor>) > <linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#885">inst_fifo_rx_data</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#36">FIFO_DC</linty-anchor>)|&#10004;|&#10007;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#802">inst_phy_plus_lane</linty-anchor> (<linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#41">phy_plus_lane</linty-anchor>) > <linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#920">inst_fifo_out_ctrl</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#36">FIFO_DC</linty-anchor>)|&#10004;|&#10007;|


## Flip-flops using this clock domain

**Count: 129**

### Rising-edge usage

| Count: 129 |
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
| <linty-anchor href="//src/ip_spacefibre_light_top/reset_gen.vhd#56">reset_gen.vhd#56</linty-anchor> |
| <linty-anchor href="//src/module_phy_plus_lane/lane_ctrl_word_detect.vhd#80">lane_ctrl_word_detect.vhd#80</linty-anchor> |
| <linty-anchor href="//src/module_phy_plus_lane/lane_ctrl_word_insert.vhd#79">lane_ctrl_word_insert.vhd#79</linty-anchor> |
| <linty-anchor href="//src/module_phy_plus_lane/lane_init_fsm.vhd#183">lane_init_fsm.vhd#183</linty-anchor> |
| <linty-anchor href="//src/module_phy_plus_lane/lane_init_fsm.vhd#283">lane_init_fsm.vhd#283</linty-anchor> |
| <linty-anchor href="//src/module_phy_plus_lane/lane_init_fsm.vhd#422">lane_init_fsm.vhd#422</linty-anchor> |
| <linty-anchor href="//src/module_phy_plus_lane/lane_init_fsm.vhd#442">lane_init_fsm.vhd#442</linty-anchor> |
| <linty-anchor href="//src/module_phy_plus_lane/lane_init_fsm.vhd#482">lane_init_fsm.vhd#482</linty-anchor> |
| <linty-anchor href="//src/module_phy_plus_lane/lane_init_fsm.vhd#505">lane_init_fsm.vhd#505</linty-anchor> |
| <linty-anchor href="//src/module_phy_plus_lane/lane_init_fsm.vhd#538">lane_init_fsm.vhd#538</linty-anchor> |
| <linty-anchor href="//src/module_phy_plus_lane/lane_init_fsm.vhd#571">lane_init_fsm.vhd#571</linty-anchor> |
| <linty-anchor href="//src/module_phy_plus_lane/lane_init_fsm.vhd#611">lane_init_fsm.vhd#611</linty-anchor> |
| <linty-anchor href="//src/module_phy_plus_lane/lane_init_fsm.vhd#661">lane_init_fsm.vhd#661</linty-anchor> |
| <linty-anchor href="//src/module_phy_plus_lane/lane_init_fsm.vhd#694">lane_init_fsm.vhd#694</linty-anchor> |
| <linty-anchor href="//src/module_phy_plus_lane/lane_init_fsm.vhd#731">lane_init_fsm.vhd#731</linty-anchor> |
| <linty-anchor href="//src/module_phy_plus_lane/parallel_loopback.vhd#64">parallel_loopback.vhd#64</linty-anchor> |
| <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#135">rx_sync_fsm.vhd#135</linty-anchor> |
| <linty-anchor href="//src/module_phy_plus_lane/rx_sync_fsm.vhd#86">rx_sync_fsm.vhd#86</linty-anchor> |
| <linty-anchor href="//src/module_phy_plus_lane/skip_insertion.vhd#63">skip_insertion.vhd#63</linty-anchor> |

### Falling-edge usage

| Count: 0 |
| --- |


<br>

Note that there could be fewer source code locations than the number of flip-flops because several flip-flops can be inferred from the same piece of code.<br>
<br>



<br>

[Back to Clock Domains Report](../clock_domains.md)