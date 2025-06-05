# Clock Domains

## Clock Management Module (CMM)

**<linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#41">phy_plus_lane</linty-anchor>** instantiated as **<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#802">inst_phy_plus_lane</linty-anchor>**

<br>

*All clocks should be generated within a unique clock management module (CMM).*
*A dedicated CMM brings a lot in terms of reuse and portability. Because all vendor-specific clock elements are generated within the same module, it is easier to replace this module to target other FPGAs.*



## Clock Domains

Count: **4**

| Name: Origin | Graph | Rising | Falling | Details |
| --- | :---: | :---: | :---: | :---: |
|**<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#45">CLK</linty-anchor>**<br>&nbsp;&nbsp;-&nbsp;**CLK**: <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#45"> spacefibre_light_top.vhd#45 (Port)</linty-anchor>|<a href="/graphs/clock_hierarchy_graph.html"><img title="Open Clock Hierarchy Graph" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open Clock Hierarchy Graph"></a>|&#10004;|&#10007;|[<img title="View Clock Domain Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Clock Domain Details">](clock_domains/clock_domain_1.md)|
|**<linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#614">inst_phy_plus_lane.clk_tx</linty-anchor>**<br>&nbsp;&nbsp;-&nbsp;**O**: <linty-anchor href="//src/module_phy_plus_lane/phy_plus_lane.vhd#954"> phy_plus_lane.vhd#954 (Blackbox port: O)</linty-anchor>|<a href="/graphs/clock_hierarchy_graph.html"><img title="Open Clock Hierarchy Graph" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open Clock Hierarchy Graph"></a>|&#10004;|&#10007;|[<img title="View Clock Domain Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Clock Domain Details">](clock_domains/clock_domain_2.md)|
|**<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#58">AXIS_ACLK_TX_DL</linty-anchor>**<br>&nbsp;&nbsp;-&nbsp;**AXIS_ACLK_TX_DL**: <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#58"> spacefibre_light_top.vhd#58 (Port)</linty-anchor>|<a href="/graphs/clock_hierarchy_graph.html"><img title="Open Clock Hierarchy Graph" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open Clock Hierarchy Graph"></a>|&#10004;|&#10007;|[<img title="View Clock Domain Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Clock Domain Details">](clock_domains/clock_domain_3.md)|
|**<linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#65">AXIS_ACLK_RX_DL</linty-anchor>**<br>&nbsp;&nbsp;-&nbsp;**AXIS_ACLK_RX_DL**: <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#65"> spacefibre_light_top.vhd#65 (Port)</linty-anchor>|<a href="/graphs/clock_hierarchy_graph.html"><img title="Open Clock Hierarchy Graph" src="/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open Clock Hierarchy Graph"></a>|&#10004;|&#10007;|[<img title="View Clock Domain Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Clock Domain Details">](clock_domains/clock_domain_4.md)|


*A clock domain used for both rising and falling edges is counted as two separate clock domains.*

