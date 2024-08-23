#!/bin/bash
# -----------------------------------------------
# LYRINIT.sh
# -----------------------------------------------

# =================================================
# ФУНКЦИИ
# =================================================

#--------------------------------------------------------------------------------
# procedure LYRINIT ()
#--------------------------------------------------------------------------------
function LYRINIT () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

# -----------------------------------------------
# procedure INIT_LIB (SCRIPT)
# -----------------------------------------------
function INIT_LIB () {
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
        'ASUS-U2204-VB' | 'ASUS-U2204-VM' | 'ASUS-U2404-VB' | 'ASUS-U2404-VM' | 'ASUS-U2310')
            PROJECTS_LYR_DIR='/home/lyr/PROJECTS_LYR'
            SCRIPTS_DIR='/home/lyr/PROJECTS_LYR/CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX/TOOLS_SRC_SH'
        ;;
        *)
            echo "ERROR: Компьютер не определен...!"
            exit 1
            ;;
    esac
    #echo PROJECTS_LYR_DIR:$PROJECTS_LYR_DIR
    #echo SCRIPTS_DIR:$SCRIPTS_DIR

    # -------------------------------------------------------------------
    # LIB_SH - каталог библиотеки скриптов
    # -------------------------------------------------------------------
    if [[ -z "$LIB_SH" ]] ; then
        LIB_SH="$SCRIPTS_DIR/LIB"
        #echo LIB_SH:$LIB_SH
    fi
    if [[ ! -d "$LIB_SH" ]] ; then
        echo ERROR: Каталог библиотеки LYR $LIB_SH не существует...
        exit 1
    fi

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
#
#--------------------------------------------------------------------------------
#begin
    if [[ -z $LYRINIT ]] ; then
        INIT_LIB

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
        source "$LIB_SH/LYRConsole.sh"
        SET_LIB "$1"

        LYRINIT=1
    fi

    return 0

#end
#--------------------------------------------------------------------------------
