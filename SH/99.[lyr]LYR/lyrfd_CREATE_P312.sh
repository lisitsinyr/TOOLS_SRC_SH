#!/bin/bash
# -------------------------------------------------------------------
# lyrfd_CREATE_P312.sh
# -------------------------------------------------------------------

#--------------------------------------------------------------------------------
# procedure CreateDirectory (Directory, Owner, Access, Delete)
#--------------------------------------------------------------------------------
function CreateDirectory () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    ADirectory=$1
    AOwner=$2
    AAccess=$3
    ADelete=$4

    if [ ! -z "$ADelete" ] ; then
        sudo rm -R $ADirectory
    fi
    if [[ ! -d $ADirectory ]] ; then
        echo ---------------------------------------------
        echo create $ADirectory
        echo ---------------------------------------------
        sudo mkdir -p $ADirectory
    fi
    # Задаем владельца на созданный каталог
    sudo chown -R $AOwner $ADirectory
    # Задаем права на созданный каталог
    sudo chmod -R $AAccess $ADirectory

    return 0
}
#endfunction

#begin
    # ------------------------------------------------------------------
    # Создаем каталог /home/lyr/VENV
    # ------------------------------------------------------------------
    directory=/home/lyr/VENV
    CreateDirectory $directory lyr:lyr 770

    # ------------------------------------------------------------------
    # Создаем каталог /home/lyr/VENV/P312
    # ------------------------------------------------------------------
    directory=/home/lyr/VENV/P312
    CreateDirectory $directory lyr:lyr 770

#end
