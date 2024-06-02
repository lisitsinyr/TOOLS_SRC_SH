#!/bin/bash
# -------------------------------------------------------------------
# lyrspm_install_app_Jetbrains_Toolbox.sh
# -------------------------------------------------------------------

#:begin
    # --------------------------------------------
    # Installing Jetbrains Toolbox
    # --------------------------------------------
    # You can also opt to use the terminal to retrive the installer, run:
    wget -c https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.27.3.14493.tar.gz

    # Then proceed to extract the toolbox installer using:
    sudo tar -xzf jetbrains-toolbox-1.27.3.14493.tar.gz -C /opt

    #if missing FUSE2. If this happens, proceed to manually install it using the:
    sudo apt-get install -y libfuse2

    # to start installing the applications you want. On the terminal, run:
    /opt/jetbrains-toolbox-1.27.3.14493/jetbrains-toolbox

#:Exit
