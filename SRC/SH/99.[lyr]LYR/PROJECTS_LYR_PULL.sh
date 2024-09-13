#!/bin/bash
# -------------------------------------------------------------------
# PROJECTS_LYR_PULL.sh
# -------------------------------------------------------------------

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
    #echo UNAME:$UNAME
    case "$UNAME" in
        'ASUS-W10P')
            PROJECTS_LYR_ROOT=/d
            PROJECTS_LYR_ROOT=/d/WORK/UBU
            PROJECTS_LYR_DIR=$PROJECTS_LYR_ROOT/PROJECTS_LYR
            PROJECTS_LYR_DIR='/d/PROJECTS_LYR'

            SCRIPTS_DIR=$PROJECTS_LYR_DIR/CHECK_LIST/OS/UNIX/PROJECTS_UNIX/TOOLS_SRC_SH
            SCRIPTS_DIR=/d/PROJECTS_LYR/CHECK_LIST/OS/UNIX/PROJECTS_UNIX/TOOLS_SRC_SH
            SCRIPTS_DIR='/d/PROJECTS_LYR/CHECK_LIST/OS/UNIX/PROJECTS_UNIX/TOOLS_SRC_SH'
            ;;
        'ASUS-U2204-VB' | 'ASUS-U2204-VM' | 'ASUS-U2404-VB' | 'ASUS-U2404-VM' | 'ASUS-U2310')
            PROJECTS_LYR_ROOT=/home/lyr
            PROJECTS_LYR_DIR=$PROJECTS_LYR_ROOT/PROJECTS_LYR
            PROJECTS_LYR_DIR='/home/lyr/PROJECTS_LYR'

            SCRIPTS_DIR=$PROJECTS_LYR_DIR/CHECK_LIST/OS/UNIX/PROJECTS_UNIX/TOOLS_SRC_SH
            SCRIPTS_DIR='/home/lyr/PROJECTS_LYR/CHECK_LIST/OS/UNIX/PROJECTS_UNIX/TOOLS_SRC_SH'
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
        LIB_SH="$SCRIPTS_DIR/SRC/LIB"
        #echo LIB_SH:$LIB_SH
    fi
    if [[ ! -d "$LIB_SH" ]] ; then
        echo ERROR: Каталог библиотеки LYR $LIB_SH не существует...
        exit 1
    fi
    # -------------------------------------------------------------------
    # Инициализация БИБЛИОТЕКИ LYR
    # -------------------------------------------------------------------
    source "$LIB_SH/LYRINIT.sh" "$1"

    return 0
}
#endfunction






















# -----------------------------------------------
# 01.MAIN_INIT ()
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
    #echo UNAME:$UNAME
    case "$UNAME" in
        'ASUS-W10P')
            PROJECTS_LYR_ROOT=/d
            PROJECTS_LYR_ROOT=/d/WORK/UBU
            PROJECTS_LYR_DIR=$PROJECTS_LYR_ROOT/PROJECTS_LYR
            SCRIPTS_DIR=$PROJECTS_LYR_DIR/CHECK_LIST/OS/UNIX/PROJECTS_UNIX/TOOLS_SRC_SH
            SCRIPTS_DIR=/d/PROJECTS_LYR/CHECK_LIST/OS/UNIX/PROJECTS_UNIX/TOOLS_SRC_SH
            ;;
        'ASUS-U2204-VB' | 'ASUS-U2204-VM' | 'ASUS-U2404-VB' | 'ASUS-U2404-VM' | 'ASUS-U2310')
            PROJECTS_LYR_ROOT=/home/lyr
            PROJECTS_LYR_DIR=$PROJECTS_LYR_ROOT/PROJECTS_LYR
            SCRIPTS_DIR=$PROJECTS_LYR_DIR/CHECK_LIST/OS/UNIX/PROJECTS_UNIX/TOOLS_SRC_SH
        ;;
        *)
            echo "ERROR: Компьютер не определен...!"
            exit 1
            ;;
    esac
    #echo PROJECTS_LYR_ROOT:$PROJECTS_LYR_ROOT
    #echo PROJECTS_LYR_DIR:$PROJECTS_LYR_DIR
    #echo SCRIPTS_DIR:$SCRIPTS_DIR

    if [[ ! -d "$PROJECTS_LYR_DIR" ]] ; then
        #echo INFO: Dir "$PROJECTS_LYR_DIR" not exist...
        #echo INFO: Create "$PROJECTS_LYR_DIR" ...
        result=$(mkdir -p "$PROJECTS_LYR_DIR")
        #echo result:$result
        if [[ ! $result==0 ]] ; then
            echo ERROR: Dir "$PROJECTS_LYR_DIR" not created...
            exit 1
        fi
    fi

    UNAME=$(uname -n)
    case "$UNAME" in
        'ASUS-W10P')
            ;;
        'ASUS-U2204-VB' | 'ASUS-U2204-VM' | 'ASUS-U2404-VB' | 'ASUS-U2404-VM' | 'ASUS-U2310')
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

    # -------------------------------------------------------------------
    # LIB_SH - каталог библиотеки скриптов
    # -------------------------------------------------------------------
    if [[ -z "$LIB_SH" ]] ; then
        LIB_SH="$SCRIPTS_DIR/SRC/LIB"
        #echo LIB_SH: $LIB_SH
    fi
    if [[ ! -d "$LIB_SH" ]] ; then
        echo ERROR: Каталог библиотеки LYR $LIB_SH не существует...
        exit 1
    fi

    # -------------------------------------------------------------------
    # запуск скриптов БИБЛИОТЕКИ LYR
    # -------------------------------------------------------------------
    #source "$LIB_SH/LYRConst.sh"
    #source "$LIB_SH/LYRFileUtils.sh"
    #source "$LIB_SH/LYRLog.sh"
    #source "$LIB_SH/LYRConst.sh"
    #source "$LIB_SH/LYRDateTime.sh"
    #source "$LIB_SH/LYRSupport.sh"
    #source "$LIB_SH/LYRParserINI.sh"
    #source "$LIB_SH/LYRConsole.sh"
    source "$LIB_SH/LYRINIT.sh" "$0"
    SET_LIB "$0"

    return 0
}
#endfunction

# -----------------------------------------------
# 02.MAIN_SET ()
# -----------------------------------------------
function MAIN_SET () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    DIR_TOOLS=~/TOOLS

    #------------------------------------------------
    # 01_UNIX
    #------------------------------------------------
    DIR_COMMANDS_SH=$PROJECTS_LYR_DIR/CHECK_LIST/OS/UNIX/PROJECTS_UNIX/COMMANDS_SH
    DIR_TOOLS_SRC_SH=$PROJECTS_LYR_DIR/CHECK_LIST/OS/UNIX/PROJECTS_UNIX/TOOLS_SRC_SH
    DIR_TOOLS_SH=$PROJECTS_LYR_DIR/CHECK_LIST/OS/UNIX/TOOLS_SH

    #------------------------------------------------
    # 05_Python
    #------------------------------------------------
    DIR_PYTHON=$PROJECTS_LYR_DIR/CHECK_LIST/DESKTOP/Python/PROJECTS_PY
    DIR_EXAMPLES_PY=$DIR_PYTHON/EXAMPLES_PY
    DIR_MobileAPP_PY=$DIR_PYTHON/MobileAPP_PY
    DIR_PATTERN_PY=$DIR_PYTHON/PATTERN_PY
    DIR_TEST_PY=$DIR_PYTHON/TEST_PY
    DIR_YOUTUBE_PY=$DIR_PYTHON/YOUTUBE_PY
    DIR_TESTS_PY=$DIR_PYTHON/TESTS_PY
    DIR_TOOLS_SRC_PY=$DIR_PYTHON/TOOLS_SRC_PY
    DIR_TOOLS_PY=$PROJECTS_LYR_DIR/CHECK_LIST/DESKTOP/Python/TOOLS_PY

    #------------------------------------------------
    # GIT
    #------------------------------------------------
    DIR_TOOLS_SRC_GIT=$PROJECTS_LYR_DIR/CHECK_LIST/GIT/PROJECTS_GIT/TOOLS_SRC_GIT
    DIR_TOOLS_GIT=$PROJECTS_LYR_DIR/CHECK_LIST/GIT/TOOLS_GIT

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# 03.MAIN_CHECK_PARAMETR ()
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
    Read_P O1 O1
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

# -----------------------------------------------
# procedure MAIN_CreateDirectory ()
# -----------------------------------------------
function MAIN_CreateDirectory () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    if [[ "$GDirectory" != "$DIR_TOOLS/TOOLS_SH" ]] ; then
        cd $PROJECTS_LYR_DIR
    fi

    if [[ ! -d "$GDirectory" ]] ; then
        echo $GDirectory
        #echo INFO: Dir "$GDirectory" not exist ...
        echo INFO: Create "$GDirectory" ...
        result=$(mkdir -p "$GDirectory")
        if [[ ! $result==0 ]] ; then
            echo ERROR: Dir "$GDirectory" not created...
            exit 1
        fi
    fi

    cd $GDirectory

    if [[ ! -z "$GRepo" ]] ; then
        if [[ "$GDirectory" != "$DIR_TOOLS/TOOLS_SH" ]] ; then
            echo $PROJECTS_LYR_DIR/$GDirectory
        else
            echo $GDirectory
        fi
        #echo GRepo:$GRepo
        if [[ ! -d ".git" ]] ; then
            cd ../
            echo ...git clone:$GRepo
            git clone $GRepo
        else
            echo ...git pull:$GRepo
            git pull
        fi
    fi

    return 0
}
#endfunction

# -----------------------------------------------
# procedure MAIN_01_UNIX ()
# -----------------------------------------------
function MAIN_01_UNIX () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    echo ===============================
    echo 01_UNIX ...
    echo ===============================

    DIR_UNIX=CHECK_LIST/OS/UNIX

    GDirectory=$DIR_UNIX/SOFTWARE
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_UNIX/ДОКУМЕНТАЦИЯ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_UNIX/ДОКУМЕНТЫ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_UNIX/КНИГИ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_UNIX/КУРСЫ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_UNIX/СТАТЬИ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_UNIX/FRAMEWORK
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_UNIX/LIBRARY
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_UNIX/WORK
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_UNIX/TOOLS_SH
    GRepo="git@github.com:lisitsinyr/TOOLS_SH.git"
    MAIN_CreateDirectory

    GDirectory=$DIR_UNIX/PROJECTS/UBUNTU
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_UNIX/PROJECTS_UNIX/COMMANDS_SH
    GRepo=git@github.com:lisitsinyr/COMMANDS_SH.git
    MAIN_CreateDirectory
    #chmod -R u+x $GDirectory
    find $PROJECTS_LYR_DIR/$GDirectory/ -name "*.sh" -exec chmod u+x {} \;

    GDirectory=$DIR_UNIX/PROJECTS_UNIX/TESTS_SH
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_UNIX/PROJECTS_UNIX/TOOLS_SRC_SH
    GRepo="git@github.com:lisitsinyr/TOOLS_SRC_SH.git"
    MAIN_CreateDirectory
    find $PROJECTS_LYR_DIR/$GDirectory/ -name "*.sh" -exec chmod u+x {} \;

    GDirectory=$DIR_TOOLS/TOOLS_SH
    GRepo="git@github.com:lisitsinyr/TOOLS_SH.git"
    MAIN_CreateDirectory
    find $GDirectory/ -name "*.sh" -exec chmod u+x {} \;

    return 0
}
#endfunction

# -----------------------------------------------
# procedure MAIN_05_Python ()
# -----------------------------------------------
function MAIN_05_Python () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    echo ===============================
    echo 05_Python ...
    echo ===============================

    DIR_05_Python=CHECK_LIST/DESKTOP/Python

    GDirectory=$DIR_05_Python/SOFTWARE
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_05_Python/ДОКУМЕНТАЦИЯ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_05_Python/ДОКУМЕНТЫ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_05_Python/КНИГИ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_05_Python/КУРСЫ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_05_Python/СТАТЬИ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_05_Python/FRAMEWORK
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_05_Python/LIBRARY
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_05_Python/PROJECTS
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_05_Python/TOOLS_PY
    GRepo="git@github.com:lisitsinyr/TOOLS_PY.git"
    MAIN_CreateDirectory

    GDirectory=$DIR_05_Python/VENV
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_05_Python/WORK
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_05_Python/PROJECTS_PY/EXAMPLES_PY
    GRepo="git@github.com:lisitsinyr/EXAMPLES_PY.git"
    MAIN_CreateDirectory

    GDirectory=$DIR_05_Python/PROJECTS_PY/MobileAPP_PY
    GRepo="git@github.com:lisitsinyr/MobileAPP_PY.git"
    MAIN_CreateDirectory

    GDirectory=$DIR_05_Python/PROJECTS_PY/PATTERN_PY
    GRepo="git@github.com:lisitsinyr/PATTERN_PY.git"
    MAIN_CreateDirectory

    GDirectory=$DIR_05_Python/PROJECTS_PY/TEST_PY
    GRepo=git@github.com:lisitsinyr/TEST_PY.git
    MAIN_CreateDirectory

    GDirectory=$DIR_05_Python/PROJECTS_PY/TESTS_PY
    GRepo="git@github.com:lisitsinyr/TESTS_PY.git"
    MAIN_CreateDirectory

    GDirectory=$DIR_05_Python/PROJECTS_PY/TOOLS_SRC_PY
    GRepo="git@github.com:lisitsinyr/TOOLS_SRC_PY.git"
    MAIN_CreateDirectory

    GDirectory=$DIR_05_Python/PROJECTS_PY/YOUTUBE_PY
    GRepo="git@github.com:lisitsinyr/YOUTUBE_PY.git"
    MAIN_CreateDirectory

    GDirectory=$DIR_TOOLS/TOOLS_PY
    GRepo="git@github.com:lisitsinyr/TOOLS_PY.git"
    MAIN_CreateDirectory

    return 0
}
#endfunction

# -----------------------------------------------
# procedure MAIN_GIT ()
# -----------------------------------------------
function MAIN_GIT () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    echo ===============================
    echo GIT ...
    echo ===============================

    DIR_GIT=CHECK_LIST/GIT

    GDirectory=$DIR_GIT/SOFTWARE
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_GIT/ДОКУМЕНТАЦИЯ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_GIT/ДОКУМЕНТЫ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_GIT/КНИГИ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_GIT/КУРСЫ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_GIT/СТАТЬИ
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_GIT/FRAMEWORK
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_GIT/LIBRARY
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_GIT/WORK
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_GIT/TOOLS_GIT
    #GRepo="git@github.com:lisitsinyr/TOOLS_GIT.git"
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_GIT/PROJECTS_GIT/TOOLS_SRC_GIT
    GRepo="git@github.com:lisitsinyr/TOOLS_SRC_GIT.git"
    MAIN_CreateDirectory

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# 04.MAIN_FUNC ()
#--------------------------------------------------------------------------------
function MAIN_FUNC {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    AddLog $loALL $tlsTEXT '--------------------------------------'
    AddLog $loALL $tlsTEXT 'MAIN_FUNC ...'
    AddLog $loALL $tlsTEXT '--------------------------------------'

    # -------------------------------------------------------------------
    # запуск скриптов
    # -------------------------------------------------------------------

    MAIN_01_UNIX

    MAIN_05_Python

    MAIN_GIT

    #PressAnyKey

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
    LOG_FILE_ADD=0

    # -------------------------------------------------------------------
    # 01.MAIN_INIT
    # SCRIPTS_DIR - Каталог скриптов
    # LIB_BAT - каталог библиотеки скриптов
    # SCRIPTS_DIR_KIX - Каталог скриптов KIX
    # -------------------------------------------------------------------
    MAIN_INIT

    # Количество аргументов
    Read_N
    echo Read_N:$Read_N

    SET_LIB $0

    #echo CURRENT_DIR:$CURRENT_DIR
    #echo SCRIPT_FULLFILENAME:$SCRIPT_FULLFILENAME
    #PressAnyKey

    StartLogFile

    OK=yes
    # -------------------------------------------------------------------
    # 02.MAIN_SET
    # -------------------------------------------------------------------
    MAIN_SET

    # -------------------------------------------------------------------
    # 03.MAIN_CHECK_PARAMETR
    # -------------------------------------------------------------------
    if [[ ! -z "$OK" ]] ; then #if defined OK if not defined Read_N (
        MAIN_CHECK_PARAMETR
    fi

    OK=yes
    # -------------------------------------------------------------------
    # 04.MAIN_FUNC
    # -------------------------------------------------------------------
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
#end
#--------------------------------------------------------------------------------
