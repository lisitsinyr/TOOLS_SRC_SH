#!/bin/bash
# -------------------------------------------------------------------
# lyrspm_install_app_java.sh
# -------------------------------------------------------------------

#begin
    # --------------------------------------------
    # Установка JDK
    # --------------------------------------------
    java --version

    #sudo apt update && sudo apt install default-jdk

    #sudo apt update && sudo apt install default-jre              # version 2:1.17-74, or
    #sudo apt update && sudo apt install openjdk-17-jre-headless  # version 17.0.9~6ea-1
    sudo apt update && sudo apt install openjdk-11-jre-headless  # version 11.0.20+8-1ubuntu1
    #sudo apt update && sudo apt install openjdk-19-jre-headless  # version 19.0.2+7-4
    #sudo apt update && sudo apt install openjdk-20-jre-headless  # version 20.0.2+9-1
    #sudo apt update && sudo apt install openjdk-21-jre-headless  # version 21+35-1
    #sudo apt update && sudo apt install openjdk-22-jre-headless  # version 22~16ea-1
    #sudo apt update && sudo apt install openjdk-8-jre-headless   # version 8u382-ga-1ubuntu1

    #sudo apt update && sudo apt install default-jre              # version 2:1.17-75, or
    #sudo apt update && sudo apt install openjdk-17-jre-headless  # version 17.0.10~6ea-1
    #sudo apt update && sudo apt install openjdk-11-jre-headless  # version 11.0.21+9-0ubuntu1
    #sudo apt update && sudo apt install openjdk-19-jre-headless  # version 19.0.2+7-4
    #sudo apt update && sudo apt install openjdk-20-jre-headless  # version 20.0.2+9-1
    sudo apt update && sudo apt install openjdk-21-jre-headless  # version 21.0.1+12-3
    #sudo apt update && sudo apt install openjdk-22-jre-headless  # version 22~22ea-1
    #sudo apt update && sudo apt install openjdk-8-jre-headless   # version 8u392-ga-1

    java --version

#end
