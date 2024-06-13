#!/bin/bash
# -----------------------------------------------
# LYRLog.sh
# -----------------------------------------------

# =================================================
# ФУНКЦИИ
# =================================================

#--------------------------------------------------------------------------------
# procedure LYRLog ()
#--------------------------------------------------------------------------------
function LYRLog () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure __SETVarLog ()
#--------------------------------------------------------------------------------
function __SETVarLog () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    # --------------------------------
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
    ctlsTEXT='T'

    return 0
}
#endfunction

# --------------------------------------------------------------------------------
# function __SHORTLevelName (Alevel) -> __SHORTLevelName
# --------------------------------------------------------------------------------
function __SHORTLevelName () {
# beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    Alevel=$1
    # echo 'Alevel:'Alevel

    SHORTLevelName=

    if [ "$Alevel" = "$INFO" ] ; then
        SHORTLevelName=$ctlsINFO
    fi
    if [ "$Alevel" = "$WARNING" ] ; then
        SHORTLevelName=$ctlsWARNING
    fi
    if [ "$Alevel" = "$ERROR" ] ; then
        SHORTLevelName=$ctlsERROR
    fi
    if [ "$Alevel" = "CRITICAL" ] ; then
        SHORTLevelName=$ctlsCRITICAL
    fi
    if [ "$Alevel" = "$DEBUG" ] ; then
        SHORTLevelName=$ctlsDEBUG
    fi
    if [ "$Alevel" = "$TEXT" ] ; then
        SHORTLevelName=$ctlsTEXT
    fi
    if [ "$Alevel" = "$DEBUGTEXT" ] ; then
        SHORTLevelName=$ctlsDEBUGTEXT
    fi
    if [ "$Alevel" = "$BEGIN" ] ; then
        SHORTLevelName=$ctlsBEGIN
    fi
    if [ "$Alevel" = "$END" ] ; then
        SHORTLevelName=$ctlsEND
    fi
    if [ "$Alevel" = "$PROCESS" ] ; then
        SHORTLevelName=$ctlsPROCESS
    fi

    return 0
}
# endfunction

#--------------------------------------------------------------------------------
# function __LOG_STR (Alevel, Amessage) -> __LOG_STR
#--------------------------------------------------------------------------------
function __LOG_STR () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    Alevel=$1
    # echo 'Alevel:'Alevel

    Amessage="$2 $3 $4 $5 $6 $7 $8 $9"
    # echo


    

    
    
    
    
    FORMAT='%Y-%m-%d %H:%M:%S %N'
    # echo

    SHORTLevelName $Alevel
    # echo
    


    printf -v asctime '%(%Y/%m/%d %H:%M:%S)T' -1

    case "$Alevel" in
    $NOTSET)
        Linfo='NOTSET'
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$Amessage"
        ;;
    $DEBUG)
        Linfo='DEBUG'
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$Amessage"
        ;;
    $INFO)
        Linfo='INFO'
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$Amessage"
        ;;
    $WARNING)
        Linfo='WARNING'
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$Amessage"
        ;;
    $ERROR)
        Linfo='ERROR'
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$Amessage"
        ;;
    $CRITICAL)
        Linfo='CRITICAL'
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$Amessage"
        ;;
    $DEBUGTEXT)
        Linfo='DEBUGTEXT'
        printf -v LOG_STR "%-s %-s" "$SHORTLevelName" "$Amessage"
        ;;
    $BEGIN)
        Linfo='BEGIN'
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$Amessage"
        ;;
    $END)
        Linfo='END'
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$Amessage"
        ;;
    $PROCESS)
        Linfo='PROCESS'
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$Amessage"
        ;;
    $TEXT)
        Linfo='TEXT'
        printf -v LOG_STR "%-s" "$Amessage"
        ;;
    *)
        Linfo=''
        ;;
    esac

    return 0
}
#endfunction

#--------------------------------------------------
# procedure AddLog (Aout, Alevel, ...)
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

    __SETVarLog

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
