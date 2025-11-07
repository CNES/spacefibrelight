<a href="/spacefibrelight/reports/reset_domains.html">Back to Reset Domains Report</a>

<br>

# Reset Domain Details

## Summary

| Name: Origin | Graph | Global | Local | Asynchronous | Synchronous | Active&nbsp;High | Active&nbsp;Low | Number of flip-flops<br>using this reset domain | Number of instances<br>using this reset domain |
| --- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | ---: | ---: |
|**<linty-anchor href="/src/ip_spacefibre_light_top/reset_gen.vhd#46">inst_reset_sync_clk_from_GTY.reset_gen_rr_n</linty-anchor>**<br>&nbsp;&nbsp;-&nbsp;**inst_reset_sync_clk_from_GTY.reset_gen_rr_n**: <linty-anchor href="//src/ip_spacefibre_light_top/reset_gen.vhd#56"> reset_gen.vhd#56 (Flip-flop)</linty-anchor>|<a href="/spacefibrelight/graphs/reset_hierarchy_graph.html"><img title="Open Reset Hierarchy Graph" src="/spacefibrelight/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open Reset Hierarchy Graph"></a>|&#10004;|&#10007;|&#10004;|&#10007;|&#10007;|&#10004;|**167**/1320 (12.65%)|**9**/109|


## Instances using this reset domain

**Count: 9**

| Instance | Asynchronous | Synchronous | Active&nbsp;High | Active&nbsp;Low
| --- | :---: | :---: | :---: | :---: |
|TOP (<linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#153">spacefibre_light_top</linty-anchor>) > <linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#910">gen_inst_phy_plus_lane.inst_phy_plus_lane</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#35">phy_plus_lane_64b</linty-anchor>) > <linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#1020">inst_ppl_64_rx_sync_fsm</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#30">ppl_64_rx_sync_fsm</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#153">spacefibre_light_top</linty-anchor>) > <linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#910">gen_inst_phy_plus_lane.inst_phy_plus_lane</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#35">phy_plus_lane_64b</linty-anchor>) > <linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#1046">inst_lane_ctrl_word_detect</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_ctrl_word_detect.vhd#32">ppl_64_lane_ctrl_word_detect</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#153">spacefibre_light_top</linty-anchor>) > <linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#910">gen_inst_phy_plus_lane.inst_phy_plus_lane</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#35">phy_plus_lane_64b</linty-anchor>) > <linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#1080">inst_ppl_64_rx_wr_en_fifo</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_wr_en_fifo.vhd#32">ppl_64_rx_wr_en_fifo</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#153">spacefibre_light_top</linty-anchor>) > <linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#910">gen_inst_phy_plus_lane.inst_phy_plus_lane</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#35">phy_plus_lane_64b</linty-anchor>) > <linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#646">inst_lane_init_fsm</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#32">ppl_64_lane_init_fsm</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#153">spacefibre_light_top</linty-anchor>) > <linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#910">gen_inst_phy_plus_lane.inst_phy_plus_lane</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#35">phy_plus_lane_64b</linty-anchor>) > <linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#741">inst_fifo_in_ctrl</linty-anchor> (<linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#36">FIFO_DC</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#153">spacefibre_light_top</linty-anchor>) > <linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#910">gen_inst_phy_plus_lane.inst_phy_plus_lane</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#35">phy_plus_lane_64b</linty-anchor>) > <linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#775">inst_fifo_tx_data</linty-anchor> (<linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#36">FIFO_DC</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#153">spacefibre_light_top</linty-anchor>) > <linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#910">gen_inst_phy_plus_lane.inst_phy_plus_lane</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#35">phy_plus_lane_64b</linty-anchor>) > <linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#808">inst_ppl_64_lane_ctrl_word_insert</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_ctrl_word_insert.vhd#32">ppl_64_lane_ctrl_word_insert</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#153">spacefibre_light_top</linty-anchor>) > <linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#910">gen_inst_phy_plus_lane.inst_phy_plus_lane</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#35">phy_plus_lane_64b</linty-anchor>) > <linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#843">inst_ppl_64_skip_insertion</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#30">ppl_64_skip_insertion</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#153">spacefibre_light_top</linty-anchor>) > <linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#910">gen_inst_phy_plus_lane.inst_phy_plus_lane</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#35">phy_plus_lane_64b</linty-anchor>) > <linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#994">inst_ppl_64_word_alignment</linty-anchor> (<linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#33">ppl_64_word_alignment</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|


## Flip-flops using this reset domain

**Count: 167**

### Asynchronous usage

| Count: 167 |
| --- |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#199">fifo_dc.vhd#199</linty-anchor> |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#222">fifo_dc.vhd#222</linty-anchor> |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#240">fifo_dc.vhd#240</linty-anchor> |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#256">fifo_dc.vhd#256</linty-anchor> |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#300">fifo_dc.vhd#300</linty-anchor> |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#321">fifo_dc.vhd#321</linty-anchor> |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#344">fifo_dc.vhd#344</linty-anchor> |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#362">fifo_dc.vhd#362</linty-anchor> |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#378">fifo_dc.vhd#378</linty-anchor> |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#440">fifo_dc.vhd#440</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_ctrl_word_detect.vhd#132">ppl_64_lane_ctrl_word_detect.vhd#132</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_ctrl_word_detect.vhd#231">ppl_64_lane_ctrl_word_detect.vhd#231</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_ctrl_word_detect.vhd#330">ppl_64_lane_ctrl_word_detect.vhd#330</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_ctrl_word_detect.vhd#347">ppl_64_lane_ctrl_word_detect.vhd#347</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_ctrl_word_detect.vhd#361">ppl_64_lane_ctrl_word_detect.vhd#361</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_ctrl_word_insert.vhd#238">ppl_64_lane_ctrl_word_insert.vhd#238</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_ctrl_word_insert.vhd#86">ppl_64_lane_ctrl_word_insert.vhd#86</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#1046">ppl_64_lane_init_fsm.vhd#1046</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#190">ppl_64_lane_init_fsm.vhd#190</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#295">ppl_64_lane_init_fsm.vhd#295</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#436">ppl_64_lane_init_fsm.vhd#436</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#455">ppl_64_lane_init_fsm.vhd#455</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#511">ppl_64_lane_init_fsm.vhd#511</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#534">ppl_64_lane_init_fsm.vhd#534</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#581">ppl_64_lane_init_fsm.vhd#581</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#628">ppl_64_lane_init_fsm.vhd#628</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#696">ppl_64_lane_init_fsm.vhd#696</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#731">ppl_64_lane_init_fsm.vhd#731</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#803">ppl_64_lane_init_fsm.vhd#803</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#883">ppl_64_lane_init_fsm.vhd#883</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#970">ppl_64_lane_init_fsm.vhd#970</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#127">ppl_64_rx_sync_fsm.vhd#127</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#229">ppl_64_rx_sync_fsm.vhd#229</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#92">ppl_64_rx_sync_fsm.vhd#92</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_wr_en_fifo.vhd#63">ppl_64_rx_wr_en_fifo.vhd#63</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#83">ppl_64_skip_insertion.vhd#83</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#401">ppl_64_word_alignment.vhd#401</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#86">ppl_64_word_alignment.vhd#86</linty-anchor> |

### Synchronous usage

| Count: 0 |
| --- |


### Active-high usage

| Count: 0 |
| --- |


### Active-low usage

| Count: 167 |
| --- |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#199">fifo_dc.vhd#199</linty-anchor> |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#222">fifo_dc.vhd#222</linty-anchor> |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#240">fifo_dc.vhd#240</linty-anchor> |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#256">fifo_dc.vhd#256</linty-anchor> |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#300">fifo_dc.vhd#300</linty-anchor> |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#321">fifo_dc.vhd#321</linty-anchor> |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#344">fifo_dc.vhd#344</linty-anchor> |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#362">fifo_dc.vhd#362</linty-anchor> |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#378">fifo_dc.vhd#378</linty-anchor> |
| <linty-anchor href="/src/ip/fifo_dc/fifo_dc.vhd#440">fifo_dc.vhd#440</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_ctrl_word_detect.vhd#132">ppl_64_lane_ctrl_word_detect.vhd#132</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_ctrl_word_detect.vhd#231">ppl_64_lane_ctrl_word_detect.vhd#231</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_ctrl_word_detect.vhd#330">ppl_64_lane_ctrl_word_detect.vhd#330</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_ctrl_word_detect.vhd#347">ppl_64_lane_ctrl_word_detect.vhd#347</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_ctrl_word_detect.vhd#361">ppl_64_lane_ctrl_word_detect.vhd#361</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_ctrl_word_insert.vhd#238">ppl_64_lane_ctrl_word_insert.vhd#238</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_ctrl_word_insert.vhd#86">ppl_64_lane_ctrl_word_insert.vhd#86</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#1046">ppl_64_lane_init_fsm.vhd#1046</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#190">ppl_64_lane_init_fsm.vhd#190</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#295">ppl_64_lane_init_fsm.vhd#295</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#436">ppl_64_lane_init_fsm.vhd#436</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#455">ppl_64_lane_init_fsm.vhd#455</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#511">ppl_64_lane_init_fsm.vhd#511</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#534">ppl_64_lane_init_fsm.vhd#534</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#581">ppl_64_lane_init_fsm.vhd#581</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#628">ppl_64_lane_init_fsm.vhd#628</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#696">ppl_64_lane_init_fsm.vhd#696</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#731">ppl_64_lane_init_fsm.vhd#731</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#803">ppl_64_lane_init_fsm.vhd#803</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#883">ppl_64_lane_init_fsm.vhd#883</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd#970">ppl_64_lane_init_fsm.vhd#970</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#127">ppl_64_rx_sync_fsm.vhd#127</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#229">ppl_64_rx_sync_fsm.vhd#229</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd#92">ppl_64_rx_sync_fsm.vhd#92</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_rx_wr_en_fifo.vhd#63">ppl_64_rx_wr_en_fifo.vhd#63</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd#83">ppl_64_skip_insertion.vhd#83</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#401">ppl_64_word_alignment.vhd#401</linty-anchor> |
| <linty-anchor href="/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd#86">ppl_64_word_alignment.vhd#86</linty-anchor> |



<br>

Note that there could be fewer source code locations than the number of flip-flops because several flip-flops can be inferred from the same piece of code.<br>
<br>



<br>

<a href="/spacefibrelight/reports/reset_domains.html">Back to Reset Domains Report</a>