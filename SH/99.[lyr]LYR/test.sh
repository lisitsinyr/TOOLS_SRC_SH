#!/bin/bash

# cat ./LIB/ini2arr.ini

# load the in.ini INI file to current BASH - quoted to preserve line breaks

# eval "$(cat ./LIB/ini2arr.ini | ./LIB/ini2arr.py)"

# ./LIB/ini2arr.py ./LIB/ini2arr.ini
# eval "$(./LIB/ini2arr.py ./LIB/ini2arr.ini)"

source <(cat ./LIB/ini2arr.ini | ./LIB/ini2arr.py)

# test it:
echo ${barfoo[session]}
