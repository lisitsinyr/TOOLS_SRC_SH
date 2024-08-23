#!/bin/bash
# -----------------------------------------------
# [lyrxxx_]PATTERN_empty.sh
# -----------------------------------------------

# -----------------------------------------------
# procedure INIT_PROJECTS_LYR_DIR ()
# -----------------------------------------------
function INIT_PROJECTS_LYR_DIR () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

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

    return 0
}
#endfunction

# -----------------------------------------------
# procedure INIT_PROJECT ()
# -----------------------------------------------
function INIT_PROJECT () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    if [[ -z $INIT_PROJECT ]] ; then
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
# procedure INIT_LIB (SCRIPT)
# -----------------------------------------------
function INIT_LIB () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    if [[ -z $INIT_LIB ]] ; then
        # -------------------------------------------------------------------
        # SCRIPTS_DIR - каталог скриптов
        # -------------------------------------------------------------------
        SCRIPTS_DIR="$PROJECTS_LYR_DIR"'/CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX/TOOLS_SRC_SH'
        echo SCRIPTS_DIR:$SCRIPTS_DIR
        # -------------------------------------------------------------------
        # LIB_SH - каталог библиотеки скриптов
        # -------------------------------------------------------------------
        if [[ -z "$LIB_SH" ]] ; then
            LIB_SH="$SCRIPTS_DIR/LIB"
            echo LIB_SH:$LIB_SH
        fi
        if [[ ! -d "$LIB_SH" ]] ; then
            echo ERROR: Каталог библиотеки LYR $LIB_SH не существует...
            exit 1
        fi
        # -------------------------------------------------------------------
        # Инициализация БИБЛИОТЕКИ LYR
        # -------------------------------------------------------------------
        source "$LIB_SH/LYRINIT.sh" "$1"
    fi

    return 0
}
#endfunction

#begin
    # Установка PROJECTS_LYR_DIR
    #-------------------------------------------------------------------
    INIT_PROJECTS_LYR_DIR
    #-------------------------------------------------------------------
    # Установка проекта PATTERN
    #-------------------------------------------------------------------
    INIT_PROJECT
    #-------------------------------------------------------------------
    # Установка LIB LYR
    #-------------------------------------------------------------------
    INIT_LIB "$0"

    # Количество аргументов
    Read_N

    __SHOW_VAR_SCRIPT
    __SHOW_VAR_DEFAULT
    __SHOW_VAR_PROJECTS
    __SHOW_LOG

    #read -n 1 -s -r -p $'Press any key to continue ...\n'
    PressAnyKey

    return 0
#end

# ===================================================================
