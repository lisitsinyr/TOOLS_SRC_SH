#!/bin/bash
# -----------------------------------------------
# LYRFileUtils.sh
# -----------------------------------------------

# =================================================
# ФУНКЦИИ
# =================================================

#--------------------------------------------------------------------------------
# procedure LYRFileUtils ()
#--------------------------------------------------------------------------------
function LYRFileUtils () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: procedure $FUNCNAME ... >$(tty)
    fi

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# function ExtractFileDir (AFullFilename) -> ExtractFileDir
#--------------------------------------------------------------------------------
function ExtractFileDir () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    AFullFilename="$1"
    # fspec=/path/to/some/file.txt
    # echo ${fspec%/*}
    # fspec=/path/to/some/

    local LResult=
    LError=0
    LResult=${AFullFilename%/*}
    if [ -z "$LResult" ] ; then
        LError=1
    else
        echo $LResult               # работает всегда
        #printf $LResult
    fi

    return $(( $LError ))
    #echo $(( $LResult ))       # работает, если LResult 0..255
    #return $(( $LResult ))     # работает, если LResult 0..255
    #return $LResult            # работает, если LResult 0..255
}
#endfunction

# --------------------------------------------------------------------------------
# function FullFileName (AFilename) -> FullFileName
# --------------------------------------------------------------------------------
function FullFileName () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# function ExtractFileName (AFilename) -> ExtractFileName
#--------------------------------------------------------------------------------
function ExtractFileName () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    AFilename="$1"
    # fspec=/path/to/some/file.txt
    # echo ${fspec##*/}
    # file.txt

    local LResult=
    LError=0
    LResult=${AFilename##*/}
    if [ -z "$LResult" ] ; then
        LError=1
    else
        echo $LResult               # работает всегда
    fi

    return $(( $LError ))
}
#endfunction

#-------------------------------------------------------------------------------
# function ExtractFileNameWithoutExt (AFileName) -> ExtractFileNameWithoutExt
#-------------------------------------------------------------------------------
function ExtractFileNameWithoutExt () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    AFileName="$1"

    local LResult=
    LError=0
    LResult=${AFileName%.*}
    if [ -z "$LResult" ] ; then
        LError=1
    else
        echo $LResult               # работает всегда
    fi

    return $(( $LError ))
}
#endfunction

#--------------------------------------------------------------------------------
# function ExtractFileExt (AFileName) -> ExtractFileExt
#--------------------------------------------------------------------------------
function ExtractFileExt () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    AFileName="$1"

    local LResult=
    LError=0
    LResult=${AFileName#*.}
    if [ -z "$LResult" ] ; then
        LError=1
    else
        echo $LResult               # работает всегда
    fi

    return $(( $LError ))
}
#endfunction

#--------------------------------------------------------------------------------
# function FileAttr (AFileName) -> FileAttr
#--------------------------------------------------------------------------------
function FileAttr () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# function FileSize (AFileName) -> FileSize
#--------------------------------------------------------------------------------
function FileSize () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# function CreateDir (ADIRECTORY) -> CreateDir
#--------------------------------------------------------------------------------
function CreateDir () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# function CreateFile (AFILENAME) -> CreateFile
#--------------------------------------------------------------------------------
function CreateFile () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# function CheckFile (AFILENAME) -> CheckFile
#--------------------------------------------------------------------------------
function CheckFile () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# function CurrentDir () -> CurrentDir
#--------------------------------------------------------------------------------
function CurrentDir () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    local LResult=
    LError=0
    #LResult=${AFilename##*/}
    #LResult=${PWD##*/}          # to assign to a variable
    #LResult=${result:-/}        # to correct for the case where PWD=/
    LResult=${PWD}              # to assign to a variable
    if [ -z "$LResult" ] ; then
        LError=1
    else
        echo $LResult               # работает всегда
    fi

    return $(( $LError ))
}
#endfunction

#--------------------------------------------------------------------------------
# procedure COPY_FILES (DIR_FROM, DIR_TO, MASK, ARG)
#--------------------------------------------------------------------------------
function COPY_FILES () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    ADIR_FROM=$1
    echo ADIR_FROM:$ADIR_FROM
    ADIR_TO=$2
    echo ADIR_TO:$ADIR_TO

    AMASK=$3
    echo AMASK:$AMASK
    AArg=$4
    echo AArg:$AArg

    #find "$ADIR_FROM" -type f -iname *.sh
    #find "$ADIR_FROM" -type f -name "*.*" -exec cp {} "$ADIR_TO" \;
    #find "$ADIR_FROM" -type f -name "*.sh" -exec ls {} \;

    find "$ADIR_FROM" -type f -name "$AMASK" -exec cp $AArg {} "$ADIR_TO" \;

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure XCOPY_FILES (DIR_FROM, DIR_TO, MASK, ARG)
#--------------------------------------------------------------------------------
function XCOPY_FILES () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    find "$ADIR_FROM" -type f -name "$AMASK" -exec -r cp {} "$ADIR_TO" \;

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure CreateDirectory (Directory, Owner, Access, Delete)
#--------------------------------------------------------------------------------
function CreateDirectory () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    ADirectory=$1
    AOwner=$2
    AAccess=$3
    ADelete=$4

    if [ ! -z "$ADelete" ] ; then
        sudo rm -R $ADirectory
    fi
    if [[ ! -d $ADirectory ]] ; then
        echo ---------------------------------------------
        echo create $ADirectory
        echo ---------------------------------------------
        sudo mkdir -p $ADirectory
    fi
    # Задаем владельца на созданный каталог
    sudo chown -R AOwner $ADirectory
    # Задаем права на созданный каталог
    sudo chmod -R AAccess $ADirectory

    return 0
}
#endfunction

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
    #echo ASCRIPTdesktopName:$ASCRIPTdesktopName
    if [[ -f $ASCRIPTdesktop ]] ; then
        cd ~/Desktop/
        rm $ASCRIPTdesktop
        touch $ASCRIPTdesktop
        echo '[Desktop Entry]'          >> $ASCRIPTdesktop
        echo 'Name='$ASCRIPTdesktopName >> $ASCRIPTdesktop
        echo 'Exec='$AScript            >> $ASCRIPTdesktop
        echo 'Terminal=true'            >> $ASCRIPTdesktop
        echo 'Type=Application'         >> $ASCRIPTdesktop
        chmod u+x $ASCRIPTdesktop
    fi

    return 0
}
#endfunction

#--------------------------------------------------------------------------------
# procedure PathWin2PathUnix (APath)
#--------------------------------------------------------------------------------
function PathWin2PathUnix () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    APath=$1
    #echo APath:$APath
    LResult=${APath/:}
    #echo LResult:$LResult
    LResult=/${LResult//\\//}

    echo $LResult  # работает всегда

    return 0
}
#endfunction
