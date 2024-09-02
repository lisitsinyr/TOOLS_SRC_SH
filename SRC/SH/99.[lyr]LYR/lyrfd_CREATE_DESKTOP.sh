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

#--------------------------------------------------------------------------------
# procedure CreateScriptDesktop (Script, Link)
#--------------------------------------------------------------------------------
function CreateScriptDesktop () {
#beginfunction
    AScript=$1
    #echo AScript:$AScript
    ASCRIPTdesktop=$2
    #echo ASCRIPTdesktop:$ASCRIPTdesktop
    ASCRIPTdesktopName=$3
    echo ASCRIPTdesktopName:$ASCRIPTdesktopName
    if [[ -f $ASCRIPTdesktop ]] ; then
        cd ~/Desktop/
        rm $ASCRIPTdesktop
    fi
    touch $ASCRIPTdesktop
    echo '[Desktop Entry]'          >> $ASCRIPTdesktop
    echo 'Name='$ASCRIPTdesktopName >> $ASCRIPTdesktop
    echo 'Exec='$AScript            >> $ASCRIPTdesktop
    echo 'Terminal=true'            >> $ASCRIPTdesktop
    echo 'Type=Application'         >> $ASCRIPTdesktop
    chmod u+x $ASCRIPTdesktop

    return 0
}
#endfunction

#begin
    # ------------------------------------------------------------------
    # 
    # ------------------------------------------------------------------
    DIR_SH=~/PROJECTS_LYR/CHECK_LIST/01_OS/03_UNIX/PROJECTS_UNIX/TOOLS_SRC_SH

    LSCRIPT=$DIR_SH/SH/'99.[lyr]LYR'/PROJECTS_LYR_PULL.sh
    LSCRIPTdesktopName='PROJECTS_LYR_PULL'
    Ldesktop=$DIR_SH/SH/'99.[lyr]LYR'/PROJECTS_LYR_PULL.desktop
    #cp $Ldesktop ~/Desktop
    #chmod u+x $LSCRIPTdesktop
    LSCRIPTdesktop=~/Desktop/PROJECTS_LYR_PULL.desktop
    CreateScriptDesktop $LSCRIPT $LSCRIPTdesktop $LSCRIPTdesktopName

    LSCRIPT=$DIR_SH/SH/'99.[lyr]LYR'/PROJECTS_LYR_PUSH.sh
    LSCRIPTdesktopName='PROJECTS_LYR_PUSH'
    Ldesktop=$DIR_SH/SH/'99.[lyr]LYR'/PROJECTS_LYR_PUSH.desktop
    #cp $Ldesktop ~/Desktop
    #chmod u+x $LSCRIPTdesktop
    LSCRIPTdesktop=~/Desktop/PROJECTS_LYR_PUSH.desktop
    CreateScriptDesktop $LSCRIPT $LSCRIPTdesktop $LSCRIPTdesktopName

#end
