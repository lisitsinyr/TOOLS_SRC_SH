#!/bin/bash
# -------------------------------------------------------------------
# lyrfd_CREATE_DESKTOP.sh
# -------------------------------------------------------------------

#--------------------------------------------------------------------------------
# procedure CreateLink (Object, Link)
#--------------------------------------------------------------------------------
function CreateLink () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    AObject=$1
    ALink=$2
    if [[ -d $Object ]] ; then
        cd ~/Desktop/
        rm $ALink
        ln -s $Object $ALink
    fi
    if [[ -f $Object ]] ; then
        cd ~/Desktop/
        rm $ALink
        ln -s $Object $ALink
    fi

    return 0
}
#endfunction

#begin
    # ------------------------------------------------------------------
    # 
    # ------------------------------------------------------------------
    DIR_SH=~/PROJECTS_LYR/CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX/TOOLS_SRC_SH

    PROJECTS_LYR_PULL=$DIR_SH/SH/99.[lyr]LYR/PROJECTS_LYR_PULL.sh
    CreateLink $PROJECTS_LYR_PULL PROJECTS_LYR_PULL

    PROJECTS_LYR_PUSH=$DIR_SH/SH/99.[lyr]LYR/PROJECTS_LYR_PUSH.sh
    CreateLink $PROJECTS_LYR_PUSH PROJECTS_LYR_PUSH

#end
