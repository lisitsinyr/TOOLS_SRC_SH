#!/bin/bash
# -----------------------------------------------
# LYRConst.sh
# -----------------------------------------------

#-------------------------------------------------------------------
# CONST
#-------------------------------------------------------------------
    PRESSANYKEYTIMEOUT=
    TIMEOUT=5
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
    SCRIPT_FULLFILENAME="$1"
    SCRIPT_FULLFILENAME=$AFULLFILENAME
    #echo SCRIPT_FULLFILENAME: $SCRIPT_FULLFILENAME
    
    # -------------------------------------------------------------------
    # SCRIPT_BASEFILENAME - Файл скрипта [имя+расширение]
    #------------------------------------------------------
    SCRIPT_BASEFILENAME=$(ExtractFileName "$SCRIPT_FULLFILENAME")
    #echo SCRIPT_BASEFILENAME: $SCRIPT_BASEFILENAME

    # -------------------------------------------------------------------
    # SCRIPT_FILENAME - Файл скрипта [имя]
    #------------------------------------------------------
    SCRIPT_FILENAME=$(ExtractFileNameWithoutExt "$SCRIPT_BASEFILENAME")
    #echo SCRIPT_FILENAME: $SCRIPT_FILENAME
    
    # -------------------------------------------------------------------
    # SCRIPT_FILEDIR - Файл скрипта: каталог
    #------------------------------------------------------
    SCRIPT_FILEDIR=$(ExtractFileDir "$SCRIPT_FULLFILENAME")
    #echo SCRIPT_FILEDIR: $SCRIPT_FILEDIR
    
    # -------------------------------------------------------------------
    # SCRIPT_FILEEXT - Файл скрипта: расширение
    # -------------------------------------------------------------------
    SCRIPT_FILEEXT=$(ExtractFileExt "$SCRIPT_BASEFILENAME")
    #echo SCRIPT_FILEEXT: $SCRIPT_FILEEXT

    return 0
}
#endfunction

# --------------------------------------------------------------------------------
# procedure __SET_VAR_DEFAULT (DEBUG)
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
    touchRUN=
    SetINIAPP=
    GetINIAPP=

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
    #echo SLEEP: $SLEEP

    # -------------------------------------------------------------------
    # REPO_INI - Файл с параметрами репозитария
    # -------------------------------------------------------------------
    REPO_INI=REPO.ini
    # echo REPO_INI [REPO.ini]: !REPO_INI!

    # -------------------------------------------------------------------
    # REPO_NAME - Имя репозитария
    # -------------------------------------------------------------------
    REPO_NAME=

    # -------------------------------------------------------------------
    # PROJECT_INI - Файл с параметрами проекта
    # -------------------------------------------------------------------
    PROJECT_INI=PROJECT.ini
    # echo PROJECT_INI [PROJECT.ini]: !PROJECT_INI!

    # -------------------------------------------------------------------
    # PROJECT_NAME - Имя проекта
    # -------------------------------------------------------------------
    PROJECT_NAME=

    # -------------------------------------------------------------------
    # POETRY_INI - Файл с параметрами проекта
    # -------------------------------------------------------------------
    POETRY_INI=POETRY.ini
    # echo POETRY_INI [POETRY.ini]: !POETRY_INI!

    # -------------------------------------------------------------------
    # POETRY_NAME - Имя проекта
    # -------------------------------------------------------------------
    POETRY_NAME=

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
    #PROJECTS_LYR_DIR='/d/PROJECTS_LYR'
    #echo PROJECTS_LYR_DIR:$PROJECTS_LYR_DIR

    # -------------------------------------------------------------------
    # PROJECT - проект
    #------------------------------------------------------
    PROJECT=
    #echo PROJECT: $PROJECT
    
    # -------------------------------------------------------------------
    # PROJECT_DIR -
    #------------------------------------------------------
    PROJECTS_DIR=
    #echo PROJECT_DIR: $PROJECT_DIR
    
    # -------------------------------------------------------------------
    # CURRENT_SYSTEM -
    #------------------------------------------------------
    CURRENT_SYSTEM=$(uname -a)
    #echo CURRENT_SYSTEM: $CURRENT_SYSTEM
    
    # -------------------------------------------------------------------
    # UNAME - COMPUTERNAME
    #------------------------------------------------------
    UNAME=$(uname -n)
    #echo UNAME: $UNAME
    
    # -------------------------------------------------------------------
    # USERNAME - USERNAME
    #------------------------------------------------------
    USERNAME=$(whoami)
    #echo USERNAME: $USERNAME

    # -------------------------------------------------------------------
    # CURRENT_DIR - Текущий каталог
    #------------------------------------------------------
    CURRENT_DIR=$(pwd)
    #echo CURRENT_DIR: CURRENT_DIR

    # -------------------------------------------------------------------
    # TEMP_DIR - Временный каталог
    # -------------------------------------------------------------------
    TEMP_DIR=
    # echo TEMP_DIR: !TEMP_DIR!

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
    LOG_FILESCRIPT=

    # ------------------------------------------------------
    # LOG_STR
    # ------------------------------------------------------
    LOG_STR=

    # -------------------------------------------------------------------
    # LOG_DT_FORMAT_DEFAULT -
    #------------------------------------------------------
    #LOG_DT_FORMAT_DEFAULT='%Y%m%d%H%M%S'
    LOG_DT_FORMAT_DEFAULT='%Y%m%d'
    #echo LOG_DT_FORMAT_DEFAULT: $LOG_DT_FORMAT_DEFAULT

    # -------------------------------------------------------------------
    # LOG_FILE_ADD - 1 добавлять к файлу, 0 - с начала файла
    #------------------------------------------------------
    if [ -z "$LOG_FILE_ADD" ] ; then
        LOG_FILE_ADD=0
    fi
    #echo "LOG_FILE_ADD=$LOG_FILE_ADD"

    # -------------------------------------------------------------------
    # LOG_FILE_DT - 1 добавлять к имени файла префикс DATETIME_STAMP
    #------------------------------------------------------
    if [ -z "$LOG_FILE_DT" ] ; then
        LOG_FILE_DT=0
    fi
    #echo "LOG_FILE_DT=$LOG_FILE_DT"

    #------------------------------------------------------
    # LOG_DT_FORMAT -
    #------------------------------------------------------
    #LOG_DT_FORMAT=
    if [[ -z "$LOG_DT_FORMAT" ]] ; then
        LOG_DT_FORMAT=$LOG_DT_FORMAT_DEFAULT
    fi
    #echo "LOG_DT_FORMAT=$LOG_DT_FORMAT"

    # -------------------------------------------------------------------
    # LOG_FILENAME_FORMAT - Формат имени файла журнала [FILENAME,DATETIME,...]
    #------------------------------------------------------
    # LOG_FILENAME_FORMAT=
    if [ -z "$LOG_FILENAME_FORMAT" ] ; then
        LOG_FILENAME_FORMAT=FILENAME
        #LOG_FILENAME_FORMAT=DATETIME
    fi
    #echo LOG_FILENAME_FORMAT [FILENAME,DATETIME,...]: $LOG_FILENAME_FORMAT

    # -------------------------------------------------------------------
    # LOG_DIR - Каталог журнала [каталог]
    #------------------------------------------------------
    #LOG_DIR=
    if [ -z "$LOG_DIR" ] ; then
        LOG_DIR="$PROJECTS_LYR_DIR/LOGS"
    fi
    echo LOG_DIR: $LOG_DIR
    if [[ ! -d "$LOG_DIR" ]] ; then
        echo INFO: Dir "$LOG_DIR" not exist...
        #echo INFO: Каталог "$LOG_DIR" не существует...
        echo INFO: Create "$LOG_DIR" ...
        result=$(mkdir "$LOG_DIR")
        # echo ERRORLEVEL: !ERRORLEVEL!
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
    echo LOG_FILENAME: $LOG_FILENAME

    # -------------------------------------------------------------------
    # LOG_FULLFILENAME - Файл журнала [каталог+имя+расширение]
    #------------------------------------------------------
    if [ -z "$REPO_NAME" ] ; then
        LOG_FULLFILENAME="$LOG_DIR"/"$LOG_FILENAME.log"
    else
        LOG_FULLFILENAME="$LOG_DIR"/"$REPO_NAME"_"$LOG_FILENAME.log"
        LOG_FULLFILENAME="$LOG_DIR"/"$LOG_FILENAME.log"
    fi
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

    #Lpath=$1
    #Lpath=${Lpath/:}
    #Lpath=/${Lpath//\\//}
    #LSCRIPT=$Lpath

    LSCRIPT=$(PathWin2PathUnix "$1")
    echo LSCRIPT:$LSCRIPT

    #LSCRIPT=$(cygpath "$1")
    #echo LSCRIPT:$LSCRIPT

    __SET_VAR_SCRIPT "$LSCRIPT"
    __SET_VAR_DEFAULT
    __SET_VAR_PROJECTS
    __SET_LOG

    return 0
}
#endfunction
