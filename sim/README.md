# Environnement

The test were run on a:
- Ubuntu 20.04.6 LTS environnement
- python 3.10
- Questa Intel Starter FPGA Edition-64 2023.2 and Questa 2024.3
- cocotb 1.9.2

## Cocotb 

### prerequisite
- python >3.8 
- questa simulator installed and referenced in the path environnement

### installation
- install cocotb 1.9.2 with command `pip install cocotb`
- install cocotb axi driver with command `pip install cocotbext-axi`
you can check the installation of cocotb the command `cocotb-config --version` which will return `1.9.2`
- install cocotb framework from location **!!URL OF COCOTB FRAMEWORK TO BE ADDED!!** 

## Questa
The simulator Questa Intel Starter FPGA Edition-64 2023.2 is used for the test (you can use any questa simulator).
It can be download at the following address:

https://www.intel.com/content/www/us/en/software-kit/790078/questa-intel-fpgas-pro-edition-software-version-23-3.html

The Questa binaries should be added to the environnement variable PATH before running the tests with command `export PATH=<Questa_install_path>/questa_fse/bin:$PATH`

## cocotb framework
This framework include additionnal features for `cocotbext-axi` such as stimuli from files and logger. This project is hosted at `https://github.com/Elsys-Design/DIGITAL-VERIFICATION-COCOTB` it is included in the proejct as submodule at path `sim/cocotb-framework`.

# Running a simulation
- go into `sim/scenario/` 
- configure your environnement for runningthe simulation. To do so you have to set at least 3 variables:
    - SPACEFIBRELIGHT_ROOT_PATH : the main absolute path location of your spacefibre cloned project (the one with .git folder)
    - FRAMEWORK_COCOTB_INSTALL_PATH : the absolute path location for your cocotb_framework 
    - GUI : set the variable to 1 to launch questa GUI or simply write 0 to directly run the simulaiton without GUI.
    - HARDWARE_TARGET : sete the variable to "NG_ULTRA" or "VERSAL" depending on the target you are building the IP for

   To do so you can execute in a terminal (or add them to you .bashrc)
   ```
   #set you absolute path to the root of the project spacefibrelight
        export SPACEFIBRELIGHT_ROOT_PATH=<ABSOLUTE/PATH/>CNES_IP-SPACE-FIBRE

        #set your framework location
        export FRAMEWORK_COCOTB_INSTALL_PATH==<ABSOLUTE/PATH/>CNES_IP-SPACE-FIBRE/sim/cocyb-framework/src

        # Select 1 to have to gui loaded (you will have to click run all to start simualtion)
        # select 0 to have automatic
        export GUI=0

        # Specfy the target, either VERSAL or NG_ULTRA
        export HARDWARE_TARGET="VERSAL"
   ```
- edit `RunSim.sh` to 
    - match your framework installation path 
    - your spacefibrelight IP root dir 
    - select your custom parameters 
- execute `RunSim.sh <NAME_OF_THE_TEST>` with NAME_OF_THE_TEST is equal to the folder name of the test to be ran.
- to execute every test available in every folders use command `RunSim.sh all`


  
___    


The `Runme.sh` script as several configuration variables:

- `SPACEFIBRELIGHT_ROOT_PATH`:absolute path to the root of the project spacefibrelight
- `FRAMEWORK_COCOTB_INSTALL_PATH`: absolute path to the src directory of the project cocotb framework 
- `GUI` :
    -Select `1` to have to gui loaded (you will have to click run all to start simulation)
    -Select `0` to have automatic
- `WAVES`
    - Select `1` to create the full waveform for the test (questa WLF file)
    - select `0` not to generate the waveforms

- `EXTRA_VSIM_CMD` : you can set addition vsim command with this variable
- `HARDWARE_TARGET` : 
    - Select `VERSAL` to build the IP for a VERSAL target
    - Select `NG_ULTRA` to build the IP for a NG-ULTRA target

For convenience , you can create a file called `sim/scenario/environnement`.
This file will include all paramaters and will be sourced prior to launch simulation.
Here is an example of the content of the file (this file won't be part of the repository as this configuration is custom for each developper):
```

#set you absolute path to the root of the project spacefibrelight
export SPACEFIBRELIGHT_ROOT_PATH=/home/user/my/handsome/project/spacefibrelight

#set your framework location
export FRAMEWORK_COCOTB_INSTALL_PATH=$SPACEFIBRELIGHT_ROOT_PATH/sim/cocotb-framework/src

# Select 1 to have to gui loaded (you will have to click run all to start simualtion)
# select 0 to have automatic
export GUI=0

# Select 1 to create the full waveform for the test (questa WLF file)
# select 0 not ot generate the waveforms
export WAVES=0

# Specify target (uncomment the line needed and comment the other one)
export HARDWARE_TARGET="VERSAL"
# export HARDWARE_TARGET="NG_ULTRA"

##additionnal VSIM command  
export EXTRA_VSIM_CMD="-do $SPACEFIBRELIGHT_ROOT_PATH/sim/scenario/custom.do"

#enable venv for pipx on ubuntu 24
export VIRTUAL_ENV=/home/flo/.local/lib/python3.12/site-packages/cocotb
```
## cocotb on ubuntu 24
On new ubuntu, global python installation is no longer authorized. you could use `pipx` which create a virtual env.
In order to make cocotb to work you should set : `VIRTUAL_ENV` with command
`export VIRTUAL_ENV=/home/user/.local/lib/python3.12/site-packages/cocotb`
