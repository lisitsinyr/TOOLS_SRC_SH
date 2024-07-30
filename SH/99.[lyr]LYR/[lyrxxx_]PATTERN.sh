#!/bin/bash
# -----------------------------------------------
# [lyrxxx_]PATTERN.sh
# -----------------------------------------------

# -----------------------------------------------
# procedure MAIN_INIT ()
# -----------------------------------------------
function MAIN_INIT () {
#beginfunction
    #echo DEBUG: $DEBUG
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    # -------------------------------------------------------------------
    # SCRIPTS_DIR - каталог скриптов
    # -------------------------------------------------------------------
    UNAME=$(uname -n)
    case "$UNAME" in
        'ASUS-W10P')
            PROJECTS_LYR_DIR='/d/PROJECTS_LYR'
            SCRIPTS_DIR='/d/PROJECTS_LYR/CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX/TOOLS_SRC_SH'
            ;;
        'ASUS-U2204-VB' | 'ASUS-U2204-VM' | 'ASUS-U2310-VB' | 'ASUS-U2310-VB' | 'ASUS-U2310')
            PROJECTS_LYR_DIR='/home/lyr/PROJECTS_LYR'
            SCRIPTS_DIR='/home/lyr/PROJECTS_LYR/CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX/TOOLS_SRC_SH'
        ;;
        *)
            echo "ERROR: Компьютер не определен...!"
            exit 1
            ;;
    esac
    echo PROJECTS_LYR_DIR:$PROJECTS_LYR_DIR
    echo SCRIPTS_DIR:$SCRIPTS_DIR

    # -------------------------------------------------------------------
    # LIB_SH - каталог библиотеки скриптов
    # -------------------------------------------------------------------
    if [[ -z "$LIB_SH" ]] ; then
        LIB_SH="$SCRIPTS_DIR/LIB"
        echo LIB_SH: $LIB_SH
    fi
    if [[ ! -d "$LIB_SH" ]] ; then
        echo ERROR: Каталог библиотеки LYR $LIB_SH не существует...
        exit 1
    fi

    # -------------------------------------------------------------------
    # запуск скриптов БИБЛИОТЕКИ LYR
    # -------------------------------------------------------------------
    source "$LIB_SH/LYRConst.sh"
    source "$LIB_SH/LYRFileUtils.sh"
    source "$LIB_SH/LYRLog.sh"
    source "$LIB_SH/LYRConst.sh"
    source "$LIB_SH/LYRDateTime.sh"
    source "$LIB_SH/LYRSupport.sh"
    source "$LIB_SH/LYRParserINI.sh"
    source "$LIB_SH/LUConsole.sh"
    return 0
}
#endfunction

# -----------------------------------------------
# procedure MAIN_SET ()
# -----------------------------------------------
function MAIN_SET () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure MAIN_CHECK_PARAMETR ()
#--------------------------------------------------------------------------------
function MAIN_CHECK_PARAMETR () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    # -------------------------------------
    # OPTION
    # -------------------------------------
    O1=O1_default
    PN_CAPTION=O1
    Read_P O1
    echo O1:$O1
    #AddLog $loAll $tlsTEXT O1:$O1
    #AddLog $loAll $tlsINFO O1:$O1
    if [[ ! -z "$O1" ]] ; then
        OPTION="$OPTION --O1 $O1"
    else
        echo INFO: O1 not defined ...
    fi

    # -------------------------------------
    # ARGS
    # -------------------------------------
    # Проверка на обязательные аргументы
    A1=
    PN_CAPTION=A1
    Read_P A1 A1
    echo A1:$A1
    #AddLog $loAll $tlsTEXT A1:$A1
    #AddLog $loAll $tlsINFO A1:$A1
    if [[ ! -z "$A1" ]] ; then
        ARGS="$ARGS $A1"
    else
        echo ERROR: A1 not defined ...
        OK=
    fi

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure MAIN_FUNC ()
#--------------------------------------------------------------------------------
function MAIN_FUNC {
#beginfunction
    AddLog $loAll $tlsTEXT '--------------------------------------'
    AddLog $loAll $tlsTEXT 'MAIN_FUNC ...'
    AddLog $loAll $tlsTEXT '--------------------------------------'
    # -------------------------------------------------------------------
    # запуск скриптов
    # -------------------------------------------------------------------
    #source "$PROJECTS_DIR"/"TOOLS_SH/LIB/[lyrxxx_]PATTERN_FUNCTION.sh"
    #FUNC_01

    return 0
}
#endfunction

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

    DEBUG=0

    # -------------------------------------------------------------------
    # SCRIPTS_DIR - Каталог скриптов
    # LIB_BAT - каталог библиотеки скриптов
    # SCRIPTS_DIR_KIX - Каталог скриптов KIX
    # -------------------------------------------------------------------
    MAIN_INIT

    # Количество аргументов
    Read_N
    echo Read_N:$Read_N

    SET_LIB "$0"
    #echo CURRENT_DIR:$CURRENT_DIR
    echo SCRIPT_FULLFILENAME:$SCRIPT_FULLFILENAME

    StartLogFile

    AddLog $loAll $tlsNOTSET NOTSET
    AddLog $loAll $tlsDEBUG DEBUG
    AddLog $loAll $tlsINFO INFO
    AddLog $loAll $tlsWARNING WARNING
    AddLog $loAll $tlsERROR ERROR
    AddLog $loAll $tlsCRITICAL CRITICAL
    AddLog $loAll $tlsDEBUGTEXT DEBUGTEXT
    AddLog $loAll $tlsBEGIN BEGIN
    AddLog $loAll $tlsEND END
    AddLog $loAll $tlsPROCESS PROCESS
    AddLog $loAll $tlsTEXT TEXT
    
    OK=yes
    MAIN_SET

    if [[ ! -z "$OK" ]] ; then #if defined OK if not defined Read_N (
        MAIN_CHECK_PARAMETR
    fi

    OK=yes
    if [[ ! -z "$OK" ]] ; then
        MAIN_FUNC
        #Pause "$SLEEP"
        #PressAnyKey
    fi

    StopLogFile

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
#
#--------------------------------------------------------------------------------
#begin
    MAIN

    PressAnyKey
#end
#--------------------------------------------------------------------------------
