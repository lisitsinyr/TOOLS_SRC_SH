#!/bin/bash
# -------------------------------------------------------------------
# lyrspm_install_app_cifs-utils.sh
# -------------------------------------------------------------------

#begin
    # --------------------------------------------
    #  Установка autofs
    # --------------------------------------------
    #sudo apt-get update && sudo apt-get install autofs
    #sudo apt update && sudo apt install autofs

    # --------------------------------------------
    # Установим набор утилит для монтирования SMB
    # Установка cifs-utils
    # --------------------------------------------
    #sudo apt-get update && sudo apt-get install cifs-utils
    sudo apt update && sudo apt install cifs-utils

    # После установки, демон autofs запустится автоматически,
    # но на время конфигурирования его нужно отключить:
    #sudo /etc/init.d/autofs stop

#end
