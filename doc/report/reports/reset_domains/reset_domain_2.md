[Back to Reset Domains Report](../reset_domains.md)

<br>

# Reset Domain Details

## Summary

| Name: Origin | Graph | Global | Local | Asynchronous | Synchronous | Active&nbsp;High | Active&nbsp;Low | Number of flip-flops<br>using this reset domain | Number of instances<br>using this reset domain |
| --- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | ---: | ---: |
|**<linty-anchor href="//src/module_data_link/data_link_reset.vhd#73">inst_data_link.inst_data_link_reset.lane_reset_dlre_i</linty-anchor>**<br>&nbsp;&nbsp;-&nbsp;**inst_data_link.inst_data_link_reset.lane_reset_dlre_i**: <linty-anchor href="//src/module_data_link/data_link_reset.vhd#92"> data_link_reset.vhd#92 (Flip-flop)</linty-anchor>|<a href="/graphs/reset_hierarchy_graph.html"><img title="Open Reset Hierarchy Graph" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open Reset Hierarchy Graph"></a>|&#10004;|&#10007;|&#10007;|&#10004;|&#10004;|&#10007;|**111**/1245 (8.92%)|**10**/103|


## Instances using this reset domain

**Count: 10**

| Instance | Asynchronous | Synchronous | Active&nbsp;High | Active&nbsp;Low
| --- | :---: | :---: | :---: | :---: |
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#1067">inst_data_mac</linty-anchor> (<linty-anchor href="//src/module_data_link/data_mac.vhd#32">data_mac</linty-anchor>)|&#10007;|&#10004;|&#10004;|&#10007;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#1109">inst_data_encapsulation</linty-anchor> (<linty-anchor href="//src/module_data_link/data_encapsulation.vhd#32">data_encapsulation</linty-anchor>)|&#10007;|&#10004;|&#10004;|&#10007;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#1138">inst_data_seq_compute</linty-anchor> (<linty-anchor href="//src/module_data_link/data_seq_compute.vhd#32">data_seq_compute</linty-anchor>)|&#10007;|&#10004;|&#10004;|&#10007;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#1158">inst_data_crc_compute</linty-anchor> (<linty-anchor href="//src/module_data_link/data_crc_compute.vhd#32">data_crc_compute</linty-anchor>)|&#10007;|&#10004;|&#10004;|&#10007;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#765">inst_data_desencapsulation_bc</linty-anchor> (<linty-anchor href="//src/module_data_link/data_desencapsulation_bc.vhd#32">data_desencapsulation_bc</linty-anchor>)|&#10007;|&#10004;|&#10004;|&#10007;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#824">inst_data_desencapsulation</linty-anchor> (<linty-anchor href="//src/module_data_link/data_desencapsulation.vhd#32">data_desencapsulation</linty-anchor>)|&#10007;|&#10004;|&#10004;|&#10007;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#862">inst_data_seq_check</linty-anchor> (<linty-anchor href="//src/module_data_link/data_seq_check.vhd#32">data_seq_check</linty-anchor>)|&#10007;|&#10004;|&#10004;|&#10007;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#918">inst_data_crc_check</linty-anchor> (<linty-anchor href="//src/module_data_link/data_crc_check.vhd#32">data_crc_check</linty-anchor>)|&#10007;|&#10004;|&#10004;|&#10007;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#951">inst_data_word_id_fsm</linty-anchor> (<linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#32">data_word_id_fsm</linty-anchor>)|&#10007;|&#10004;|&#10004;|&#10007;|
|TOP (<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#146">spacefibre_light_top</linty-anchor>) > <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#567">inst_data_link</linty-anchor> (<linty-anchor href="//src/module_data_link/data_link.vhd#31">data_link</linty-anchor>) > <linty-anchor href="//src/module_data_link/data_link.vhd#980">inst_data_err_management</linty-anchor> (<linty-anchor href="//src/module_data_link/data_err_management.vhd#32">data_err_management</linty-anchor>)|&#10007;|&#10004;|&#10004;|&#10007;|


## Flip-flops using this reset domain

**Count: 111**

### Asynchronous usage

| Count: 0 |
| --- |


### Synchronous usage

| Count: 111 |
| --- |
| <linty-anchor href="//src/module_data_link/data_crc_check.vhd#199">data_crc_check.vhd#199</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_crc_compute.vhd#127">data_crc_compute.vhd#127</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_crc_compute.vhd#183">data_crc_compute.vhd#183</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_crc_compute.vhd#91">data_crc_compute.vhd#91</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_desencapsulation.vhd#67">data_desencapsulation.vhd#67</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_desencapsulation_bc.vhd#63">data_desencapsulation_bc.vhd#63</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#92">data_encapsulation.vhd#92</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_err_management.vhd#107">data_err_management.vhd#107</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_err_management.vhd#166">data_err_management.vhd#166</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_err_management.vhd#206">data_err_management.vhd#206</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_err_management.vhd#269">data_err_management.vhd#269</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_mac.vhd#132">data_mac.vhd#132</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_seq_check.vhd#125">data_seq_check.vhd#125</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_seq_compute.vhd#74">data_seq_compute.vhd#74</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#134">data_word_id_fsm.vhd#134</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#273">data_word_id_fsm.vhd#273</linty-anchor> |

### Active-high usage

| Count: 111 |
| --- |
| <linty-anchor href="//src/module_data_link/data_crc_check.vhd#199">data_crc_check.vhd#199</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_crc_compute.vhd#127">data_crc_compute.vhd#127</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_crc_compute.vhd#183">data_crc_compute.vhd#183</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_crc_compute.vhd#91">data_crc_compute.vhd#91</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_desencapsulation.vhd#67">data_desencapsulation.vhd#67</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_desencapsulation_bc.vhd#63">data_desencapsulation_bc.vhd#63</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_encapsulation.vhd#92">data_encapsulation.vhd#92</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_err_management.vhd#107">data_err_management.vhd#107</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_err_management.vhd#166">data_err_management.vhd#166</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_err_management.vhd#206">data_err_management.vhd#206</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_err_management.vhd#269">data_err_management.vhd#269</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_mac.vhd#132">data_mac.vhd#132</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_seq_check.vhd#125">data_seq_check.vhd#125</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_seq_compute.vhd#74">data_seq_compute.vhd#74</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#134">data_word_id_fsm.vhd#134</linty-anchor> |
| <linty-anchor href="//src/module_data_link/data_word_id_fsm.vhd#273">data_word_id_fsm.vhd#273</linty-anchor> |

### Active-low usage

| Count: 0 |
| --- |




<br>

Note that there could be fewer source code locations than the number of flip-flops because several flip-flops can be inferred from the same piece of code.<br>
<br>



<br>

[Back to Reset Domains Report](../reset_domains.md)