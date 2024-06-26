#!/bin/bash
# -------------------------------------------------------------------
# lyrfd_CREATE_DATA.sh
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
    sudo chown -R AOwner $ADirectory
    # Задаем права на созданный каталог
    sudo chmod -R AAccess $ADirectory

    return 0
}
#endfunction

#begin
    # ------------------------------------------------------------------
    # Создаем каталог /DATA
    # ------------------------------------------------------------------
    directory=/DATA
    CreateDirectory $directory lyr:lyr 777 Y

    # ------------------------------------------------------------------
    # Создаем каталог /DATA/public
    # ------------------------------------------------------------------
    directory=/DATA/public
    CreateDirectory $directory root:root 777
    # Создать группу пользователей
    sudo groupadd DATA_public_w
    # Создать группу пользователей
    sudo groupadd DATA_public_r
    # Добавить ранее созданного пользователя в эту группу:
    #sudo usermod -a -G DATA-public-w lyr
    # Добавить ранее созданного пользователя в эту группу:
    #sudo usermod -a -G DATA-public-r lyr
    sudo echo 'DATA_public' > $directory/READ.me

    # ------------------------------------------------------------------
    # Создаем каталог /DATA/lyrs
    # ------------------------------------------------------------------
    directory=/DATA/lyrs
    CreateDirectory $directory lyr:DATA_lyrs_w 775

    # Создать группу пользователей
    sudo groupadd DATA_lyrs_w
    # Создать группу пользователей
    sudo groupadd DATA_lyrs_r
    # Добавить ранее созданного пользователя в эту группу:
    #sudo usermod -a -G DATA_lyrs_w lyr
    # Добавить ранее созданного пользователя в эту группу:
    #sudo usermod -a -G DATA_lyrs_r lyr
    # Добавить ранее созданного пользователя в эту группу:
    #sudo usermod -a -G DATA_lyrs_w lyr2
    # Добавить ранее созданного пользователя в эту группу:
    sudo usermod -a -G DATA_lyrs_r lyr2
    sudo echo 'DATA_lyrs' > $directory/DATA_lyrs.txt

    # ------------------------------------------------------------------
    # Создаем каталог /DATA/lyr
    # ------------------------------------------------------------------
    directory=$directory
    CreateDirectory $directory lyr:DATA_lyr_w 775

    # Создать группу пользователей
    sudo groupadd DATA_lyr_w
    # Создать группу пользователей
    sudo groupadd DATA_lyr_r
    # Добавить ранее созданного пользователя в эту группу:
    #sudo usermod -a -G DATA_lyr_w lyr
    # Добавить ранее созданного пользователя в эту группу:
    #sudo usermod -a -G DATA_lyr_r lyr
    # Добавить ранее созданного пользователя в эту группу:
    sudo usermod -a -G DATA_lyr_w lyr2
    # Добавить ранее созданного пользователя в эту группу:
    #sudo usermod -a -G DATA_lyr_r lyr2
    sudo echo 'DATA_lyr' > $directory/DATA_lyr.txt

#end
