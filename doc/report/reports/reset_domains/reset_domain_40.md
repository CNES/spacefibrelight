[Back to Reset Domains Report](../reset_domains.md)

<br>

# Reset Domain Details

## Summary

| Name: Origin | Graph | Global | Local | Asynchronous | Synchronous | Active&nbsp;High | Active&nbsp;Low | Number of flip-flops<br>using this reset domain | Number of instances<br>using this reset domain |
| --- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | ---: | ---: |
|**Complex:** ****<br>&nbsp;&nbsp;-&nbsp;**inst_data_link.inst_data_link_reset.lane_reset_dlre_i**: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#92"> data_link_reset.vhd#92 (Flip-flop)</linty-anchor><br>&nbsp;&nbsp;-&nbsp;**inst_data_link.inst_data_word_id_fsm.END_FRAME_DWI**: <linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#273"> data_word_id_fsm.vhd#273 (Flip-flop)</linty-anchor><br>&nbsp;&nbsp;-&nbsp;**inst_data_link.inst_data_word_id_fsm.FRAME_ERR_DWI**: <linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#134"> data_word_id_fsm.vhd#134 (Flip-flop)</linty-anchor><br>&nbsp;&nbsp;-&nbsp;**inst_data_link.inst_data_word_id_fsm.NEW_WORD_DWI**: <linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#273"> data_word_id_fsm.vhd#273 (Flip-flop)</linty-anchor><br>&nbsp;&nbsp;-&nbsp;**inst_data_link.inst_data_word_id_fsm.RXNOTHING_ACTIVE_DWI**: <linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#134"> data_word_id_fsm.vhd#134 (Flip-flop)</linty-anchor><br>&nbsp;&nbsp;-&nbsp;**inst_data_link.inst_data_word_id_fsm.TYPE_FRAME_DWI**: <linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#273"> data_word_id_fsm.vhd#273 (Flip-flop)</linty-anchor>|<a href="/graphs/reset_hierarchy_graph.html"><img title="Open Reset Hierarchy Graph" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open Reset Hierarchy Graph"></a>|&#10007;|&#10004;|&#10007;|&#10004;|&#10004;|&#10007;|**1**/1245 (0.08%)|**1**/103|


## Instances using this reset domain

**Count: 1**

| Instance | Asynchronous | Synchronous | Active&nbsp;High | Active&nbsp;Low
| --- | :---: | :---: | :---: | :---: |
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#918">inst_data_crc_check</linty-anchor> (<linty-anchor href="//src/module_data_link/data_crc_check.vhd#32">data_crc_check</linty-anchor>)|&#10007;|&#10004;|&#10004;|&#10007;|


## Flip-flops using this reset domain

**Count: 1**

### Asynchronous usage

| Count: 0 |
| --- |


### Synchronous usage

| Count: 1 |
| --- |
| <linty-anchor href="//src/module_data_link/data_crc_check.vhd#156">data_crc_check.vhd#156</linty-anchor> |

### Active-high usage

| Count: 1 |
| --- |
| <linty-anchor href="//src/module_data_link/data_crc_check.vhd#156">data_crc_check.vhd#156</linty-anchor> |

### Active-low usage

| Count: 0 |
| --- |




<br>

Note that there could be fewer source code locations than the number of flip-flops because several flip-flops can be inferred from the same piece of code.<br>
<br>



<br>

[Back to Reset Domains Report](../reset_domains.md)