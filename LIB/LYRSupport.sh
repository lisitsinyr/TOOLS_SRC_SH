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
# procedure Check_P (P_Name P_Value)
#--------------------------------------------------------------------------------
function Check_P () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    P_Name=$1
    #echo P_Name: $P_Name
    
    
    
    
    
    
    
    
    P_Value=$2
    echo P_Value: $P_Value


    
    
    
    
    Input=
    if [ -z $P_Value ] ; then
        echo ${P_Name}[${!P_Name}]:
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
    echo P_Value: $P_Value

    Input=
    if [ -z $P_Value ] ; then
        echo ${P_Name}[${!P_Name}]:
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
function Read_P () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    P_Name=$1
    #echo P_Name:$P_Name
    # список создаваемых вариантов
    P_List=$2
    # echo P_List:$P_List
    # Atimeout
    Atimeout=$3
    #echo Atimeout:$Atimeout

    if [ -z $Atimeout ] ; then
        Atimeout=10
    fi
    # echo Atimeout:$Atimeout

    echo ERROR: function $FUNCNAME not implemented! ...

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

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure SetINI (AFileName, ASection, AParameter, AValue)
#--------------------------------------------------------------------------------
function SetINI () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    set AFileName=$1
    #echo AFileName:$AFileName
    set ASection=$2
    # echo ASection:$ASection
    set AParameter=$3
    # echo AParameter:$AParameter
    set AValue=$4
    # echo AValue:$AValue

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure GetINI (AFileName, ASection, AParameter)
#--------------------------------------------------------------------------------
function GetINI () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    set AFileName=$1
    #echo AFileName:$AFileName
    set ASection=$2
    # echo ASection:$ASection
    set AParameter=$3
    # echo AParameter:$AParameter

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure GetINIParametr (AFileName, ASection, AParameter)
#--------------------------------------------------------------------------------
function GetINIParametr () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    set AFileName=$1
    #echo AFileName:$AFileName
    set ASection=$2
    # echo ASection:$ASection
    set AParameter=$3
    # echo AParameter:$AParameter

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure GetFileParser (AFileName Adelims Atokens Aeol)
#--------------------------------------------------------------------------------
function GetFileParser () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    set AFileName=$1
    #echo AFileName:$AFileName
    set Adelims=$2
    # echo Adelims:$Adelims
    set Atokens=$3
    # echo Atokens:$Atokens
    set Aeol=$4
    # echo Aeol:$Aeol

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
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

    set ASET=$1
    #echo ASET:$ASET
    set Aview=$2
    # echo Aview:$Aview
    set Aarg=$3
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

    set ASET=$1
    #echo ASET:$ASET
    set Aview=$2
    # echo Aview:$Aview
    set Aarg=$3
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

    set Astart=$1
    #echo Astart:$Astart
    set Astep=$2
    # echo Astep:$Astep
    set Aend=$3
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

    set ASET=$1
    #echo ASET:$ASET
    set Adelims=$2
    # echo Adelims:$Adelims
    set Atokens=$3
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

    set ASET=$1
    #echo ASET:$ASET
    set Adelims=$2
    # echo Adelims:$Adelims
    set Atokens=$3
    # echo Atokens:$Atokens

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction
                            