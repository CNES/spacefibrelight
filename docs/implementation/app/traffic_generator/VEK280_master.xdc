
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
create_clock -period 10.000 [get_ports QUAD0_GTREFCLK0_in_p]

set_false_path -from [get_clocks -of_objects [get_pins I_CLOCKING_WIZARD_0/inst/clock_primitive_inst/MMCME5_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins I_CLOCKING_WIZARD_0/inst/clock_primitive_inst/MMCME5_inst/CLKOUT0]]

set_property BEL GTYP_QUAD [get_cells design_1_i/spacefibrelight_0/U0/spacefibre_light_top_inst/inst_phy_plus_lane/gtwiz_versal_0/inst/intf_quad_map_inst/quad_top_inst/gt_quad_base_0_inst/inst/quad_inst]
set_property LOC GTYP_QUAD_X1Y3 [get_cells design_1_i/spacefibrelight_0/U0/spacefibre_light_top_inst/inst_phy_plus_lane/gtwiz_versal_0/inst/intf_quad_map_inst/quad_top_inst/gt_quad_base_0_inst/inst/quad_inst]

############################################################################
##                            I/O Constraints                             ##
############################################################################
set_property PACKAGE_PIN AU11 [get_ports CLK_FPGA_P]
set_property PACKAGE_PIN AV11 [get_ports CLK_FPGA_N]
set_property IOSTANDARD DIFF_SSTL15 [get_ports CLK_FPGA_P]
set_property IOSTANDARD DIFF_SSTL15 [get_ports CLK_FPGA_N]
set_property PACKAGE_PIN AV33 [get_ports RESET]
set_property IOSTANDARD LVCMOS15 [get_ports RESET]
set_property PACKAGE_PIN Y30 [get_ports QUAD0_GTREFCLK0_in_p]

