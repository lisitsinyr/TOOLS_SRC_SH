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

    echo ERROR: function $FUNCNAME not implemented! ...

    return 0
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

    echo ERROR: function $FUNCNAME not implemented! ...

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

    echo ERROR: function $FUNCNAME not implemented! ...

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
# procedure CreateLink (Directory)
#--------------------------------------------------------------------------------
function CreateLink () {
#beginfunction
    if [[ "$DEBUG" -eq 1 ]] ; then
        echo DEBUG: function $FUNCNAME ... >$(tty)
    fi

    ADirectory=$1
    if [[ -d $ADirectory ]] ; then
        cd ~/Desktop/
        ln -s $ADirectory
    fi

    return 0
}
#endfunction
