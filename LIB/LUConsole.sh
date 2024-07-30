#!/bin/bash
# -----------------------------------------------
# LUConsole.sh
# -----------------------------------------------

#------------------------------------------
# CONST
#------------------------------------------
sBEGIN_hex='\x1b['
sBEGIN_Unicode='\u001b'
sBEGIN_oct='\033['
sBEGIN=$sBEGIN_hex
sEND='m'
sRESET=$sBEGIN_oct'0'$sEND          # сброс к начальным значениям
sRESET_1=$sBEGIN_oct'0;'$sEND     # вернуться к начальному стилю
sRESET_2=$sBEGIN_oct$sEND

sR='\r'
sB='\b' # символ возврата

sERASE_LINE='\x1b[2K' # erase line command
sCURSOR_UP_ONE='\033[K'

#--------------------------------------
# Изменения стиля (Styles)
#--------------------------------------
cS_BOLD='01' # Жирный
cS_02='02' # Блеклый
cS_ITALIC='03' # Курсив
cS_UNDERLINE='04' # Подчёркнутый
cS_05='05' # Мигание
cS_06='06'
cS_REVERSE='07' # Реверс
cS_08='08'
cS_09='09' # Зачёркнутый

#--------------------------------------
# Изменения цвета шрифта
#--------------------------------------
cFG8_BLACK='30' # Чёрный
cFG8_RED='31' # Красный
cFG8_GREEN='32' # Зелёный
cFG8_YELLOW='33' # Жёлтый
cFG8_BLUE='34' # Синий
cFG8_MAGENTA='35' # Фиолетовый (пурпурный цвет)
cFG8_CYAN='36' # Бирюзовый (голубой цвет)
cFG8_WHITE='37' # Белый

# Для доступны такие цвета текста:
#\033[30m - чёрный;
#\033[31m - красный;
#\033[32m - зелёный;
#\033[33m - желтый;
#\033[34m - синий;
#\033[35m - фиолетовый;
#\033[36m - голубой;
#\033[37m - серый.

#--------------------------------------
# Изменения цвета фона
#--------------------------------------
cBG8_BLACK='40' # Чёрный
cBG8_RED='41' # Красный
cBG8_GREEN='42' # Зелёный
cBG8_YELLOW='43' # Жёлтый
cBG8_BLUE='44' # Синий
cBG8_MAGENTA='45' # Фиолетовый (пурпурный цвет)
cBG8_CYAN='46' # Бирюзовый (голубой цвет)
cBG8_WHITE='47' # Белый
#И такие цвета фона:
#\033[40m - чёрный;
#\033[41m - красный;
#\033[42m - зелёный;
#\033[43m - желтый;
#\033[44m - синий;
#\033[45m - фиолетовый;
#\033[46m - голубой;
#\033[47m - серый;
#\033[0m - сбросить все до значений по умолчанию.

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
# Совсем много цветов
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
sFG256_BEGIN='38;05;'
#--------------------------------------
# Изменения цвета фона
#--------------------------------------
sBG256_BEGIN='48;05;'
#--------------------------------------
#--------------------------------------
# Избранные цвета 256
#--------------------------------------
sFG256_01='38;05;'+'15'
sBG256_01='48;05;'+'21'
sColor256_01=$sBEGIN_oct$cS_BOLD';'$sFG256_01';'$sBG256_01$sEND

# =================================================
# ФУНКЦИИ
# =================================================

#--------------------------------------------------------------------------------
# procedure LUConsole ()
#--------------------------------------------------------------------------------
function LUConsole () {
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
        if [ ! -z $AStyles ] ||
           [ ! -z $AFG8 ] || [ ! -z $ABG8 ] ||
           [ ! -z $AFG256 ] || [ ! -z $ABG256 ] ; then
            LResult=$sBEGIN'0'
        fi
        # --------------------------------------------
        if [ ! -z $AStyles ] ; then
            LResult=$LResult$LStyles
        fi
        # --------------------------------------------
        if [ ! -z $AFG8 ] ; then
            if [ ! -z $AStyles ] ; then
                LResult=$LResult';'$AFG8
            else
                LResult=$LResult$AFG8
            fi
        fi
        # --------------------------------------------
        if [ ! -z $ABG8 ] ; then
            if [ ! -z "$LStyles" ] || [ ! -z "$AFG8" ] ; then
                LResult=$LResult';'$ABG8
            else
                LResult=$LResult$ABG8
            fi
        fi
        # --------------------------------------------
        if [ -z "$AFG8" ] && [ -z "$ABG8" ] ; then
            if [ ! -z "$AFG256" ] ; then
                if [ ! -z $AStyles ] ; then
                    LResult=$LResult';'$sFG256_BEGIN$AFG256
                else
                    LResult=$LResult$sFG256_BEGIN$AFG256
                fi
            fi
            # --------------------------------------------
            if [ ! -z $ABG256 ] ; then
                if [ ! -z $AStyles ] > 0 || [ ! -z $AFG256 ] ; then
                    LResult=$LResult';'$sBG256_BEGIN$ABG256
                else
                    LResult=$LResult$sBG256_BEGIN$ABG256
                fi
            fi
        fi
        # --------------------------------------------
        if [ ! -z $LResult ] ; then
            LResult=$LResult$sEND$As$sRESET
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

    #if LUSupport.IsTerminal():
    #    sys.stdout.write ($As)
    #else:
    #    if len(kwargs):
    #        Ls = FormatColorStr($As, **kwargs)
    #        sys.stdout.write ($Ls)
    #    else:
    #        sys.stdout.write ($As)
    #    #endif
    ##endif
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

    str="\n"
    echo -e -n $str

    Write "$1" "$2" "$3" "$4" "$5" "$6" "$7"

    str="\n"
    echo -e -n $str

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

    #sys.stdout.write ('\r')
    str="\r"
    echo -e $str

    return 0
}
#endfunction

