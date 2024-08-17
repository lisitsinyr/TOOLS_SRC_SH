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
    # read -p "Press enter to continue"

    # In other shells, you can do:
    # printf "%s " "Press enter to continue"
    # read ans

    # As mentioned in the comments above, this command does
    # actually require the user to press enter; a solution
    # that works with any key in bash would be:
    #
    # Explanation by Rayne and wchargin
    # -n defines the required character count to stop reading
    # -s hides the user's input
    # -r causes the string to be interpreted "raw" (without considering backslash escapes)

    Atimeout=0
    if [[ $PRESSANYKEY -eq 1 ]] ; then
        read -N 1 -s -r -p $'Press any key to continue ...\n'
    fi

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
# procedure __Read_F (P_Name, P_List, Atimeout)
#--------------------------------------------------------------------------------
function __Read_F () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    # P_Name     - Имя переменной
    # P_Value    - Значение переменной
    # ${!P_Name} - Значение переменной по умолчанию 
    # P_List     - список создаваемых вариантов
    # Atimeout   - TIMEOUT

    P_Name=$1
    #echo P_Name:$P_Name
    P_List=$2
    #echo P_List:$P_List
    Atimeout=$3
    #echo Atimeout:$Atimeout
    if [ -z $Atimeout ] ; then
        Atimeout=$TIMEOUT
    fi
    #echo Atimeout:$Atimeout

    P_Value=

    if [[ ! -z $P_List ]] ; then

        Input=${!P_Name} # ${!P_Name} - Значение переменной по умолчанию 
        if [[ -z $P_Value ]] ; then
            if [[ ! -z $PN_CAPTION ]] ; then
                #echo $PN_CAPTION[${P_Name}][${!P_Name}] "[$P_List]":
                LPN_CAPTION="$PN_CAPTION[${P_Name}][$P_List][${!P_Name}]:"
            else
                #echo [${P_Name}][${!P_Name}] "[$P_List]":
                LPN_CAPTION="[${P_Name}][$P_List][${!P_Name}]:"
            fi

            read -r -N 1 -t $Atimeout -p "$LPN_CAPTION" Input

            while [[ ! $P_List =~ $Input ]] ; do
                #printf $sR
                #printf $sERASE_LINE
                #ClearLine
                #read -r -N 1 -t $Atimeout -p "$LPN_CAPTION" Input

                #printf "$sB $sB"
                Backspace
                read -r -N 1 -t $Atimeout Input

            done

        else
            eval ${P_Name}=$P_Value
            return 0
        fi
        #echo Input:$Input

        if [ -z $Input ] ; then
            eval ${P_Name}=${!P_Name}
        else
            if [[ $P_List =~ $Input ]]; then
                eval ${P_Name}=$Input
            else
                eval ${P_Name}=${!P_Name}
            fi
        fi

        #echo -e -n "\n"
        NewLine
    fi

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure Read_F (P_Name, P_List, ADefault, ACaption, Atimeout)
#--------------------------------------------------------------------------------
function Read_F () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    # P_Name     - Имя переменной
    # P_Value    - Значение переменной
    # ${!P_Name} - Значение переменной по умолчанию 
    # P_List     - список создаваемых вариантов
    # Atimeout   - TIMEOUT

    P_Name=$1
    echo P_Name:$P_Name
    P_List=$2
    echo P_List:$P_List
    ADefault=$3
    echo ADefault:$ADefault
    #if [ -z $ADefault ] ; then
    #    ADefault=${!P_Name}
    #fi
    ACaption=$4
    echo ACaption:$ACaption
    if [ -z $ACaption ] ; then
        ACaption=$PN_CAPTION
    fi
    Atimeout=$5
    Atimeout=$TIMEOUT
    #echo Atimeout:$Atimeout

    eval ${P_Name}=$ADefault
    P_Value=

    if [[ ! -z $P_List ]] ; then

        Input=$ADefault             # - Значение переменной по умолчанию 

        if [[ -z $P_Value ]] ; then
            if [[ ! -z $ACaption ]] ; then
                LCAPTION="$ACaption[${P_Name}][$P_List][${!P_Name}]:"
            else
                LCAPTION="[${P_Name}][$P_List][${!P_Name}]:"
            fi

            read -r -N 1 -t $Atimeout -p "$LCAPTION" Input

            while [[ ! $P_List =~ $Input ]] ; do
                Backspace
                read -r -N 1 -t $Atimeout Input
            done

        else
            eval ${P_Name}=$P_Value
            return 0
        fi
        #echo Input:$Input

        if [ -z $Input ] ; then
            eval ${P_Name}=${!P_Name}
        else
            if [[ $P_List =~ $Input ]]; then
                eval ${P_Name}=$Input
            else
                eval ${P_Name}=${!P_Name}
            fi
        fi
        NewLine
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
                            