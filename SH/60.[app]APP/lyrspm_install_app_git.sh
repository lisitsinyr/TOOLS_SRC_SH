﻿#!/bin/bash
# -------------------------------------------------------------------
# lyrspm_install_app_git.sh
# -------------------------------------------------------------------

#:begin
    # --------------------------------------------
    # Установка git
    # --------------------------------------------
    git --version

    sudo apt update && sudo apt install git

    git --version

#:Exit