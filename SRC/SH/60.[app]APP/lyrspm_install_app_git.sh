#!/bin/bash
# -------------------------------------------------------------------
# lyrspm_install_app_git.sh
# -------------------------------------------------------------------

#begin
    # --------------------------------------------
    # Установка git
    # --------------------------------------------
    git --version

    sudo apt update && sudo apt install git

    #sudo apt update && sudo snap install gitkraken --classic

    git --version

#end
