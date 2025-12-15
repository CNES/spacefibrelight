
#check existence of global environnment path SPWF_ROOTPATH
if { [info exists env(SPWF_ROOTPATH)] } {
    #it exists do nothing
    puts "SPWF_ROOTPATH is set by user to $env(SPWF_ROOTPATH)"
} else {
    #set defaut value
    set env(SPWF_ROOTPATH) ../../../
    puts "SPWF_ROOTPATH is NOT set by user switch to default $env(SPWF_ROOTPATH)"
}
#########################################################################
#project parameters
#########################################################################
#main path of the spacefibrelight git projet
set proj_rootpath $env(SPWF_ROOTPATH)

# name of the xilinx project to generate
set proj_name starfire_loopback

#FPGA reference of the project
set proj_part xcve2802-vsvh1760-2mp-e-s

#add local baord proejct (to avoid missing installation or different version)
# be careful many parameters for versal are preset by the xilinx board file
set proj_boardpart xilinx.com:vek280:part0:1.2

##############################################################################
######These parameters are generated "automatically" do not edit if not needed
##############################################################################
#location  of the current test application
set proj_script_path $proj_rootpath/implementation/app/$proj_name

#vivado main project location
set proj_vivadowork $proj_rootpath/work/$proj_name

#custom IP repo for the application (thereis a symbolic link in it to reference spaefibrelight IP itself without copying sources)
set proj_vivadoiprepo $proj_rootpath/xilinx_ip
########################################################################

create_project -force -name $proj_name -dir $proj_vivadowork
set_property part $proj_part [current_project]
set_property target_language vhdl [current_project]
set_property "default_lib" "work" [current_project]

###SET IP repository####
#ip repo is set to main root path to get benefit from spacefibrelight xilinx IP folder
set_property ip_repo_paths $proj_vivadoiprepo [current_project]
update_ip_catalog 

####### configure board part #######
#load  board package from cnes local repo
set_param board.repoPaths [list "$proj_script_path/implementation/board/vek280/xilinxboardstore_vek280_2025.1"]
#verify presence of local board
get_board_parts *vek280*
set obj [current_project]
set_property -name "ip_cache_permissions" -value "read write" -objects $obj
set_property -name "simulator_language" -value "Mixed" -objects $obj
set_property -name "board_part" -value $proj_boardpart -objects $obj

# ---------------------------------------------------------------------
# sources
# ---------------------------------------------------------------------

#TOP implementation/app/traffic_generator/top_vek280.vhd
    set src_files [list \
        "$proj_script_path/top_vek280.vhd"\
        "$proj_rootpath/sim/models/data_link/data_link_configurator/data_link_configurator.vhd"\
        "$proj_rootpath/sim/models/lane/resync_double.vhd"\
        "$proj_rootpath/sim/models/lane/resync_double.vhd"\
        "$proj_rootpath/sim/models/data_link/data_link_analyzer/data_link_analyzer.vhd"\
        "$proj_rootpath/sim/models/data_link/data_link_generator/data_link_generator.vhd"\
        "$proj_rootpath/sim/models/lane/lane_analyzer/lane_analyzer.vhd"\
        "$proj_rootpath/sim/models/lane/lane_generator/lane_generator.vhd"\
        "$proj_rootpath/sim/benches/common/pkg_model.vhd"\
    ]
    add_files -norecurse  $src_files
    set_property top "top_vek280" [current_fileset]

#XDC
     set xdc_files [list \
         [list "$proj_script_path/VEK280_master.xdc"                     0 1 ] \
     ]

    # # add file to constraint fileset depending on their use (synthsys or implementation)
     foreach file $xdc_files {
         set file_obj [add_files -norecurse -fileset constrs_1 [lindex $file 0]]
         set_property "used_in_synthesis"      [lindex $file 1] $file_obj
         set_property "used_in_implementation" [lindex $file 2] $file_obj
     }
## create  buf_gt
#source $proj_rootpath/ip/cores/BufG_GT_bd.tcl
#make_wrapper -files [get_files $proj_vivadowork/vek280_traffic_gene/vek280_traffic_gene.srcs/sources_1/bd/BufG_GT_bd/BufG_GT_bd.bd] -top

# ---------------------------------------------------------------------
# Block design
# ---------------------------------------------------------------------
source $proj_script_path/design_1.tcl

close_project