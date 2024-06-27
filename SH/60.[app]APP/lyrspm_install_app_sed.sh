#!/bin/bash
# -------------------------------------------------------------------
# lyrspm_install_app_sed.sh
# -------------------------------------------------------------------

#begin
    # --------------------------------------------
    # Установка sed
    # --------------------------------------------
    # 1. Install sed Using apt-get 
    # Update apt database with apt-get using the following command.
    #sudo apt-get update
    # After updating apt database, We can install sed using apt-get by running the following command:
    #sudo apt-get -y install sed

    #2.Install sed Using apt
    # Update apt database with apt using the following command.
    # After updating apt database, We can install sed using apt by running the following command:
    sudo apt update && sudo apt -y install sed

    #3.Install sed Using aptitude
    # If you want to follow this method, you might need to install aptitude first since aptitude is usually not installed by default on Ubuntu. Update apt database with aptitude using the following command.
    #sudo aptitude update
    # After updating apt database, We can install sed using aptitude by running the following command:
    #sudo aptitude -y install sed

#end
