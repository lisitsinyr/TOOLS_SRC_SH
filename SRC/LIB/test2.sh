#!/bin/bash
# -----------------------------------------------
# test2.sh
# -----------------------------------------------

#begin
    read -p "Please press ENTER" var
    if [ ${#var} -eq 0 ]; then
        echo "Enter was hit"
        echo $var|hexdump -C
    fi

    read -n 1 -s -r -p $'Press any key to continue ...\n'

    return 0

#end
