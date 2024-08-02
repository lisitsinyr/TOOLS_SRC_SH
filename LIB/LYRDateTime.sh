#!/bin/bash
# -----------------------------------------------
# LYRDateTime.sh
# -----------------------------------------------

# =================================================
# ФУНКЦИИ
# =================================================

#--------------------------------------------------------------------------------
# procedure LYRDateTime ()
#--------------------------------------------------------------------------------
function LYRDateTime () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# function YYYYMMDDHHMMSS () -> YYYYMMDDHHMMSS
#--------------------------------------------------------------------------------
function YYYYMMDDHHMMSS () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    printf "%(%Y%m%d%H%M%S)T"

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# function DateTime (AFORMAT) -> DateTime
#--------------------------------------------------------------------------------
function DateTime () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    AFORMAT="$1"
    printf "%($AFORMAT)T"

    return 0
}
#endfunction
