#!/bin/bash
#
# this script set the required ennvironnement for cocotb
# provide the name of the folder to be executed as a parameter
# use "all" to run all tests
#
# Be carefull : The name of the folder as to match the name of the cocotb test inside it

### for convenience you can store all your bash variable commands  in a file called environnement
## if this file exists it will be sourced automatically
FILE=environnement
if [ -f  ]; then
   echo "File $FILE exists."
   source $FILE
   echo "sourcing this file for custom parameters."
else
   echo "File $FILE does not exist. Using gobal variable."
fi


################## script run control ###########################
# Check if exactly one parameter is passed
if [ "$#" -ne 1 ]; then
  echo "Error: This script requires exactly one parameter."
  echo "Usage: $0 <MYTEST>"
  echo "          <MYTEST> : Name of the test to be ran |  all : to run all tests"
  exit 1
fi

# check if SPACEFIBRELIGHT_ROOT_PATH is set
if  [ -z ${SPACEFIBRELIGHT_ROOT_PATH+x} ]; then
echo "missing SPACEFIBRELIGHT_ROOT_PATH variable"
echo "please execute in terminal prior to launch this script:"
echo "      export SPACEFIBRELIGHT_ROOT_PATH=MY/ABSOLUTE/PATH/TO/SPACEFIBRELIBRELIGHT/MAIN/FOLDER"
exit 1 
fi

# check if FRAMEWORK_COCOTB_INSTALL_PATH is set
if  [ -z ${FRAMEWORK_COCOTB_INSTALL_PATH+x} ]; then
    echo "missing FRAMEWORK_COCOTB_INSTALL_PATH variable"
    echo "please execute in terminal prior to launch this script:"
    echo "      export FRAMEWORK_COCOTB_INSTALL_PATH=MY/ABSOLUTE/PATH/TO/COCOTB_FRAMEWORK/MAIN/FOLDER"
    exit 1 
fi

# check if SPACEFIBRELIGHT_ROOT_PATH is set
if  [ -z ${SPACEFIBRELIGHT_ROOT_PATH+x} ]; then
echo "missing SPACEFIBRELIGHT_ROOT_PATH variable"
echo "please execute in terminal prior to launch this script:"
echo "      export SPACEFIBRELIGHT_ROOT_PATH=MY/ABSOLUTE/PATH/TO/SPACEFIBRELIBRELIGHT/MAIN/FOLDER"
exit 1 
fi

# check if FRAMEWORK_COCOTB_INSTALL_PATH is set
if  [ -z ${FRAMEWORK_COCOTB_INSTALL_PATH+x} ]; then
    echo "missing FRAMEWORK_COCOTB_INSTALL_PATH variable"
    echo "please execute in terminal prior to launch this script:"
    echo "      export FRAMEWORK_COCOTB_INSTALL_PATH=MY/ABSOLUTE/PATH/TO/COCOTB_FRAMEWORK/MAIN/FOLDER"
    exit 1 
fi

###################################

# Store the parameter for test to be run
export MYSIM=$1

#update python path 
# Find the directory if this file
if [ -n "${ZSH_VERSION-}" ] ; then
    current_dir="$(dirname "$0")"
else
    current_dir="$(dirname "${BASH_SOURCE[0]}")"
fi
current_dir=$(realpath $current_dir)

#create bench path
export BENCHPATH=$current_dir/../benches

#create model path
export MODELPATH=$current_dir/../models/


#Add models directories and bench directory to python path
export PYTHONPATH=$current_dir:$PYTHONPATH
export PYTHONPATH=$BENCHPATH/configuration_1_bench:$PYTHONPATH
export PYTHONPATH=$BENCHPATH/configuration_2_bench:$PYTHONPATH
export PYTHONPATH=$BENCHPATH/common:$PYTHONPATH
export PYTHONPATH=$MODELPATH/python_model:$PYTHONPATH
#add framework to pythonpath
export PYTHONPATH=$FRAMEWORK_COCOTB_INSTALL_PATH:$PYTHONPATH
#display python path environment for debug purpose
echo $PYTHONPATH

#handle all request
if [ "$MYSIM" == "all" ]; then
    #list all tests in folder
    for dir in */; do
        #remove / at the end of listed folder
        export MYSIM="${dir::-1}"
        #don't execute archived tests and coverage html directory
        if [ "$MYSIM" != "archive" ] && [ "$MYSIM" != "covhtmlreport" ]; then
            echo "Found test $MYSIM and execute it!"

            cd $MYSIM 
            #clean sim build sometimes cocotb fail to refresh it
            rm -r sim_build
            #run simulation with cocotb
            make -f ../Makefile
            cd ..
        fi
    done
    #execute all tests
else
    #execute test in its folder

    ## handle non existence of test
    # set -e  # Exit on any command failure
    # trap 'echo -e "\n###############\nTest (or folder): $MYSIM doesnt exist! \nExiting.\n###############\n"' ERR
    cd $MYSIM # Will fail and trigger trap if doesn't exist
    
    #change error message 
    # trap 'echo -e "\n###############\nError Running test : $MYSIM (see previous error message from cocotb)! \nExiting.\n###############\n"' ERR
    # clean sim build sometimes cocotb fail to refresh it
    rm -r sim_build

    #run simulation with cocotb
    make -f ../Makefile
    cd ..
fi




