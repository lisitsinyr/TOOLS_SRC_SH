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
    loSTANDART=0
    loTEXTFILE=1
    loALL=2
    
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
    tlsNOTSET=0
    tlsDEBUG=1
    tlsINFO=2
    tlsWARNING=3
    tlsERROR=4
    tlsCRITICAL=5
    tlsDEBUGTEXT=11
    tlsBEGIN=21
    tlsEND=22
    tlsPROCESS=23
    tlsTEXT=24
    # --------------------------------
    stlsNOTSET='NOTSET'
    stlsDEBUG='DEBUG'
    stlsINFO='INFO'
    stlsWARNING='WARNING'
    stlsERROR='ERROR'
    stlsCRITICAL='CRITICAL'
    stlsDEBUGTEXT='DEBUGTEXT'
    stlsBEGIN='BEGIN'
    stlsEND='END'
    stlsPROCESS='PROCESS'
    stlsTEXT='TEXT'
    
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
    #echo Alevel:$Alevel

    SHORTLevelName=''

    if [[ $Alevel = $tlsNOTSET ]] ; then
        SHORTLevelName=$ctlsNOTSET
    fi
    if [[ $Alevel = $tlsDEBUG ]] ; then
        SHORTLevelName=$ctlsDEBUG
    fi
    if [[ $Alevel = $tlsINFO ]] ; then
        SHORTLevelName=$ctlsINFO
    fi
    if [[ $Alevel = $tlsWARNING ]] ; then
        SHORTLevelName=$ctlsWARNING
    fi
    if [[ $Alevel = $tlsERROR ]] ; then
        SHORTLevelName=$ctlsERROR
    fi
    if [[ $Alevel = $tlsCRITICAL ]] ; then
        SHORTLevelName=$ctlsCRITICAL
    fi
    if [[ $Alevel = $tlsDEBUGTEXT ]] ; then
        SHORTLevelName=$ctlsDEBUGTEXT
    fi
    if [[ $Alevel = $tlsBEGIN ]] ; then
        SHORTLevelName=$ctlsBEGIN
    fi
    if [[ $Alevel = $tlsEND ]] ; then
        SHORTLevelName=$ctlsEND
    fi
    if [[ $Alevel = $tlsPROCESS ]] ; then
        SHORTLevelName=$ctlsPROCESS
    fi
    if [[ $Alevel = $tlsTEXT ]] ; then
        SHORTLevelName=$ctlsTEXT
    fi

    return 0
}
# endfunction

# --------------------------------------------------------------------------------
# function __COLORLevel (Alevel) -> __COLORLevel
# --------------------------------------------------------------------------------
function __COLORLevel () {
# beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    Alevel=$1
    #echo Alevel:$Alevel

    COLORLevel=''
    if [[ $Alevel = $tlsNOTSET ]] ; then
        COLORLevel=$cFG8_BLUE$cEND
    fi
    if [[ $Alevel = $tlsDEBUG ]] ; then
        COLORLevel=$cFG8_BLUE$cEND
    fi
    if [[ $Alevel = $tlsINFO ]] ; then
        COLORLevel=$cFG8_WHITE$cEND
    fi
    if [[ $Alevel = $tlsWARNING ]] ; then
        COLORLevel=$cS_BOLD';'$cFG8_YELLOW$cEND
    fi
    if [[ $Alevel = $tlsERROR ]] ; then
        COLORLevel=$cS_BOLD';'$cFG8_RED$cEND
    fi
    if [[ $Alevel = $tlsCRITICAL ]] ; then
        COLORLevel=$cS_BOLD+';'$cFG8_BLACK';'$cBG8_RED$cEND
    fi
    if [[ $Alevel = $tlsDEBUGTEXT ]] ; then
        COLORLevel=$cS_BOLD';'$cFG8_BLUE$cEND
    fi
    if [[ $Alevel = $tlsBEGIN ]] ; then
        COLORLevel=$cS_BOLD';'$cFG8_GREEN$cEND
    fi
    if [[ $Alevel = $tlsEND ]] ; then
        COLORLevel=$cS_BOLD';'$cFG8_GREEN$cEND
    fi
    if [[ $Alevel = $tlsPROCESS ]] ; then
        COLORLevel=$cS_BOLD';'$cFG8_GREEN$cEND
    fi
    if [[ $Alevel = $tlsTEXT ]] ; then
        COLORLevel=$cS_BOLD+';'$cFG8_YELLOW$cEND
    fi

    return 0
}
# endfunction

#--------------------------------------------------------------------------------
# function __LOG_STR (Alevel, ...) -> __LOG_STR
#--------------------------------------------------------------------------------
function __LOG_STR () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    Alevel=$1
    #echo Alevel:$Alevel
    shift 1

    AMessage="$*"
    #echo AMessage:$AMessage
    
    FORMAT='%Y-%m-%d %H:%M:%S %N'
    #echo FORMAT:$FORMAT

    __SHORTLevelName $Alevel
    #echo SHORTLevelName:$SHORTLevelName

    __COLORLevel $Alevel
    #echo COLORLevel:$COLORLevel

    printf -v asctime '%(%Y/%m/%d %H:%M:%S)T' -1

    case "$Alevel" in
    $tlsNOTSET)
        LInfo=$stlsNOTSET
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$AMessage"
        ;;
    $tlsDEBUG)
        LInfo=$stlsDEBUG
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$AMessage"
        ;;
    $tlsINFO)
        LInfo=$stlsINFO
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$AMessage"
        ;;
    $tlsWARNING)
        LInfo=$stlsWARNING
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$AMessage"
        ;;
    $tlsERROR)
        LInfo=$stlsERROR
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$AMessage"
        ;;
    $tlsCRITICAL)
        LInfo=$stlsCRITICAL
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$AMessage"
        ;;
    $tlsDEBUGTEXT)
        LInfo=$stlsDEBUGTEXT
        printf -v LOG_STR "%-s %-s" "$SHORTLevelName" "$AMessage"
        ;;
    $tlsBEGIN)
        LInfo=$stlsBEGIN
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$AMessage"
        ;;
    $tlsEND)
        LInfo=$stlsEND
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$AMessage"
        ;;
    $tlsPROCESS)
        LInfo=$stlsPROCESS
        printf -v LOG_STR "%-s %-s %-s" "$asctime" "$SHORTLevelName" "$AMessage"
        ;;
    $tlsTEXT)
        LInfo=$stlsTEXT
        printf -v LOG_STR "%-s" "$AMessage"
        #echo LOG_STR:$LOG_STR
        ;;
    *)
        LInfo=''
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
    AOut=$1
    #echo AOut:$AOut
    ALevel=$2
    #echo ALevel:$ALevel

    shift 2
    __LOG_STR $ALevel "$*"


    IFS_save="$IFS"
    IFS=$'\r'

    if [[ $AOut -eq 0 ]] ; then
        #echo LOG_STR:$LOG_STR
        #echo -e $LOG_STR >$(tty)
        echo -e $cBEGIN_OCT$COLORLevel$LOG_STR$sRESET >$(tty)
    elif [[ $AOut -eq 1 ]] ; then
        # echo -e "$LOG_STR" >&3
        if [[ ! -z $LOG_FULLFILENAME ]] ; then
            echo -e $LOG_STR >> "$LOG_FULLFILENAME"
        fi
    elif [[ $AOut -eq 2 ]] ; then
        #echo LOG_STR:$LOG_STR
        #echo -e $LOG_STR >$(tty)
        echo -e $cBEGIN_OCT$COLORLevel$LOG_STR$sRESET >$(tty)

#LCOLOR = COLORS_tls.get (T)
#if LCOLOR is not None:
#    LFmt = LYRConsole.cBEGIN_OCT + LCOLOR + _s + LYRConsole.sRESET
#else:
#    LFmt = _s
#LYRConsole.WriteLN (LFmt)

        if [[ ! -z $LOG_FULLFILENAME ]] ; then
            echo -e $LOG_STR >> "$LOG_FULLFILENAME"
        fi
        # echo -e $LOG_STR >&3
        # echo -e $LOG_STR | tee -a "$LOG_FULLFILENAME"
    else
        echo 'ERROR:' $AOut
    fi

    IFS="$IFS_save"

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
    LOut=$1
    LFileName="$2"
    if [[ -r "$LFileName" ]] ; then
        # чтения файла построчно
        # while IFS= read -r LValue; do
        #     AddLog $LOut $tlsTEXT "$LValue"
        # done < "$LFileName"

        # Использование дескриптора файла
        # Вы также можете предоставить ввод в цикл, используя дескриптор файла:

        IFS_save="$IFS"
        IFS=$'\r'

        #while IFS= read -r -u9 LValue; do
        while read -r -u9 LValue; do
            #echo LValue:$LValue
            AddLog $LOut $tlsTEXT "$LValue"
        done 9< "$LFileName"
        exec 9>&-

        IFS="$IFS_save"

    else
        AddLog $LOut $ERROR "$LFileName"
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

    #__SETVarLog

    LOG_FILESCRIPT="$SCRIPT_FILENAME"

    #------------------------------------------------------
    # Открытие файла журнала
    #------------------------------------------------------
    LFileName="$LOG_FULLFILENAME"
    if [[ "$LOG_FILE_ADD" -eq 0 ]] ; then
        if [[ -r "$LFileName" ]] ; then
            rm "$LFileName"
        fi
        touch "$LFileName"
    else
        if [[ ! -r "$LFileName" ]] ; then
            touch "$LFileName"
        fi
    fi
    # -------------------------------------------------------------------
    AddLog $loALL $tlsTEXT $S01
    AddLog $loALL $tlsINFO Старт: "$SCRIPT_BASEFILENAME"
    AddLog $loALL $tlsTEXT $S01
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
    AddLog $loALL $tlsTEXT $S01
    AddLog $loALL $tlsINFO Стоп: "$SCRIPT_BASEFILENAME"
    AddLog $loALL $tlsTEXT $S01
    # -------------------------------------------------------------------
    exec 3>&-

    return 0
}
#endfunction
