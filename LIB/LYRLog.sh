#!/bin/bash
# -----------------------------------------------
# LYRLog.sh
# -----------------------------------------------

#:begin
# echo '01.НАЗВАНИЕ'
# echo '    *** - ***'

# echo '02.СИНТАКСИС'
# echo '    LOG_DIR='
# echo '    LOG_FILE='
# echo '    LOG_OPT='
# echo '    LOG_FILE_DT_FORMAT'

# echo '03.ОПИСАНИЕ'
# echo '    ***'

# -------------------------------------------------------------------
# Redirect stdout and stderr to the log file
# -------------------------------------------------------------------
#0, STDIN - стандартный поток ввода
#1, STDOUT - стандартный поток вывода
#2, STDERR - стандартный поток ошибок
#3, 3 - поток вывода
#4, 4 - поток вывода
#5, 5 - поток вывода
#6, 6 - поток вывода
#7, 7 - поток вывода
#8, 8 - поток вывода
#9, 9 - поток вывода

# -------------------------------------------------------------------
#   echo "This is normal output" >&1
#   echo "This is an error"      >&2
# -------------------------------------------------------------------

# -------------------------------------------------------------------
#   echo 1> data.txt  # STDOUT
#   echo 2> error.txt # STDERR

#   ls data 1> data.txt 2> error.txt # STDOUT STDERR

#Если надо, STDERR и STDOUT можно перенаправить в один и тот же файл, воспользовавшись &>:
#   ls data &> data-error.txt
#Устаревшая форма записи:
#   ls data > data-error.txt 2>&1
# -------------------------------------------------------------------

# -------------------------------------------------------------------
#   exec $> "$LOG_FILE"  # STDOUT и STDERR
#   exec 1> "$LOG_FILE"  # STDOUT
# -------------------------------------------------------------------

#-------------------------------------------------
# AddLog $loAll $NOTSET 'NOTSET'
# AddLog $loAll $DEBUG 'DEBUG'
# AddLog $loAll $INFO 'INFO'
# AddLog $loAll $WARNING 'WARNING'
# AddLog $loAll $ERROR 'ERROR'
# AddLog $loAll $CRITICAL 'CRITICAL'
# AddLog $loAll $DEBUGTEXT 'DEBUGTEXT'
# AddLog $loAll $BEGIN 'BEGIN'
# AddLog $loAll $END 'END'
# AddLog $loAll $PROCESS 'PROCESS'
# AddLog $loAll $TEXT 'TEXT'

#-------------------------------------------------
# AddLog $loAll $TEXT '--------------------------------------'
# str=''
# str=""
# result=$('')
# AddLog $loAll $TEXT 'str:'"$str"
# AddLog $loAll $TEXT 'result:'"$result"
# AddLog $loAll $TEXT '--------------------------------------'
#-------------------------------------------------

#--------------------------------------------------------------------------------
# procedure LYRLog ()
#--------------------------------------------------------------------------------
function LYRLog () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure SETVarLog ()
#--------------------------------------------------------------------------------
function SETVarLog () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi
    # --------------------------------
    FORMAT='%Y-%m-%d %H:%M:%S %N'
    S01=------------------------------------------------------
    # --------------------------------
    loStandard=0
    loTextFile=1
    loAll=2
    # --------------------------------
    NOTSET=0
    DEBUGT=1
    INFO=2
    WARNING=3
    ERROR=4
    CRITICAL=5
    DEBUGTEXT=11
    BEGIN=21
    END=22
    PROCESS=23
    TEXT=24
    # --------------------------------
    ctlsNOTSET=' '
    ctlsDEBUG='D'
    ctlsINFO='I'
    ctlsWARNING='W'
    ctlsERROR='E'
    ctlsCRITICAL='C'
    ctlsBEGIN='<'
    ctlsEND='>'
    ctlsPROCESS='P'
    ctlsDEBUGTEXT='T'
    ctlsTEXT=''

    return 0
}
#endfunction

# --------------------------------------------------------------------------------
# procedure SHORTLevel (Alevel $2 $3 $4 $5 $6 $7 $8 $9)
# --------------------------------------------------------------------------------
function SHORTLevel () {
# beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    Llevel=$1
    # echo Llevel: %Llevel%
    SHORTLevelName=
    if [ "$Llevel" = "$INFO" ] ; then
        SHORTLevelName=$ctlsINFO
    fi
    if [ "$Llevel" = "$WARNING" ] ; then
        SHORTLevelName=$ctlsWARNING
    fi
    if [ "$Llevel" = "$ERROR" ] ; then
        SHORTLevelName=$ctlsERROR
    fi
    if [ "$Llevel" = "CRITICAL" ] ; then
        SHORTLevelName=$ctlsCRITICAL
    fi
    if [ "$Llevel" = "$DEBUG" ] ; then
        SHORTLevelName=$ctlsDEBUG
    fi
    if [ "$Llevel" = "$TEXT" ] ; then
        SHORTLevelName=$ctlsTEXT
    fi
    if [ "$Llevel" = "$DEBUGTEXT" ] ; then
        SHORTLevelName=$ctlsDEBUGTEXT
    fi
    if [ "$Llevel" = "$BEGIN" ] ; then
        SHORTLevelName=$ctlsBEGIN
    fi
    if [ "$Llevel" = "$END" ] ; then
        SHORTLevelName=$ctlsEND
    fi
    if [ "$Llevel" = "$PROCESS" ] ; then
        SHORTLevelName=$ctlsPROCESS
    fi

    return 0
}
# endfunction

#--------------------------------------------------------------------------------
# procedure FormatStr (Alevel $2 $3 $4 $5 $6 $7 $8 $9)
#--------------------------------------------------------------------------------
function FormatStr () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    #------------------------------------------------------
    #
    #------------------------------------------------------
    Llevel=$1
    Lmessage="$2 $3 $4 $5 $6 $7 $8 $9"
    printf -v asctime '%(%Y/%m/%d %H:%M:%S)T' -1
    SHORTLevel $Llevel
    case "$Llevel" in
    $NOTSET)
        Linfo='NOTSET'
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$Lmessage"
        ;;
    $DEBUG)
        Linfo='DEBUG'
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$Lmessage"
        ;;
    $INFO)
        Linfo='INFO'
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$Lmessage"
        ;;
    $WARNING)
        Linfo='WARNING'
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$Lmessage"
        ;;
    $ERROR)
        Linfo='ERROR'
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$Lmessage"
        ;;
    $CRITICAL)
        Linfo='CRITICAL'
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$Lmessage"
        ;;
    $DEBUGTEXT)
        Linfo='DEBUGTEXT'
        printf -v LOG_STR "%-s %-s" "$SHORTLevelName" "$Lmessage"
        ;;
    $BEGIN)
        Linfo='BEGIN'
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$Lmessage"
        ;;
    $END)
        Linfo='END'
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$Lmessage"
        ;;
    $PROCESS)
        Linfo='PROCESS'
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$Lmessage"
        ;;
    $TEXT)
        Linfo='TEXT'
        printf -v LOG_STR "%-s" "$Lmessage"
        ;;
    *)
        Linfo=''
        ;;
    esac

    return 0
}
#endfunction

#--------------------------------------------------
# procedure AddLog (Aout Alevel $3 $4 $5 $6 $7 $8 $9)
#--------------------------------------------------
function AddLog () { 
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    #------------------------------------------------------
    #
    #------------------------------------------------------
    Lout=$1
    Llevel=$2
    FormatStr "$Llevel" "$3" "$4" "$5" "$6" "$7" "$8" "$9"
    if [ $Lout -eq 0 ] ; then
        echo "$LOG_STR" >$(tty)
    elif [ $Lout -eq 1 ] ; then
        # echo "$LOG_STR" >&3
        echo "$LOG_STR" >> "$LOG_FULLFILENAME"
    elif [ $Lout -eq 2 ] ; then
        echo "$LOG_STR" >$(tty)
        echo "$LOG_STR" >> "$LOG_FULLFILENAME"
        # echo "$LOG_STR" >&3
        # echo "$LOG_STR" | tee -a "$LOG_FULLFILENAME"
    else
        echo 'ERROR' $Lout
    fi

    return 0
}
#endfunction

#--------------------------------------------------
# procedure AddLogFile (Aout AFileName)
#--------------------------------------------------
function AddLogFile () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    #------------------------------------------------------
    #
    #------------------------------------------------------
    Lout=$1
    LFileName="$2"
    if [ -r "$LFileName" ] ; then
        # чтения файла построчно
        # while IFS= read -r LValue; do
        #     AddLog $Lout $TEXT "$LValue"
        # done < "$LFileName"

        # Использование дескриптора файла
        # Вы также можете предоставить ввод в цикл, используя дескриптор файла:
        while IFS= read -r -u9 LValue; do
            AddLog $Lout $TEXT "$LValue"
        done 9< "$LFileName"
        exec 9>&-
    else
        AddLog $Lout $ERROR "$LFileName"
    fi

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure StartLogFile ()
#--------------------------------------------------------------------------------
function StartLogFile () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    SETVarLog

    LOG_FILESCRIPT="$SCRIPT_FILENAME"

    #------------------------------------------------------
    # Открытие файла журнала
    #------------------------------------------------------
    LFileName="$LOG_FULLFILENAME"
    if [[ "$LOG_FILE_ADD" -eq 0 ]] ; then
        if [ -r "$LFileName" ] ; then
            rm "$LFileName"
        fi
        touch "$LFileName"
    else
        if [ ! -r "$LFileName" ] ; then
            touch "$LFileName"
        fi
    fi
    # -------------------------------------------------------------------
    AddLog $loAll $TEXT $S01
    AddLog $loAll $INFO Старт: "$SCRIPT_BASEFILENAME"
    AddLog $loAll $TEXT $S01
    # -------------------------------------------------------------------

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure StopLogFile ()
#--------------------------------------------------------------------------------
function StopLogFile () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    #if not "%LOG_FILESCRIPT%"=="%SCRIPT_FILENAME%" (exit /b 0)

    #------------------------------------------------------
    #
    #------------------------------------------------------
    AddLog $loAll $TEXT $S01
    AddLog $loAll $INFO Стоп: "$SCRIPT_BASEFILENAME"
    AddLog $loAll $TEXT $S01
    # -------------------------------------------------------------------
    exec 3>&-

    return 0
}
#endfunction

#:Exit
