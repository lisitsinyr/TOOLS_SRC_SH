#!/bin/bash
# -------------------------------------------------------------------
# PROJECTS_LYR_PUSH.sh
# -------------------------------------------------------------------

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
    case "$UNAME" in
        'ASUS-W10P')
            PROJECTS_LYR_ROOT=/d
            PROJECTS_LYR_ROOT=/d/WORK/UBU
            PROJECTS_LYR_DIR=$PROJECTS_LYR_ROOT/PROJECTS_LYR

            SCRIPTS_DIR=$PROJECTS_LYR_DIR/CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX/TOOLS_SRC_SH
            SCRIPTS_DIR=/d/PROJECTS_LYR/CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX/TOOLS_SRC_SH

            ;;
        'ASUS-U2204-VB' | 'ASUS-U2204-VM' | 'ASUS-U2310-VB' | 'ASUS-U2310-VB' | 'ASUS-U2310')
            PROJECTS_LYR_ROOT=/home/lyr
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
    source "$LIB_SH/LYRParserINI.sh"
    source "$LIB_SH/LUConsole.sh"

    #PressAnyKey

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

    #------------------------------------------------
    # 01_03_UNIX
    #------------------------------------------------
    DIR_TOOLS_SRC_SH=$PROJECTS_LYR_DIR/CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX/TOOLS_SRC_SH
    DIR_TOOLS_SH=$PROJECTS_LYR_DIR/CHECK_LIST/01_OS/03_UNIX/TOOLS_SH

    #------------------------------------------------
    # 05_02_Python
    #------------------------------------------------
    DIR_PYTHON=$PROJECTS_LYR_DIR/CHECK_LIST/05_DESKTOP/02_Python/PROJECTS_PY
    DIR_EXAMPLES_PY=$DIR_PYTHON/EXAMPLES_PY
    DIR_MobileAPP_PY=$DIR_PYTHON/MobileAPP_PY
    DIR_PATTERN_PY=$DIR_PYTHON/PATTERN_PY
    DIR_TEST_PY=$DIR_PYTHON/TEST_PY
    DIR_YOUTUBE_PY=$DIR_PYTHON/YOUTUBE_PY
    DIR_TESTS_PY=$DIR_PYTHON/TESTS_PY
    DIR_TOOLS_SRC_PY=$DIR_PYTHON/TOOLS_SRC_PY
    DIR_TOOLS_PY=$PROJECTS_LYR_DIR/CHECK_LIST/05_DESKTOP/02_Python/TOOLS_PY
    DIR_TOOLS_PY_=~/TOOLS/TOOLS_PY

    #------------------------------------------------
    # 07_GIT
    #------------------------------------------------
    DIR_TOOLS_SRC_GIT=$PROJECTS_LYR_DIR/CHECK_LIST/07_GIT/PROJECTS_GIT/TOOLS_SRC_GIT
    DIR_TOOLS_GIT=$PROJECTS_LYR_DIR/CHECK_LIST/07_GIT/TOOLS_GIT

    #PressAnyKey

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

# --------------------------------------------------------------------------------
# procedure UPDATE_TOOLS_SH ()
# --------------------------------------------------------------------------------
function UPDATE_TOOLS_SH () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    LDIR_FROM=$DIR_TOOLS_SRC_SH/SH
    echo LDIR_FROM:$LDIR_FROM
    LMASK=*.*
    echo LMASK:$LMASK
    LDIR_TO=$DIR_TOOLS_SH/SH
    echo LDIR_TO:$LDIR_TO

    if [[ -d $LDIR_TO ]] ; then
        #sudo rm -R $LDIR_TO
        echo 'sudo rm -R' $LDIR_TO
        rm -R "$LDIR_TO"
    fi
    #sudo mkdir -p $LDIR_TO
    echo 'sudo mkdir -p' $LDIR_TO
    mkdir -p "$LDIR_TO"

    #PressAnyKey

    COPY_FILES "$LDIR_FROM" "$LDIR_TO" "$LMASK"

    LDIR_FROM=$DIR_TOOLS_SRC_SH/LIB
    echo LDIR_FROM:$LDIR_FROM
    LMASK=*.*
    echo LMASK:$LMASK
    LDIR_TO=$DIR_TOOLS_SH/LIB
    echo LDIR_TO:$LDIR_TO

    #PressAnyKey

    if [[ -d $LDIR_TO ]] ; then
        #sudo rm -R $LDIR_TO
        echo 'sudo rm -R' $LDIR_TO
        rm -R "$LDIR_TO"
    fi
    #sudo mkdir -p $LDIR_TO
    echo 'sudo mkdir -p' $LDIR_TO
    mkdir -p "$LDIR_TO"
    COPY_FILES "$LDIR_FROM" "$LDIR_TO" "$LMASK"

    LDIR_FROM=$DIR_TOOLS_SRC_GIT/SH
    echo LDIR_FROM:$LDIR_FROM
    LMASK=*.*
    echo LMASK:$LMASK
    LDIR_TO=$DIR_TOOLS_SH/SH_GIT
    echo LDIR_TO:$LDIR_TO

    #PressAnyKey

    if [[ -d $LDIR_TO ]] ; then
        #sudo rm -R $LDIR_TO
        echo 'sudo rm -R' $LDIR_TO
        rm -R "$LDIR_TO"
    fi
    #sudo mkdir -p $LDIR_TO
    echo 'sudo mkdir -p' $LDIR_TO
    mkdir -p "$LDIR_TO"
    COPY_FILES "$LDIR_FROM" "$LDIR_TO" "$LMASK"

    return 0
}
#endfunction

# --------------------------------------------------------------------------------
# procedure UPDATE_TOOLS_PY ()
# --------------------------------------------------------------------------------
function UPDATE_TOOLS_PY () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    LDIR_FROM=$DIR_TOOLS_SRC_PY/SRC/SH
    echo LDIR_FROM:$LDIR_FROM
    LMASK=*.*
    echo LMASK:$LMASK
    LDIR_TO=$DIR_TOOLS_PY/SH
    echo LDIR_TO:$LDIR_TO
    if [[ -d $LDIR_TO ]] ; then
        #sudo rm -R $LDIR_TO
        echo 'sudo rm -R' $LDIR_TO
        rm -R "$LDIR_TO"
    fi
    #sudo mkdir -p $LDIR_TO
    echo 'sudo mkdir -p' $LDIR_TO
    mkdir -p "$LDIR_TO"
    COPY_FILES "$LDIR_FROM" "$LDIR_TO" "$LMASK"

    LDIR_FROM=$DIR_TOOLS_SRC_PY/SRC/SCRIPTS
    echo LDIR_FROM:$LDIR_FROM
    LMASK=*.*
    echo LMASK:$LMASK
    LDIR_TO=$DIR_TOOLS_PY/SCRIPTS
    echo LDIR_TO:$LDIR_TO
    if [[ -d $LDIR_TO ]] ; then
        #sudo rm -R $LDIR_TO
        echo 'sudo rm -R' $LDIR_TO
        rm -R "$LDIR_TO"
    fi
    #sudo mkdir -p $LDIR_TO
    echo 'sudo mkdir -p' $LDIR_TO
    mkdir -p "$LDIR_TO"
    COPY_FILES "$LDIR_FROM" "$LDIR_TO" "$LMASK"

    return 0
}
#endfunction

# --------------------------------------------------------------------------------
# procedure UPDATE_TOOLS_GIT (ADirectory)
# --------------------------------------------------------------------------------
function UPDATE_TOOLS_GIT () {
# beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    LDIR_FROM=$DIR_TOOLS_SRC_GIT/SH
    echo LDIR_FROM:$LDIR_FROM
    LMASK=*.*
    echo LMASK:$LMASK
    LDIR_TO=$DIR_TOOLS_GIT/SH
    echo LDIR_TO:$LDIR_TO
    if [[ -d $LDIR_TO ]] ; then
        #sudo rm -R $LDIR_TO
        echo 'sudo rm -R' $LDIR_TO
        rm -R "$LDIR_TO"
    fi
    #sudo mkdir -p $LDIR_TO
    echo 'sudo mkdir -p' $LDIR_TO
    mkdir -p "$LDIR_TO"

    #COPY_FILES "$LDIR_FROM" "$LDIR_TO" "$LMASK"

    return 0
}
# endfunction

# =================================================
# procedure git_pull (ADirectory)
# =================================================
function git_pull () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    LOG_FILE_ADD=1

    ADirectory=$1
    echo ADirectory:$ADirectory
    cd "$ADirectory"/

    ./lyrgit_pull.sh
    #git pull

    return 0
}
#endfunction

# --------------------------------------------------------------------------------
# procedure REPO_WORK (ADirectory, APYTHON)
# --------------------------------------------------------------------------------
function REPO_WORK () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    ADirectory=$1
    echo ADirectory:$ADirectory
    cd $ADirectory/
    CURRENT_DIR=$(CurrentDir)
    echo CURRENT_DIR:$CURRENT_DIR

    APYTHON=$2
    echo APYTHON:$APYTHON

    echo ...GetINIParametr_PY...
    GetINIParametr_PY REPO.ini general REPO_NAME
    echo REPO_NAME:$REPO_NAME

    echo ...GetINIParametr_PY...
    GetINIParametr_PY REPO.ini general
    echo general_repo_name:${general[repo_name]}

    echo ...GetINIParametr_SH...
    REPO_NAME=$(GetINIParametr_SH REPO.ini general REPO_NAME)
    echo REPO_NAME:$REPO_NAME

    rm *.bat
    rm *.sh

    LFileName=$DIR_TOOLS_SRC_GIT/SH/A.WORK/lyrgit_push_main.sh
    echo LFileName:$LFileName
    if [[ -f "$LFileName" ]] ; then
        cp $LFileName $ADirectory/
    fi
    LFileName=$DIR_TOOLS_SRC_GIT/SH/A.WORK/lyrgit_pull.sh
    echo LFileName:$LFileName
    if [[ -f "$LFileName" ]] ; then
        cp $LFileName $ADirectory/
    fi

    if [ $APYTHON -eq 1 ] ; then
        DIR_TOOLS_SRC_PY=$PROJECTS_LYR_DIR/CHECK_LIST/05_DESKTOP/02_Python/PROJECTS_PY/TOOLS_SRC_PY
        LFileName=$DIR_TOOLS_SRC_PY/SRC/BAT/PROJECT_PYupdate.sh
        echo LFileName:$LFileName
        if [[ -f $LFileName ]] ; then
            cp $LFileName $ADirectory/
        fi
        DIR_PYTHON=$PROJECTS_LYR_DIR/CHECK_LIST/05_DESKTOP/02_Python/PROJECTS_PY
        LFileName=$DIR_PYTHON/PATTERN_PY/pyproject.toml
        echo LFileName:$LFileName
        if [[ -f $LFileName ]] ; then
            cp $LFileName $ADirectory/
        fi
    fi

    echo Права $ADirectory/*.sh
    find "$ADirectory" -name "*.sh" -exec chmod u+x {} \;

    chmod u+x $ADirectory/*.sh

    ./lyrgit_push_main.sh

    return 0
}
#endfunction

# --------------------------------------------------------------------------------
# procedure MAIN_05_02_Python ()
# --------------------------------------------------------------------------------
function MAIN_05_02_Python () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    REPO_WORK $DIR_EXAMPLES_PY 1
    REPO_WORK $DIR_MobileAPP_PY 1
    REPO_WORK $DIR_PATTERN_PY 1
    REPO_WORK $DIR_TEST_PY 1
    REPO_WORK $DIR_YOUTUBE_PY 1
    REPO_WORK $DIR_TESTS_PY 1

    REPO_WORK $DIR_TOOLS_SRC_PY
    UPDATE_TOOLS_PY
    REPO_WORK $DIR_TOOLS_PY 0

    #git_pull $DIR_TOOLS_PY_

    return 0
}
#endfunction

# --------------------------------------------------------------------------------
# procedure MAIN_01_03_UNIX ()
# --------------------------------------------------------------------------------
function MAIN_01_03_UNIX () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    REPO_WORK $DIR_TOOLS_SRC_SH 0
    UPDATE_TOOLS_SH
    REPO_WORK $DIR_TOOLS_SH 0

    return 0
}
#endfunction

# --------------------------------------------------------------------------------
# procedure MAIN_07_GIT ()
# --------------------------------------------------------------------------------
function MAIN_07_GIT () {
# beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    REPO_WORK $DIR_TOOLS_SRC_GIT 0
    UPDATE_TOOLS_GIT
    REPO_WORK $DIR_TOOLS_GIT 0

    #DIR_TOOLS_GIT_=D:/TOOLS/TOOLS_GIT
    #git_pull $DIR_TOOLS_GIT_

    return 0
}
# endfunction

#--------------------------------------------------------------------------------
# 04.MAIN_FUNC ()
#--------------------------------------------------------------------------------
function MAIN_FUNC {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    AddLog $loAll $tlsTEXT '--------------------------------------'
    AddLog $loAll $tlsTEXT 'MAIN_FUNC ...'
    AddLog $loAll $tlsTEXT '--------------------------------------'

    # -------------------------------------------------------------------
    # запуск скриптов
    # -------------------------------------------------------------------

    MAIN_01_03_UNIX

    #MAIN_05_02_Python

    #MAIN_07_GIT

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
