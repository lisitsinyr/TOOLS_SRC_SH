#!/bin/bash
# -------------------------------------------------------------------
# lyrfd_CR_TOOLS.sh
# -------------------------------------------------------------------

#begin
    # ------------------------------------------------------------------
    cd /home/lyr/TOOLS
    
    git clone git@github.com:lisitsinyr/TOOLS_SH.git

    # u+x - разрешить выполнение для владельца
    find /home/lyr/TOOLS/ -type f -iname *.sh -exec chmod u+x {} \;

#end
