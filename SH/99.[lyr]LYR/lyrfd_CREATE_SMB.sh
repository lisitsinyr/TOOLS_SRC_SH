#!/bin/bash
# -------------------------------------------------------------------
# lyrfd_CREATE_SMB.sh
# -------------------------------------------------------------------

#begin
    # ------------------------------------------------------------------
    # Создаем каталог /home/lyr/SMB
    # ------------------------------------------------------------------
    directory=/home/lyr/SMB
    if [[ ! -d $directory ]] ; then
        echo ---------------------------------------------
        echo create $directory
        echo ---------------------------------------------
        sudo mkdir -p $directory
        # Задаем владельца на созданный каталог
        sudo chown -R lyr:lyr $directory
        # Задаем права на созданный каталог
        sudo chmod -R 770 $directory
        sudo echo 'username=lyr'          > $directory/.SMB
        sudo echo 'password=Lozudasa100' >> $directory/.SMB

    fi

#end
