#!/bin/bash
# -------------------------------------------------------------------
# lyrspm_update_app_git.sh
# -------------------------------------------------------------------

#begin
    # --------------------------------------------
    # Установка последней версии git
    # --------------------------------------------
    git --version

    sudo add-apt-repository ppa:git-core/ppa -y
    
    #sudo apt-get update && sudo apt-get install git -y
    sudo apt update && sudo apt install git -y

    git --version

#end

