#use you own environnement variable SPWFV_ROOTPATH to set the root path of the spacefibrelight project
# this env variable is used in the xilinx tcl script create_project.tcl 

SPWF_ROOTPATH=../../../ /opt/Xilinx/Vivado/2024.1/bin/vivado -nolog -nojournal -mode batch -source create_project.tcl 
