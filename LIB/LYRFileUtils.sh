#!/bin/bash
# -----------------------------------------------
# LYRFileUtils.sh
# -----------------------------------------------

#:begin
# echo '01.НАЗВАНИЕ'
# echo '    *** - ***'

# echo '02.СИНТАКСИС'
# echo '    *** [параметры] ***'

# echo '03.ОПИСАНИЕ'
# echo '    ***'

#--------------------------------------------------------------------------------
# procedure LYRFileUtils ()
#--------------------------------------------------------------------------------
function LYRFileUtils () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# function ExtractFileDir (APath)
#--------------------------------------------------------------------------------
function ExtractFileDir () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    local LResult=
    LError=0
    LPath="$1"
    # fspec=/path/to/some/file.txt
    # echo ${fspec%/*}
    # fspec=/path/to/some/
    LResult=${LPath%/*}
    if [ -z "$LResult" ] ; then
        LError=1
    else
        echo $LResult               # работает всегда
        #printf $LResult
    fi

    return $(( $LError ))
    #echo $(( $LResult ))       # работает, если LResult 0..255
    #return $(( $LResult ))     # работает, если LResult 0..255
    #return $LResult            # работает, если LResult 0..255
}
#endfunction

#--------------------------------------------------------------------------------
# function ExtractFileName (APath)
#--------------------------------------------------------------------------------
function ExtractFileName () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    local LResult=
    LError=0
    LPath="$1"
    # fspec=/path/to/some/file.txt
    # echo ${fspec##*/}
    # file.txt
    LResult=${LPath##*/}
    if [ -z "$LResult" ] ; then
        LError=1
    else
        echo $LResult               # работает всегда
    fi

    return $(( $LError ))
}
#endfunction

#-------------------------------------------------------------------------------
# function ExtractFileNameWithoutExt (AFileName)
#-------------------------------------------------------------------------------
function ExtractFileNameWithoutExt () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    local LResult=
    LError=0
    LFileName="$1"
    LResult=${LFileName%.*}
    if [ -z "$LResult" ] ; then
        LError=1
    else
        echo $LResult               # работает всегда
    fi
    return $(( $LError ))
}
#endfunction

#--------------------------------------------------------------------------------
# function ExtractFileExt (AFileName)
#--------------------------------------------------------------------------------
function ExtractFileExt () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    local LResult=
    LError=0
    LFileName="$1"
    LResult=${LFileName#*.}
    if [ -z "$LResult" ] ; then
        LError=1
    else
        echo $LResult               # работает всегда
    fi

    return $(( $LError ))
}
#endfunction

#:Exit
