#!/bin/bash
# -----------------------------------------------
# LYRSupport.sh
# -----------------------------------------------

#:begin
# echo '01.НАЗВАНИЕ'
# echo '    *** - ***'

# echo '02.СИНТАКСИС'
# echo '    *** [параметры] ***'

# echo '03.ОПИСАНИЕ'
# echo '    ***'

#--------------------------------------------------------------------------------
# procedure LYRSupport ()
#--------------------------------------------------------------------------------
function LYRSupport () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

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
# procedure Pause (SLEEP)
#--------------------------------------------------------------------------------
function Pause () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    #echo Pause: $1

    if [ -z $1 ] ; then
        sleep 0s
    else
        sleep "$1"
    fi

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure Check_P (P_Name P_Value)
#--------------------------------------------------------------------------------
function Check_P () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    P_Name=$1
    echo P_Name: $P_Name
    P_Value=$2
    echo P_Value: $P_Value

    if [ -z $P_Value ] ; then
        Input=
        echo ${P_Name}[${!P_Name}]:
        read Input
    else
        eval ${P_Name}=$P_Value
        return 0
    fi
    echo Input: $Input
    if [ -z $Input ] ; then
        eval ${P_Name}=${!P_Name}
    else
        eval ${P_Name}=$Input
    fi

    return 0
}
#endfunction

#:Exit
