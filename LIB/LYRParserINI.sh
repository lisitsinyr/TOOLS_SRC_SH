#!/bin/bash
# -----------------------------------------------
# LYRParserINI.sh
# -----------------------------------------------

# =================================================
# ФУНКЦИИ
# =================================================

#--------------------------------------------------------------------------------
# procedure LYRParserINI ()
#--------------------------------------------------------------------------------
function LYRParserINI () {
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

    AFileName=$1
    #echo AFileName:$AFileName
    ASection=$2
    # echo ASection:$ASection
    AParameter=$3
    # echo AParameter:$AParameter
    AValue=$4
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

    AFileName=$1
    #echo AFileName:$AFileName
    ASection=$2
    # echo ASection:$ASection
    AParameter=$3
    # echo AParameter:$AParameter

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure __ini_get_section (AFileName)
#--------------------------------------------------------------------------------
function __ini_get_section () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    if [[ "$1" =~ ^(\[)(.*)(\])$ ]]; then 
        echo ${BASH_REMATCH[2]} ; 
    else 
        echo ""; 
    fi

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure __ini_get_key_value (AFileName)
#--------------------------------------------------------------------------------
function __ini_get_key_value () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    if [[ "$1" =~ ^([^=]+)=([^=]+)$ ]]; 
    then 
        echo "${BASH_REMATCH[1]}=${BASH_REMATCH[2]}"; 
    else 
        echo ""
    fi

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure __ini_loadfile (AFileName)
#--------------------------------------------------------------------------------
function __ini_loadfile () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    local cur_section=""
    local cur_key=""
    local cur_val=""
    IFS=
    while read -r line; do
        new_section=$(__ini_get_section $line)
        # got a new section
        if [[ -n "$new_section" ]]; then
            cur_section=$new_section
        # not a section, try a key value
        else
            val=$(__ini_get_key_value $line)
            # trim the leading and trailing spaces as well
            cur_key=$(echo $val | cut -f1 -d'=' | sed -e 's/^[[:space:]]*//' | sed -e 's/[[:space:]]*$//') 
            cur_val=$(echo $val | cut -f2 -d'=' | sed -e 's/^[[:space:]]*//' | sed -e 's/[[:space:]]*$//')
        if [[ -n "$cur_key" ]]; then
            # section + key is the associative in bash array, the field seperator is space
            inidb[${cur_section} ${cur_key}]=$cur_val
        fi
    fi
    done <$1

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure __ini_printdb (AFileName)
#--------------------------------------------------------------------------------
function __ini_printdb () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    for i in "${!inidb[@]}"
    do
    # split the associative key in to section and key
       echo -n "section  : $(echo $i | cut -f1 -d ' ');"
       echo -n "key  : $(echo $i | cut -f2 -d ' ');"
       echo  "value: ${inidb[$i]}"
    done

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure __ini_get_value (ASection, AParameter)
#--------------------------------------------------------------------------------
function __ini_get_value () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    section=$1
    key=$2
    echo "${inidb[$section $key]}"
    #eval ${key}=TEST

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

    AFileName=$1
    echo AFileName:$AFileName
    ASection=$2
    echo ASection:$ASection
    AParameter=$3
    echo AParameter:$AParameter

    __ini_loadfile $AFileName
    __ini_printdb $ASection $AParameter
    #__ini_get_value $ASection $AParameter
    
    #echo ERROR: function $FUNCNAME not implemented! ...

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

    AFileName=$1
    #echo AFileName:$AFileName
    Adelims=$2
    # echo Adelims:$Adelims
    Atokens=$3
    # echo Atokens:$Atokens
    Aeol=$4
    # echo Aeol:$Aeol

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

