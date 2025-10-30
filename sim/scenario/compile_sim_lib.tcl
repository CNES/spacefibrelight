#This file implement common questa libraries used for simulation

#get spacefibrelight project   main root path
set rootpath $env(SPACEFIBRELIGHT_ROOT_PATH)

echo ""
echo "Script execute in $rootpath"
echo ""

quietly set LIB_PATH_UNISIM_V    $rootpath/sim/libraries/unisim/verilog/src
quietly set LIB_PATH_UNISIM_VHD  $rootpath/sim/libraries/unisim/vhdl/src/unisims
quietly set LIB_PATH_BUF         $rootpath/sim/libraries/cores/BufG_GT_bd
quietly set LIB_PATH_GTY         $rootpath/sim/libraries/cores/extended_phy_layer_gtwiz_versal_0_0
quietly set LIB_PATH_XPM         $rootpath/sim/libraries/xpm
quietly set LIB_PATH_SECUREIP    $rootpath/sim/libraries/secureip


if [file exists sim_build/unisim] {vdel -lib sim_build/unisim -all}
if [file exists sim_build/xpm] {vdel -lib sim_build/xpm -all}
if [file exists sim_build/commun] {vdel -lib sim_build/commun -all}
if [file exists sim_build/phy_plus_lane_lib] {vdel -lib sim_build/phy_plus_lane_lib -all}
if [file exists sim_build/secureip] {vdel -lib sim_build/secureip -all}
if [file exists sim_build/data_link_lib] {vdel -lib sim_build/data_link_lib -all}
if [file exists sim_build/interlayer_lib] {vdel -lib sim_build/interlayer_lib -all}

echo "############# Create Libraries #############"
vlib sim_build/xpm
vlib sim_build/unisim
vlib sim_build/commun
vlib sim_build/phy_plus_lane_lib
vlib sim_build/phy_plus_lane_64_lib
vlib sim_build/secureip
vlib sim_build/data_link_lib
vlib sim_build/interlayer_lib
vlib sim_build/nx
echo "############# End create Libraries #############"

echo "############# Map Libraries #############"
vmap secureip sim_build/secureip
vmap xpm sim_build/xpm
vmap unisim sim_build/unisim
vmap commun sim_build/commun
vmap phy_plus_lane_lib sim_build/phy_plus_lane_lib
vmap phy_plus_lane_64_lib sim_build/phy_plus_lane_64_lib
vmap data_link_lib sim_build/data_link_lib
vmap interlayer_lib sim_build/interlayer_lib
vmap nx sim_build/nx
echo "############# End map Libraries #############"


echo "###################################################"
echo "############# Start compile XPM #############"
echo "###################################################"
vlog -work xpm -sv $LIB_PATH_XPM/xpm_cdc/hdl/xpm_cdc.sv
vlog -work xpm -sv $LIB_PATH_XPM/xpm_fifo/hdl/xpm_fifo.sv
vlog -work xpm -sv $LIB_PATH_XPM/xpm_memory/hdl/xpm_memory.sv
vcom -work xpm $LIB_PATH_XPM/xpm_VCOMP.vhd
echo "############# End compile XPM #############"



echo "###################################################"
echo "############# Start compile Secureip #############"
echo "###################################################"
vlog -work secureip -sv $LIB_PATH_SECUREIP/gtyp_quad/*.svp
echo "############# End compile Secureip #############"


echo "###################################################"
echo "############# Start compile Unisim #############"
echo "###################################################"
vlog +acc -work unisim $LIB_PATH_UNISIM_V/glbl.v
vlog +acc -work unisim $LIB_PATH_UNISIM_V/retarget_comp.v
vlog +acc -work unisim $LIB_PATH_UNISIM_V/unisim_comp.v
vlog +acc -work unisim $LIB_PATH_UNISIM_V/unisim_retarget_comp.vp
vlog +acc -work unisim $LIB_PATH_UNISIM_V/unisim_retarget_comp.v
vlog +acc -work unisim $LIB_PATH_UNISIM_V/unisims/*.v
vcom +acc -work unisim $LIB_PATH_UNISIM_VHD/unisim_VCOMP.vhd
vcom +acc -work unisim $LIB_PATH_UNISIM_VHD/unisim_VPKG.vhd
echo "############# End compile Unisim #############"


echo "##############################################"
echo "############# Start compile FIFO #############"
echo "##############################################"
vcom +acc -work commun  $rootpath/src/pkg_tools.vhd
vcom +acc -work commun  $rootpath/src/ip/fifo_dc/fifo_dc.vhd

echo "############# End compile FIFO #############"


echo "####################################################"
echo "########## Start compile Phy+Lane VERSAL ###########"
echo "####################################################"

vcom +cover=sb +acc -work phy_plus_lane_lib  $rootpath/src/pkg_phy_plus_lane.vhd

echo "############# Start compile BUFG #############"
vlog  +cover=sb +acc -work phy_plus_lane_lib  -L xpm -L unisim $LIB_PATH_BUF/ip/BufG_GT_bd_bufg_gt_0_0/BufG_GT_bd_bufg_gt_0_0_inst.v
vlog  +cover=sb +acc -work phy_plus_lane_lib  -L xpm -L unisim $LIB_PATH_BUF/ip/BufG_GT_bd_bufg_gt_0_0/sim/BufG_GT_bd_bufg_gt_0_0.v
echo "############# End compile BUFG #############"

echo "############# Start compile GTY #############"
vlog +cover=sb +acc -work phy_plus_lane_lib  -L xpm -L unisim $LIB_PATH_GTY/*.v

echo "############# End compile GTY #############"

echo "#####################################################"
echo "########## Start compile Phy+Lane NGULTRA ###########"
echo "#####################################################"

vcom +cover=sb +acc -work phy_plus_lane_64_lib  $rootpath/src/pkg_phy_plus_lane_64b.vhd
vcom +cover=sb +acc -work phy_plus_lane_64_lib  $rootpath/src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd
vcom +cover=sb +acc -work phy_plus_lane_64_lib  $rootpath/src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd

echo "############# Start compile NX HSSL #############"
vlog +cover=sb +acc -incr -timescale=1ps/1ps -sv -work phy_plus_lane_64_lib  $rootpath/src/ip/cores/HSSL_Nanoxplore/merged_nx_hssl_u_full.svp
vcom +cover=sb +acc -2008 -work nx -mixedsvvh pc  $rootpath/src/ip/cores/HSSL_Nanoxplore/nxLibrary-Ultra.vhdp
vcom +cover=sb +acc -2008 -mixedsvvh pc -work  phy_plus_lane_64_lib  $rootpath/src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd

echo "######## Start compile Lane_layer VERSAL #########"
vcom +cover=sb +acc -work phy_plus_lane_lib  $rootpath/src/module_phy_plus_lane/lane_ctrl_word_detect.vhd
vcom +cover=sb +acc -work phy_plus_lane_lib  $rootpath/src/module_phy_plus_lane/lane_ctrl_word_insert.vhd
vcom +cover=sb +acc -work phy_plus_lane_lib  $rootpath/src/module_phy_plus_lane/lane_init_fsm.vhd
vcom +cover=sb +acc -work phy_plus_lane_lib  $rootpath/src/module_phy_plus_lane/parallel_loopback.vhd
vcom +cover=sb +acc -work phy_plus_lane_lib  $rootpath/src/module_phy_plus_lane/rx_sync_fsm.vhd
vcom +cover=sb +acc -work phy_plus_lane_lib  $rootpath/src/module_phy_plus_lane/skip_insertion.vhd
vcom +cover=sb +acc -work phy_plus_lane_lib  $rootpath/src/module_phy_plus_lane/phy_plus_lane.vhd
vcom +cover=sb +acc -work phy_plus_lane_lib  $rootpath/src/module_phy_plus_lane/mib_phy_plus_lane.vhd
echo "######### End compile Lane_layer VERSAL ##########"

echo "######## Start compile Lane_layer NGULTRA #########"
vcom +cover=sb +acc -2008 -work phy_plus_lane_64_lib  $rootpath/src/module_phy_plus_lane_64b/ppl_64_lane_ctrl_word_detect.vhd
vcom +cover=sb +acc -2008 -work phy_plus_lane_64_lib  $rootpath/src/module_phy_plus_lane_64b/ppl_64_lane_ctrl_word_insert.vhd
vcom +cover=sb +acc -2008 -work phy_plus_lane_64_lib  $rootpath/src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd
vcom +cover=sb +acc -2008 -work phy_plus_lane_64_lib  $rootpath/src/module_phy_plus_lane_64b/ppl_64_parallel_loopback.vhd
vcom +cover=sb +acc -2008 -work phy_plus_lane_64_lib  $rootpath/src/module_phy_plus_lane_64b/ppl_64_rx_wr_en_fifo.vhd
vcom +cover=sb +acc -2008 -work phy_plus_lane_64_lib  $rootpath/src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd
vcom +cover=sb +acc -2008 -work phy_plus_lane_64_lib  $rootpath/src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd
vcom +cover=sb +acc -2008 -work phy_plus_lane_64_lib  $rootpath/src/module_phy_plus_lane_64b/ppl_64_bus_concat_tx.vhd
vcom +cover=sb +acc -2008 -work phy_plus_lane_64_lib  $rootpath/src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd
vcom +cover=sb +acc -2008 -work phy_plus_lane_64_lib  $rootpath/src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd
vcom +cover=sb +acc -2008 -work phy_plus_lane_64_lib  $rootpath/src/module_phy_plus_lane/mib_phy_plus_lane.vhd
echo "######### End compile Lane_layer NGULTRA ##########"


echo "######### End compile Lane_layer ##########"

echo "########## End compile Phy+Lane ###########"



echo "################################################"
echo "######## Start compile Data_Link_layer #########"
echo "################################################"

vcom +cover=sb +acc -work data_link_lib  $rootpath/src/pkg_data_link.vhd

vcom +cover=sb +acc -work data_link_lib  $rootpath/src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd
vcom +cover=sb +acc -work data_link_lib  $rootpath/src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd
vcom +cover=sb +acc -work data_link_lib  $rootpath/src/ip/fifo_dc_axis_to_custom/AXIS_SLAVE.vhd
vcom +cover=sb +acc -work data_link_lib  $rootpath/src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd
vcom +cover=sb +acc -work data_link_lib  $rootpath/src/module_data_link/data_crc_check.vhd
vcom +cover=sb +acc -work data_link_lib  $rootpath/src/module_data_link/data_crc_compute.vhd
vcom +cover=sb +acc -work data_link_lib  $rootpath/src/module_data_link/data_desencapsulation.vhd
vcom +cover=sb +acc -work data_link_lib  $rootpath/src/module_data_link/data_desencapsulation_bc.vhd
vcom +cover=sb +acc -work data_link_lib  $rootpath/src/module_data_link/data_encapsulation.vhd
vcom +cover=sb +acc -work data_link_lib  $rootpath/src/module_data_link/data_err_management.vhd
vcom +cover=sb +acc -work data_link_lib  $rootpath/src/module_data_link/data_in_bc_buf.vhd
vcom +cover=sb +acc -work data_link_lib  $rootpath/src/module_data_link/data_in_buf.vhd
vcom +cover=sb +acc -work data_link_lib  $rootpath/src/module_data_link/data_link_reset.vhd
vcom +cover=sb +acc -work data_link_lib  $rootpath/src/module_data_link/data_mac.vhd
vcom +cover=sb +acc -work data_link_lib  $rootpath/src/module_data_link/data_out_bc_buf.vhd
vcom +cover=sb +acc -work data_link_lib  $rootpath/src/module_data_link/data_out_buf.vhd
vcom +cover=sb +acc -work data_link_lib  $rootpath/src/module_data_link/data_seq_check.vhd
vcom +cover=sb +acc -work data_link_lib  $rootpath/src/module_data_link/data_seq_compute.vhd
vcom +cover=sb +acc -work data_link_lib  $rootpath/src/module_data_link/data_word_id_fsm.vhd
vcom +cover=sb +acc -work data_link_lib  $rootpath/src/ip/fifo_dc/fifo_dc.vhd
vcom +cover=sb +acc -work data_link_lib  $rootpath/src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd
vcom +cover=sb +acc -work data_link_lib  $rootpath/src/module_data_link/data_link.vhd
vcom +cover=sb +acc -work data_link_lib  $rootpath/src/module_data_link/mib_data_link.vhd

echo "######## End compile Data_Link_layer #########"


echo "####### Start compile Interlayer #######"

vcom +cover=sb +acc -work interlayer_lib  $rootpath/src/ip_spacefibre_light_top/demux_rx.vhd
vcom +cover=sb +acc -work interlayer_lib  $rootpath/src/ip_spacefibre_light_top/mux_tx.vhd

echo "####### End compile Interlayer #######"





