#!/bin/bash
# -------------------------------------------------------------------
# lyrex_01.sh
Example 1: How to Sync Time in multiple servers using Bash For Loop in Linux
If you want to sync time in multiple servers using bash for loop in Linux then you can use below loop. In this example, we have provided the IP of all Servers in server.txt and then going to every server using for loop and setting the time to 16:08:00 using date command as shown below.
# -------------------------------------------------------------------

#begin

for a in $(cat server.txt);do ssh root@$a date +%T -s "16:08:00";done

NOTE:
Please note that here I have already enabled passwordless authentication between Servers to avoid any password prompt. So do not be surprise if you run any of the commands given in this article and it ask you to provide the authentication password. To Know more about setting up Passwordless authentication, you can check Passwordless ssh login using ssh keygen in 6 Easy Steps.

#end
