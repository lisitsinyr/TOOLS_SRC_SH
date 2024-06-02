#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_clean.bat
# ----------------------------------------------------------------------------
# 
# ----------------------------------------------------------------------------
# usage: git clean [-d] [-f] [-i] [-n] [-q] [-e <pattern>] [-x | -X] [--] [<pathspec>...]
# 
#     -q, --[no-]quiet      do not print names of files removed
#     -n, --[no-]dry-run    dry run
#     -f, --[no-]force      force
#     -i, --[no-]interactive
#                           interactive cleaning
#     -d                    remove whole directories
#     -e, --exclude <pattern>
#                           add <pattern> to ignore rules
#     -x                    remove ignored files, too
#     -X                    remove only ignored files
# ----------------------------------------------------------------------------

#:begin
echo '----------------------------------------------'
echo 'git clean'
echo '----------------------------------------------'
git clean

#:exit
