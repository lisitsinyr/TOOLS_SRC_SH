﻿#!/bin/bash
# -------------------------------------------------------------------
# lyrspm_install_app_chrony.sh
# -------------------------------------------------------------------

#:begin
    # --------------------------------------------
    # Установка chrony
    # --------------------------------------------
    sudo apt-get install chrony

    # --------------------------------------------
    # Разрешим автозапуск сервиса chrony
    # --------------------------------------------
    sudo systemctl enable chrony

#:Exit