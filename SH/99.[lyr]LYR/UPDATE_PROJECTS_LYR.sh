#!/bin/bash
# -------------------------------------------------------------------
# UPDATE_PROJECTS_LYR.sh
# -------------------------------------------------------------------

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
            PROJECTS_LYR_ROOT='/d'
            PROJECTS_LYR_ROOT='/d/WORK/UBU'
            PROJECTS_LYR_DIR=$PROJECTS_LYR_ROOT/PROJECTS_LYR
            SCRIPTS_DIR=$PROJECTS_LYR_DIR/CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX/TOOLS_SRC_SH
            ;;
        'ASUS-U2204-VB' | 'ASUS-U2204-VM' | 'ASUS-U2310-VB' | 'ASUS-U2310-VB' | 'ASUS-U2310')
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

    LOG_FILE_ADD=1

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
    Read_P O1 O1
    echo O1:$O1
    #AddLog $loAll $TEXT O1:$O1
    #AddLog $loAll $INFO O1:$O1
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
    #AddLog $loAll $TEXT A1:$A1
    #AddLog $loAll $INFO A1:$A1
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

    LDIR_TO=$DIR_TOOLS_SH/SH
    if [[ -d $LDIR_TO ]] ; then
        #sudo rm -R $LDIR_TO
        echo 'sudo rm -R $LDIR_TO'
    else
        #sudo mkdir -p $LDIR_TO
        echo 'sudo mkdir -p $LDIR_TO'
    fi
    LDIR_FROM=$DIR_TOOLS_SRC_SH/SH
    LMASK=*.*
    COPY_FILES $LDIR_FROM $LDIR_TO $LMASK

    LDIR_TO=$DIR_TOOLS_SH/LIB
    if [[ -d $LDIR_TO ]] ; then
        #sudo rm -R $LDIR_TO
        echo 'sudo rm -R $LDIR_TO'
    else
        #sudo mkdir -p $LDIR_TO
        echo 'sudo mkdir -p $LDIR_TO'
    fi
    LDIR_FROM=$DIR_TOOLS_SRC_SH/LIB
    LMASK=*.*
    COPY_FILES $LDIR_FROM $LDIR_TO $LMASK

    LDIR_TO=$DIR_TOOLS_SH/SH_GIT
    if [[ -d $LDIR_TO ]] ; then
        #sudo rm -R $LDIR_TO
        echo 'sudo rm -R $LDIR_TO'
    else
        #sudo mkdir -p $LDIR_TO
        echo 'sudo mkdir -p $LDIR_TO'
    fi
    LDIR_FROM=$DIR_TOOLS_SRC_GIT/SH
    LMASK=*.sh
    COPY_FILES $LDIR_FROM $LDIR_TO $LMASK

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

    LDIR_TO=$DIR_TOOLS_PY/SH
    LMASK=*.*
    if [[ -d $LDIR_TO ]] ; then
        #sudo rm -R $LDIR_TO
        echo 'sudo rm -R $LDIR_TO'
    else
        #sudo mkdir -p $LDIR_TO
        echo 'sudo mkdir -p $LDIR_TO'
    fi

    LDIR_FROM=$DIR_TOOLS_SRC_PY/SRC/SH
    COPY_FILES $LDIR_FROM $LDIR_TO $LMASK

    LDIR_TO=$DIR_TOOLS_PY/SCRIPTS
    LMASK=*.*

    LDIR_FROM=$DIR_TOOLS_SRC_PY/SRC/SCRIPTS
    COPY_FILES $LDIR_FROM $LDIR_TO $LMASK

    return 0
}
#endfunction

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
    cd $ADirectory/

    # call lyrgit_pull_main.sh
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
    echo CURRENT_DIR:$CURRENT_DIR

    APYTHON=$2
    echo APYTHON:$APYTHON

    # echo ...GetINIParametr_PY...
    # GetINIParametr_PY REPO.ini general REPO_NAME2
    # echo REPO_NAME2:$REPO_NAME2

    # echo ...GetINIParametr_PY...
    # GetINIParametr_PY REPO.ini general
    # echo general_repo_name:${general[repo_name]}
    # echo general_repo_name2:${general[repo_name2]}

    echo ...GetINIParametr_SH...
    REPO_NAME2=$(GetINIParametr_SH REPO.ini general REPO_NAME)
    echo REPO_NAME2:$REPO_NAME2

    rm *.sh

    LFileName=$DIR_TOOLS_SH/SH_GIT/lyrgit_push_main.sh
    echo LFileName:$LFileName
    if [[ ! -f $LFileName ]] ; then
       cp $LFileName ./
    fi

    if [ $APYTHON -eq 1 ] ; then
        set LFileName=$DIR_TOOLS_SRC_PY/SRC/BAT/PROJECT_PYupdate.bat
        echo LFileName:$LFileName
        #if [[ -d $LFileName ]] ; then
        #    copy $LFileName
        #fi
        set LFileName=$DIR_PYTHON/PATTERN_PY/pyproject.toml
        echo LFileName:$LFileName
        #if [[ -d $LFileName ]] ; then
        #    copy $LFileName
        #fi
    fi

    #./lyrgit_push_main.sh

    return 0
}
#endfunction

# --------------------------------------------------------------------------------
# procedure MAIN_05_DESKTOP_02_Python ()
# --------------------------------------------------------------------------------
function MAIN_05_DESKTOP_02_Python () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

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

    REPO_WORK $DIR_EXAMPLES_PY 1
    REPO_WORK $DIR_MobileAPP_PY 1
    REPO_WORK $DIR_PATTERN_PY 1
    REPO_WORK $DIR_TEST_PY 1
    REPO_WORK $DIR_YOUTUBE_PY 1
    REPO_WORK $DIR_TESTS_PY 1

    REPO_WORK $DIR_TOOLS_SRC_PY
    UPDATE_TOOLS_PY
    REPO_WORK $DIR_TOOLS_PY 0

    git_pull $DIR_TOOLS_PY_

    return 0
}
#endfunction

# --------------------------------------------------------------------------------
# procedure MAIN_01_OS_03_UNIX ()
# --------------------------------------------------------------------------------
function MAIN_01_OS_03_UNIX () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    DIR_TOOLS_SRC_SH=$PROJECTS_LYR_DIR/CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX/TOOLS_SRC_SH
    DIR_TOOLS_SH=$PROJECTS_LYR_DIR/CHECK_LIST/01_OS/03_UNIX/TOOLS_SH

    REPO_WORK $DIR_TOOLS_SRC_SH 0
    # UPDATE_TOOLS_SH
    # REPO_WORK $DIR_TOOLS_SH 0

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure MAIN_FUNC ()
#--------------------------------------------------------------------------------
function MAIN_FUNC {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    AddLog $loAll $TEXT '--------------------------------------'
    AddLog $loAll $TEXT 'MAIN_FUNC ...'
    AddLog $loAll $TEXT '--------------------------------------'
    # -------------------------------------------------------------------
    # запуск скриптов
    # -------------------------------------------------------------------
    #source "$PROJECTS_DIR"/"TOOLS_SH/LIB/[lyrxxx_]PATTERN_FUNCTION.sh"
    #FUNC_01

    # MAIN_05_DESKTOP_02_Python
    MAIN_01_OS_03_UNIX

    # PressAnyKey

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
#end
#--------------------------------------------------------------------------------
