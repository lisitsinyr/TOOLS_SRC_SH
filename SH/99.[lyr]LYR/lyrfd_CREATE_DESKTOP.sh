#!/bin/bash
# -------------------------------------------------------------------
# lyrfd_CREATE_DESKTOP.sh
# -------------------------------------------------------------------

#--------------------------------------------------------------------------------
# procedure CreateLink (Object, Link)
#--------------------------------------------------------------------------------
function CreateLink () {
#beginfunction
    AObject=$1
    #echo AObject:$AObject
    ALink=$2
    #echo ALink:$ALink

    if [[ -d $AObject ]] ; then
        echo $ALink каталог ...
        cd ~/Desktop/
        rm $ALink
        ln -s $AObject $ALink
    fi
    if [[ -f $AObject ]] ; then
        echo $ALink файл ...
        cd ~/Desktop/
        rm $ALink
        ln -s $AObject $ALink
    fi

    return 0
}
#endfunction

#begin
    # ------------------------------------------------------------------
    # 
    # ------------------------------------------------------------------
    DIR_SH=~/PROJECTS_LYR/CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX/TOOLS_SRC_SH

    PROJECTS_LYR_PULL=$DIR_SH/SH/'99.[lyr]LYR'/PROJECTS_LYR_PULL.sh
    #echo PROJECTS_LYR_PULL:$PROJECTS_LYR_PULL
    CreateLink $PROJECTS_LYR_PULL PROJECTS_LYR_PULL

    PROJECTS_LYR_PUSH=$DIR_SH/SH/'99.[lyr]LYR'/PROJECTS_LYR_PUSH.sh
    #echo PROJECTS_LYR_PUSH:$PROJECTS_LYR_PUSH
    CreateLink $PROJECTS_LYR_PUSH PROJECTS_LYR_PUSH

#end
