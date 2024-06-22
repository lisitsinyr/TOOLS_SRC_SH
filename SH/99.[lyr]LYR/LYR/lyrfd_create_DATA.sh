#!/bin/bash
# -------------------------------------------------------------------
# lyrfd_CREATE_DATA.sh
# -------------------------------------------------------------------

#begin
    # ------------------------------------------------------------------
    # Создаем каталог /DATA
    # ------------------------------------------------------------------
    directory=/DATA
    echo ---------------------------------------------
    echo create $directory
    echo ---------------------------------------------
    sudo rm -R $directory
    sudo mkdir -p $directory
    # Задаем права на созданный каталог
    sudo chmod 777 $directory

    # ------------------------------------------------------------------
    # Создаем каталог /DATA/public
    # ------------------------------------------------------------------
    directory=/DATA/public
    echo ---------------------------------------------
    echo create $directory
    echo ---------------------------------------------
    sudo mkdir -p $directory
    #cd /DATA/public
    # Задаем права на созданный каталог
    sudo chmod -R 777 $directory
    # Создать группу пользователей
    sudo groupadd DATA_public_w
    # Создать группу пользователей
    sudo groupadd DATA_public_r
    # Задаем владельца на созданный каталог
    sudo chown -R root:root $directory
    # Добавить ранее созданного пользователя в эту группу:
    #sudo usermod -a -G DATA-public-w lyr
    # Добавить ранее созданного пользователя в эту группу:
    #sudo usermod -a -G DATA-public-r lyr
    sudo echo 'DATA_public' > $directory/READ.me

    # ------------------------------------------------------------------
    # Создаем каталог /DATA/lyrs
    # ------------------------------------------------------------------
    echo ---------------------------------------------
    echo create /DATA/lyrs
    echo ---------------------------------------------
    sudo mkdir -p /DATA/lyrs
    #cd /DATA/lyrs
    # Задаем права на созданный каталог
    sudo chmod 775 /DATA/lyrs
    # Создать группу пользователей
    sudo groupadd DATA_lyrs_w
    # Создать группу пользователей
    sudo groupadd DATA_lyrs_r
    # Задаем владельца на созданный каталог
    sudo chown -R lyr:DATA_lyrs_w /DATA/lyrs
    # Добавить ранее созданного пользователя в эту группу:
    #sudo usermod -a -G DATA_lyrs_w lyr
    # Добавить ранее созданного пользователя в эту группу:
    #sudo usermod -a -G DATA_lyrs_r lyr
    # Добавить ранее созданного пользователя в эту группу:
    #sudo usermod -a -G DATA_lyrs_w lyr2
    # Добавить ранее созданного пользователя в эту группу:
    sudo usermod -a -G DATA_lyrs_r lyr2
    sudo echo 'DATA_lyrs' > /DATA/lyrs/DATA_lyrs.txt

    # ------------------------------------------------------------------
    # Создаем каталог /DATA/lyr
    # ------------------------------------------------------------------
    echo ---------------------------------------------
    echo create /DATA/lyr
    echo ---------------------------------------------
    sudo mkdir -p /DATA/lyr
    #cd /DATA/lyr
    # Задаем права на созданный каталог
    sudo chmod -R 775 /DATA/lyr
    # Создать группу пользователей
    sudo groupadd DATA_lyr_w
    # Создать группу пользователей
    sudo groupadd DATA_lyr_r
    # Задаем владельца на созданный каталог
    sudo chown -R lyr:DATA_lyr_w /DATA/lyr
    # Добавить ранее созданного пользователя в эту группу:
    #sudo usermod -a -G DATA_lyr_w lyr
    # Добавить ранее созданного пользователя в эту группу:
    #sudo usermod -a -G DATA_lyr_r lyr
    # Добавить ранее созданного пользователя в эту группу:
    sudo usermod -a -G DATA_lyr_w lyr2
    # Добавить ранее созданного пользователя в эту группу:
    #sudo usermod -a -G DATA_lyr_r lyr2
    sudo echo 'DATA_lyr' > /DATA/lyr/DATA_lyr.txt

#end
