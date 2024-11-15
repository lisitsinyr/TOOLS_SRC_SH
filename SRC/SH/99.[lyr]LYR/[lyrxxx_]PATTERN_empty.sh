#!/bin/bash
# -----------------------------------------------
# [lyrxxx_]PATTERN_empty.sh
# -----------------------------------------------

#--------------------------------------------------------------------------------
# procedure MAIN ()
#--------------------------------------------------------------------------------
function MAIN () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    BATNAME=$0
    echo Start $BATNAME ...

    return 0
}
#endfunction

#begin
    LFileNameINIT='INIT_TOOLS_SRC_SH.sh'
    if [[ -r "$LFileNameINIT" ]] ; then
        source "./$LFileNameINIT" "$0"
    else
        echo ERROR: Файл установки $LFileNameINIT не существует ... >$(tty)
        read -n 1 -s -r -p $'Press any key to continue ...\n'
        exit 1
    fi

    MAIN
    read -n 1 -s -r -p $'Press any key to continue ...\n'
#end
