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

    cd $PROJECTS_LYR_DIR

    echo GDirectory:$GDirectory

    if [[ ! -d "$GDirectory" ]] ; then
        #echo INFO: Dir "$GDirectory" not exist ...
        #echo INFO: Create "$GDirectory" ...
        result=$(mkdir -p "$GDirectory")
        if [[ ! $result==0 ]] ; then
            echo ERROR: Dir "$GDirectory" not created...
            exit 1
        fi
    fi

    cd $GDirectory

    if [[ ! -z "$GRepo" ]] ; then
        #echo GRepo:$GRepo
        if [[ ! -d ".git" ]] ; then
            cd ../
            echo git clone: $GRepo
            git clone $GRepo
        else
            echo git pull: $GRepo
            git pull
        fi
    fi
    
    return 0
}
#endfunction

# -----------------------------------------------
# procedure MAIN_07_GIT ()
# -----------------------------------------------
function MAIN_07_GIT () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    DIR_07_GIT=CHECK_LIST/07_GIT

    GDirectory=$DIR_07_GIT/SOFTWARE
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_07_GIT/ДОКУМЕНТАЦИЯ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_07_GIT/ДОКУМЕНТЫ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_07_GIT/КНИГИ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_07_GIT/КУРСЫ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_07_GIT/СТАТЬИ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_07_GIT/FRAMEWORK
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_07_GIT/LIBRARY
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_07_GIT/WORK
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_07_GIT/PROJECTS_GIT/TOOLS_SRC_GIT
    GRepo="git@github.com:lisitsinyr/TOOLS_SRC_GIT.git"
    MAIN_CreateDirectory

    return 0
}
#endfunction

# -----------------------------------------------
# procedure MAIN_01_03_UNIX ()
# -----------------------------------------------
function MAIN_01_03_UNIX () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    DIR_03_UNIX=CHECK_LIST/01_OS/03_UNIX

    GDirectory=$DIR_03_UNIX/SOFTWARE
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_03_UNIX/ДОКУМЕНТАЦИЯ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_03_UNIX/ДОКУМЕНТЫ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_03_UNIX/КНИГИ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_03_UNIX/КУРСЫ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_03_UNIX/СТАТЬИ
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
# procedure MAIN_05_02_Python ()
# -----------------------------------------------
function MAIN_05_02_Python () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    DIR_05_02_Python=CHECK_LIST/05_DESKTOP/02_Python

    GDirectory=$DIR_05_02_Python/SOFTWARE
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_05_02_Python/ДОКУМЕНТАЦИЯ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_05_02_Python/ДОКУМЕНТЫ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_05_02_Python/КНИГИ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_05_02_Python/КУРСЫ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_05_02_Python/СТАТЬИ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_05_02_Python/FRAMEWORK
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_05_02_Python/LIBRARY
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_05_02_Python/PROJECTS
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_05_02_Python/TOOLS_PY
    GRepo="git@github.com:lisitsinyr/TOOLS_PY.git"
    MAIN_CreateDirectory

    GDirectory=$DIR_05_02_Python/VENV
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_05_02_Python/WORK
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_05_02_Python/PROJECTS_PY/EXAMPLES_PY
    GRepo="git@github.com:lisitsinyr/EXAMPLES_PY.git"
    MAIN_CreateDirectory

    GDirectory=$DIR_05_02_Python/PROJECTS_PY/MobileAPP_PY
    GRepo="git@github.com:lisitsinyr/MobileAPP_PY.git"
    MAIN_CreateDirectory

    GDirectory=$DIR_05_02_Python/PROJECTS_PY/PATTERN_PY
    GRepo="git@github.com:lisitsinyr/PATTERN_PY.git"
    MAIN_CreateDirectory

    GDirectory=$DIR_05_02_Python/PROJECTS_PY/TEST_PY
    GRepo=git@github.com:lisitsinyr/TEST_PY.git
    MAIN_CreateDirectory

    GDirectory=$DIR_05_02_Python/PROJECTS_PY/TESTS_PY
    GRepo="git@github.com:lisitsinyr/TESTS_PY.git"
    MAIN_CreateDirectory

    GDirectory=$DIR_05_02_Python/PROJECTS_PY/TOOLS_SRC_PY
    GRepo="git@github.com:lisitsinyr/TOOLS_SRC_PY.git"
    MAIN_CreateDirectory

    GDirectory=$DIR_05_02_Python/PROJECTS_PY/YOUTUBE_PY
    GRepo="git@github.com:lisitsinyr/YOUTUBE_PY.git"
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
            PROJECTS_LYR_ROOT='/d'
            PROJECTS_LYR_ROOT='/d/WORK/UBU'
            PROJECTS_LYR_DIR=$PROJECTS_LYR_ROOT/PROJECTS_LYR
            SCRIPTS_DIR=$PROJECTS_LYR_DIR/CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX/TOOLS_SRC_SH
            ;;
        'ASUS-U2204-VB' | 'ASUS-U2204-VM' | 'ASUS-U2404-VB' | 'ASUS-U2404-VM')
            PROJECTS_LYR_ROOT='/home/lyr'
            PROJECTS_LYR_DIR=$PROJECTS_LYR_ROOT/PROJECTS_LYR
            SCRIPTS_DIR=$PROJECTS_LYR_DIR/CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX/TOOLS_SRC_SH
        ;;
        *)
            echo "ERROR: Компьютер не определен...!"
            exit 1
            ;;
    esac
    echo PROJECTS_LYR_ROOT:$PROJECTS_LYR_ROOT
    echo PROJECTS_LYR_DIR:$PROJECTS_LYR_DIR
    echo SCRIPTS_DIR:$SCRIPTS_DIR

    if [[ ! -d "$PROJECTS_LYR_DIR" ]] ; then
        #echo INFO: Dir "$PROJECTS_LYR_DIR" not exist...
        #echo INFO: Create "$PROJECTS_LYR_DIR" ...

        result=$(mkdir -p "$PROJECTS_LYR_DIR")
        echo result:$result
        if [[ ! $result==0 ]] ; then
            echo ERROR: Dir "$PROJECTS_LYR_DIR" not created...
            exit 1
        fi

    fi

    UNAME=$(uname -n)
    case "$UNAME" in
        'ASUS-W10P')
            ;;
        'ASUS-U2204-VB' | 'ASUS-U2204-VM' | 'ASUS-U2404-VB' | 'ASUS-U2404-VM')
            # Задаем права на созданный каталог
            sudo chmod -R 770 "$PROJECTS_LYR_DIR"
            # Задаем владельца на созданный каталог
            sudo chown -R lyr:lyr "$PROJECTS_LYR_DIR"
        ;;
        *)
            echo "ERROR: Компьютер не определен...!"
            exit 1
            ;;
    esac

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

    MAIN_SetROOT

    MAIN_07_GIT

    MAIN_01_03_UNIX

    MAIN_05_02_Python

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
