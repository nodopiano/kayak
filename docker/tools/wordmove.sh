#!/bin/bash

# Colors
red="\e[0;91m"
yellow="\e[0;33m"
blue="\e[0;96m"
reset="\e[0m"

# If Movefile does not exist, create one
if [ ! -f Movefile ]; then
    if [ ! -d $MOVEFILE_PATH ]; then
        echo -e "${red}ERROR${reset}: $MOVEFILE_PATH is not a valid directory."
        exit -1
    fi

    if [ $MOVEFILE_PATH != "./" ] && [ $MOVEFILE_PATH != "." ]; then
        if [ ! -f "$MOVEFILE_PATH/Movefile" ]; then
            echo -e "${blue}INFO${reset}: Movefile not present in $MOVEFILE_PATH"
            echo "Generating a brand new Movefile..."
            cp Movefile.example "$MOVEFILE_PATH/Movefile" || exit -2
        fi
    else
        cp Movefile.example "$MOVEFILE_PATH/Movefile" || exit -2
    fi
fi

wordmove "$@"