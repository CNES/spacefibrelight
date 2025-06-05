# Setup the Vivado board project
The board is created with `vivado 2024.1`. It targets the xilinx `vek280 evalboard`. For convenience the board parameter is included in `implementation/board/vek280/xilinxboardstore_vek280_2025.1` and sourced automatically during project creation.

Use script `generate_board.sh` to create the vek280 example.
The script uses an environnment variable `SPWF_ROOTPATH` to define the main path for the spacefibrelight git project. If not set a default value is applied.
You can customize some parameters in the script.

There are additionnal parameters you can edit at the beginning of the file `implementation/app/traffic_generator/create_project.tcl` 
