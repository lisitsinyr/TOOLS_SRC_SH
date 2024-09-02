#!/bin/bash
# -------------------------------------------------------------------
# lyrex_01.sh
Example 3: How to check the processes using maximum swap memory in Linux
If you want to check the processes using maximum swap memory in linux then you can use below bash for loop. In this example, we are using awk and sort tool with bash for loop to check the processes using swap memory as shown below.
# -------------------------------------------------------------------

#begin
 for file in /proc/*/status ; do awk '/VmSwap|Name/{printf $2 " " $3}END{ print ""}' $file; done | sort -k 2 -n -r | less

#end
