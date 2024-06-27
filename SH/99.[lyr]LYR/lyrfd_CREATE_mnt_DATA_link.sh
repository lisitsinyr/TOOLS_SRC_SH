#!/bin/bash
# -------------------------------------------------------------------
# lyrfd_CREATE_mnt_DATA_link.sh
# -------------------------------------------------------------------

#--------------------------------------------------------------------------------
# procedure CreateLink (Directory)
#--------------------------------------------------------------------------------
function CreateLink () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    ADirectory=$1
    if [[ -d $ADirectory ]] ; then
        cd ~/Desktop/
        ln -s $ADirectory
    fi

    return 0
}
#endfunction

#begin
    # ------------------------------------------------------------------
    # Создаем каталог /mnt/DATA/ASUS-W10P/WORK
    # ------------------------------------------------------------------
    directory=/mnt/DATA/ASUS-W10P/WORK
    CreateLink $directory

    # ------------------------------------------------------------------
    # Создаем каталог /mnt/DATA/ASUS-W10P/SOFT-install
    # ------------------------------------------------------------------
    directory=/mnt/DATA/ASUS-W10P/SOFT-install
    CreateLink $directory

    # ------------------------------------------------------------------
    # Создаем каталог /mnt/DATA/ASUS-W10P/PROJECTS_LYR
    # ------------------------------------------------------------------
    directory=/mnt/DATA/ASUS-W10P/PROJECTS_LYR
    CreateLink $directory

#end
