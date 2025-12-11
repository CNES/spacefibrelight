
############################################################################
##
##  VEK280 REV Bx Master XDC (Not compatible with REV Ax)
##  Data: 02/08/2023
##
############################################################################

############################################################################
##                          Clock Constraints                             ##
############################################################################



############################################################################
##                        Timings Constraints                             ##
############################################################################
create_clock -period 10.000 [get_ports SPF_GTCLK_p]


set_property BEL GTYP_QUAD [get_cells design_1_i/spacefibrelight_0/U0/spacefibre_light_top_inst/inst_phy_plus_lane/gtwiz_versal_0/inst/intf_quad_map_inst/quad_top_inst/gt_quad_base_0_inst/inst/quad_inst]
set_property LOC GTYP_QUAD_X0Y4 [get_cells design_1_i/spacefibrelight_0/U0/spacefibre_light_top_inst/inst_phy_plus_lane/gtwiz_versal_0/inst/intf_quad_map_inst/quad_top_inst/gt_quad_base_0_inst/inst/quad_inst]

############################################################################
##                            I/O Constraints                             ##
############################################################################
## pushbutton SW4
set_property PACKAGE_PIN AV33 [get_ports RESET]
set_property IOSTANDARD LVCMOS15 [get_ports RESET]

#led 0
set_property PACKAGE_PIN AT12 [get_ports Led0]
set_property IOSTANDARD LVCMOS15 [get_ports Led0]

#on VEK280 schematic signal RC21008A_GTCLK1_OUT8_P
set_property PACKAGE_PIN H9 [get_ports SPF_GTCLK_p]
set_property PACKAGE_PIN H8 [get_ports SPF_GTCLK_n]
#on VEK280 schematic signal RC21008A_GTCLK1_OUT8_n


