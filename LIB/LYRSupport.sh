#!/bin/bash
# -----------------------------------------------
# LYRSupport.sh
# -----------------------------------------------

#--------------------------------------------------------------------------------
# procedure LYRSupport ()
#--------------------------------------------------------------------------------
function LYRSupport () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure PressAnyKey ()
#--------------------------------------------------------------------------------
function PressAnyKey () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi
    # How can I make "Press any key to continue" [duplicate]
    # You can use the read command. If you are using bash:
    #read -p "Press enter to continue"

    # In other shells, you can do:
    #printf "%s " "Press enter to continue"
    #read ans

    # As mentioned in the comments above, this command does
    # actually require the user to press enter; a solution
    # that works with any key in bash would be:
    #
    # Explanation by Rayne and wchargin
    # -n defines the required character count to stop reading
    # -s hides the user's input
    # -r causes the string to be interpreted "raw" (without considering backslash escapes)

    read -n 1 -s -r -p $'Press any key to continue ...\n'

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure Pause (APause)
#--------------------------------------------------------------------------------
function Pause () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    APause=$1
    #echo Pause:$1

    if [ -z $1 ] ; then
        sleep 0s
    else
        sleep "$1"
    fi

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure Read_P (P_Name P_Value)
#--------------------------------------------------------------------------------
function Read_P () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    P_Name=$1
    #echo P_Name: $P_Name

    P_Value=$2
    #echo P_Value: $P_Value

    Input=
    if [ -z $P_Value ] ; then
        if [ ! -z $PN_CAPTION ] ; then
            echo $PN_CAPTION[${P_Name}][${!P_Name}]:
        else
            echo [${P_Name}][${!P_Name}]:
        fi
        read Input
    else
        eval ${P_Name}=$P_Value
        return 0
    fi
    #echo Input: $Input

    if [ -z $Input ] ; then
        eval ${P_Name}=${!P_Name}
    else
        eval ${P_Name}=$Input
    fi

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure Read_F (P_Name, P_List, Atimeout)
#--------------------------------------------------------------------------------
function Read_F () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    P_Name=$1
    #echo P_Name:$P_Name
    # список создаваемых вариантов
    P_List=$2
    #echo P_List:$P_List
    #Atimeout
    Atimeout=$3
    #echo Atimeout:$Atimeout
    if [ -z $Atimeout ] ; then
        Atimeout=10
    fi
    #echo Atimeout:$Atimeout

    P_Value=

    # Значение по умолчанию ${!P_Name}
    #eval ${P_Name}=${!P_Name}

    if [[ ! -z $P_List ]] ; then

        Input=${!P_Name}
        if [ -z $P_Value ] ; then
            #if [ ! -z $PN_CAPTION ] ; then
            #    echo $PN_CAPTION[${P_Name}][${!P_Name}]:
            #else
            #    echo [${P_Name}][${!P_Name}]:
            #fi
            read -r -N 1 -t $Atimeout -p "$PN_CAPTION [$P_List]" Input
        else
            eval ${P_Name}=$P_Value
            return 0
        fi
        #echo Input:$Input

        if [ -z $Input ] ; then
            eval ${P_Name}=${!P_Name}
        else
            eval ${P_Name}=$Input
        fi
        echo -e -n "\n"

        #echo $PN_CAPTION
        #read -r -N 1 -t $Atimeout -p "$PN_CAPTION [$P_List]" Input
        #if [[ -z $Input ]] ; then
        #    $Input=N
        #fi
        #case "$response" in
        #    [yY][eE][sS]|[yY])
        #        echo $response
        #        ;;
        #    *)
        #        echo $response
        #        ;;
        #esac

        #choice /C !P_List! /D !%P_Name%! /T !Atimeout! /M "!PN_CAPTION!"
        #if !ERRORLEVEL!==1 (
        #    set %P_Name%=!ERRORLEVEL!
        #) else (
        #    set %P_Name%=
        #)
    fi

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# function Read_N () -> Read_N
#--------------------------------------------------------------------------------
function Read_N () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    Read_N=$#

    return $#
}
#endfunction

#--------------------------------------------------------------------------------
# procedure GetDir (ASET, Aview, Aarg)
#--------------------------------------------------------------------------------
function GetDir () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    ASET=$1
    #echo ASET:$ASET
    Aview=$2
    # echo Aview:$Aview
    Aarg=$3
    # echo Aarg:$Aarg

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure GetFile (ASET, Aview, Aarg)
#--------------------------------------------------------------------------------
function GetFile () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    ASET=$1
    #echo ASET:$ASET
    Aview=$2
    # echo Aview:$Aview
    Aarg=$3
    # echo Aarg:$Aarg

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure FORCicle (Astart, Astep, Aend)
#--------------------------------------------------------------------------------
function GetFile () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    Astart=$1
    #echo Astart:$Astart
    Astep=$2
    # echo Astep:$Astep
    Aend=$3
    # echo Aend:$Aend

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure GetSET (ASET Adelims Atokens)
#--------------------------------------------------------------------------------
function GetSET () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    ASET=$1
    #echo ASET:$ASET
    Adelims=$2
    # echo Adelims:$Adelims
    Atokens=$3
    # echo Atokens:$Atokens

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure GetCMD (ASET Adelims Atokens)
#--------------------------------------------------------------------------------
function GetCMD () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    ASET=$1
    #echo ASET:$ASET
    Adelims=$2
    # echo Adelims:$Adelims
    Atokens=$3
    # echo Atokens:$Atokens

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction
                            