# Clock Domains

## Clock Management Module (CMM)

None identified.

<br>

*All clocks should be generated within a unique clock management module (CMM).*
*A dedicated CMM brings a lot in terms of reuse and portability. Because all vendor-specific clock elements are generated within the same module, it is easier to replace this module to target other FPGAs.*



## Clock Domains

| Count | Graph |
| ---: | :---: |
| 5 | <a href="/spacefibrelight/graphs/clock_hierarchy_graph.html"><img title="Open Clock Hierarchy Graph" src="/spacefibrelight/_static/images/icon_graph.png" style="max-height: 25px; width: auto;" alt="Open Clock Hierarchy Graph"></a> |

| Name: Origin | Rising | Falling | Details |
| --- | :---: | :---: | :---: |
|**<linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#51">CLK</linty-anchor>**<br>&nbsp;&nbsp;-&nbsp;**CLK**: <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#51"> spacefibre_light_top.vhd#51 (Port)</linty-anchor>|&#10004;|&#10007;|<a href="/spacefibrelight/reports/clock_domains/clock_domain_1.html"><img title="View Clock Domain Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Clock Domain Details"></a>|
|**<linty-anchor href="/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd#540">gen_inst_phy_plus_lane.inst_phy_plus_lane.clk_tx</linty-anchor>**<br>&nbsp;&nbsp;-&nbsp;**hssl_clock_o**: <linty-anchor href="//src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd#156"> hssl_SpaceFibre_64b.vhd#156 (Blackbox port: hssl_clock_o)</linty-anchor>|&#10004;|&#10007;|<a href="/spacefibrelight/reports/clock_domains/clock_domain_2.html"><img title="View Clock Domain Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Clock Domain Details"></a>|
|**<linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#72">AXIS_ACLK_RX_DL</linty-anchor>**<br>&nbsp;&nbsp;-&nbsp;**AXIS_ACLK_RX_DL**: <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#72"> spacefibre_light_top.vhd#72 (Port)</linty-anchor>|&#10004;|&#10007;|<a href="/spacefibrelight/reports/clock_domains/clock_domain_3.html"><img title="View Clock Domain Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Clock Domain Details"></a>|
|**<linty-anchor href="/src/ip_spacefibre_light_top/spacefibre_light_top.vhd#65">AXIS_ACLK_TX_DL</linty-anchor>**<br>&nbsp;&nbsp;-&nbsp;**AXIS_ACLK_TX_DL**: <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#65"> spacefibre_light_top.vhd#65 (Port)</linty-anchor>|&#10004;|&#10007;|<a href="/spacefibrelight/reports/clock_domains/clock_domain_4.html"><img title="View Clock Domain Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Clock Domain Details"></a>|
|**<linty-anchor href="/src/ip_spacefibre_light_top/reset_gen.vhd#46">inst_reset_sync_clk_from_GTY.reset_gen_rr_n</linty-anchor>**<br>&nbsp;&nbsp;-&nbsp;**inst_reset_sync_clk_from_GTY.reset_gen_rr_n**: <linty-anchor href="//src/ip_spacefibre_light_top/reset_gen.vhd#56"> reset_gen.vhd#56 (Flip-flop)</linty-anchor>|&#10004;|&#10007;|<a href="/spacefibrelight/reports/clock_domains/clock_domain_5.html"><img title="View Clock Domain Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Clock Domain Details"></a>|


*A clock domain used for both rising and falling edges is counted as two separate clock domains.*

