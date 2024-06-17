#!/bin/bash
# -------------------------------------------------------------------
# lyrfd_CREATE_TOOLS.sh
# -------------------------------------------------------------------

# -----------------------------------------------
# procedure MAIN_CreateDirectory ()
# -----------------------------------------------
function MAIN_CreateDirectory () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    cd $DATA

    echo GDirectory:$GDirectory

    if [[ ! -d "$GDirectory" ]] ; then
        #echo INFO: Dir "$GDirectory" not exist ...
        #echo INFO: Create "$GDirectory" ...
        result=$(mkdir -p "$GDirectory")
        if [[ ! $result==0 ]] ; then
            echo ERROR: Dir "$GDirectory" not created...
            exit 1
        fi
    fi

    cd $GDirectory

    if [[ ! -z "$GRepo" ]] ; then
        #echo GRepo:$GRepo
        if [[ ! -d ".git" ]] ; then
            cd ../
            echo git clone: $GRepo
            git clone $GRepo
        else
            echo git pull: $GRepo
            git pull
        fi
    fi

    return 0
}
#endfunction

# -----------------------------------------------
# procedure MAIN_DATA ()
# -----------------------------------------------
function MAIN_DATA () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    DIR_DATA=.
    echo DIR_DATA:$DIR_DATA

    GDirectory=$DIR_DATA/public
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_DATA/lyrs
    GRepo=
    MAIN_CreateDirectory

    GDirectory=$DIR_DATA/lyr
    GRepo=
    MAIN_CreateDirectory

    UNAME=$(uname -n)
    case "$UNAME" in
        'ASUS-W10P')
            ;;
        'ASUS-U2204-VB' | 'ASUS-U2204-VM' | 'ASUS-U2404-VB' | 'ASUS-U2404-VM')
            # Задаем права на созданный каталог
            sudo chmod -R 777 $DIR_DATA/public
            # Создать группу пользователей
            sudo groupadd DATA_public_w
            # Создать группу пользователей
            sudo groupadd DATA_public_r
            # Задаем владельца на созданный каталог
            sudo chown -R root:root $DIR_DATA/public

            # Создать группу пользователей
            sudo groupadd DATA_lyrs_w
            # Создать группу пользователей
            sudo groupadd DATA_lyrs_r
            # Задаем владельца на созданный каталог
            sudo chown -R lyr:DATA_lyrs_w $DIR_DATA/lyrs
            # Добавить ранее созданного пользователя в эту группу:
            #sudo usermod -a -G DATA_lyrs_w lyr
            # Добавить ранее созданного пользователя в эту группу:
            #sudo usermod -a -G DATA_lyrs_r lyr
            # Добавить ранее созданного пользователя в эту группу:
            #sudo usermod -a -G DATA_lyrs_w lyr2
            # Добавить ранее созданного пользователя в эту группу:
            sudo usermod -a -G DATA_lyrs_r lyr2

            # Задаем права на созданный каталог
            sudo chmod -R 775 $DIR_DATA/lyr
            # Создать группу пользователей
            sudo groupadd DATA_lyr_w
            # Создать группу пользователей
            sudo groupadd DATA_lyr_r
            # Задаем владельца на созданный каталог
            sudo chown -R lyr:DATA_lyr_w $DIR_DATA/lyr
            # Добавить ранее созданного пользователя в эту группу:
            #sudo usermod -a -G DATA_lyr_w lyr
            # Добавить ранее созданного пользователя в эту группу:
            #sudo usermod -a -G DATA_lyr_r lyr
            # Добавить ранее созданного пользователя в эту группу:
            sudo usermod -a -G DATA_lyr_w lyr2

        ;;
        *)
            echo "ERROR: Компьютер не определен...!"
            exit 1
            ;;
    esac

    return 0
}
#endfunction

# =================================================
# procedure MAIN_SetROOT ()
# =================================================
function MAIN_SetROOT () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    UNAME=$(uname -n)
    case "$UNAME" in
        'ASUS-W10P')
            DATA_ROOT='/d'
            DATA_ROOT='/d/WORK'
            ;;
        'ASUS-U2204-VB' | 'ASUS-U2204-VM' | 'ASUS-U2404-VB' | 'ASUS-U2404-VM')
            DATA_ROOT=''
        ;;
        *)
            echo "ERROR: Компьютер не определен...!"
            exit 1
            ;;
    esac
    echo DATA_ROOT:$DATA_ROOT

    DATA=$DATA_ROOT/DATA
    echo DATA:$DATA

    if [[ ! -d "$DATA" ]] ; then
        #echo INFO: Dir "$DATA" not exist...
        #echo INFO: Create "$DATA" ...

        # Создаем каталог DATA
        result=$(mkdir -p "$DATA")
        echo result:$result
        if [[ ! $result==0 ]] ; then
            echo ERROR: Dir "$DATA" not created...
            exit 1
        fi

        # Задаем права на созданный каталог
        chmod -R 777 "$DATA"

    fi

    return 0
}
#endfunction

# =================================================
# procedure MAIN (%*)
# =================================================
function MAIN () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    BATNAME=$0
    echo Start $BATNAME ...

    MAIN_SetROOT

    MAIN_DATA

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
