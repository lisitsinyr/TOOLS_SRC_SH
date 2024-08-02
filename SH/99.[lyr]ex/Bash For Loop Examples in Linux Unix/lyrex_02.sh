#!/bin/bash
# -------------------------------------------------------------------
# lyrex_01.sh
Example 2: How to Check next 5 CPU Load Average using Bash For Loop in Linux
If you want to check next 5 CPU Load Average using bash for loop in Linux then you need to loop through each of the sequence from 1 to 5 and display the load average using cat /proc/loadavg for every sequence as shown below.
# -------------------------------------------------------------------

#begin
for i in $(seq 5);do cat /proc/loadavg;sleep 3;done

#end
