#!/bin/bash
# -----------------------------------------------
# __SET_LIB.sh
# -----------------------------------------------

# -------------------------------------------------------------------
# __SET_VAR_SCRIPT
# SCRIPT_FULLFILENAME - Файл скрипта [каталог+имя+расширение]
#     SCRIPT_FULLFILENAME=
# SCRIPT_BASEFILENAME - Файл скрипта [имя+расширение]
#     SCRIPT_BASEFILENAME=
# SCRIPT_FILENAME - Файл скрипта [имя]
#     SCRIPT_FILENAME=
# -------------------------------------------------------------------
# __SET_SCRIPTS_DIR
# SCRIPTS_DIR - Каталог скриптов
#     SCRIPTS_DIR=
# -------------------------------------------------------------------
# __SET_VAR_DEFAULT
# LOG_FILENAME - Файл журнала [имя]
#     LOG_FILENAME=
# DATETIME_STAMP - формат имени файла журнала [YYYYMMDDHHMMSS]
#     DATETIME_STAMP=%date:~6,4%%date:~3,2%%date:~0,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
# LOG_FILENAME_FORMAT - Формат имени файла журнала [FILENAME,DT,...]
#     LOG_FILENAME_FORMAT=FILENAME
# LOG_OPT - Параметры журнала [11]
#     LOG_OPT=11
# -------------------------------------------------------------------
# __SET_VAR_PROJECTS
# PROJECTS -
#     PROJECTS=
# CURRENT_SYSTEM -
#     CURRENT_SYSTEM=
# UNAME -
#     UNAME=
# USERNAME -
#     USERNAME=
# PROJECTS_LYR_DIR -
#     PROJECTS_LYR_DIR=
# PROJECTS_DIR -
#     PROJECTS_DIR=
# CURRENT_DIR - Текущий каталог
#     CURRENT_DIR=
# -------------------------------------------------------------------
# __SET_CHECK_REPO
# REPO_NAME - Имя репозитария
#     REPO_NAME=
# REPO_INI - Файл с параметрами репозитария
#     REPO_INI=REPO.ini
# -------------------------------------------------------------------
# __SET_LOG
# LOG_DT_FORMAT -
#     LOG_DT_FORMAT=
# LOG_FILENAME_FORMAT - Формат имени файла журнала [FILENAME,DATETIME,...]
#     LOG_FILENAME_FORMAT=
# LOG_FILE_ADD - Параметры журнала [0]
#     LOG_FILE_ADD=  
# LOG_FILE_DT - Параметры журнала [0]
#     LOG_FILE_DT=
# LOG_DIR - Каталог журнала
#     LOG_DIR=
# LOG_FILENAME - Файл журнала [имя]
#     LOG_FILENAME=
# LOG_FILESCRIPT - Файл первого скрипта [имя]
#     LOG_FILESCRIPT=
# LOG_STR -
#     LOG_STR=
# -------------------------------------------------------------------

# -------------------------------------------------------------------
# ФУНКЦИИ
#     function __SET_VAR_SCRIPT
#     function __SET_BAT_DIR
#     function __SET_VAR_DEFAULT
#     function __SET_VAR_PROJECTS
#     function __SET_CHECK_REPO
#     function __SET_LOG
# -------------------------------------------------------------------

# =================================================
# ФУНКЦИИ
# =================================================

# --------------------------------------------------------------------------------
# procedure __SET_VAR_DEFAULT (DEBUG)
# --------------------------------------------------------------------------------
function __SET_VAR_DEFAULT () {
# beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    # -------------------------------------------------------------------
    # LOG_DT_FORMAT_DEFAULT -
    #------------------------------------------------------
    #LOG_DT_FORMAT_DEFAULT='%Y%m%d%H%M%S'
    LOG_DT_FORMAT_DEFAULT='%Y%m%d'
    #echo LOG_DT_FORMAT_DEFAULT: $LOG_DT_FORMAT_DEFAULT
    
    # -------------------------------------------------------------------
    # DATETIME_STAMP - формат имени файла журнала [YYYYMMDDHHMMSS]
    #------------------------------------------------------
    #DATETIME_STAMP=$(YYYYMMDDHHMMSS)
    #DATETIME_STAMP=$(DateTime $LOG_DT_FORMAT)
    DATETIME_STAMP=$(printf "%(%Y%m%d%H%M%S)T")
    #echo DATETIME_STAMP [YYYYMMDDHHMMSS]: $DATETIME_STAMP

    # -------------------------------------------------------------------
    # SLEEP - Number[Suffix-s,m,h,d]
    #------------------------------------------------------
    SLEEP=
    #echo SLEEP: $SLEEP

    return 0
}
# endfunction

# --------------------------------------------------------------------------------
# procedure __SET_VAR_SCRIPT (FULLFILENAME)
# --------------------------------------------------------------------------------
function __SET_VAR_SCRIPT () {
# beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    # -------------------------------------------------------------------
    # Файл скрипта: каталог+имя+расширение
    #------------------------------------------------------
    SCRIPT_FULLFILENAME="$1"
    #echo SCRIPT_FULLFILENAME: $SCRIPT_FULLFILENAME
    # -------------------------------------------------------------------
    # Файл скрипта: имя+расширение
    #------------------------------------------------------
    SCRIPT_BASEFILENAME=$(ExtractFileName "$SCRIPT_FULLFILENAME")
    #echo SCRIPT_BASEFILENAME: $SCRIPT_BASEFILENAME
    # -------------------------------------------------------------------
    # Файл скрипта: имя
    #------------------------------------------------------
    SCRIPT_FILENAME=$(ExtractFileNameWithoutExt "$SCRIPT_BASEFILENAME")
    #echo SCRIPT_FILENAME: $SCRIPT_FILENAME
    # -------------------------------------------------------------------
    # Файл скрипта: каталог
    #------------------------------------------------------
    SCRIPT_FILEDIR=$(ExtractFileDir "$SCRIPT_FULLFILENAME")
    #echo SCRIPT_FILEDIR: $SCRIPT_FILEDIR
    # -------------------------------------------------------------------
    # Файл скрипта: расширение
    SCRIPT_FILEEXT=$(ExtractFileExt "$SCRIPT_BASEFILENAME")
    #------------------------------------------------------
    #echo SCRIPT_FILEEXT: $SCRIPT_FILEEXT

    return 0
}
# endfunction

# --------------------------------------------------------------------------------
# procedure __SET_VAR_PROJECTS ()
# --------------------------------------------------------------------------------
function __SET_VAR_PROJECTS () {
# beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    # -------------------------------------------------------------------
    # PROJECTS - проект
    #------------------------------------------------------
    #PROJECTS=
    #echo PROJECTS: $PROJECTS
    # -------------------------------------------------------------------
    # PROJECTS_LYR_DIR -
    #------------------------------------------------------
    #PROJECTS_LYR_DIR=
    #echo PROJECTS_LYR_DIR: $PROJECTS_LYR_DIR
    # -------------------------------------------------------------------
    # PROJECTS_DIR -
    #------------------------------------------------------
    #PROJECTS_DIR=
    #echo PROJECTS_DIR: $PROJECTS_DIR
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

    return 0
}
# endfunction

# --------------------------------------------------------------------------------
# procedure __SET_CHECK_REPO ()
# --------------------------------------------------------------------------------
function __SET_CHECK_REPO () {
# beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    # -------------------------------------------------------------------
    # REPO_NAME - Имя репозитария
    #------------------------------------------------------
    REPO_NAME=""
    #echo REPO_NAME: $REPO_NAME
    # -------------------------------------------------------------------
    # REPO_INI - Файл с параметрами репозитария
    #------------------------------------------------------
    REPO_INI='REPO.ini'
    #echo REPO_INI [REPO.ini]: $REPO_INI
    # -------------------------------------------------------------------
    # Проверка существования файла REPO.ini
    #------------------------------------------------------
    #if not exist %REPO_INI% (
    #    echo INFO: File %REPO_INI% not exist
    #    # exit /b 1
    #) else (
    #    for /f "eol=# delims== tokens=1,2" %%i in (%REPO_INI%) do (
    #        # В переменной i - ключ
    #        # В переменной j - значение
    #        set %%i=%%j
    #        # echo %%i: %%%j%
    #    )
    #)
    #echo REPO_NAME: $REPO_NAME

    return 0
}
# endfunction

# --------------------------------------------------------------------------------
# procedure __SET_LOG ()
# --------------------------------------------------------------------------------
function __SET_LOG () {
# beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    #------------------------------------------------------
    # LOG_DT_FORMAT -
    #------------------------------------------------------
    if [[ -z "$LOG_DT_FORMAT" ]] ; then
        LOG_DT_FORMAT=$LOG_DT_FORMAT_DEFAULT
    fi
    #echo "LOG_DT_FORMAT=$LOG_DT_FORMAT"
    # -------------------------------------------------------------------
    # LOG_FILENAME_FORMAT - Формат имени файла журнала [FILENAME,DATETIME,...]
    #------------------------------------------------------
    if [ -z "$LOG_FILENAME_FORMAT" ] ; then
        LOG_FILENAME_FORMAT=FILENAME
        #LOG_FILENAME_FORMAT=DATETIME
    fi
    #echo LOG_FILENAME_FORMAT [FILENAME,DATETIME,...]: $LOG_FILENAME_FORMAT
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
    # -------------------------------------------------------------------
    # LOG_DIR - Каталог журнала [каталог]
    #------------------------------------------------------
    if [ -z "$LOG_DIR" ] ; then
        LOG_DIR="$PROJECTS_LYR_DIR/LOGS"
    fi
    #echo LOG_DIR: $LOG_DIR
    if [[ ! -d "$LOG_DIR" ]] ; then
        echo INFO: Dir "$LOG_DIR" not exist...
        echo INFO: Каталог "$LOG_DIR" не существует...
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
    #echo LOG_FILENAME: $LOG_FILENAME

    # -------------------------------------------------------------------
    # LOG_FULLFILENAME - Файл журнала [каталог+имя+расширение]
    #------------------------------------------------------
    if [ -z "$REPO_NAME" ] ; then
        LOG_FULLFILENAME="$LOG_DIR"/"$LOG_FILENAME.log"
    else
        LOG_FULLFILENAME="$LOG_DIR"/"$REPO_NAME"_"$LOG_FILENAME.log"
        LOG_FULLFILENAME="$LOG_DIR"/"$LOG_FILENAME.log"
    fi
    #echo LOG_FULLFILENAME: "$LOG_FULLFILENAME"

    #------------------------------------------------------
    # LOG_FILESCRIPT - Файл первого скрипта [имя]
    #------------------------------------------------------
    LOG_FILESCRIPT=

    #------------------------------------------------------
    # LOG_STR
    #------------------------------------------------------
    LOG_STR=

    return 0
}
# endfunction

# ===================================================================

#:Exit
