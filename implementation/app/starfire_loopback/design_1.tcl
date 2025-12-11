
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2024.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   if { [string compare $scripts_vivado_version $current_vivado_version] > 0 } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2042 -severity "ERROR" " This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Sourcing the script failed since it was created with a future version of Vivado."}

   } else {
     catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   }

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# DATA_LINK_CONFIGURATOR, LANE_GENERATOR, LANE_ANALYZER

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcve2802-vsvh1760-2MP-e-S
   set_property BOARD_PART xilinx.com:vek280:part0:1.2 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:versal_cips:3.4\
CNES:user:spacefibrelight:0.1\
xilinx.com:ip:axi_noc:1.1\
xilinx.com:ip:xlconstant:1.1\
xilinx.com:ip:smartconnect:1.0\
xilinx.com:ip:proc_sys_reset:5.0\
xilinx.com:ip:axi_bram_ctrl:4.1\
xilinx.com:ip:emb_mem_gen:1.0\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\ 
DATA_LINK_CONFIGURATOR\
LANE_GENERATOR\
LANE_ANALYZER\
"

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: LANE_ANALYZER
proc create_hier_cell_LANE_ANALYZER { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_LANE_ANALYZER() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI


  # Create pins
  create_bd_pin -dir I -type clk clk_l
  create_bd_pin -dir I -type rst aresetn
  create_bd_pin -dir I -from 31 -to 0 DATA_RX
  create_bd_pin -dir I -from 3 -to 0 VALID_K_CHARAC_RX_PPL
  create_bd_pin -dir I FIFO_RX_EMPTY_PPL
  create_bd_pin -dir I FIFO_RX_DATA_VALID_PPL
  create_bd_pin -dir O FIFO_RX_RD_EN_PPL
  create_bd_pin -dir I -from 7 -to 0 FAR_END_CAPA_DL

  # Create instance: LANE_ANALYZER_0, and set properties
  set block_name LANE_ANALYZER
  set block_cell_name LANE_ANALYZER_0
  if { [catch {set LANE_ANALYZER_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $LANE_ANALYZER_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: smartconnect_0, and set properties
  set smartconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_0 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_0


  # Create interface connections
  connect_bd_intf_net -intf_net axi_noc_0_M04_AXI [get_bd_intf_pins S00_AXI] [get_bd_intf_pins smartconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net smartconnect_0_M00_AXI [get_bd_intf_pins LANE_ANALYZER_0/S_AXI] [get_bd_intf_pins smartconnect_0/M00_AXI]

  # Create port connections
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_RST_DUT_N [get_bd_pins aresetn] [get_bd_pins smartconnect_0/aresetn] [get_bd_pins LANE_ANALYZER_0/RST_N]
  connect_bd_net -net LANE_ANALYZER_0_FIFO_RX_RD_EN_PPL [get_bd_pins LANE_ANALYZER_0/FIFO_RX_RD_EN_PPL] [get_bd_pins FIFO_RX_RD_EN_PPL]
  connect_bd_net -net spacefibrelight_0_DATA_RX_SPY [get_bd_pins DATA_RX] [get_bd_pins LANE_ANALYZER_0/DATA_RX]
  connect_bd_net -net spacefibrelight_0_FAR_END_CAPA [get_bd_pins FAR_END_CAPA_DL] [get_bd_pins LANE_ANALYZER_0/FAR_END_CAPA_DL]
  connect_bd_net -net spacefibrelight_0_FIFO_RX_DATA_VALID_SPY [get_bd_pins FIFO_RX_DATA_VALID_PPL] [get_bd_pins LANE_ANALYZER_0/FIFO_RX_DATA_VALID_PPL]
  connect_bd_net -net spacefibrelight_0_FIFO_RX_EMPTY_SPY [get_bd_pins FIFO_RX_EMPTY_PPL] [get_bd_pins LANE_ANALYZER_0/FIFO_RX_EMPTY_PPL]
  connect_bd_net -net spacefibrelight_0_VALID_K_CHARAC_RX_SPY [get_bd_pins VALID_K_CHARAC_RX_PPL] [get_bd_pins LANE_ANALYZER_0/VALID_K_CHARAC_RX_PPL]
  connect_bd_net -net versal_cips_0_pl0_ref_clk [get_bd_pins clk_l] [get_bd_pins smartconnect_0/aclk] [get_bd_pins LANE_ANALYZER_0/CLK]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: LANE_GENERATOR
proc create_hier_cell_LANE_GENERATOR { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_LANE_GENERATOR() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI


  # Create pins
  create_bd_pin -dir I -type clk clk_l
  create_bd_pin -dir I -type rst reset_n
  create_bd_pin -dir O -from 31 -to 0 DATA_TX
  create_bd_pin -dir O NEW_DATA_TX_PPL
  create_bd_pin -dir I FIFO_TX_FULL_PPL
  create_bd_pin -dir O LANE_RESET_DL
  create_bd_pin -dir O -from 3 -to 0 VALID_K_CHARAC_TX_PPL
  create_bd_pin -dir O -from 7 -to 0 CAPABILITY_TX_PPL

  # Create instance: smartconnect_0, and set properties
  set smartconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_0 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_0


  # Create instance: LANE_GENERATOR_0, and set properties
  set block_name LANE_GENERATOR
  set block_cell_name LANE_GENERATOR_0
  if { [catch {set LANE_GENERATOR_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $LANE_GENERATOR_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create interface connections
  connect_bd_intf_net -intf_net axi_noc_0_M03_AXI [get_bd_intf_pins S00_AXI] [get_bd_intf_pins smartconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net smartconnect_0_M00_AXI [get_bd_intf_pins smartconnect_0/M00_AXI] [get_bd_intf_pins LANE_GENERATOR_0/S_AXI]

  # Create port connections
  connect_bd_net -net LANE_GENERATOR_0_CAPABILITY_TX_PPL [get_bd_pins LANE_GENERATOR_0/CAPABILITY_TX_PPL] [get_bd_pins CAPABILITY_TX_PPL]
  connect_bd_net -net LANE_GENERATOR_0_DATA_TX [get_bd_pins LANE_GENERATOR_0/DATA_TX] [get_bd_pins DATA_TX]
  connect_bd_net -net LANE_GENERATOR_0_LANE_RESET_DL [get_bd_pins LANE_GENERATOR_0/LANE_RESET_DL] [get_bd_pins LANE_RESET_DL]
  connect_bd_net -net LANE_GENERATOR_0_NEW_DATA_TX_PPL [get_bd_pins LANE_GENERATOR_0/NEW_DATA_TX_PPL] [get_bd_pins NEW_DATA_TX_PPL]
  connect_bd_net -net LANE_GENERATOR_0_VALID_K_CHARAC_TX_PPL [get_bd_pins LANE_GENERATOR_0/VALID_K_CHARAC_TX_PPL] [get_bd_pins VALID_K_CHARAC_TX_PPL]
  connect_bd_net -net reset_n_smartconnect_1 [get_bd_pins reset_n] [get_bd_pins smartconnect_0/aresetn] [get_bd_pins LANE_GENERATOR_0/RST_N]
  connect_bd_net -net spacefibrelight_0_FIFO_TX_FULL_INJ [get_bd_pins FIFO_TX_FULL_PPL] [get_bd_pins LANE_GENERATOR_0/FIFO_TX_FULL_PPL]
  connect_bd_net -net versal_cips_0_pl0_ref_clk [get_bd_pins clk_l] [get_bd_pins LANE_GENERATOR_0/CLK] [get_bd_pins smartconnect_0/aclk]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: DATALINK_CONFIGURATOR
proc create_hier_cell_DATALINK_CONFIGURATOR { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_DATALINK_CONFIGURATOR() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI


  # Create pins
  create_bd_pin -dir I -type clk clk_l
  create_bd_pin -dir I -type rst reset_n
  create_bd_pin -dir I CLK_TX
  create_bd_pin -dir I RST_TXCLK_N
  create_bd_pin -dir O -type rst INTERFACE_RST
  create_bd_pin -dir O -type rst LINK_RST
  create_bd_pin -dir O NACK_RST_EN
  create_bd_pin -dir O NACK_RST_MODE
  create_bd_pin -dir O -from 8 -to 0 PAUSE_VC
  create_bd_pin -dir O -from 7 -to 0 CONTINUOUS_VC
  create_bd_pin -dir O LANE_START
  create_bd_pin -dir O AUTOSTART
  create_bd_pin -dir O -type rst LANE_RESET
  create_bd_pin -dir O PARALLEL_LOOPBACK_EN
  create_bd_pin -dir O -from 7 -to 0 STANDBY_REASON
  create_bd_pin -dir O NEAR_END_SERIAL_LB_EN
  create_bd_pin -dir O FAR_END_SERIAL_LB_EN
  create_bd_pin -dir I -from 7 -to 0 VC_CREDIT
  create_bd_pin -dir I -from 7 -to 0 FCT_CREDIT_OVERFLOW
  create_bd_pin -dir I CRC_LONG_ERROR
  create_bd_pin -dir I CRC_SHORT_ERROR
  create_bd_pin -dir I FRAME_ERROR
  create_bd_pin -dir I SEQ_ERROR
  create_bd_pin -dir I -type rst FAR_END_LINK_RST
  create_bd_pin -dir I -from 7 -to 0 SEQ_NUMBER_TX
  create_bd_pin -dir I -from 7 -to 0 SEQ_NUMBER_RX
  create_bd_pin -dir I -from 7 -to 0 INPUT_BUFFER_OVFL
  create_bd_pin -dir I -from 8 -to 0 FRAME_TX
  create_bd_pin -dir I -from 8 -to 0 FRAME_FINISHED
  create_bd_pin -dir I -from 6 -to 0 DATA_CNT_TX
  create_bd_pin -dir I -from 6 -to 0 DATA_CNT_RX
  create_bd_pin -dir I -from 2 -to 0 ACK_COUNTER_TX
  create_bd_pin -dir I -from 2 -to 0 NACK_COUNTER_TX
  create_bd_pin -dir I -from 3 -to 0 FCT_COUNTER_TX
  create_bd_pin -dir I -from 2 -to 0 ACK_COUNTER_RX
  create_bd_pin -dir I -from 2 -to 0 NACK_COUNTER_RX
  create_bd_pin -dir I -from 3 -to 0 FCT_COUNTER_RX
  create_bd_pin -dir I -from 1 -to 0 FULL_COUNTER_RX
  create_bd_pin -dir I -from 1 -to 0 RETRY_COUNTER_RX
  create_bd_pin -dir I -from 7 -to 0 CURRENT_TIME_SLOT
  create_bd_pin -dir I LINK_RST_ASSERTED
  create_bd_pin -dir I -from 7 -to 0 ACK_SEQ_NUM
  create_bd_pin -dir I -from 7 -to 0 NACK_SEQ_NUM
  create_bd_pin -dir I -from 3 -to 0 LANE_STATE
  create_bd_pin -dir I -from 7 -to 0 RX_ERROR_CNT
  create_bd_pin -dir I RX_ERROR_OVF
  create_bd_pin -dir I LOSS_SIGNAL
  create_bd_pin -dir I -from 7 -to 0 FAR_END_CAPA
  create_bd_pin -dir I RX_POLARITY
  create_bd_pin -dir O RST_DUT_N
  create_bd_pin -dir O DL_EN
  create_bd_pin -dir O LANE_SPY_EN
  create_bd_pin -dir I -type rst RESET_PARAM_DL

  # Create instance: smartconnect_1, and set properties
  set smartconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_1 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_1


  # Create instance: DATA_LINK_CONFIGURAT_0, and set properties
  set block_name DATA_LINK_CONFIGURATOR
  set block_cell_name DATA_LINK_CONFIGURAT_0
  if { [catch {set DATA_LINK_CONFIGURAT_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $DATA_LINK_CONFIGURAT_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create interface connections
  connect_bd_intf_net -intf_net axi_noc_0_M02_AXI [get_bd_intf_pins S00_AXI] [get_bd_intf_pins smartconnect_1/S00_AXI]
  connect_bd_intf_net -intf_net smartconnect_1_M00_AXI [get_bd_intf_pins DATA_LINK_CONFIGURAT_0/S_AXI] [get_bd_intf_pins smartconnect_1/M00_AXI]

  # Create port connections
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_AUTOSTART [get_bd_pins DATA_LINK_CONFIGURAT_0/AUTOSTART] [get_bd_pins AUTOSTART]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_CONTINUOUS_VC [get_bd_pins DATA_LINK_CONFIGURAT_0/CONTINUOUS_VC] [get_bd_pins CONTINUOUS_VC]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_DL_EN [get_bd_pins DATA_LINK_CONFIGURAT_0/DL_EN] [get_bd_pins DL_EN]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_FAR_END_SERIAL_LB_EN [get_bd_pins DATA_LINK_CONFIGURAT_0/FAR_END_SERIAL_LB_EN] [get_bd_pins FAR_END_SERIAL_LB_EN]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_INTERFACE_RST [get_bd_pins DATA_LINK_CONFIGURAT_0/INTERFACE_RST] [get_bd_pins INTERFACE_RST]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_LANE_RESET [get_bd_pins DATA_LINK_CONFIGURAT_0/LANE_RESET] [get_bd_pins LANE_RESET]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_LANE_SPY_EN [get_bd_pins DATA_LINK_CONFIGURAT_0/LANE_SPY_EN] [get_bd_pins LANE_SPY_EN]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_LANE_START [get_bd_pins DATA_LINK_CONFIGURAT_0/LANE_START] [get_bd_pins LANE_START]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_LINK_RST [get_bd_pins DATA_LINK_CONFIGURAT_0/LINK_RST] [get_bd_pins LINK_RST]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_NACK_RST_EN [get_bd_pins DATA_LINK_CONFIGURAT_0/NACK_RST_EN] [get_bd_pins NACK_RST_EN]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_NACK_RST_MODE [get_bd_pins DATA_LINK_CONFIGURAT_0/NACK_RST_MODE] [get_bd_pins NACK_RST_MODE]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_NEAR_END_SERIAL_LB_EN [get_bd_pins DATA_LINK_CONFIGURAT_0/NEAR_END_SERIAL_LB_EN] [get_bd_pins NEAR_END_SERIAL_LB_EN]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_PARALLEL_LOOPBACK_EN [get_bd_pins DATA_LINK_CONFIGURAT_0/PARALLEL_LOOPBACK_EN] [get_bd_pins PARALLEL_LOOPBACK_EN]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_PAUSE_VC [get_bd_pins DATA_LINK_CONFIGURAT_0/PAUSE_VC] [get_bd_pins PAUSE_VC]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_RST_DUT_N [get_bd_pins DATA_LINK_CONFIGURAT_0/RST_DUT_N] [get_bd_pins RST_DUT_N]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_STANDBY_REASON [get_bd_pins DATA_LINK_CONFIGURAT_0/STANDBY_REASON] [get_bd_pins STANDBY_REASON]
  connect_bd_net -net reset_n_fpga_1 [get_bd_pins reset_n] [get_bd_pins smartconnect_1/aresetn] [get_bd_pins DATA_LINK_CONFIGURAT_0/RST_N_DL] [get_bd_pins DATA_LINK_CONFIGURAT_0/RST_N]
  connect_bd_net -net spacefibrelight_0_ACK_COUNTER_RX [get_bd_pins ACK_COUNTER_RX] [get_bd_pins DATA_LINK_CONFIGURAT_0/ACK_COUNTER_RX]
  connect_bd_net -net spacefibrelight_0_ACK_COUNTER_TX [get_bd_pins ACK_COUNTER_TX] [get_bd_pins DATA_LINK_CONFIGURAT_0/ACK_COUNTER_TX]
  connect_bd_net -net spacefibrelight_0_ACK_SEQ_NUM [get_bd_pins ACK_SEQ_NUM] [get_bd_pins DATA_LINK_CONFIGURAT_0/ACK_SEQ_NUM]
  connect_bd_net -net spacefibrelight_0_CLK_TX [get_bd_pins CLK_TX] [get_bd_pins DATA_LINK_CONFIGURAT_0/CLK_TX]
  connect_bd_net -net spacefibrelight_0_CRC_LONG_ERROR [get_bd_pins CRC_LONG_ERROR] [get_bd_pins DATA_LINK_CONFIGURAT_0/CRC_LONG_ERROR]
  connect_bd_net -net spacefibrelight_0_CRC_SHORT_ERROR [get_bd_pins CRC_SHORT_ERROR] [get_bd_pins DATA_LINK_CONFIGURAT_0/CRC_SHORT_ERROR]
  connect_bd_net -net spacefibrelight_0_CREDIT_VC [get_bd_pins VC_CREDIT] [get_bd_pins DATA_LINK_CONFIGURAT_0/VC_CREDIT]
  connect_bd_net -net spacefibrelight_0_CURRENT_TIME_SLOT [get_bd_pins CURRENT_TIME_SLOT] [get_bd_pins DATA_LINK_CONFIGURAT_0/CURRENT_TIME_SLOT]
  connect_bd_net -net spacefibrelight_0_DATA_COUNTER_RX [get_bd_pins DATA_CNT_RX] [get_bd_pins DATA_LINK_CONFIGURAT_0/DATA_CNT_RX]
  connect_bd_net -net spacefibrelight_0_DATA_COUNTER_TX [get_bd_pins DATA_CNT_TX] [get_bd_pins DATA_LINK_CONFIGURAT_0/DATA_CNT_TX]
  connect_bd_net -net spacefibrelight_0_FAR_END_CAPA [get_bd_pins FAR_END_CAPA] [get_bd_pins DATA_LINK_CONFIGURAT_0/FAR_END_CAPA]
  connect_bd_net -net spacefibrelight_0_FAR_END_LINK_RESET [get_bd_pins FAR_END_LINK_RST] [get_bd_pins DATA_LINK_CONFIGURAT_0/FAR_END_LINK_RST]
  connect_bd_net -net spacefibrelight_0_FCT_COUNTER_RX [get_bd_pins FCT_COUNTER_RX] [get_bd_pins DATA_LINK_CONFIGURAT_0/FCT_COUNTER_RX]
  connect_bd_net -net spacefibrelight_0_FCT_COUNTER_TX [get_bd_pins FCT_COUNTER_TX] [get_bd_pins DATA_LINK_CONFIGURAT_0/FCT_COUNTER_TX]
  connect_bd_net -net spacefibrelight_0_FCT_CREDIT_OVERFLOW [get_bd_pins FCT_CREDIT_OVERFLOW] [get_bd_pins DATA_LINK_CONFIGURAT_0/FCT_CREDIT_OVERFLOW]
  connect_bd_net -net spacefibrelight_0_FRAME_ERROR [get_bd_pins FRAME_ERROR] [get_bd_pins DATA_LINK_CONFIGURAT_0/FRAME_ERROR]
  connect_bd_net -net spacefibrelight_0_FRAME_FINISHED [get_bd_pins FRAME_FINISHED] [get_bd_pins DATA_LINK_CONFIGURAT_0/FRAME_FINISHED]
  connect_bd_net -net spacefibrelight_0_FRAME_TX [get_bd_pins FRAME_TX] [get_bd_pins DATA_LINK_CONFIGURAT_0/FRAME_TX]
  connect_bd_net -net spacefibrelight_0_FULL_COUNTER_RX [get_bd_pins FULL_COUNTER_RX] [get_bd_pins DATA_LINK_CONFIGURAT_0/FULL_COUNTER_RX]
  connect_bd_net -net spacefibrelight_0_INPUT_BUF_OVF_VC [get_bd_pins INPUT_BUFFER_OVFL] [get_bd_pins DATA_LINK_CONFIGURAT_0/INPUT_BUFFER_OVFL]
  connect_bd_net -net spacefibrelight_0_LANE_STATE [get_bd_pins LANE_STATE] [get_bd_pins DATA_LINK_CONFIGURAT_0/LANE_STATE]
  connect_bd_net -net spacefibrelight_0_LINK_RST_ASSERTED [get_bd_pins LINK_RST_ASSERTED] [get_bd_pins DATA_LINK_CONFIGURAT_0/LINK_RST_ASSERTED]
  connect_bd_net -net spacefibrelight_0_LOSS_SIGNAL [get_bd_pins LOSS_SIGNAL] [get_bd_pins DATA_LINK_CONFIGURAT_0/LOSS_SIGNAL]
  connect_bd_net -net spacefibrelight_0_NACK_COUNTER_RX [get_bd_pins NACK_COUNTER_RX] [get_bd_pins DATA_LINK_CONFIGURAT_0/NACK_COUNTER_RX]
  connect_bd_net -net spacefibrelight_0_NACK_COUNTER_TX [get_bd_pins NACK_COUNTER_TX] [get_bd_pins DATA_LINK_CONFIGURAT_0/NACK_COUNTER_TX]
  connect_bd_net -net spacefibrelight_0_NACK_SEQ_NUM [get_bd_pins NACK_SEQ_NUM] [get_bd_pins DATA_LINK_CONFIGURAT_0/NACK_SEQ_NUM]
  connect_bd_net -net spacefibrelight_0_RESET_PARAM [get_bd_pins RESET_PARAM_DL] [get_bd_pins DATA_LINK_CONFIGURAT_0/RESET_PARAM_DL]
  connect_bd_net -net spacefibrelight_0_RETRY_COUNTER_RX [get_bd_pins RETRY_COUNTER_RX] [get_bd_pins DATA_LINK_CONFIGURAT_0/RETRY_COUNTER_RX]
  connect_bd_net -net spacefibrelight_0_RST_TXCLK_N [get_bd_pins RST_TXCLK_N] [get_bd_pins DATA_LINK_CONFIGURAT_0/RST_TXCLK_N]
  connect_bd_net -net spacefibrelight_0_RX_ERROR_CNT [get_bd_pins RX_ERROR_CNT] [get_bd_pins DATA_LINK_CONFIGURAT_0/RX_ERROR_CNT]
  connect_bd_net -net spacefibrelight_0_RX_ERROR_OVF [get_bd_pins RX_ERROR_OVF] [get_bd_pins DATA_LINK_CONFIGURAT_0/RX_ERROR_OVF]
  connect_bd_net -net spacefibrelight_0_RX_POLARITY [get_bd_pins RX_POLARITY] [get_bd_pins DATA_LINK_CONFIGURAT_0/RX_POLARITY]
  connect_bd_net -net spacefibrelight_0_SEQUENCE_ERROR [get_bd_pins SEQ_ERROR] [get_bd_pins DATA_LINK_CONFIGURAT_0/SEQ_ERROR]
  connect_bd_net -net spacefibrelight_0_SEQ_NUMBER_RX [get_bd_pins SEQ_NUMBER_RX] [get_bd_pins DATA_LINK_CONFIGURAT_0/SEQ_NUMBER_RX]
  connect_bd_net -net spacefibrelight_0_SEQ_NUMBER_TX [get_bd_pins SEQ_NUMBER_TX] [get_bd_pins DATA_LINK_CONFIGURAT_0/SEQ_NUMBER_TX]
  connect_bd_net -net versal_cips_0_pl0_ref_clk [get_bd_pins clk_l] [get_bd_pins DATA_LINK_CONFIGURAT_0/CLK] [get_bd_pins DATA_LINK_CONFIGURAT_0/CLK_DL] [get_bd_pins smartconnect_1/aclk]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set ch0_lpddr4_trip1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:lpddr4_rtl:1.0 ch0_lpddr4_trip1 ]

  set ch1_lpddr4_trip1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:lpddr4_rtl:1.0 ch1_lpddr4_trip1 ]

  set lpddr4_clk1 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 lpddr4_clk1 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {200000000} \
   ] $lpddr4_clk1


  # Create ports
  set clk_l [ create_bd_port -dir O clk_l ]
  set reset_n_fpga [ create_bd_port -dir O -from 0 -to 0 reset_n_fpga ]
  set CLK_GTY_0 [ create_bd_port -dir I CLK_GTY_0 ]
  set RX_POS_0 [ create_bd_port -dir I RX_POS_0 ]
  set RX_NEG_0 [ create_bd_port -dir I RX_NEG_0 ]
  set TX_POS_0 [ create_bd_port -dir O TX_POS_0 ]
  set TX_NEG_0 [ create_bd_port -dir O TX_NEG_0 ]
  set reset [ create_bd_port -dir I -type rst reset ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $reset

  # Create instance: versal_cips_0, and set properties
  set versal_cips_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:versal_cips:3.4 versal_cips_0 ]
  set_property -dict [list \
    CONFIG.BOOT_MODE {Custom} \
    CONFIG.CLOCK_MODE {Custom} \
    CONFIG.DDR_MEMORY_MODE {Enable} \
    CONFIG.DEBUG_MODE {JTAG} \
    CONFIG.DESIGN_MODE {1} \
    CONFIG.IO_CONFIG_MODE {Custom} \
    CONFIG.PS_BOARD_INTERFACE {ps_pmc_fixed_io} \
    CONFIG.PS_PL_CONNECTIVITY_MODE {Custom} \
    CONFIG.PS_PMC_CONFIG { \
      BOOT_MODE {Custom} \
      CLOCK_MODE {Custom} \
      DDR_MEMORY_MODE {Connectivity to DDR via NOC} \
      DEBUG_MODE {JTAG} \
      DESIGN_MODE {1} \
      DEVICE_INTEGRITY_MODE {Sysmon temperature voltage and external IO monitoring} \
      IO_CONFIG_MODE {Custom} \
      PMC_ALT_REF_CLK_FREQMHZ {33.333} \
      PMC_CRP_EFUSE_REF_CTRL_SRCSEL {IRO_CLK/4} \
      PMC_CRP_HSM0_REF_CTRL_FREQMHZ {33.333} \
      PMC_CRP_HSM1_REF_CTRL_FREQMHZ {133.333} \
      PMC_CRP_LSBUS_REF_CTRL_FREQMHZ {100} \
      PMC_CRP_NOC_REF_CTRL_FREQMHZ {960} \
      PMC_CRP_PL0_REF_CTRL_FREQMHZ {334} \
      PMC_CRP_PL2_REF_CTRL_FREQMHZ {150} \
      PMC_CRP_PL5_REF_CTRL_FREQMHZ {400} \
      PMC_GPIO0_MIO_PERIPHERAL {{ENABLE 1} {IO {PMC_MIO 0 .. 25}}} \
      PMC_GPIO1_MIO_PERIPHERAL {{ENABLE 1} {IO {PMC_MIO 26 .. 51}}} \
      PMC_MIO12 {{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL pullup} {SCHMITT 0} {SLEW slow} {USAGE GPIO}} \
      PMC_MIO37 {{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA high} {PULL pullup} {SCHMITT 0} {SLEW slow} {USAGE GPIO}} \
      PMC_MIO38 {{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA high} {PULL pullup} {SCHMITT 0} {SLEW slow} {USAGE GPIO}} \
      PMC_OSPI_PERIPHERAL {{ENABLE 1} {IO {PMC_MIO 0 .. 11}} {MODE Single}} \
      PMC_PL_ALT_REF_CLK_FREQMHZ {33.333} \
      PMC_QSPI_PERIPHERAL_ENABLE {0} \
      PMC_REF_CLK_FREQMHZ {33.3333} \
      PMC_SD1 {{CD_ENABLE 1} {CD_IO {PMC_MIO 28}} {POW_ENABLE 1} {POW_IO {PMC_MIO 51}} {RESET_ENABLE 0} {RESET_IO {PMC_MIO 12}} {WP_ENABLE 0} {WP_IO {PMC_MIO 1}}} \
      PMC_SD1_PERIPHERAL {{CLK_100_SDR_OTAP_DLY 0x3} {CLK_200_SDR_OTAP_DLY 0x2} {CLK_50_DDR_ITAP_DLY 0x36} {CLK_50_DDR_OTAP_DLY 0x3} {CLK_50_SDR_ITAP_DLY 0x2C} {CLK_50_SDR_OTAP_DLY 0x4} {ENABLE 1} {IO\
{PMC_MIO 26 .. 36}}} \
      PMC_SD1_SLOT_TYPE {SD 3.0} \
      PMC_USE_PMC_NOC_AXI0 {1} \
      PS_BOARD_INTERFACE {ps_pmc_fixed_io} \
      PS_CAN0_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 14 .. 15}}} \
      PS_CAN1_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 16 .. 17}}} \
      PS_CRL_CAN0_REF_CTRL_FREQMHZ {160} \
      PS_CRL_CAN1_REF_CTRL_FREQMHZ {160} \
      PS_ENET0_MDIO {{ENABLE 1} {IO {PS_MIO 24 .. 25}}} \
      PS_ENET0_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 0 .. 11}}} \
      PS_ENET1_PERIPHERAL {{ENABLE 0} {IO {PMC_MIO 38 .. 49}}} \
      PS_GEN_IPI0_ENABLE {1} \
      PS_GEN_IPI0_MASTER {A72} \
      PS_GEN_IPI1_ENABLE {1} \
      PS_GEN_IPI2_ENABLE {1} \
      PS_GEN_IPI3_ENABLE {1} \
      PS_GEN_IPI4_ENABLE {1} \
      PS_GEN_IPI5_ENABLE {1} \
      PS_GEN_IPI6_ENABLE {1} \
      PS_HSDP_EGRESS_TRAFFIC {JTAG} \
      PS_HSDP_INGRESS_TRAFFIC {JTAG} \
      PS_HSDP_MODE {NONE} \
      PS_I2C0_PERIPHERAL {{ENABLE 1} {IO {PMC_MIO 46 .. 47}}} \
      PS_I2C1_PERIPHERAL {{ENABLE 1} {IO {PMC_MIO 44 .. 45}}} \
      PS_I2CSYSMON_PERIPHERAL {{ENABLE 0} {IO {PMC_MIO 39 .. 40}}} \
      PS_MIO7 {{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL disable} {SCHMITT 0} {SLEW slow} {USAGE Reserved}} \
      PS_MIO9 {{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL disable} {SCHMITT 0} {SLEW slow} {USAGE Reserved}} \
      PS_M_AXI_LPD_DATA_WIDTH {128} \
      PS_NUM_FABRIC_RESETS {0} \
      PS_PCIE_EP_RESET1_IO {PS_MIO 18} \
      PS_PCIE_EP_RESET2_IO {PS_MIO 19} \
      PS_PCIE_RESET {ENABLE 1} \
      PS_PL_CONNECTIVITY_MODE {Custom} \
      PS_UART0_PERIPHERAL {{ENABLE 1} {IO {PMC_MIO 42 .. 43}}} \
      PS_UART1_PERIPHERAL {{ENABLE 0} {IO {PMC_MIO 4 .. 5}}} \
      PS_USB3_PERIPHERAL {{ENABLE 1} {IO {PMC_MIO 13 .. 25}}} \
      PS_USE_FPD_AXI_NOC0 {0} \
      PS_USE_FPD_AXI_NOC1 {0} \
      PS_USE_FPD_CCI_NOC {1} \
      PS_USE_FPD_CCI_NOC0 {1} \
      PS_USE_M_AXI_FPD {0} \
      PS_USE_M_AXI_LPD {1} \
      PS_USE_NOC_LPD_AXI0 {1} \
      PS_USE_PMCPL_CLK0 {0} \
      PS_USE_PMCPL_CLK1 {0} \
      PS_USE_PMCPL_CLK2 {1} \
      PS_USE_PMCPL_IRO_CLK {0} \
      PS_USE_S_AXI_FPD {0} \
      PS_USE_S_AXI_LPD {0} \
      SMON_ALARMS {Set_Alarms_On} \
      SMON_ENABLE_TEMP_AVERAGING {0} \
      SMON_INTERFACE_TO_USE {I2C} \
      SMON_PMBUS_ADDRESS {0x18} \
      SMON_TEMP_AVERAGING_SAMPLES {0} \
    } \
  ] $versal_cips_0


  # Create instance: spacefibrelight_0, and set properties
  set spacefibrelight_0 [ create_bd_cell -type ip -vlnv CNES:user:spacefibrelight:0.1 spacefibrelight_0 ]

  # Create instance: axi_noc_0, and set properties
  set axi_noc_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_noc:1.1 axi_noc_0 ]
  set_property -dict [list \
    CONFIG.CH0_LPDDR4_0_BOARD_INTERFACE {ch0_lpddr4_trip1} \
    CONFIG.CH1_LPDDR4_0_BOARD_INTERFACE {ch1_lpddr4_trip1} \
    CONFIG.MC2_FLIPPED_PINOUT {true} \
    CONFIG.MC_CHANNEL_INTERLEAVING {true} \
    CONFIG.MC_CHAN_REGION1 {DDR_LOW1} \
    CONFIG.MC_EN_INTR_RESP {TRUE} \
    CONFIG.MC_LP4_OVERWRITE_IO_PROP {true} \
    CONFIG.MC_LP4_PIN_EFFICIENT {true} \
    CONFIG.MC_SYSTEM_CLOCK {Differential} \
    CONFIG.NUM_CLKS {7} \
    CONFIG.NUM_MC {1} \
    CONFIG.NUM_MCP {4} \
    CONFIG.NUM_MI {0} \
    CONFIG.NUM_SI {6} \
    CONFIG.sys_clk0_BOARD_INTERFACE {lpddr4_clk1} \
  ] $axi_noc_0


  set_property -dict [ list \
   CONFIG.REGION {0} \
   CONFIG.CONNECTIONS {MC_3 {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {M03_AXI:0x100:M04_AXI:0x40:M01_AXI:0x80:M02_AXI:0xc0:M00_AXI:0x0} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {ps_cci} \
 ] [get_bd_intf_pins /axi_noc_0/S00_AXI]

  set_property -dict [ list \
   CONFIG.REGION {0} \
   CONFIG.CONNECTIONS {MC_2 {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {ps_cci} \
 ] [get_bd_intf_pins /axi_noc_0/S01_AXI]

  set_property -dict [ list \
   CONFIG.REGION {0} \
   CONFIG.CONNECTIONS {MC_0 {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {ps_cci} \
 ] [get_bd_intf_pins /axi_noc_0/S02_AXI]

  set_property -dict [ list \
   CONFIG.REGION {0} \
   CONFIG.CONNECTIONS {MC_1 {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {ps_cci} \
 ] [get_bd_intf_pins /axi_noc_0/S03_AXI]

  set_property -dict [ list \
   CONFIG.REGION {0} \
   CONFIG.CONNECTIONS {MC_3 {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.DEST_IDS {M00_AXI:0x0} \
   CONFIG.REMAPS {} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {ps_rpu} \
 ] [get_bd_intf_pins /axi_noc_0/S04_AXI]

  set_property -dict [ list \
   CONFIG.REGION {0} \
   CONFIG.CONNECTIONS {MC_2 {read_bw {100} write_bw {100} read_avg_burst {4} write_avg_burst {4}}} \
   CONFIG.NOC_PARAMS {} \
   CONFIG.CATEGORY {ps_pmc} \
 ] [get_bd_intf_pins /axi_noc_0/S05_AXI]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S00_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk0]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S01_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk1]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S02_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk2]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S03_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk3]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S04_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk4]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S05_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk5]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {} \
 ] [get_bd_pins /axi_noc_0/aclk6]

  # Create instance: DATALINK_CONFIGURATOR
  create_hier_cell_DATALINK_CONFIGURATOR [current_bd_instance .] DATALINK_CONFIGURATOR

  # Create instance: LANE_GENERATOR
  create_hier_cell_LANE_GENERATOR [current_bd_instance .] LANE_GENERATOR

  # Create instance: LANE_ANALYZER
  create_hier_cell_LANE_ANALYZER [current_bd_instance .] LANE_ANALYZER

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [list \
    CONFIG.CONST_VAL {0} \
    CONFIG.CONST_WIDTH {8} \
  ] $xlconstant_0


  # Create instance: smartconnect_0, and set properties
  set smartconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_0 ]
  set_property -dict [list \
    CONFIG.NUM_CLKS {1} \
    CONFIG.NUM_MI {4} \
    CONFIG.NUM_SI {1} \
  ] $smartconnect_0


  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]
  set_property CONFIG.C_EXT_RST_WIDTH {1} $proc_sys_reset_0


  # Create instance: axi_bram_ctrl_0, and set properties
  set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_0 ]
  set_property -dict [list \
    CONFIG.PROTOCOL {AXI4LITE} \
    CONFIG.SINGLE_PORT_BRAM {1} \
  ] $axi_bram_ctrl_0


  # Create instance: scratchpad_bram, and set properties
  set scratchpad_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:emb_mem_gen:1.0 scratchpad_bram ]

  # Create interface connections
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_pins LANE_GENERATOR/S00_AXI] [get_bd_intf_pins smartconnect_0/M01_AXI]
  connect_bd_intf_net -intf_net S00_AXI_2 [get_bd_intf_pins DATALINK_CONFIGURATOR/S00_AXI] [get_bd_intf_pins smartconnect_0/M02_AXI]
  connect_bd_intf_net -intf_net S00_AXI_3 [get_bd_intf_pins LANE_ANALYZER/S00_AXI] [get_bd_intf_pins smartconnect_0/M03_AXI]
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTA [get_bd_intf_pins scratchpad_bram/BRAM_PORTA] [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_noc_0_CH0_LPDDR4_0 [get_bd_intf_ports ch0_lpddr4_trip1] [get_bd_intf_pins axi_noc_0/CH0_LPDDR4_0]
  connect_bd_intf_net -intf_net axi_noc_0_CH1_LPDDR4_0 [get_bd_intf_ports ch1_lpddr4_trip1] [get_bd_intf_pins axi_noc_0/CH1_LPDDR4_0]
  connect_bd_intf_net -intf_net lpddr4_clk1_1 [get_bd_intf_ports lpddr4_clk1] [get_bd_intf_pins axi_noc_0/sys_clk0]
  connect_bd_intf_net -intf_net smartconnect_0_M00_AXI [get_bd_intf_pins smartconnect_0/M00_AXI] [get_bd_intf_pins axi_bram_ctrl_0/S_AXI]
  connect_bd_intf_net -intf_net spacefibrelight_0_AXIS_VC0_RX_DL [get_bd_intf_pins spacefibrelight_0/AXIS_VC0_TX_DL] [get_bd_intf_pins spacefibrelight_0/AXIS_VC0_RX_DL]
  connect_bd_intf_net -intf_net spacefibrelight_0_AXIS_VC1_RX_DL [get_bd_intf_pins spacefibrelight_0/AXIS_VC1_RX_DL] [get_bd_intf_pins spacefibrelight_0/AXIS_VC1_TX_DL]
  connect_bd_intf_net -intf_net spacefibrelight_0_AXIS_VC2_RX_DL [get_bd_intf_pins spacefibrelight_0/AXIS_VC2_RX_DL] [get_bd_intf_pins spacefibrelight_0/AXIS_VC2_TX_DL]
  connect_bd_intf_net -intf_net spacefibrelight_0_AXIS_VC3_RX_DL [get_bd_intf_pins spacefibrelight_0/AXIS_VC3_RX_DL] [get_bd_intf_pins spacefibrelight_0/AXIS_VC3_TX_DL]
  connect_bd_intf_net -intf_net spacefibrelight_0_AXIS_VC4_RX_DL [get_bd_intf_pins spacefibrelight_0/AXIS_VC4_RX_DL] [get_bd_intf_pins spacefibrelight_0/AXIS_VC4_TX_DL]
  connect_bd_intf_net -intf_net spacefibrelight_0_AXIS_VC5_RX_DL [get_bd_intf_pins spacefibrelight_0/AXIS_VC5_RX_DL] [get_bd_intf_pins spacefibrelight_0/AXIS_VC5_TX_DL]
  connect_bd_intf_net -intf_net spacefibrelight_0_AXIS_VC6_RX_DL [get_bd_intf_pins spacefibrelight_0/AXIS_VC6_RX_DL] [get_bd_intf_pins spacefibrelight_0/AXIS_VC6_TX_DL]
  connect_bd_intf_net -intf_net spacefibrelight_0_AXIS_VC7_RX_DL [get_bd_intf_pins spacefibrelight_0/AXIS_VC7_RX_DL] [get_bd_intf_pins spacefibrelight_0/AXIS_VC7_TX_DL]
  connect_bd_intf_net -intf_net spacefibrelight_0_AXIS_VC8_RX_DL [get_bd_intf_pins spacefibrelight_0/AXIS_VC8_RX_DL] [get_bd_intf_pins spacefibrelight_0/AXIS_VC8_TX_DL]
  connect_bd_intf_net -intf_net versal_cips_0_FPD_CCI_NOC_0 [get_bd_intf_pins versal_cips_0/FPD_CCI_NOC_0] [get_bd_intf_pins axi_noc_0/S00_AXI]
  connect_bd_intf_net -intf_net versal_cips_0_FPD_CCI_NOC_1 [get_bd_intf_pins versal_cips_0/FPD_CCI_NOC_1] [get_bd_intf_pins axi_noc_0/S01_AXI]
  connect_bd_intf_net -intf_net versal_cips_0_FPD_CCI_NOC_2 [get_bd_intf_pins versal_cips_0/FPD_CCI_NOC_2] [get_bd_intf_pins axi_noc_0/S02_AXI]
  connect_bd_intf_net -intf_net versal_cips_0_FPD_CCI_NOC_3 [get_bd_intf_pins versal_cips_0/FPD_CCI_NOC_3] [get_bd_intf_pins axi_noc_0/S03_AXI]
  connect_bd_intf_net -intf_net versal_cips_0_LPD_AXI_NOC_0 [get_bd_intf_pins versal_cips_0/LPD_AXI_NOC_0] [get_bd_intf_pins axi_noc_0/S04_AXI]
  connect_bd_intf_net -intf_net versal_cips_0_M_AXI_LPD [get_bd_intf_pins versal_cips_0/M_AXI_LPD] [get_bd_intf_pins smartconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net versal_cips_0_PMC_NOC_AXI_0 [get_bd_intf_pins versal_cips_0/PMC_NOC_AXI_0] [get_bd_intf_pins axi_noc_0/S05_AXI]

  # Create port connections
  connect_bd_net -net CLK_GTY_0_1 [get_bd_ports CLK_GTY_0] [get_bd_pins spacefibrelight_0/CLK_GTY]
  connect_bd_net -net DATALINK_CONFIGURATOR_RST_DUT_N [get_bd_pins DATALINK_CONFIGURATOR/RST_DUT_N] [get_bd_pins spacefibrelight_0/RST_N] [get_bd_pins spacefibrelight_0/AXIS_VC3_TX_DL_RSTN] [get_bd_pins spacefibrelight_0/AXIS_VC0_RX_DL_RSTN] [get_bd_pins spacefibrelight_0/AXIS_VC1_RX_DL_RSTN] [get_bd_pins spacefibrelight_0/AXIS_VC1_TX_DL_RSTN] [get_bd_pins spacefibrelight_0/AXIS_VC2_RX_DL_RSTN] [get_bd_pins spacefibrelight_0/AXIS_VC3_RX_DL_RSTN] [get_bd_pins spacefibrelight_0/AXIS_VC4_RX_DL_RSTN] [get_bd_pins spacefibrelight_0/AXIS_VC5_RX_DL_RSTN] [get_bd_pins spacefibrelight_0/AXIS_VC6_RX_DL_RSTN] [get_bd_pins spacefibrelight_0/AXIS_VC7_RX_DL_RSTN] [get_bd_pins spacefibrelight_0/AXIS_VC8_RX_DL_RSTN] [get_bd_pins spacefibrelight_0/AXIS_VC0_TX_DL_RSTN] [get_bd_pins spacefibrelight_0/AXIS_VC2_TX_DL_RSTN] [get_bd_pins spacefibrelight_0/AXIS_VC4_TX_DL_RSTN] [get_bd_pins spacefibrelight_0/AXIS_VC5_TX_DL_RSTN] [get_bd_pins spacefibrelight_0/AXIS_VC6_TX_DL_RSTN] [get_bd_pins spacefibrelight_0/AXIS_VC7_TX_DL_RSTN] [get_bd_pins spacefibrelight_0/AXIS_VC8_TX_DL_RSTN]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_AUTOSTART [get_bd_pins DATALINK_CONFIGURATOR/AUTOSTART] [get_bd_pins spacefibrelight_0/AUTOSTART]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_CONTINUOUS_VC [get_bd_pins DATALINK_CONFIGURATOR/CONTINUOUS_VC] [get_bd_pins spacefibrelight_0/CONTINUOUS_VC]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_DL_EN [get_bd_pins DATALINK_CONFIGURATOR/DL_EN] [get_bd_pins spacefibrelight_0/ENABLE_INJ]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_FAR_END_SERIAL_LB_EN [get_bd_pins DATALINK_CONFIGURATOR/FAR_END_SERIAL_LB_EN] [get_bd_pins spacefibrelight_0/FAR_END_SERIAL_LB_EN]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_INTERFACE_RST [get_bd_pins DATALINK_CONFIGURATOR/INTERFACE_RST] [get_bd_pins spacefibrelight_0/INTERFACE_RESET]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_LANE_RESET [get_bd_pins DATALINK_CONFIGURATOR/LANE_RESET] [get_bd_pins spacefibrelight_0/LANE_RESET]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_LANE_SPY_EN [get_bd_pins DATALINK_CONFIGURATOR/LANE_SPY_EN] [get_bd_pins spacefibrelight_0/ENABLE_SPY]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_LANE_START [get_bd_pins DATALINK_CONFIGURATOR/LANE_START] [get_bd_pins spacefibrelight_0/LANE_START]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_LINK_RST [get_bd_pins DATALINK_CONFIGURATOR/LINK_RST] [get_bd_pins spacefibrelight_0/LINK_RESET]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_NACK_RST_EN [get_bd_pins DATALINK_CONFIGURATOR/NACK_RST_EN] [get_bd_pins spacefibrelight_0/NACK_RST_EN]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_NACK_RST_MODE [get_bd_pins DATALINK_CONFIGURATOR/NACK_RST_MODE] [get_bd_pins spacefibrelight_0/NACK_RST_MODE]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_NEAR_END_SERIAL_LB_EN [get_bd_pins DATALINK_CONFIGURATOR/NEAR_END_SERIAL_LB_EN] [get_bd_pins spacefibrelight_0/NEAR_END_SERIAL_LB_EN]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_PARALLEL_LOOPBACK_EN [get_bd_pins DATALINK_CONFIGURATOR/PARALLEL_LOOPBACK_EN] [get_bd_pins spacefibrelight_0/PARALLEL_LOOPBACK_EN]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_PAUSE_VC [get_bd_pins DATALINK_CONFIGURATOR/PAUSE_VC] [get_bd_pins spacefibrelight_0/PAUSE_VC]
  connect_bd_net -net DATA_LINK_CONFIGURAT_0_STANDBY_REASON [get_bd_pins DATALINK_CONFIGURATOR/STANDBY_REASON] [get_bd_pins spacefibrelight_0/STANDBY_REASON]
  connect_bd_net -net LANE_ANALYZER_0_FIFO_RX_RD_EN_PPL [get_bd_pins LANE_ANALYZER/FIFO_RX_RD_EN_PPL] [get_bd_pins spacefibrelight_0/FIFO_RX_RD_EN_SPY]
  connect_bd_net -net LANE_GENERATOR_0_CAPABILITY_TX_PPL [get_bd_pins LANE_GENERATOR/CAPABILITY_TX_PPL] [get_bd_pins spacefibrelight_0/CAPABILITY_TX_INJ]
  connect_bd_net -net LANE_GENERATOR_0_DATA_TX [get_bd_pins LANE_GENERATOR/DATA_TX] [get_bd_pins spacefibrelight_0/DATA_TX_INJ]
  connect_bd_net -net LANE_GENERATOR_0_LANE_RESET_DL [get_bd_pins LANE_GENERATOR/LANE_RESET_DL] [get_bd_pins spacefibrelight_0/LANE_RESET_INJ]
  connect_bd_net -net LANE_GENERATOR_0_NEW_DATA_TX_PPL [get_bd_pins LANE_GENERATOR/NEW_DATA_TX_PPL] [get_bd_pins spacefibrelight_0/NEW_DATA_TX_INJ]
  connect_bd_net -net LANE_GENERATOR_0_VALID_K_CHARAC_TX_PPL [get_bd_pins LANE_GENERATOR/VALID_K_CHARAC_TX_PPL] [get_bd_pins spacefibrelight_0/VALID_K_CHARAC_TX_INJ]
  connect_bd_net -net RX_NEG_0_1 [get_bd_ports RX_NEG_0] [get_bd_pins spacefibrelight_0/RX_NEG]
  connect_bd_net -net RX_POS_0_1 [get_bd_ports RX_POS_0] [get_bd_pins spacefibrelight_0/RX_POS]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins proc_sys_reset_0/interconnect_aresetn] [get_bd_pins smartconnect_0/aresetn] [get_bd_pins DATALINK_CONFIGURATOR/reset_n] [get_bd_pins LANE_GENERATOR/reset_n] [get_bd_pins LANE_ANALYZER/aresetn] [get_bd_ports reset_n_fpga] [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn]
  connect_bd_net -net reset_n_1 [get_bd_ports reset] [get_bd_pins proc_sys_reset_0/ext_reset_in]
  connect_bd_net -net spacefibrelight_0_ACK_COUNTER_RX [get_bd_pins spacefibrelight_0/ACK_COUNTER_RX] [get_bd_pins DATALINK_CONFIGURATOR/ACK_COUNTER_RX]
  connect_bd_net -net spacefibrelight_0_ACK_COUNTER_TX [get_bd_pins spacefibrelight_0/ACK_COUNTER_TX] [get_bd_pins DATALINK_CONFIGURATOR/ACK_COUNTER_TX]
  connect_bd_net -net spacefibrelight_0_ACK_SEQ_NUM [get_bd_pins spacefibrelight_0/ACK_SEQ_NUM] [get_bd_pins DATALINK_CONFIGURATOR/ACK_SEQ_NUM]
  connect_bd_net -net spacefibrelight_0_CLK_TX [get_bd_pins spacefibrelight_0/CLK_TX] [get_bd_pins DATALINK_CONFIGURATOR/CLK_TX]
  connect_bd_net -net spacefibrelight_0_CRC_LONG_ERROR [get_bd_pins spacefibrelight_0/CRC_LONG_ERROR] [get_bd_pins DATALINK_CONFIGURATOR/CRC_LONG_ERROR]
  connect_bd_net -net spacefibrelight_0_CRC_SHORT_ERROR [get_bd_pins spacefibrelight_0/CRC_SHORT_ERROR] [get_bd_pins DATALINK_CONFIGURATOR/CRC_SHORT_ERROR]
  connect_bd_net -net spacefibrelight_0_CREDIT_VC [get_bd_pins spacefibrelight_0/CREDIT_VC] [get_bd_pins DATALINK_CONFIGURATOR/VC_CREDIT]
  connect_bd_net -net spacefibrelight_0_CURRENT_TIME_SLOT [get_bd_pins spacefibrelight_0/CURRENT_TIME_SLOT] [get_bd_pins DATALINK_CONFIGURATOR/CURRENT_TIME_SLOT]
  connect_bd_net -net spacefibrelight_0_DATA_COUNTER_RX [get_bd_pins spacefibrelight_0/DATA_COUNTER_RX] [get_bd_pins DATALINK_CONFIGURATOR/DATA_CNT_RX]
  connect_bd_net -net spacefibrelight_0_DATA_COUNTER_TX [get_bd_pins spacefibrelight_0/DATA_COUNTER_TX] [get_bd_pins DATALINK_CONFIGURATOR/DATA_CNT_TX]
  connect_bd_net -net spacefibrelight_0_DATA_RX_SPY [get_bd_pins spacefibrelight_0/DATA_RX_SPY] [get_bd_pins LANE_ANALYZER/DATA_RX]
  connect_bd_net -net spacefibrelight_0_FAR_END_CAPA [get_bd_pins spacefibrelight_0/FAR_END_CAPA] [get_bd_pins DATALINK_CONFIGURATOR/FAR_END_CAPA] [get_bd_pins LANE_ANALYZER/FAR_END_CAPA_DL]
  connect_bd_net -net spacefibrelight_0_FAR_END_LINK_RESET [get_bd_pins spacefibrelight_0/FAR_END_LINK_RESET] [get_bd_pins DATALINK_CONFIGURATOR/FAR_END_LINK_RST]
  connect_bd_net -net spacefibrelight_0_FCT_COUNTER_RX [get_bd_pins spacefibrelight_0/FCT_COUNTER_RX] [get_bd_pins DATALINK_CONFIGURATOR/FCT_COUNTER_RX]
  connect_bd_net -net spacefibrelight_0_FCT_COUNTER_TX [get_bd_pins spacefibrelight_0/FCT_COUNTER_TX] [get_bd_pins DATALINK_CONFIGURATOR/FCT_COUNTER_TX]
  connect_bd_net -net spacefibrelight_0_FCT_CREDIT_OVERFLOW [get_bd_pins spacefibrelight_0/FCT_CREDIT_OVERFLOW] [get_bd_pins DATALINK_CONFIGURATOR/FCT_CREDIT_OVERFLOW]
  connect_bd_net -net spacefibrelight_0_FIFO_RX_DATA_VALID_SPY [get_bd_pins spacefibrelight_0/FIFO_RX_DATA_VALID_SPY] [get_bd_pins LANE_ANALYZER/FIFO_RX_DATA_VALID_PPL]
  connect_bd_net -net spacefibrelight_0_FIFO_RX_EMPTY_SPY [get_bd_pins spacefibrelight_0/FIFO_RX_EMPTY_SPY] [get_bd_pins LANE_ANALYZER/FIFO_RX_EMPTY_PPL]
  connect_bd_net -net spacefibrelight_0_FIFO_TX_FULL_INJ [get_bd_pins spacefibrelight_0/FIFO_TX_FULL_INJ] [get_bd_pins LANE_GENERATOR/FIFO_TX_FULL_PPL]
  connect_bd_net -net spacefibrelight_0_FRAME_ERROR [get_bd_pins spacefibrelight_0/FRAME_ERROR] [get_bd_pins DATALINK_CONFIGURATOR/FRAME_ERROR]
  connect_bd_net -net spacefibrelight_0_FRAME_FINISHED [get_bd_pins spacefibrelight_0/FRAME_FINISHED] [get_bd_pins DATALINK_CONFIGURATOR/FRAME_FINISHED]
  connect_bd_net -net spacefibrelight_0_FRAME_TX [get_bd_pins spacefibrelight_0/FRAME_TX] [get_bd_pins DATALINK_CONFIGURATOR/FRAME_TX]
  connect_bd_net -net spacefibrelight_0_FULL_COUNTER_RX [get_bd_pins spacefibrelight_0/FULL_COUNTER_RX] [get_bd_pins DATALINK_CONFIGURATOR/FULL_COUNTER_RX]
  connect_bd_net -net spacefibrelight_0_INPUT_BUF_OVF_VC [get_bd_pins spacefibrelight_0/INPUT_BUF_OVF_VC] [get_bd_pins DATALINK_CONFIGURATOR/INPUT_BUFFER_OVFL]
  connect_bd_net -net spacefibrelight_0_LANE_STATE [get_bd_pins spacefibrelight_0/LANE_STATE] [get_bd_pins DATALINK_CONFIGURATOR/LANE_STATE]
  connect_bd_net -net spacefibrelight_0_LINK_RST_ASSERTED [get_bd_pins spacefibrelight_0/LINK_RST_ASSERTED] [get_bd_pins DATALINK_CONFIGURATOR/LINK_RST_ASSERTED]
  connect_bd_net -net spacefibrelight_0_LOSS_SIGNAL [get_bd_pins spacefibrelight_0/LOSS_SIGNAL] [get_bd_pins DATALINK_CONFIGURATOR/LOSS_SIGNAL]
  connect_bd_net -net spacefibrelight_0_NACK_COUNTER_RX [get_bd_pins spacefibrelight_0/NACK_COUNTER_RX] [get_bd_pins DATALINK_CONFIGURATOR/NACK_COUNTER_RX]
  connect_bd_net -net spacefibrelight_0_NACK_COUNTER_TX [get_bd_pins spacefibrelight_0/NACK_COUNTER_TX] [get_bd_pins DATALINK_CONFIGURATOR/NACK_COUNTER_TX]
  connect_bd_net -net spacefibrelight_0_NACK_SEQ_NUM [get_bd_pins spacefibrelight_0/NACK_SEQ_NUM] [get_bd_pins DATALINK_CONFIGURATOR/NACK_SEQ_NUM]
  connect_bd_net -net spacefibrelight_0_RESET_PARAM [get_bd_pins spacefibrelight_0/RESET_PARAM] [get_bd_pins DATALINK_CONFIGURATOR/RESET_PARAM_DL]
  connect_bd_net -net spacefibrelight_0_RETRY_COUNTER_RX [get_bd_pins spacefibrelight_0/RETRY_COUNTER_RX] [get_bd_pins DATALINK_CONFIGURATOR/RETRY_COUNTER_RX]
  connect_bd_net -net spacefibrelight_0_RST_TXCLK_N [get_bd_pins spacefibrelight_0/RST_TXCLK_N] [get_bd_pins DATALINK_CONFIGURATOR/RST_TXCLK_N]
  connect_bd_net -net spacefibrelight_0_RX_ERROR_CNT [get_bd_pins spacefibrelight_0/RX_ERROR_CNT] [get_bd_pins DATALINK_CONFIGURATOR/RX_ERROR_CNT]
  connect_bd_net -net spacefibrelight_0_RX_ERROR_OVF [get_bd_pins spacefibrelight_0/RX_ERROR_OVF] [get_bd_pins DATALINK_CONFIGURATOR/RX_ERROR_OVF]
  connect_bd_net -net spacefibrelight_0_RX_POLARITY [get_bd_pins spacefibrelight_0/RX_POLARITY] [get_bd_pins DATALINK_CONFIGURATOR/RX_POLARITY]
  connect_bd_net -net spacefibrelight_0_SEQUENCE_ERROR [get_bd_pins spacefibrelight_0/SEQUENCE_ERROR] [get_bd_pins DATALINK_CONFIGURATOR/SEQ_ERROR]
  connect_bd_net -net spacefibrelight_0_SEQ_NUMBER_RX [get_bd_pins spacefibrelight_0/SEQ_NUMBER_RX] [get_bd_pins DATALINK_CONFIGURATOR/SEQ_NUMBER_RX]
  connect_bd_net -net spacefibrelight_0_SEQ_NUMBER_TX [get_bd_pins spacefibrelight_0/SEQ_NUMBER_TX] [get_bd_pins DATALINK_CONFIGURATOR/SEQ_NUMBER_TX]
  connect_bd_net -net spacefibrelight_0_TX_NEG [get_bd_pins spacefibrelight_0/TX_NEG] [get_bd_ports TX_NEG_0]
  connect_bd_net -net spacefibrelight_0_TX_POS [get_bd_pins spacefibrelight_0/TX_POS] [get_bd_ports TX_POS_0]
  connect_bd_net -net spacefibrelight_0_VALID_K_CHARAC_RX_SPY [get_bd_pins spacefibrelight_0/VALID_K_CHARAC_RX_SPY] [get_bd_pins LANE_ANALYZER/VALID_K_CHARAC_RX_PPL]
  connect_bd_net -net versal_cips_0_fpd_cci_noc_axi0_clk [get_bd_pins versal_cips_0/fpd_cci_noc_axi0_clk] [get_bd_pins axi_noc_0/aclk0]
  connect_bd_net -net versal_cips_0_fpd_cci_noc_axi1_clk [get_bd_pins versal_cips_0/fpd_cci_noc_axi1_clk] [get_bd_pins axi_noc_0/aclk1]
  connect_bd_net -net versal_cips_0_fpd_cci_noc_axi2_clk [get_bd_pins versal_cips_0/fpd_cci_noc_axi2_clk] [get_bd_pins axi_noc_0/aclk2]
  connect_bd_net -net versal_cips_0_fpd_cci_noc_axi3_clk [get_bd_pins versal_cips_0/fpd_cci_noc_axi3_clk] [get_bd_pins axi_noc_0/aclk3]
  connect_bd_net -net versal_cips_0_lpd_axi_noc_clk [get_bd_pins versal_cips_0/lpd_axi_noc_clk] [get_bd_pins axi_noc_0/aclk4]
  connect_bd_net -net versal_cips_0_pl0_ref_clk [get_bd_pins versal_cips_0/pl2_ref_clk] [get_bd_ports clk_l] [get_bd_pins spacefibrelight_0/CLK] [get_bd_pins spacefibrelight_0/AXIS_VC0_RX_DL_ACLK] [get_bd_pins spacefibrelight_0/AXIS_VC1_RX_DL_ACLK] [get_bd_pins spacefibrelight_0/AXIS_VC2_RX_DL_ACLK] [get_bd_pins spacefibrelight_0/AXIS_VC3_RX_DL_ACLK] [get_bd_pins spacefibrelight_0/AXIS_VC4_RX_DL_ACLK] [get_bd_pins spacefibrelight_0/AXIS_VC5_RX_DL_ACLK] [get_bd_pins spacefibrelight_0/AXIS_VC6_RX_DL_ACLK] [get_bd_pins spacefibrelight_0/AXIS_VC7_RX_DL_ACLK] [get_bd_pins spacefibrelight_0/AXIS_VC8_RX_DL_ACLK] [get_bd_pins spacefibrelight_0/AXIS_VC0_TX_DL_ACLK] [get_bd_pins spacefibrelight_0/AXIS_VC1_TX_DL_ACLK] [get_bd_pins spacefibrelight_0/AXIS_VC2_TX_DL_ACLK] [get_bd_pins spacefibrelight_0/AXIS_VC3_TX_DL_ACLK] [get_bd_pins spacefibrelight_0/AXIS_VC4_TX_DL_ACLK] [get_bd_pins spacefibrelight_0/AXIS_VC5_TX_DL_ACLK] [get_bd_pins spacefibrelight_0/AXIS_VC6_TX_DL_ACLK] [get_bd_pins spacefibrelight_0/AXIS_VC7_TX_DL_ACLK] [get_bd_pins spacefibrelight_0/AXIS_VC8_TX_DL_ACLK] [get_bd_pins axi_noc_0/aclk6] [get_bd_pins DATALINK_CONFIGURATOR/clk_l] [get_bd_pins LANE_GENERATOR/clk_l] [get_bd_pins LANE_ANALYZER/clk_l] [get_bd_pins smartconnect_0/aclk] [get_bd_pins versal_cips_0/m_axi_lpd_aclk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins axi_bram_ctrl_0/s_axi_aclk]
  connect_bd_net -net versal_cips_0_pmc_axi_noc_axi0_clk [get_bd_pins versal_cips_0/pmc_axi_noc_axi0_clk] [get_bd_pins axi_noc_0/aclk5]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins spacefibrelight_0/CURRENT_TIME_SLOT_NW]

  # Create address segments
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/FPD_CCI_NOC_0] [get_bd_addr_segs axi_noc_0/S00_AXI/C3_DDR_LOW0] -force
  assign_bd_address -offset 0x000800000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/FPD_CCI_NOC_0] [get_bd_addr_segs axi_noc_0/S00_AXI/C3_DDR_LOW1] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/FPD_CCI_NOC_1] [get_bd_addr_segs axi_noc_0/S01_AXI/C2_DDR_LOW0] -force
  assign_bd_address -offset 0x000800000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/FPD_CCI_NOC_1] [get_bd_addr_segs axi_noc_0/S01_AXI/C2_DDR_LOW1] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/FPD_CCI_NOC_2] [get_bd_addr_segs axi_noc_0/S02_AXI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x000800000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/FPD_CCI_NOC_2] [get_bd_addr_segs axi_noc_0/S02_AXI/C0_DDR_LOW1] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/FPD_CCI_NOC_3] [get_bd_addr_segs axi_noc_0/S03_AXI/C1_DDR_LOW0] -force
  assign_bd_address -offset 0x000800000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/FPD_CCI_NOC_3] [get_bd_addr_segs axi_noc_0/S03_AXI/C1_DDR_LOW1] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/LPD_AXI_NOC_0] [get_bd_addr_segs axi_noc_0/S04_AXI/C3_DDR_LOW0] -force
  assign_bd_address -offset 0x80000000 -range 0x00000100 -target_address_space [get_bd_addr_spaces versal_cips_0/M_AXI_LPD] [get_bd_addr_segs DATALINK_CONFIGURATOR/DATA_LINK_CONFIGURAT_0/S_AXI/reg0] -force
  assign_bd_address -offset 0x80000200 -range 0x00000100 -target_address_space [get_bd_addr_spaces versal_cips_0/M_AXI_LPD] [get_bd_addr_segs LANE_ANALYZER/LANE_ANALYZER_0/S_AXI/reg0] -force
  assign_bd_address -offset 0x80000100 -range 0x00000100 -target_address_space [get_bd_addr_spaces versal_cips_0/M_AXI_LPD] [get_bd_addr_segs LANE_GENERATOR/LANE_GENERATOR_0/S_AXI/reg0] -force
  assign_bd_address -offset 0x90000000 -range 0x00000100 -target_address_space [get_bd_addr_spaces versal_cips_0/M_AXI_LPD] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/PMC_NOC_AXI_0] [get_bd_addr_segs axi_noc_0/S05_AXI/C2_DDR_LOW0] -force
  assign_bd_address -offset 0x000800000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/PMC_NOC_AXI_0] [get_bd_addr_segs axi_noc_0/S05_AXI/C2_DDR_LOW1] -force

  # Exclude Address Segments
  exclude_bd_addr_seg -offset 0x000800000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/LPD_AXI_NOC_0] [get_bd_addr_segs axi_noc_0/S04_AXI/C3_DDR_LOW1]


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


