[Back to Reset Domains Report](../reset_domains.md)

<br>

# Reset Domain Details

## Summary

| Name: Origin | Graph | Global | Local | Asynchronous | Synchronous | Active&nbsp;High | Active&nbsp;Low | Number of flip-flops<br>using this reset domain | Number of instances<br>using this reset domain |
| --- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | ---: | ---: |
|**<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#44">RST_N</linty-anchor>**<br>&nbsp;&nbsp;-&nbsp;**RST_N**: <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#44"> spacefibre_light_top.vhd#44 (Port)</linty-anchor>|<a href="/graphs/reset_hierarchy_graph.html"><img title="Open Reset Hierarchy Graph" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open Reset Hierarchy Graph"></a>|&#10004;|&#10007;|&#10004;|&#10007;|&#10007;|&#10004;|**309**/1245 (24.82%)|**26**/103|


## Instances using this reset domain

**Count: 26**

| Instance | Asynchronous | Synchronous | Active&nbsp;High | Active&nbsp;Low
| --- | :---: | :---: | :---: | :---: |
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#556">inst_reset_sync_clk_from_GTY</linty-anchor> (<linty-anchor href="//src/ip_spacefibre_light_top/reset_gen.vhd#30">reset_gen</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#1002">inst_data_link_reset</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link_reset.vhd#32">data_link_reset</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#1020">inst_data_out_bc_buf</linty-anchor> (<linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#32">data_out_bc_buf</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#1041">gen_data_out_buff(0)\.inst_data_out_buff</linty-anchor> (<linty-anchor href="//src/module_data_link/data_out_buf.vhd#33">data_out_buff</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#1041">gen_data_out_buff(1)\.inst_data_out_buff</linty-anchor> (<linty-anchor href="//src/module_data_link/data_out_buf.vhd#33">data_out_buff</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#1041">gen_data_out_buff(2)\.inst_data_out_buff</linty-anchor> (<linty-anchor href="//src/module_data_link/data_out_buf.vhd#33">data_out_buff</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#1041">gen_data_out_buff(3)\.inst_data_out_buff</linty-anchor> (<linty-anchor href="//src/module_data_link/data_out_buf.vhd#33">data_out_buff</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#1041">gen_data_out_buff(4)\.inst_data_out_buff</linty-anchor> (<linty-anchor href="//src/module_data_link/data_out_buf.vhd#33">data_out_buff</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#1041">gen_data_out_buff(5)\.inst_data_out_buff</linty-anchor> (<linty-anchor href="//src/module_data_link/data_out_buf.vhd#33">data_out_buff</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#1041">gen_data_out_buff(6)\.inst_data_out_buff</linty-anchor> (<linty-anchor href="//src/module_data_link/data_out_buf.vhd#33">data_out_buff</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#1041">gen_data_out_buff(7)\.inst_data_out_buff</linty-anchor> (<linty-anchor href="//src/module_data_link/data_out_buf.vhd#33">data_out_buff</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#750">inst_data_in_bc_buf</linty-anchor> (<linty-anchor href="//src/module_data_link/data_in_bc_buf.vhd#32">data_in_bc_buf</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#776">inst_mid_buf_bc</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#36">FIFO_DC_DROP_BAD_FRAME</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#803">gen_data_in_buff(0)\.inst_data_in_buf</linty-anchor> (<linty-anchor href="//src/module_data_link/data_in_buf.vhd#33">data_in_buf</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#803">gen_data_in_buff(1)\.inst_data_in_buf</linty-anchor> (<linty-anchor href="//src/module_data_link/data_in_buf.vhd#33">data_in_buf</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#803">gen_data_in_buff(2)\.inst_data_in_buf</linty-anchor> (<linty-anchor href="//src/module_data_link/data_in_buf.vhd#33">data_in_buf</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#803">gen_data_in_buff(3)\.inst_data_in_buf</linty-anchor> (<linty-anchor href="//src/module_data_link/data_in_buf.vhd#33">data_in_buf</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#803">gen_data_in_buff(4)\.inst_data_in_buf</linty-anchor> (<linty-anchor href="//src/module_data_link/data_in_buf.vhd#33">data_in_buf</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#803">gen_data_in_buff(5)\.inst_data_in_buf</linty-anchor> (<linty-anchor href="//src/module_data_link/data_in_buf.vhd#33">data_in_buf</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#803">gen_data_in_buff(6)\.inst_data_in_buf</linty-anchor> (<linty-anchor href="//src/module_data_link/data_in_buf.vhd#33">data_in_buf</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#803">gen_data_in_buff(7)\.inst_data_in_buf</linty-anchor> (<linty-anchor href="//src/module_data_link/data_in_buf.vhd#33">data_in_buf</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#837">inst_mid_buf</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#36">FIFO_DC_DROP_BAD_FRAME</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#750">inst_mux_tx</linty-anchor> (<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#32">mux_tx</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#778">inst_demux_rx</linty-anchor> (<linty-anchor href="//src/ip_spacefibre_light_top/demux_rx.vhd#32">demux_rx</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#802">inst_phy_plus_lane</linty-anchor> (<linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#41">phy_plus_lane</linty-anchor>) > <linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#885">inst_fifo_rx_data</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#36">FIFO_DC</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#802">inst_phy_plus_lane</linty-anchor> (<linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#41">phy_plus_lane</linty-anchor>) > <linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#920">inst_fifo_out_ctrl</linty-anchor> (<linty-anchor href="//src/ip/fifo_dc/fifo_dc.vhd#36">FIFO_DC</linty-anchor>)|&#10004;|&#10007;|&#10007;|&#10004;|


## Flip-flops using this reset domain

**Count: 309**

### Asynchronous usage

| Count: 309 |
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
| <linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#202">fifo_dc_drop_bad_frame.vhd#202</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#254">fifo_dc_drop_bad_frame.vhd#254</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#271">fifo_dc_drop_bad_frame.vhd#271</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#288">fifo_dc_drop_bad_frame.vhd#288</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#329">fifo_dc_drop_bad_frame.vhd#329</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#349">fifo_dc_drop_bad_frame.vhd#349</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#371">fifo_dc_drop_bad_frame.vhd#371</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#388">fifo_dc_drop_bad_frame.vhd#388</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#403">fifo_dc_drop_bad_frame.vhd#403</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#461">fifo_dc_drop_bad_frame.vhd#461</linty-anchor> |
| <linty-anchor href="//src/ip_spacefibre_light_top/demux_rx.vhd#59">demux_rx.vhd#59</linty-anchor> |
| <linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#75">mux_tx.vhd#75</linty-anchor> |
| <linty-anchor href="//src/ip_spacefibre_light_top/reset_gen.vhd#56">reset_gen.vhd#56</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_in_bc_buf.vhd#170">data_in_bc_buf.vhd#170</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_in_buf.vhd#206">data_in_buf.vhd#206</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_in_buf.vhd#225">data_in_buf.vhd#225</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_in_buf.vhd#298">data_in_buf.vhd#298</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_in_buf.vhd#345">data_in_buf.vhd#345</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_link_reset.vhd#92">data_link_reset.vhd#92</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#184">data_out_bc_buf.vhd#184</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#208">data_out_bc_buf.vhd#208</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#226">data_out_bc_buf.vhd#226</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#252">data_out_buf.vhd#252</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#388">data_out_buf.vhd#388</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#404">data_out_buf.vhd#404</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#420">data_out_buf.vhd#420</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#458">data_out_buf.vhd#458</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#481">data_out_buf.vhd#481</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#499">data_out_buf.vhd#499</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#537">data_out_buf.vhd#537</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#560">data_out_buf.vhd#560</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#588">data_out_buf.vhd#588</linty-anchor> |

### Synchronous usage

| Count: 0 |
| --- |


### Active-high usage

| Count: 0 |
| --- |


### Active-low usage

| Count: 309 |
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
| <linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#202">fifo_dc_drop_bad_frame.vhd#202</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#254">fifo_dc_drop_bad_frame.vhd#254</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#271">fifo_dc_drop_bad_frame.vhd#271</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#288">fifo_dc_drop_bad_frame.vhd#288</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#329">fifo_dc_drop_bad_frame.vhd#329</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#349">fifo_dc_drop_bad_frame.vhd#349</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#371">fifo_dc_drop_bad_frame.vhd#371</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#388">fifo_dc_drop_bad_frame.vhd#388</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#403">fifo_dc_drop_bad_frame.vhd#403</linty-anchor> |
| <linty-anchor href="//src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd#461">fifo_dc_drop_bad_frame.vhd#461</linty-anchor> |
| <linty-anchor href="//src/ip_spacefibre_light_top/demux_rx.vhd#59">demux_rx.vhd#59</linty-anchor> |
| <linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#75">mux_tx.vhd#75</linty-anchor> |
| <linty-anchor href="//src/ip_spacefibre_light_top/reset_gen.vhd#56">reset_gen.vhd#56</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_in_bc_buf.vhd#170">data_in_bc_buf.vhd#170</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_in_buf.vhd#206">data_in_buf.vhd#206</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_in_buf.vhd#225">data_in_buf.vhd#225</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_in_buf.vhd#298">data_in_buf.vhd#298</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_in_buf.vhd#345">data_in_buf.vhd#345</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_link_reset.vhd#92">data_link_reset.vhd#92</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#184">data_out_bc_buf.vhd#184</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#208">data_out_bc_buf.vhd#208</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_bc_buf.vhd#226">data_out_bc_buf.vhd#226</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#252">data_out_buf.vhd#252</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#388">data_out_buf.vhd#388</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#404">data_out_buf.vhd#404</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#420">data_out_buf.vhd#420</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#458">data_out_buf.vhd#458</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#481">data_out_buf.vhd#481</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#499">data_out_buf.vhd#499</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#537">data_out_buf.vhd#537</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#560">data_out_buf.vhd#560</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_out_buf.vhd#588">data_out_buf.vhd#588</linty-anchor> |



<br>

Note that there could be fewer source code locations than the number of flip-flops because several flip-flops can be inferred from the same piece of code.<br>
<br>



<br>

[Back to Reset Domains Report](../reset_domains.md)