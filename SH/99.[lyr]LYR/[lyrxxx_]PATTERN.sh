#!/bin/bash
# -----------------------------------------------
# [lyrxxx_]PATTERN.sh
# -----------------------------------------------

# -----------------------------------------------
# procedure INIT_PROJECT ()
# -----------------------------------------------
function INIT_PROJECT () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    if [[ -z $INIT_PROJECT ]] ; then
        # -------------------------------------------------------------------
        # PROJECTS_LYR_DIR - каталог проектов LYR
        # -------------------------------------------------------------------
        UNAME=$(uname -n)
        case "$UNAME" in
            'ASUS-W10P')
                PROJECTS_LYR_DIR='/d/PROJECTS_LYR'
                ;;
            'ASUS-U2204-VB' | 'ASUS-U2204-VM' | 'ASUS-U2404-VB' | 'ASUS-U2404-VM' | 'ASUS-U2310')
                PROJECTS_LYR_DIR='/home/lyr/PROJECTS_LYR'
            ;;
            *)
                echo "ERROR: Компьютер не определен...!"
                exit 1
                ;;
        esac
        #echo PROJECTS_LYR_DIR:$PROJECTS_LYR_DIR

        #-------------------------------------------------------------------
        # Инициализация проекта PATTERN
        #-------------------------------------------------------------------
        PROJECT='TOOLS_SRC_SH'
        PROJECTS_DIR="$PROJECTS_LYR_DIR"/'CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX'
        PROJECT_DIR="$PROJECTS_DIR"/'TOOLS_SRC_SH'
        LPROJECTSET="$PROJECT_DIR"/'PATTERN_SET.sh'

        if [[ -r "$LPROJECTSET" ]] ; then
            source "$LPROJECTSET"
        else
            echo INFO: Файл $LPROJECTSET не существует...
        fi
        INIT_PROJECT=1
    fi

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
    #echo O1:$O1
    #AddLog $loALL $tlsTEXT O1:$O1
    #AddLog $loALL $tlsINFO O1:$O1
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
    #echo A1:$A1
    #AddLog $loALL $tlsTEXT A1:$A1
    #AddLog $loALL $tlsINFO A1:$A1
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
function MAIN_FUNC () {
#beginfunction
    AddLog $loALL $tlsTEXT '--------------------------------------'
    AddLog $loALL $tlsTEXT 'MAIN_FUNC ...'
    AddLog $loALL $tlsTEXT '--------------------------------------'

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

    #-------------------------------------------------------------------
    # Установка проекта PATTERN
    #-------------------------------------------------------------------
    INIT_PROJECT

    #-------------------------------------------------------------------
    # Установка LIB LYR
    #-------------------------------------------------------------------
    LINIT_LIB="$PROJECT_DIR"/'INIT_LIB.sh'
    if [[ -r "$LINIT_LIB" ]] ; then
        source "$LINIT_LIB"
        INIT_LIB "$0"
    else
        #-------------------------------------------------------------------
        # Текущий каталог
        #-------------------------------------------------------------------
        LINIT_LIB='./INIT_LIB.sh'
        if [[ -r "$LINIT_LIB" ]] ; then
            source "$LINIT_LIB"
            INIT_LIB "$0"
        else
            echo ERROR: Файл $LINIT_LIB не существует...
            exit 1
        fi
    fi

    # Количество аргументов
    Read_N

    __SHOW_VAR_SCRIPT
    __SHOW_VAR_DEFAULT
    __SHOW_VAR_PROJECTS
    __SHOW_LOG

    StartLogFile

    AddLog $loALL $tlsNOTSET NOTSET
    AddLog $loALL $tlsDEBUG DEBUG
    AddLog $loALL $tlsINFO INFO
    AddLog $loALL $tlsWARNING WARNING
    AddLog $loALL $tlsERROR ERROR
    AddLog $loALL $tlsCRITICAL CRITICAL
    AddLog $loALL $tlsDEBUGTEXT DEBUGTEXT
    AddLog $loALL $tlsBEGIN BEGIN
    AddLog $loALL $tlsEND END
    AddLog $loALL $tlsPROCESS PROCESS
    AddLog $loALL $tlsTEXT TEXT
    
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
