# execute with command : /opt/NanoXplore/Impulse/nxdesignsuite-25.1.0.6/bin/nxpython ./create_proect.py

import sys
import traceback
from nxpython import *

## parameters
PROJECT_ROOT="/home/flo/temp/spacefibrelight/"
## end parameters

createProject(PROJECT_ROOT+"work/ultra/ultra")
getProject().setVariantName("NG-ULTRA", "FF-1760")

#######################
## sources
#######################

# phy+lane NGultra
getProject().addFile('phy_plus_lane_64_lib',PROJECT_ROOT+'src/pkg_phy_plus_lane_64b.vhd')
getProject().addFile('phy_plus_lane_64_lib',PROJECT_ROOT+'src/module_phy_plus_lane_64b/ppl_64_init_hssl.vhd')
getProject().addFile('phy_plus_lane_64_lib',PROJECT_ROOT+'src/module_phy_plus_lane_64b/ppl_64_word_alignment.vhd')

# NX HSSL
getProject().addFile('phy_plus_lane_64_lib',PROJECT_ROOT+'src/ip/cores/HSSL_Nanoxplore/hssl_SpaceFibre_64b.vhd')

# Lane_layer NGULTRA
getProject().addFile('phy_plus_lane_64_lib',PROJECT_ROOT+'src/ip/fifo_dc/fifo_dc.vhd')
getProject().addFile('phy_plus_lane_64_lib',PROJECT_ROOT+'src/module_phy_plus_lane_64b/ppl_64_lane_ctrl_word_detect.vhd')
getProject().addFile('phy_plus_lane_64_lib',PROJECT_ROOT+'src/module_phy_plus_lane_64b/ppl_64_lane_ctrl_word_insert.vhd')
getProject().addFile('phy_plus_lane_64_lib',PROJECT_ROOT+'src/module_phy_plus_lane_64b/ppl_64_lane_init_fsm.vhd')
getProject().addFile('phy_plus_lane_64_lib',PROJECT_ROOT+'src/module_phy_plus_lane_64b/ppl_64_parallel_loopback.vhd')
getProject().addFile('phy_plus_lane_64_lib',PROJECT_ROOT+'src/module_phy_plus_lane_64b/ppl_64_rx_wr_en_fifo.vhd')
getProject().addFile('phy_plus_lane_64_lib',PROJECT_ROOT+'src/module_phy_plus_lane_64b/ppl_64_rx_sync_fsm.vhd')
getProject().addFile('phy_plus_lane_64_lib',PROJECT_ROOT+'src/module_phy_plus_lane_64b/ppl_64_skip_insertion.vhd')
getProject().addFile('phy_plus_lane_64_lib',PROJECT_ROOT+'src/module_phy_plus_lane_64b/ppl_64_bus_concat_tx.vhd')
getProject().addFile('phy_plus_lane_64_lib',PROJECT_ROOT+'src/module_phy_plus_lane_64b/ppl_64_bus_split_rx.vhd')
getProject().addFile('phy_plus_lane_64_lib',PROJECT_ROOT+'src/module_phy_plus_lane_64b/phy_plus_lane_64b.vhd')
getProject().addFile('phy_plus_lane_64_lib',PROJECT_ROOT+'src/module_phy_plus_lane/mib_phy_plus_lane.vhd')

#datalink layer
getProject().addFile('data_link_lib',PROJECT_ROOT+'src/pkg_data_link.vhd')

getProject().addFile('data_link_lib',PROJECT_ROOT+'src/ip/fifo_dc_custom_to_axis/AXIS_MASTER.vhd')
getProject().addFile('data_link_lib',PROJECT_ROOT+'src/ip/fifo_dc_custom_to_axis/FIFO_DC_AXIS_M.vhd')
getProject().addFile('data_link_lib',PROJECT_ROOT+'src/ip/fifo_dc_axis_to_custom/AXIS_SLAVE.vhd')
getProject().addFile('data_link_lib',PROJECT_ROOT+'src/ip/fifo_dc_axis_to_custom/FIFO_DC_AXIS_S.vhd')
getProject().addFile('data_link_lib',PROJECT_ROOT+'src/module_data_link/data_crc_check.vhd')
getProject().addFile('data_link_lib',PROJECT_ROOT+'src/module_data_link/data_crc_compute.vhd')
getProject().addFile('data_link_lib',PROJECT_ROOT+'src/module_data_link/data_desencapsulation.vhd')
getProject().addFile('data_link_lib',PROJECT_ROOT+'src/module_data_link/data_desencapsulation_bc.vhd')
getProject().addFile('data_link_lib',PROJECT_ROOT+'src/module_data_link/data_encapsulation.vhd')
getProject().addFile('data_link_lib',PROJECT_ROOT+'src/module_data_link/data_err_management.vhd')
getProject().addFile('data_link_lib',PROJECT_ROOT+'src/module_data_link/data_in_bc_buf.vhd')
getProject().addFile('data_link_lib',PROJECT_ROOT+'src/module_data_link/data_in_buf.vhd')
getProject().addFile('data_link_lib',PROJECT_ROOT+'src/module_data_link/data_link_reset.vhd')
getProject().addFile('data_link_lib',PROJECT_ROOT+'src/module_data_link/data_mac.vhd')
getProject().addFile('data_link_lib',PROJECT_ROOT+'src/module_data_link/data_out_bc_buf.vhd')
getProject().addFile('data_link_lib',PROJECT_ROOT+'src/module_data_link/data_out_buf.vhd')
getProject().addFile('data_link_lib',PROJECT_ROOT+'src/module_data_link/data_seq_check.vhd')
getProject().addFile('data_link_lib',PROJECT_ROOT+'src/module_data_link/data_seq_compute.vhd')
getProject().addFile('data_link_lib',PROJECT_ROOT+'src/module_data_link/data_word_id_fsm.vhd')
getProject().addFile('data_link_lib',PROJECT_ROOT+'src/ip/fifo_dc/fifo_dc.vhd')
getProject().addFile('data_link_lib',PROJECT_ROOT+'src/ip/fifo_dc_drop_bad_frame/fifo_dc_drop_bad_frame.vhd')
getProject().addFile('data_link_lib',PROJECT_ROOT+'src/module_data_link/data_link.vhd')
getProject().addFile('data_link_lib',PROJECT_ROOT+'src/module_data_link/mib_data_link.vhd')

#Start compile Interlayer #######"
getProject().addFile('interlayer_lib',PROJECT_ROOT+'src/ip_spacefibre_light_top/demux_rx.vhd')
getProject().addFile('interlayer_lib',PROJECT_ROOT+'src/ip_spacefibre_light_top/mux_tx.vhd')

#compile top

getProject().addFile('work',PROJECT_ROOT+'src/ip_spacefibre_light_top/demux_rx.vhd')  
getProject().addFile('work',PROJECT_ROOT+'src/ip_spacefibre_light_top/mux_tx.vhd')
getProject().addFile('work',PROJECT_ROOT+'src/ip_spacefibre_light_top/reset_gen.vhd')  
getProject().addFile('work',PROJECT_ROOT+'src/ip_spacefibre_light_top/spacefibre_light_top_nano.vhd')  

getProject().addParameters({})
getProject().setDescription("")

getProject().setTopCellName("work", "spacefibre_light_top")

getProject().addParameter("G_VC_NUM", "8")
getProject().addParameter("G_TARGET",  "\"NG_ULTRA\"")
getProject().save("ultra.nym")
