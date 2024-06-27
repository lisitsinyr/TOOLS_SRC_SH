#!/bin/bash
# -------------------------------------------------------------------
# lyrfd_CREATE_mnt_DATA_link.sh
# -------------------------------------------------------------------

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
    # Создаем каталог /mnt/DATA/ASUS-W10P/WORK
    # ------------------------------------------------------------------
    directory=/mnt/DATA/ASUS-W10P/WORK
    CreateLink $directory WORK

    # ------------------------------------------------------------------
    # Создаем каталог /mnt/DATA/ASUS-W10P/SOFT-install
    # ------------------------------------------------------------------
    directory=/mnt/DATA/ASUS-W10P/SOFT-install
    #CreateLink $directory SOFT-install

    # ------------------------------------------------------------------
    # Создаем каталог /mnt/DATA/ASUS-W10P/PROJECTS_LYR
    # ------------------------------------------------------------------
    directory=/mnt/DATA/ASUS-W10P/PROJECTS_LYR
    #CreateLink $directory PROJECTS_LYR

#end
