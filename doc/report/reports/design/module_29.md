[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)

<br>

# Entity - mib_phy_plus_lane

## Summary

| Name | Location | Description |
| --- | --- | --- |
|mib_phy_plus_lane|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#32">mib_phy_plus_lane.vhd#32</linty-anchor>||
## Instantiations

Count: 1

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| inst_mib_phy_plus_lane | <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#849">spacefibre_light_top.vhd#849</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_29/instantiation_1.md) |


## Generics

Count: 0

## Ports

Count: 26

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#35">LANE_START</linty-anchor>|in|std_logic|Asserts or de-asserts LaneStart for the lane|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#36">AUTOSTART</linty-anchor>|in|std_logic|Asserts or de-asserts AutoStart for the lane|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#37">LANE_RESET</linty-anchor>|in|std_logic|Asserts or de-asserts LaneReset for the lane|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#38">PARALLEL_LOOPBACK_EN</linty-anchor>|in|std_logic|Enables or disables the parallel loopback for the lane|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#39">STANDBY_REASON</linty-anchor>|in|std_logic_vector ( 07 downto 00 )|In case of error, pauses communication|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#40">NEAR_END_SERIAL_LB_EN</linty-anchor>|in|std_logic|Enables or disables the near-end serial loopback for the lane|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#41">FAR_END_SERIAL_LB_EN</linty-anchor>|in|std_logic|Enables or disables the far-end serial loopback for the lane|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#43">LANE_STATE</linty-anchor>|out|std_logic_vector ( 03 downto 00 )|Indicates the current state of the Lane Initialization state machine in a lane|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#44">RX_ERROR_CNT</linty-anchor>|out|std_logic_vector ( 07 downto 00 )|Counter of error detected on the RX link|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#45">RX_ERROR_OVF</linty-anchor>|out|std_logic|Overflow flag of the RX_ERROR_CNT|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#46">LOSS_SIGNAL</linty-anchor>|out|std_logic|Set when no signal is received on RX link.|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#47">FAR_END_CAPA</linty-anchor>|out|std_logic_vector ( 07 downto 00 )|Capabilities field (INT3 flags)|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#48">RX_POLARITY</linty-anchor>|out|std_logic|Set when the receiver polarity is inverted.|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#51">LANE_START_TO_MOD</linty-anchor>|out|std_logic|Asserts or de-asserts LaneStart for the lane|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#52">AUTOSTART_TO_MOD</linty-anchor>|out|std_logic|Asserts or de-asserts AutoStart for the lane|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#53">LANE_RESET_TO_MOD</linty-anchor>|out|std_logic|Asserts or de-asserts LaneReset for the lane|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#54">PARALLEL_LOOPBACK_EN_TO_MOD</linty-anchor>|out|std_logic|Enables or disables the parallel loopback for the lane|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#55">STANDBY_REASON_TO_MOD</linty-anchor>|out|std_logic_vector ( 07 downto 00 )|In case of error, pauses communication|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#56">NEAR_END_SERIAL_LB_EN_TO_MOD</linty-anchor>|out|std_logic|Enables or disables the near-end serial loopback for the lane|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#57">FAR_END_SERIAL_LB_EN_TO_MOD</linty-anchor>|out|std_logic|Enables or disables the far-end serial loopback for the lane|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#59">LANE_STATE_FROM_MOD</linty-anchor>|in|std_logic_vector ( 03 downto 00 )|Indicates the current state of the Lane Initialization state machine in a lane|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#60">RX_ERROR_CNT_FROM_MOD</linty-anchor>|in|std_logic_vector ( 07 downto 00 )|Counter of error detected on the RX link|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#61">RX_ERROR_OVF_FROM_MOD</linty-anchor>|in|std_logic|Overflow flag of the RX_ERROR_CNT|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#62">LOSS_SIGNAL_FROM_MOD</linty-anchor>|in|std_logic|Set when no signal is received on RX link|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#63">FAR_END_CAPA_FROM_MOD</linty-anchor>|in|std_logic_vector ( 07 downto 00 )|Capabilities field (INT3 flags)|
|<linty-anchor href="//src/module_phy_plus_lane/mib_phy_plus_lane.vhd#64">RX_POLARITY_FROM_MOD</linty-anchor>|in|std_logic|Set when the receiver polarity is inverted|


<br>

[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)