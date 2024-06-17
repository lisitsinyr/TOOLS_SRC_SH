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

    cd $TOOLS

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
# procedure MAIN_TOOLS ()
# -----------------------------------------------
function MAIN_TOOLS () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    DIR_TOOLS=.
    echo DIR_TOOLS:$DIR_TOOLS

    GDirectory=$DIR_TOOLS/TOOLS_SH
    GRepo="git@github.com:lisitsinyr/TOOLS_SH.git"
    MAIN_CreateDirectory

    UNAME=$(uname -n)
    case "$UNAME" in
        'ASUS-W10P')
            ;;
        'ASUS-U2204-VB' | 'ASUS-U2204-VM' | 'ASUS-U2404-VB' | 'ASUS-U2404-VM')
            # Задаем права на созданный каталог
            sudo chmod -R 770 "$TOOLS"

            # u+x - разрешить выполнение для владельца
            find $TOOLS\ -type f -iname *.sh -exec chmod u+x {} \;

            # Задаем владельца на созданный каталог
            sudo chown -R lyr:lyr "$TOOLS"
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
            TOOLS_ROOT='/d'
            TOOLS_ROOT='/d/WORK'
            ;;
        'ASUS-U2204-VB' | 'ASUS-U2204-VM' | 'ASUS-U2404-VB' | 'ASUS-U2404-VM')
            TOOLS_ROOT='/home/lyr'
        ;;
        *)
            echo "ERROR: Компьютер не определен...!"
            exit 1
            ;;
    esac
    echo TOOLS_ROOT:$TOOLS_ROOT

    TOOLS=$TOOLS_ROOT/TOOLS
    echo TOOLS:$TOOLS

    if [[ ! -d "$TOOLS" ]] ; then
        #echo INFO: Dir "$TOOLS" not exist...
        #echo INFO: Create "$TOOLS_LYR" ...

        # Создаем каталог TOOLS
        result=$(mkdir -p "$TOOLS")
        echo result:$result
        if [[ ! $result==0 ]] ; then
            echo ERROR: Dir "$TOOLS" not created...
            exit 1
        fi

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

    MAIN_TOOLS

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
