#!/bin/bash
# -------------------------------------------------------------------
# lyrfd_CREATE_TOOLS_SH.sh
# -------------------------------------------------------------------

#begin
    # ------------------------------------------------------------------
    # Создаем каталог /home/lyr/TOOLS/TOOLS_SH
    # ------------------------------------------------------------------
    directory=/home/lyr/TOOLS/TOOLS_SH
    if [[ ! -d $directory ]] ; then
        cd /home/lyr/TOOLS
        echo ---------------------------------------------
        echo git clone git@github.com:lisitsinyr/TOOLS_SH.git
        echo ---------------------------------------------
        git clone git@github.com:lisitsinyr/TOOLS_SH.git
    else
        cd $directory
        git pull
    fi

    # ------------------------------------------------------------------
    # u+x - разрешить выполнение для владельца
    # ------------------------------------------------------------------
    find /home/lyr/TOOLS/ -type f -iname *.sh -exec chmod u+x {} \;

#end
