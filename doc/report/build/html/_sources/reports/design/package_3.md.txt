[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-packages)

<br>

# Package - pkg_phy_plus_lane

## Summary

| Name | Location | Description |
| --- | --- | --- |
|pkg_phy_plus_lane|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#34">pkg_phy_plus_lane.vhd#34</linty-anchor>||


## Constants

Count: 34

| Name | Type | Default value | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#36">C_K28_5_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"BC"|K28.5|
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#37">C_K28_7_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"FC"|K28.7|
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#38">C_LOST_SIG_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"64"|D04.3|
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#39">C_INIT1_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"46"|D06.2|
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#40">C_I_INIT1_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"B9"|D25.5|
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#41">C_INIT2_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"A6"|D06.5|
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#42">C_I_INIT2_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"59"|D25.2|
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#43">C_INIT3_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"38"|D24.1|
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#44">C_LLCW_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"CE"|D14.6|
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#45">C_I_LLCW_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"31"|D17.1|
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#46">C_STANDBY_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"7E"|D30.3|
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#47">C_SKIP_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"7F"|D31.3|
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#48">C_IDLE_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"CF"|D15.6|
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#49">C_RXERR_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"00"|K00.0 et D00.0|
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#51">C_SKIP_WORD</linty-anchor>|std_logic_vector ( 31 downto 00 )|C_SKIP_SYMB & C_SKIP_SYMB & C_LLCW_SYMB & C_K28_7_SYMB||
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#52">C_IDLE_WORD</linty-anchor>|std_logic_vector ( 31 downto 00 )|C_IDLE_SYMB & C_IDLE_SYMB & C_LLCW_SYMB & C_K28_7_SYMB||
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#53">C_INIT1_WORD</linty-anchor>|std_logic_vector ( 31 downto 00 )|C_INIT1_SYMB & C_INIT1_SYMB & C_LLCW_SYMB & C_K28_5_SYMB||
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#54">C_INIT2_WORD</linty-anchor>|std_logic_vector ( 31 downto 00 )|C_INIT2_SYMB & C_INIT2_SYMB & C_LLCW_SYMB & C_K28_5_SYMB||
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#55">C_INIT3_WORD</linty-anchor>|std_logic_vector ( 23 downto 00 )|C_INIT3_SYMB & C_LLCW_SYMB & C_K28_5_SYMB||
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#56">C_I_INIT1_WORD</linty-anchor>|std_logic_vector ( 31 downto 00 )|C_I_INIT1_SYMB & C_I_INIT1_SYMB & C_I_LLCW_SYMB & C_K28_5_SYMB||
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#57">C_I_INIT2_WORD</linty-anchor>|std_logic_vector ( 31 downto 00 )|C_I_INIT2_SYMB & C_I_INIT2_SYMB & C_I_LLCW_SYMB & C_K28_5_SYMB||
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#58">C_STANDBY_WORD</linty-anchor>|std_logic_vector ( 23 downto 00 )|C_STANDBY_SYMB & C_LLCW_SYMB & C_K28_7_SYMB||
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#59">C_LOST_SIG_WORD</linty-anchor>|std_logic_vector ( 23 downto 00 )|C_LOST_SIG_SYMB & C_LLCW_SYMB & C_K28_7_SYMB||
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#60">C_RXERR_WORD</linty-anchor>|std_logic_vector ( 31 downto 00 )|C_RXERR_SYMB & C_RXERR_SYMB & C_RXERR_SYMB & C_RXERR_SYMB||
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#63">C_PRBS_COUNTER_64</linty-anchor>|unsigned ( 31 downto 00 )|x"0000003F"||
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#64">C_X32_SIGNAL</linty-anchor>|unsigned ( 04 downto 00 )|"11111"||
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#65">C_5000_WORDS</linty-anchor>|unsigned ( 12 downto 00 )|"1" & x"387"||
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#67">C_SYMB_X5</linty-anchor>|unsigned ( 02 downto 00 )|"100"||
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#69">C_DWIDTH</linty-anchor>|integer|36||
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#70">C_AWIDTH</linty-anchor>|integer|10||
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#71">C_DWIDTH_CTRL_TX</linty-anchor>|integer|9||
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#72">C_AWIDTH_CTRL_TX</linty-anchor>|integer|3||
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#73">C_DWIDTH_CTRL_RX</linty-anchor>|integer|9||
|<linty-anchor href="//src/pkg_phy_plus_lane.vhd#74">C_AWIDTH_CTRL_RX</linty-anchor>|integer|3||


## Types

Count: 0



## Subtypes

Count: 0



## Functions

Count: 0



## Procedures

Count: 0



## Global Signals

Count: 0



## Global Variables

Count: 0



## Component Definitions

Count: 0



<br>

[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-packages)