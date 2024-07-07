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
# function __ini_get_section (AFileName)
#--------------------------------------------------------------------------------
function __ini_get_section {
    if [[ "$1" =~ ^(\[)(.*)(\]) ]] ; then
        echo ${BASH_REMATCH[2]} ;
    else
        echo "" ;
    fi
}

#--------------------------------------------------------------------------------
# function __ini_get_key_value (AFileName)
#--------------------------------------------------------------------------------
function __ini_get_key_value () {
#beginfunction
    if [[ "$1" =~ ^([^=]+)=([^=]+)$ ]] ; then
        echo "${BASH_REMATCH[1]}=${BASH_REMATCH[2]}";
    else
        echo ""
    fi
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
            # echo cur_section:$cur_section
        # not a section, try a key value
        else
            val=$(__ini_get_key_value $line)
            # echo val:$val
            # trim the leading and trailing spaces as well
            cur_key=$(echo $val | cut -f1 -d'=' | sed -e 's/^[[:space:]]*//' | sed -e 's/[[:space:]]*$//')
            cur_val=$(echo $val | cut -f2 -d'=' | sed -e 's/^[[:space:]]*//' | sed -e 's/[[:space:]]*$//')
            # echo cur_key:$cur_key
            # echo cur_val:$cur_val
            if [[ -n "$cur_key" ]]; then
                # section + key is the associative in bash array, the field seperator is space
                # echo $cur_section $cur_key=$cur_val
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
       echo -n "section:$(echo $i | cut -f1 -d ' ');"
       echo -n "key:$(echo $i | cut -f2 -d ' ');"
       echo  "value:${inidb[$i]}"
    done

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# function __ini_get_value (ASection, AParameter)
#--------------------------------------------------------------------------------
function __ini_get_value () {
#beginfunction
    section=$1
    key=$2
    echo "${inidb[$section $key]}"
}
#endfunction

#--------------------------------------------------------------------------------
# procedure GetINIParametr_PY (AFileName, ASection, AParameter)
#--------------------------------------------------------------------------------
function GetINIParametr_PY () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    AFileName=$1
    # echo AFileName:$AFileName
    ASection=$2
    # echo ASection:$ASection
    AParameter=$3
    # echo AParameter:$AParameter

    LResult=$($LIB_SH/GetINI.py $AFileName $ASection $AParameter)
    # COMMAND=$LResult
    # echo COMMAND:"$COMMAND"
    # echo LResult:"${LResult}"
    eval "$LResult"
    # declare -A general
    # general[repo_name]=TOOLS_SRC_SH
    # general[repo_name2]=TOOLS_SRC_SH2
    # echo general:${!general[*]}
    # echo general_repo_name:${general[repo_name]}
    # echo general_repo_name2:${general[repo_name2]}

    # Printf '%s\n' "$var" is necessary because printf '%s' "$var" on a
    # variable that doesn't end with a newline then the while loop will
    # completely miss the last line of the variable.
    # while IFS= read -r line
    # do
    #     echo "$line"
    #     # eval "$line"
    # done < <(printf '%s' "${LResult}")

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# function GetINIParametr_SH (AFileName, ASection, AParameter)
#--------------------------------------------------------------------------------
function GetINIParametr_SH () {
#beginfunction
    AFileName=$1
    ASection=$2
    AParameter=$3

    # declare -A inidb      Это делать не обязательно
    __ini_loadfile $AFileName
    #__ini_printdb

    value=$(__ini_get_value $ASection $AParameter)
    echo ${value}
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
