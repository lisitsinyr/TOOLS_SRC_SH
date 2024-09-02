#!/bin/bash
# -----------------------------------------------
# [lyrxxx_]PATTERN_empty.sh
# -----------------------------------------------

#begin
    LFileNameINIT='INIT_TOOLS_SRC_SH.sh'
    if [[ -r "$LFileNameINIT" ]] ; then
        source "./$LFileNameINIT" "$0"
    else
        echo ERROR: Файл установки $LFileNameINIT не существует ... >$(tty)
        read -n 1 -s -r -p $'Press any key to continue ...\n'
        exit 1
    fi

    read -n 1 -s -r -p $'Press any key to continue ...\n'

    return 0
#end

# ===================================================================
