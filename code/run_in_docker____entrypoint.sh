#!/bin/bash

cd /code

# HAS_NODE_MODULES_DIR: boolean
[ -d "node_modules" ] && HAS_NODE_MODULES_DIR=true || HAS_NODE_MODULES_DIR=false
# OPTION: string = "install", "dev", "build"
[[ "$OPTION" != "" ]] && HAS_OPTION=true || HAS_OPTION=false

echo ""
echo "HAS_NODE_MODULES_DIR = $HAS_NODE_MODULES_DIR"
echo "HAS_OPTION = $HAS_OPTION"
echo "OPTION = $OPTION"
echo ""


if [ "$OPTION" = "install" ]; then

    ./run_in_docker__install.sh

elif [ "$OPTION" = "dev" ]; then

    if [ $HAS_NODE_MODULES_DIR = false ]; then ./run_in_docker__install.sh && ./run_in_docker__dev.sh; fi
    if [ $HAS_NODE_MODULES_DIR = true ]; then ./run_in_docker__dev.sh; fi

elif [ "$OPTION" = "build" ]; then

    if [ $HAS_NODE_MODULES_DIR = false ]; then ./run_in_docker__install.sh && ./run_in_docker__build.sh; fi
    if [ $HAS_NODE_MODULES_DIR = true ]; then ./run_in_docker__build.sh; fi

else

    echo "Testing Script"
    echo ""
    read -n 1 -s -r -p "Press any key to continue"

fi
