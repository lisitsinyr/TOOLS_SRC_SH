#!/bin/bash
# -----------------------------------------------
# LYRConst.sh
# -----------------------------------------------

#-------------------------------------------------------------------
# CONST
#-------------------------------------------------------------------
    PRESSANYKEYTIMEOUT=
    TIMEOUT=2
#-------------------------------------------------------------------
# VAR
#-------------------------------------------------------------------

# =================================================
# ФУНКЦИИ
# =================================================

#--------------------------------------------------------------------------------
# procedure LYRConst ()
#--------------------------------------------------------------------------------
function LYRConst () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

# --------------------------------------------------------------------------------
# procedure __SET_VAR_SCRIPT (AFULLFILENAME)
# --------------------------------------------------------------------------------
function __SET_VAR_SCRIPT () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    AFULLFILENAME="$1"

    # -------------------------------------------------------------------
    # SCRIPT_FULLFILENAME - Файл скрипта [каталог+имя+расширение]
    #------------------------------------------------------
    SCRIPT_FULLFILENAME=$AFULLFILENAME

    # -------------------------------------------------------------------
    # SCRIPT_BASEFILENAME - Файл скрипта [имя+расширение]
    #------------------------------------------------------
    SCRIPT_BASEFILENAME=$(ExtractFileName "$SCRIPT_FULLFILENAME")

    # -------------------------------------------------------------------
    # SCRIPT_FILENAME - Файл скрипта [имя]
    #------------------------------------------------------
    SCRIPT_FILENAME=$(ExtractFileNameWithoutExt "$SCRIPT_BASEFILENAME")
    
    # -------------------------------------------------------------------
    # SCRIPT_FILEDIR - Файл скрипта: каталог
    #------------------------------------------------------
    SCRIPT_FILEDIR=$(ExtractFileDir "$SCRIPT_FULLFILENAME")
    
    # -------------------------------------------------------------------
    # SCRIPT_FILEEXT - Файл скрипта: расширение
    # -------------------------------------------------------------------
    SCRIPT_FILEEXT=$(ExtractFileExt "$SCRIPT_BASEFILENAME")

    return 0
}
#endfunction

# --------------------------------------------------------------------------------
# procedure __SET_VAR_DEFAULT ()
# --------------------------------------------------------------------------------
function __SET_VAR_DEFAULT () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    APP=
    COMMAND=
    OPTION=
    ARGS=
    APPRUN=
    touchRUN=
    SetINIAPP=
    GetINIAPP=

    # -------------------------------------------------------------------
    # CURRENT_SYSTEM -
    #------------------------------------------------------
    CURRENT_SYSTEM=$(uname -a)
    
    # -------------------------------------------------------------------
    # UNAME - COMPUTERNAME
    #------------------------------------------------------
    UNAME=$(uname -n)
    
    # -------------------------------------------------------------------
    # USERNAME - USERNAME
    #------------------------------------------------------
    USERNAME=$(whoami)

    # -------------------------------------------------------------------
    # DATETIME_STAMP - формат имени файла журнала [YYYYMMDDHHMMSS]
    #------------------------------------------------------
    #DATETIME_STAMP=$(YYYYMMDDHHMMSS)
    #DATETIME_STAMP=$(DateTime $LOG_DT_FORMAT)
    DATETIME_STAMP=$(printf "%(%Y%m%d%H%M%S)T")
    #echo DATETIME_STAMP [YYYYMMDDHHMMSS]: $DATETIME_STAMP

    # -------------------------------------------------------------------
    # SLEEP - Number
    #------------------------------------------------------
    SLEEP=

    # -------------------------------------------------------------------
    # CURRENT_DIR - Текущий каталог
    #------------------------------------------------------
    CURRENT_DIR=$(pwd)

    # -------------------------------------------------------------------
    # TEMP_DIR - Временный каталог
    # -------------------------------------------------------------------
    TEMP_DIR=

    return 0
}
#endfunction

# --------------------------------------------------------------------------------
# procedure __SET_VAR_PROJECTS ()
# --------------------------------------------------------------------------------
function __SET_VAR_PROJECTS () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    # -------------------------------------------------------------------
    # PROJECTS_LYR_DIR -
    #------------------------------------------------------
    #PROJECTS_LYR_DIR='...'

    # -------------------------------------------------------------------
    # SCRIPTS_DIR - каталог скриптов
    #------------------------------------------------------
    #SCRIPTS_DIR='...'

    # -------------------------------------------------------------------
    # LIB_SH - каталог библиотекм LYR
    #------------------------------------------------------
    #LIB_SH='...'

    # -------------------------------------------------------------------
    # PROJECT_DIR -
    #------------------------------------------------------
    PROJECTS_DIR='...'

    # -------------------------------------------------------------------
    # PROJECT - проект
    #------------------------------------------------------
    PROJECT='...'
    
    # -------------------------------------------------------------------
    # REPO_INI - Файл с параметрами репозитария
    # -------------------------------------------------------------------
    REPO_INI=REPO.ini

    # -------------------------------------------------------------------
    # REPO_NAME - Имя репозитария
    # -------------------------------------------------------------------
    REPO_NAME=

    # -------------------------------------------------------------------
    # PROJECT_INI - Файл с параметрами проекта
    # -------------------------------------------------------------------
    PROJECT_INI=PROJECT.ini

    # -------------------------------------------------------------------
    # PROJECT_NAME - Имя проекта
    # -------------------------------------------------------------------
    PROJECT_NAME=

    # -------------------------------------------------------------------
    # POETRY_INI - Файл с параметрами проекта
    # -------------------------------------------------------------------
    POETRY_INI=POETRY.ini

    # -------------------------------------------------------------------
    # POETRY_NAME - Имя проекта
    # -------------------------------------------------------------------
    POETRY_NAME=

    return 0
}
#endfunction

# --------------------------------------------------------------------------------
# procedure __SET_LOG ()
# --------------------------------------------------------------------------------
function __SET_LOG () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    # ------------------------------------------------------
    # LOG_FILESCRIPT - Файл первого скрипта [имя]
    # ------------------------------------------------------
    LOG_FILESCRIPT='...'

    # ------------------------------------------------------
    # LOG_STR
    # ------------------------------------------------------
    LOG_STR='...'

    # -------------------------------------------------------------------
    # LOG_DT_FORMAT_DEFAULT -
    #------------------------------------------------------
    #LOG_DT_FORMAT_DEFAULT='%Y%m%d%H%M%S'
    LOG_DT_FORMAT_DEFAULT='%Y%m%d'

    # -------------------------------------------------------------------
    # LOG_FILE_ADD - 1 добавлять к файлу, 0 - с начала файла
    #------------------------------------------------------
    if [ -z "$LOG_FILE_ADD" ] ; then
        LOG_FILE_ADD=0
    fi

    # -------------------------------------------------------------------
    # LOG_FILE_DT - 1 добавлять к имени файла префикс DATETIME_STAMP
    #------------------------------------------------------
    if [ -z "$LOG_FILE_DT" ] ; then
        LOG_FILE_DT=0
    fi

    #------------------------------------------------------
    # LOG_DT_FORMAT -
    #------------------------------------------------------
    #LOG_DT_FORMAT=
    if [[ -z "$LOG_DT_FORMAT" ]] ; then
        LOG_DT_FORMAT=$LOG_DT_FORMAT_DEFAULT
    fi

    # -------------------------------------------------------------------
    # LOG_FILENAME_FORMAT - Формат имени файла журнала [FILENAME,DATETIME,...]
    #------------------------------------------------------
    # LOG_FILENAME_FORMAT=
    if [ -z "$LOG_FILENAME_FORMAT" ] ; then
        LOG_FILENAME_FORMAT=FILENAME
        #LOG_FILENAME_FORMAT=DATETIME
    fi

    # -------------------------------------------------------------------
    # LOG_DIR - Каталог журнала [каталог]
    #------------------------------------------------------
    if [ -z "$LOG_DIR" ] ; then
        LOG_DIR="$PROJECTS_LYR_DIR/LOGS"
    fi
    if [[ ! -d "$LOG_DIR" ]] ; then
        echo INFO: Dir "$LOG_DIR" not exist...
        echo INFO: Create "$LOG_DIR" ...
        result=$(mkdir "$LOG_DIR")
        if [[ ! $result==0 ]] ; then
            echo ERROR: Dir "$LOG_DIR" not created...
            exit 1
        fi
    fi

    # -------------------------------------------------------------------
    # LOG_FILENAME - Файл журнала [имя]
    #------------------------------------------------------
    #LOG_FILENAME=
    if [ -z "$LOG_FILENAME" ] ; then
        if [ "$LOG_FILENAME_FORMAT" = FILENAME ] ; then
            LOG_FILENAME="$SCRIPT_FILENAME"
        else
            if [ "$LOG_FILENAME_FORMAT" = DATETIME ] ; then
                LOG_FILENAME="$DATETIME_STAMP"
            else
                echo 'ERROR: LOG_FILENAME not set...'
                exit 1
            fi
        fi
    fi
    if [ "$LOG_FILENAME_FORMAT" = FILENAME ] ; then
        if [[ "$LOG_FILE_DT" -eq 1 ]] ; then
            LOG_FILENAME="$DATETIME_STAMP"_"$LOG_FILENAME"
        fi
    fi

    # -------------------------------------------------------------------
    # LOG_FULLFILENAME - Файл журнала [каталог+имя+расширение]
    #------------------------------------------------------
    if [ -z "$REPO_NAME" ] ; then
        LOG_FULLFILENAME="$LOG_DIR"/"$LOG_FILENAME.log"
    else
        LOG_FULLFILENAME="$LOG_DIR"/"$REPO_NAME"_"$LOG_FILENAME.log"
        LOG_FULLFILENAME="$LOG_DIR"/"$LOG_FILENAME.log"
    fi

    return 0
}
#endfunction

# --------------------------------------------------------------------------------
# procedure __SHOW_VAR_SCRIPT ()
# --------------------------------------------------------------------------------
function __SHOW_VAR_SCRIPT () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi
    echo SCRIPT_FULLFILENAME: $SCRIPT_FULLFILENAME
    echo SCRIPT_BASEFILENAME: $SCRIPT_BASEFILENAME
    echo SCRIPT_FILENAME: $SCRIPT_FILENAME
    echo SCRIPT_FILEDIR: $SCRIPT_FILEDIR
    echo SCRIPT_FILEEXT: $SCRIPT_FILEEXT

    return 0
}
#endfunction

# --------------------------------------------------------------------------------
# procedure __SHOW_VAR_DEFAULT ()
# --------------------------------------------------------------------------------
function __SHOW_VAR_DEFAULT () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    echo CURRENT_SYSTEM:$CURRENT_SYSTEM
    echo UNAME:$UNAME
    echo USERNAME:$USERNAME
    echo SLEEP:$SLEEP
    echo CURRENT_DIR:$CURRENT_DIR
    echo TEMP_DIR:$TEMP_DIR

    return 0
}
#endfunction

# --------------------------------------------------------------------------------
# procedure __SHOW_VAR_PROJECTS ()
# --------------------------------------------------------------------------------
function __SHOW_VAR_PROJECTS () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    echo PROJECTS_LYR_DIR:$PROJECTS_LYR_DIR
    echo SCRIPTS_DIR:$SCRIPTS_DIR
    echo PROJECTS_DIR:$PROJECTS_DIR
    echo PROJECT_DIR:$PROJECT_DIR
    echo PROJECT:$PROJECT
    echo LIB_SH:$LIB_SH
    #echo REPO_INI:$REPO_INI
    #echo REPO_NAME:$REPO_NAME
    #echo PROJECT_INI:$PROJECT_INI
    #echo PROJECT_NAME:$PROJECT_NAME
    #echo POETRY_INI:$POETRY_INI
    #echo POETRY_NAME:$POETRY_NAME

    return 0
}
#endfunction

# --------------------------------------------------------------------------------
# procedure __SHOW_LOG ()
# --------------------------------------------------------------------------------
function __SHOW_LOG () {
#beginfunction
    #echo LOG_FILESCRIPT:$LOG_FILESCRIPT
    #echo LOG_STR:$LOG_STR
    #echo LOG_DT_FORMAT_DEFAULT:$LOG_DT_FORMAT_DEFAULT
    #echo LOG_FILE_ADD:$LOG_FILE_ADD
    #echo LOG_FILE_DT:$LOG_FILE_DT
    #echo LOG_DT_FORMAT:$LOG_DT_FORMAT
    #echo LOG_FILENAME_FORMAT [FILENAME,DATETIME,...]:$LOG_FILENAME_FORMAT
    echo LOG_DIR: $LOG_DIR
    echo LOG_FILENAME:$LOG_FILENAME
    echo LOG_FULLFILENAME: "$LOG_FULLFILENAME"

    return 0
}
#endfunction

# -----------------------------------------------
# procedure SET_LIB (ASCRIPT)
# -----------------------------------------------
function SET_LIB () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi
 
    ASCRIPT="$1"

    #------------------------------
    # ALL
    #------------------------------
    #Lpath=$1
    #Lpath=${Lpath/:}
    #Lpath=/${Lpath//\\//}
    #LSCRIPT=$Lpath
    LSCRIPT=$(PathWin2PathUnix "$ASCRIPT")
    #echo LSCRIPT:$LSCRIPT

    #------------------------------
    # WINDOWS
    #------------------------------
    #LSCRIPT=$(cygpath "$1")
    #echo LSCRIPT:$LSCRIPT

    __SET_VAR_SCRIPT "$LSCRIPT"
    __SET_VAR_DEFAULT
    __SET_VAR_PROJECTS
    __SET_LOG

    __SETVarLog

    return 0
}
#endfunction
