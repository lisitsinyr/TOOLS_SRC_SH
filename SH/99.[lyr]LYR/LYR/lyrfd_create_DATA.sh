#!/bin/bash
# -------------------------------------------------------------------
# lyrfd_create_DATA.sh
# -------------------------------------------------------------------

#begin
    echo '---------------------------------------------'
    echo ' create /DATA '
    echo '---------------------------------------------'
    sudo rm -R /DATA
    # ------------------------------------------------------------------
    # Создаем каталог /DATA
    sudo mkdir -p /DATA
    # Задаем права на созданный каталог
    sudo chmod 777 /DATA

    # ------------------------------------------------------------------
    # Создаем каталог /DATA/public
    echo '---------------------------------------------'
    echo ' create /DATA/public '
    echo '---------------------------------------------'
    sudo mkdir -p /DATA/public
    #cd /DATA/public
    # Задаем права на созданный каталог
    sudo chmod -R 777 /DATA/public
    # Создать группу пользователей
    sudo groupadd DATA_public_w
    # Создать группу пользователей
    sudo groupadd DATA_public_r
    # Задаем владельца на созданный каталог
    sudo chown -R root:root /DATA/public
    # Добавить ранее созданного пользователя в эту группу:
    #sudo usermod -a -G DATA-public-w lyr
    # Добавить ранее созданного пользователя в эту группу:
    #sudo usermod -a -G DATA-public-r lyr
    sudo echo 'DATA_public' > /DATA/public/DATA_public.txt

    # ------------------------------------------------------------------
    # Создаем каталог /DATA/lyrs
    echo '---------------------------------------------'
    echo ' create /DATA/lyrs '
    echo '---------------------------------------------'
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
    echo '---------------------------------------------'
    echo ' create /DATA/lyr '
    echo '---------------------------------------------'
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
