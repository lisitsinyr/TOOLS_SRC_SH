#!/bin/bash
# -------------------------------------------------------------------
# lyrspm_install_app_chrony.sh
# -------------------------------------------------------------------

#begin
    # --------------------------------------------
    # Установка chrony
    # --------------------------------------------
    #sudo apt-get update && sudo apt-get install chrony
    sudo apt update && sudo apt install chrony

    # --------------------------------------------
    # Разрешим автозапуск сервиса chrony
    # --------------------------------------------
    sudo systemctl enable chrony

#end
