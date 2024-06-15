#!/bin/bash
# -------------------------------------------------------------------
# CREATE_PROJECTS_LYR.sh
# -------------------------------------------------------------------

# -----------------------------------------------
# procedure MAIN_CreateDirectory ()
# -----------------------------------------------
function MAIN_CreateDirectory () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    echo GDirectory:$GDirectory
    echo GRepo:$GRepo

    cd $PROJECTS_LYR_ROOT

    if [[ ! -d "$GDirectory" ]] ; then
        echo INFO: Dir "$GDirectory" not exist ...
        echo INFO: Create "$GDirectory" ...
        result=$(mkdir -p "$GDirectory")
        if [[ ! $result==0 ]] ; then
            echo ERROR: Dir "$GDirectory" not created...
            exit 1
        fi
    fi

    if [[ ! -z "$GRepo" ]] ; then
        cd $GDirectory
        #git clone $GRepo
    fi

    return 0
}
#endfunction

# -----------------------------------------------
# procedure MAIN_03_UNIX ()
# -----------------------------------------------
function MAIN_03_UNIX () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    DIR_03_UNIX=PROJECTS_LYR/CHECK_LIST/01_OS/03_UNIX

    GDirectory=$DIR_03_UNIX/!!SOFTWARE
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_03_UNIX/!!ДОКУМЕНТАЦИЯ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_03_UNIX/!!ДОКУМЕНТЫ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_03_UNIX/!!КНИГИ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_03_UNIX/!!КУРСЫ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_03_UNIX/!!СТАТЬИ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_03_UNIX/FRAMEWORK
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_03_UNIX/LIBRARY
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_03_UNIX/WORK
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_03_UNIX/TOOLS_SH
    GRepo="git@github.com:lisitsinyr/TOOLS_SH.git"
    MAIN_CreateDirectory

    GDirectory=$DIR_03_UNIX/PROJECTS/UBUNTU
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_03_UNIX/PROJECTS_UNIX/COMMANDS
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_03_UNIX/PROJECTS_UNIX/TESTS_SH
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_03_UNIX/PROJECTS_UNIX/TOOLS_SRC_SH
    GRepo="git@github.com:lisitsinyr/TOOLS_SRC_SH.git"
    MAIN_CreateDirectory

    return 0
}
#endfunction

# -----------------------------------------------
# procedure MAIN_02_Python ()
# -----------------------------------------------
function MAIN_02_Python () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    DIR_02_Python=PROJECTS_LYR/CHECK_LIST/05_DESKTOP/02_Python

    GDirectory=$DIR_02_Python/!!SOFTWARE
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_02_Python/!!ДОКУМЕНТАЦИЯ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_02_Python/!!ДОКУМЕНТЫ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_02_Python/!!КНИГИ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_02_Python/!!КУРСЫ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_02_Python/!!СТАТЬИ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_02_Python/FRAMEWORK
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_02_Python/LIBRARY
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_02_Python/PROJECTS
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_02_Python/TOOLS_PY
    GRepo="git@github.com:lisitsinyr/TOOLS_PY.git"
    MAIN_CreateDirectory

    GDirectory=$DIR_02_Python/VENV/P312
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_02_Python/WORK
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_02_Python/PROJECTS_PY/EXAMPLES_PY
    GRepo="git@github.com:lisitsinyr/EXAMPLES_PY.git"
    MAIN_CreateDirectory

    GDirectory=$DIR_02_Python/PROJECTS_PY/MobileAPP_PY
    GRepo="git@github.com:lisitsinyr/MobileAPP.git"
    MAIN_CreateDirectory

    GDirectory=$DIR_02_Python/PROJECTS_PY/PATTERN_PY
    GRepo="git@github.com:lisitsinyr/PATTERN_PY.git"
    MAIN_CreateDirectory

    GDirectory=$DIR_02_Python/PROJECTS_PY/TEST_PY
    GRepo=git@github.com:lisitsinyr/TEST_PY.git
    MAIN_CreateDirectory

    GDirectory=$DIR_02_Python/PROJECTS_PY/TESTS_PY
    GRepo="git@github.com:lisitsinyr/TESTS_PY.git"
    MAIN_CreateDirectory

    GDirectory=$DIR_02_Python/PROJECTS_PY/TOOLS_SRC_PY
    GRepo="git@github.com:lisitsinyr/TOOLS_SRC_PY.git"
    MAIN_CreateDirectory

    GDirectory=$DIR_02_Python/PROJECTS_PY/YOUTUBE_PY
    GRepo="git@github.com:lisitsinyr/YOUTUBE.git"
    MAIN_CreateDirectory

    return 0
}
#endfunction

# =================================================
# procedure MAIN_SetROOT ()
# =================================================
function MAIN_SetROOT () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    UNAME=$(uname -n)
    case "$UNAME" in
        'ASUS-W10P')
            PROJECTS_LYR_ROOT='/d/WORK'
            PROJECTS_LYR_ROOT='/d/WORK/LYR'
            ;;
        'ASUS-U2204-VB' | 'ASUS-U2204-VM' | 'ASUS-U2310-VB' | 'ASUS-U2310-VB' | 'ASUS-U2310')
            PROJECTS_LYR_ROOT='/home/lyr'
        ;;
        *)
            echo "ERROR: Компьютер не определен...!"
            exit 1
            ;;
    esac

    return 0
}
#endfunction

# -----------------------------------------------
# procedure MAIN_INIT ()
# -----------------------------------------------
function MAIN_INIT () {
#beginfunction
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
    source "$LIB_SH/LYRFileUtils.sh"
    source "$LIB_SH/LYRConst.sh"
    source "$LIB_SH/LYRLog.sh"
    source "$LIB_SH/LYRConst.sh"
    source "$LIB_SH/LYRDateTime.sh"
    source "$LIB_SH/LYRSupport.sh"

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

    # -------------------------------------
    # ARGS
    # -------------------------------------
    PN_CAPTION=PROJECTS_LYR_ROOT
    Read_P PROJECTS_LYR_ROOT $PROJECTS_LYR_ROOT
    echo PROJECTS_LYR_ROOT:$PROJECTS_LYR_ROOT
    #AddLog $loAll $TEXT PROJECTS_LYR_ROOT:$PROJECTS_LYR_ROOT
    #AddLog $loAll $INFO PROJECTS_LYR_ROOT:$PROJECTS_LYR_ROOT
    if [[ ! -z "$PROJECTS_LYR_ROOT" ]] ; then
        ARGS="$PROJECTS_LYR_ROOT $PROJECTS_LYR_ROOT"
    else
        echo ERROR: PROJECTS_LYR_ROOT not defined ...
        OK=
    fi

    return 0
}
#endfunction

# =================================================
# procedure MAIN (%*)
# =================================================
function MAIN () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    BATNAME=$0
    echo Start $BATNAME ...

    MAIN_INIT

    MAIN_SetROOT

    MAIN_CHECK_PARAMETR

    if [[ ! -d "$PROJECTS_LYR_ROOT" ]] ; then
        echo INFO: Dir "$PROJECTS_LYR_ROOT" not exist...
        #echo INFO: Каталог "$PROJECTS_LYR_ROOT" не существует...
        echo INFO: Create "$PROJECTS_LYR_ROOT" ...
        result=$(mkdir "$PROJECTS_LYR_ROOT")
        if [[ ! $result==0 ]] ; then
            echo ERROR: Dir "$PROJECTS_LYR_ROOT" not created...
            exit 1
        fi
    fi

    MAIN_03_UNIX

    MAIN_02_Python

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
#
#--------------------------------------------------------------------------------
#begin
    MAIN
#end
#--------------------------------------------------------------------------------
