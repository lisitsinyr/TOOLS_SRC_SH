#!/bin/bash
# -------------------------------------------------------------------
# lyrex_01.sh
Example 4: How to convert all rows into columns based on Colon(:) separator
You can also use bash for loop to convert all rows into columns based on Colon Separator(:) as shown below. In this example, we are creating a file testfile.txt and converting its rows to columns using cut and paste command with for loop. Firstly we need to create a file testfile.txt using vi testfile.txt command.

[root@localhost ~]# vi testfile.txt
Hi:you:there
This:is:CYBERITHUB
hello:world:example
Then we need to run below bash for loop from i=1 to i<=3 to convert the rows into columns.

[root@localhost ~]# for ((i=1;i<=3;i++)); do cut -d: -f "$i" testfile.txt | paste -sd: ; done | column -t -s:
Hi      This     hello
you      is      world
there CYBERITHUB example
# -------------------------------------------------------------------

#begin

#end
