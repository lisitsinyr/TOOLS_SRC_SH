#!/bin/bash
# -------------------------------------------------------------------
# lyrfd_CREATE_mnt_DATA.sh
# -------------------------------------------------------------------

#begin
    # ------------------------------------------------------------------
    # Создаем каталог /mnt/DATA
    # ------------------------------------------------------------------
    directory=/mnt/DATA
    if [[ ! -d $directory ]] ; then
        echo ---------------------------------------------
        echo create $directory
        echo ---------------------------------------------
        sudo mkdir -p $directory
        # Задаем владельца на созданный каталог
        sudo chown -R lyr:lyr $directory
        # Задаем права на созданный каталог
        sudo chmod -R 770 $directory
    fi
    # ------------------------------------------------------------------
    # Создаем каталог /mnt/DATA/ASUS-W10P/WORK
    # ------------------------------------------------------------------
    directory=/mnt/DATA/ASUS-W10P/WORK
    if [[ ! -d $directory ]] ; then
        echo ---------------------------------------------
        echo create $directory
        echo ---------------------------------------------
        sudo mkdir -p $directory
        # Задаем владельца на созданный каталог
        sudo chown -R lyr:lyr $directory
        # Задаем права на созданный каталог
        sudo chmod -R 770 $directory
    fi
    # ------------------------------------------------------------------
    # Создаем каталог /mnt/DATA/ASUS-W10P/SOFT-install
    # ------------------------------------------------------------------
    directory=/mnt/DATA/ASUS-W10P/SOFT-install
    if [[ ! -d $directory ]] ; then
        echo ---------------------------------------------
        echo create $directory
        echo ---------------------------------------------
        sudo mkdir -p $directory
        # Задаем владельца на созданный каталог
        sudo chown -R lyr:lyr $directory
        # Задаем права на созданный каталог
        sudo chmod -R 770 $directory
    fi
    # ------------------------------------------------------------------
    # Создаем каталог /mnt/DATA/ASUS-W10P/PROJECTS_LYR
    # ------------------------------------------------------------------
    directory=/mnt/DATA/ASUS-W10P/PROJECTS_LYR
    if [[ ! -d $directory ]] ; then
        echo ---------------------------------------------
        echo create $directory
        echo ---------------------------------------------
        sudo mkdir -p $directory
        # Задаем владельца на созданный каталог
        sudo chown -R lyr:lyr $directory
        # Задаем права на созданный каталог
        sudo chmod -R 770 $directory
    fi

#end
