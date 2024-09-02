#!/bin/bash
# -----------------------------------------------
# INIT_TOOLS_SRC_SH.sh
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
        PROJECT_DIR="$PROJECTS_DIR"/$PROJECT
        LPROJECTSET="$PROJECT_DIR"/$PROJECT'_SET.sh'
        if [[ -r "$LPROJECTSET" ]] ; then
            echo INFO: Загрузка $LPROJECTSET ...
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
        # -------------------------------------------------------------------
        # LIB_SH - каталог библиотеки скриптов
        # -------------------------------------------------------------------
        if [[ -z "$LIB_SH" ]] ; then
            LIB_SH="$SCRIPTS_DIR/LIB"
        fi
        if [[ ! -d "$LIB_SH" ]] ; then
            echo ERROR: Каталог библиотеки LYR $LIB_SH не существует...
        else
            # -------------------------------------------------------------------
            # Инициализация БИБЛИОТЕКИ LYR
            # -------------------------------------------------------------------
            echo INFO: Инициализация БИБЛИОТЕКИ LYR $LIB_SH ...
            source "$LIB_SH/LYRINIT.sh" "$1"
        fi
    fi

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
#
#--------------------------------------------------------------------------------
#begin
    #-------------------------------------------------------------------
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
    INIT_LIB "$1"
#end
#--------------------------------------------------------------------------------
