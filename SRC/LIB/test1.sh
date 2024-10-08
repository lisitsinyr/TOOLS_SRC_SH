#!/bin/bash
# -----------------------------------------------
# test1.sh
# -----------------------------------------------


#begin
    # Bash Menu Script Example
    PS3='Please enter your choice: '
    echo $PS3

    options=("Option 1" "Option 2" "Option 3" "Quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "Option 1")
                echo "you chose choice 1"
                ;;
            "Option 2")
                echo "you chose choice 2"
                ;;
            "Option 3")
                echo "you chose choice $REPLY which is $opt"
                ;;
            "Quit")
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done

    read -n 1 -s -r -p $'Press any key to continue ...\n'

    return 0

#end

# ===================================================================
