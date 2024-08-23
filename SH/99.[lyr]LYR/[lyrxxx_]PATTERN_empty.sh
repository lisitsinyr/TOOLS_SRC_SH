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
    PROJECTS_LYR_DIR=...

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
        # Инициализация проекта PATTERN_empty
        #-------------------------------------------------------------------
        PROJECT='TOOLS_SRC_SH'
        PROJECTS_DIR="$PROJECTS_LYR_DIR"/'CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX'
        PROJECT_DIR="$PROJECTS_DIR"/$PROJECT
        LPROJECTSET="$PROJECT_DIR"/$PROJECT'_SET.sh'
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
        SCRIPTS_DIR=...
        # -------------------------------------------------------------------
        # LIB_SH - каталог библиотеки скриптов
        # -------------------------------------------------------------------
        if [[ -z "$LIB_SH" ]] ; then
            LIB_SH=...
        fi
        if [[ ! -d "$LIB_SH" ]] ; then
            echo ERROR: Каталог библиотеки LYR $LIB_SH не существует ...
        else
            # -------------------------------------------------------------------
            # Инициализация БИБЛИОТЕКИ LYR
            # -------------------------------------------------------------------
            echo INFO: Инициализация БИБЛИОТЕКИ LYR $LIB_SH ...
            #source "$LIB_SH/LYRINIT.sh" "$1"
        fi
    fi

    return 0
}
#endfunction

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
    INIT_LIB "$0"

    read -n 1 -s -r -p $'Press any key to continue ...\n'

    return 0
#end

# ===================================================================
