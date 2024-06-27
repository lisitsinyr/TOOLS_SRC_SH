#!/bin/bash
# -------------------------------------------------------------------
# lyrfd_CREATE_mnt_DATA.sh
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

#--------------------------------------------------------------------------------
# procedure CreateLink (Directory, Link)
#--------------------------------------------------------------------------------
function CreateLink () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    ADirectory=$1
    ALink=$2
    if [[ -d $ADirectory ]] ; then
        cd ~/Desktop/
        rm $ALink
        ln -s $ADirectory $ALink
    fi

    return 0
}
#endfunction

#begin
    # ------------------------------------------------------------------
    # Создаем каталог /mnt/DATA
    # ------------------------------------------------------------------
    directory=/mnt/DATA
    CreateDirectory $directory lyr:lyr 770

    # ------------------------------------------------------------------
    # Создаем каталог /mnt/DATA/ASUS-W10P/WORK
    # ------------------------------------------------------------------
    directory=/mnt/DATA/ASUS-W10P/WORK
    CreateDirectory $directory lyr:lyr 770
    CreateLink $directory WORK

    # ------------------------------------------------------------------
    # Создаем каталог /mnt/DATA/ASUS-W10P/SOFT-install
    # ------------------------------------------------------------------
    directory=/mnt/DATA/ASUS-W10P/SOFT-install
    CreateDirectory $directory lyr:lyr 770
    CreateLink $directory SOFT-install

    # ------------------------------------------------------------------
    # Создаем каталог /mnt/DATA/ASUS-W10P/PROJECTS_LYR
    # ------------------------------------------------------------------
    directory=/mnt/DATA/ASUS-W10P/PROJECTS_LYR
    CreateDirectory $directory lyr:lyr 770
    CreateLink $directory PROJECTS_LYR

#end
