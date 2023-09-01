#!/bin/bash

# Main
cpuTemp=$(sensors | grep Tctl | awk -F '+' '{print $2}')

if [[ -n $cpuTemp ]]; then 
    echo "$cpuTemp"; 
else 
    echo "n/a"; 
fi

exit
