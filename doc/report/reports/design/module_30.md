[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)

<br>

# Entity - mux_tx

## Summary

| Name | Location | Description |
| --- | --- | --- |
|mux_tx|<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#32">mux_tx.vhd#32</linty-anchor>||
## Instantiations

Count: 1

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| inst_mux_tx | <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#750">spacefibre_light_top.vhd#750</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_30/instantiation_1.md) |


## Generics

Count: 0

## Ports

Count: 21

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#34">RST_N</linty-anchor>|in|std_logic|Global reset|
|<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#35">CLK</linty-anchor>|in|std_logic|Global clock|
|<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#37">ENABLE_INJ</linty-anchor>|in|std_logic|Enable injector command|
|<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#39">DATA_TX_INJ</linty-anchor>|in|std_logic_vector ( 31 downto 00 )|Data parallel to be send from injector|
|<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#40">CAPABILITY_TX_INJ</linty-anchor>|in|std_logic_vector ( 07 downto 00 )|Capability send on TX link in INIT3 control word from injector|
|<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#41">NEW_DATA_TX_INJ</linty-anchor>|in|std_logic|Flag to write data in FIFO TX from injetor|
|<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#42">VALID_K_CHARAC_TX_INJ</linty-anchor>|in|std_logic_vector ( 03 downto 00 )|K charachter valid in the 32-bit DATA_TX_INJ vector|
|<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#43">FIFO_TX_FULL_INJ</linty-anchor>|out|std_logic|Fifo TX full flag to Injector|
|<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#44">LANE_RESET_INJ</linty-anchor>|in|std_logic|Lane Reset command from Injector|
|<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#46">DATA_TX_DL</linty-anchor>|in|std_logic_vector ( 31 downto 00 )|Data parallel to be send from Data-Link Layer|
|<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#47">CAPABILITY_TX_DL</linty-anchor>|in|std_logic_vector ( 07 downto 00 )|Capability send on TX link in INIT3 control word|
|<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#48">NEW_DATA_TX_DL</linty-anchor>|in|std_logic|Flag to write data in FIFO TX|
|<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#49">VALID_K_CHARAC_TX_DL</linty-anchor>|in|std_logic_vector ( 03 downto 00 )|K charachter valid in the 32-bit DATA_TX_DL vector|
|<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#50">FIFO_TX_FULL_DL</linty-anchor>|out|std_logic|Fifo TX full flag to dl|
|<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#51">LANE_RESET_DL</linty-anchor>|in|std_logic|Lane Reset command from dl|
|<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#53">DATA_TX_MUX</linty-anchor>|out|std_logic_vector ( 31 downto 00 )|Data parallel|
|<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#54">CAPABILITY_TX_MUX</linty-anchor>|out|std_logic_vector ( 07 downto 00 )|Capability send on TX link in INIT3 control word|
|<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#55">NEW_DATA_TX_MUX</linty-anchor>|out|std_logic|Flag to write data in FIFO TX|
|<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#56">VALID_K_CHARAC_TX_MUX</linty-anchor>|out|std_logic_vector ( 03 downto 00 )|K charachter valid in the 32-bit DATA_TX_MUX vector|
|<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#57">FIFO_TX_FULL_PPL</linty-anchor>|in|std_logic|Fifo TX full flag from ppl|
|<linty-anchor href="//src/ip_spacefibre_light_top/mux_tx.vhd#58">LANE_RESET_MUX</linty-anchor>|out|std_logic|Lane Reset command to ppl|


<br>

[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)