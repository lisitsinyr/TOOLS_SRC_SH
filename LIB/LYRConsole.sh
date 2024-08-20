#!/bin/bash
# -----------------------------------------------
# LYRConsole.sh
# -----------------------------------------------

#------------------------------------------
# CONST
#------------------------------------------
    cBEGIN_HEX='\x1b['
    cBEGIN_UNICODE='\u001b'
    cBEGIN_OCT='\033['
    sBEGIN=$cBEGIN_HEX
    cEND='m'
    sRESET=$cBEGIN_OCT'0'$cEND          # сброс к начальным значениям
    sRESET_1=$cBEGIN_OCT'0;'$cEND       # вернуться к начальному стилю
    sRESET_2=$cBEGIN_OCT$cEND
    cRESET_3='\033[0m'                  # сбросить все до значений по умолчанию.

    sR='\r'                             # BeginLine
    sN='\n'                             # NewLine
    sB='\b'                             # Backspace 

    cERASE_LINE='\x1b[2K'               # erase line command
    cERASE_LINE='\033[2K'               # erase line command
    cERASE_LINE='\033[0K'               # erase line command
    cERASE_LINE='\033[K'               # erase line command
    #sCURSOR_UP_ONE='\033[K'

    #Position the Cursor: \033[<L>;<C>H Or \033[<L>;<C>f puts the cursor at line L and column C.
    #Move the cursor up N lines: \033[<N>A
    #Move the cursor down N lines: \033[<N>B
    #Move the cursor forward N columns: \033[<N>C
    #Move the cursor backward N columns: \033[<N>D
    #Clear the screen, move to (0,0): \033[2J
    #Erase to end of line: \033[K
    #Save cursor position: \033[s
    #Restore cursor position: \033[u

    #--------------------------------------
    # Изменения стиля (Styles)
    #--------------------------------------
    cS_BOLD='01'        # Жирный
    cS_02='02'          # Блеклый
    cS_ITALIC='03'      # Курсив
    cS_UNDERLINE='04'   # Подчёркнутый
    cS_05='05'          # Мигание
    cS_06='06'
    cS_REVERSE='07'     # Реверс
    cS_08='08'
    cS_09='09'          # Зачёркнутый

    #--------------------------------------
    # Изменения цвета шрифта
    #--------------------------------------
    cFG8_BLACK='30'     # Чёрный
    cFG8_RED='31'       # Красный
    cFG8_GREEN='32'     # Зелёный
    cFG8_YELLOW='33'    # Жёлтый
    cFG8_BLUE='34'      # Синий
    cFG8_MAGENTA='35'   # Фиолетовый (пурпурный цвет)
    cFG8_CYAN='36'      # Бирюзовый (голубой цвет)
    cFG8_WHITE='37'     # Белый

    #--------------------------------------
    # Изменения цвета фона
    #--------------------------------------
    cBG8_BLACK='40'     # Чёрный
    cBG8_RED='41'       # Красный
    cBG8_GREEN='42'     # Зелёный
    cBG8_YELLOW='43'    # Жёлтый
    cBG8_BLUE='44'      # Синий
    cBG8_MAGENTA='45'   # Фиолетовый (пурпурный цвет)
    cBG8_CYAN='46'      # Бирюзовый (голубой цвет)
    cBG8_WHITE='47'     # Белый
    
    #--------------------------------------
    # Избранные цвета 8
    #--------------------------------------
    # красный текст - для обозначения ошибок
    # \033[ 01; 03; 04; 07; '__'; '__' m
    ERROR_ESC='\033[''31''m'
    ERROR_s=''
    ERROR_cFG8=$cFG8_RED
    ERROR_cBG8=''
    # жирный красный текст - для обозначения критических ошибок
    ERROR_CRITICAL_ESC='\033['+'01'+'31'+'m'
    ERROR_CRITICAL_s=$cS_BOLD
    ERROR_CRITICAL_cFG8=$cFG8_RED
    ERROR_CRITICAL_cBG8=''
    # зеленый текст - успешное выполнение
    SUCCESS_ESC='\033[''32''m'
    SUCCESS_s=''
    SUCCESS_cFG8=$cFG8_GREEN
    SUCCESS_sBG8=''
    # красный курсив - текст ошибки
    ERROR_TEXT_ESC='\033[''03''31''m'
    ERROR_TEXT_s=$cS_ITALIC
    ERROR_TEXT_cFG8=$cFG8_RED
    ERROR_TEXT_cBG8=''
    # выделение основного, как будто жёлтым маркером
    MARKER_ESC='\033[''43''m'
    MARKER_s=''
    MARKER_cFG8=''
    MARKER_cBG8=$cBG8_YELLOW
    # жирный белый на черном
    BOLD_ESC='\033[''01''31''40''m'
    BOLD_s=$cS_BOLD
    BOLD_cFG8=$cFG8_WHITE
    BOLD_cBG8=$cBG8_BLACK

    #--------------------------------------
    # Больше цветов: аж целых 256
    # Этот формат не всегда поддерживается стандартными консолями.
    #--------------------------------------
    # Некоторые будут негодовать: "256 цветов и нет моего любимого терракотового, какой ужас!".
    # Для таких ценителей существует формат, который уже поддерживает 24 битные цвета (3 канала RGB по 256 градаций).
    # Для не ценителей поясню, что терракотовый кодируется как — (201, 100, 59) или #c9643b.
    # Синтаксис в этом формате выглядит вот так:
    # цвет текста
    # \33[+38;2;⟨r⟩;⟨g⟩;⟨b⟩ m
    # цвет фона
    # \33[+48;2;⟨r⟩;⟨g⟩;⟨b⟩ m
    #--------------------------------------
    # \033[ 01; 03; 04; 07; 38;05;222; 48;05;22 m
    #--------------------------------------
    # Изменения цвета шрифта
    #--------------------------------------
    cFG256_BEGIN='38;05;'
    #--------------------------------------
    # Изменения цвета фона
    #--------------------------------------
    cBG256_BEGIN='48;05;'
    #--------------------------------------
    #--------------------------------------
    # Избранные цвета 256
    #--------------------------------------
    cFG256_01='38;05;'+'15'
    cBG256_01='48;05;'+'21'
    cColor256_01=$cBEGIN_OCT$cS_BOLD';'$cFG256_01';'$cBG256_01$cEND

# =================================================
# ФУНКЦИИ
# =================================================

#--------------------------------------------------------------------------------
# procedure LYRConsole ()
#--------------------------------------------------------------------------------
function LYRConsole () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

#-------------------------------------------------
# function FormatColorStr (s, AStyles:()='', AFG8:str='', ABG8:str='', AFG256:str='', ABG256:str='', AESC:str=''):
#-------------------------------------------------
function FormatColorStr () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    As=$1
    #echo As:$As
    AStyles=$2
    #echo AStyles:$AStyles
    AFG8=$3
    #echo AFG8:$AFG8
    ABG8=$4
    #echo ABG8:$ABG8
    AFG256=$5
    #echo AFG256:$AFG256
    ABG256=$6
    #echo ABG256:$ABG256
    AESC=$7
    #echo AESC:$AESC

    LResult=
    if [ ! -z "$AESC" ] ; then
        LResult=$LResult$AESC$as$sRESET
    else
        #LStyles = LUSupport.TupleToStr (AStyles)
        LStyles=

        # --------------------------------------------
        #-z string: True if the string is null (an empty string)
        if [[ ! -z $AStyles ]] ||
           [[ ! -z $AFG8 ]] || [[ ! -z $ABG8 ]] ||
           [[ ! -z $AFG256 ]] || [[ ! -z $ABG256 ]] ; then
            LResult=$sBEGIN'0'
        fi
        # --------------------------------------------
        if [[ ! -z $AStyles ]] ; then
            LResult=$LResult$LStyles
        fi
        # --------------------------------------------
        if [[ ! -z $AFG8 ]] ; then
            if [[ ! -z $AStyles ]] ; then
                LResult=$LResult';'$AFG8
            else
                LResult=$LResult$AFG8
            fi
        fi
        # --------------------------------------------
        if [[ ! -z $ABG8 ]] ; then
            if [[ ! -z "$LStyles" ]] || [[ ! -z "$AFG8" ]] ; then
                LResult=$LResult';'$ABG8
            else
                LResult=$LResult$ABG8
            fi
        fi
        # --------------------------------------------
        if [[ -z "$AFG8" ]] && [[ -z "$ABG8" ]] ; then
            if [[ ! -z "$AFG256" ]] ; then
                if [[ ! -z $AStyles ]] ; then
                    LResult=$LResult';'$cFG256_BEGIN$AFG256
                else
                    LResult=$LResult$cFG256_BEGIN$AFG256
                fi
            fi
            # --------------------------------------------
            if [[ ! -z $ABG256 ]] ; then
                if [[ ! -z $AStyles ]] > 0 || [[ ! -z $AFG256 ]] ; then
                    LResult=$LResult';'$cBG256_BEGIN$ABG256
                else
                    LResult=$LResult$cBG256_BEGIN$ABG256
                fi
            fi
        fi
        # --------------------------------------------
        if [[ ! -z $LResult ]] ; then
            LResult=$LResult$cEND$As$sRESET
        else
            LResult=$As
        fi
    fi

    echo "$LResult"               # работает всегда

    return 0
}
#endfunction

#-------------------------------------------------
# procedure Write (s, AStyles, AFG8, ABG8, AFG256, ABG256, AESC):
#-------------------------------------------------
function Write () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi
    As=$1
    #echo As:$As
    AStyles=$2
    #echo AStyles:$AStyles
    AFG8=$3
    #echo AFG8:$AFG8
    ABG8=$4
    #echo ABG8:$ABG8
    AFG256=$5
    #echo AFG256:$AFG256
    ABG256=$6
    #echo ABG256:$ABG256
    AESC=$7
    #echo AESC:$AESC

    LResult=$(FormatColorStr "$As" "$AStyles" "$AFG8" "$ABG8" "$AFG256" "$ABG256" "$AESC")
    echo -e -n "$LResult"

    return 0
}
#endfunction

#-------------------------------------------------
# procedure WriteLN (s, AStyles, AFG8, ABG8, AFG256, ABG256, AESC):
#-------------------------------------------------
function WriteLN () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    As="$1"
    #echo ${#As} 
    if [[ ${#As} -eq 0 ]] ; then
        echo -e -n "\n"
    else
        Write "$1" "$2" "$3" "$4" "$5" "$6" "$7"
        echo -e -n "\n"
    fi

    return 0
}
#endfunction

#-------------------------------------------------
# procedure ClearLine
#-------------------------------------------------
function ClearLine () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    #str="\r"
    #echo -e $str
    printf $sR
    printf $cERASE_LINE

    return 0
}
#endfunction

#-------------------------------------------------
# procedure BeginLine
#-------------------------------------------------
function BeginLine () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    #str="\r"
    #echo -e $str
    printf $sR

    return 0
}
#endfunction

#-------------------------------------------------
# procedure NewLine
#-------------------------------------------------
function NewLine () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    #str="\n"
    #echo -e $str
    printf $sN

    return 0
}
#endfunction

#-------------------------------------------------
# procedure Backspace
#-------------------------------------------------
function Backspace () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    #echo -e "$sB $sB"
    printf "$sB $sB"

    return 0
}
#endfunction

