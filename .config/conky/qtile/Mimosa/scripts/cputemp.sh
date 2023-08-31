#!/bin/bash

# Variable
temp=$(cat /sys/class/thermal/thermal_zone0/temp)
cputemp=$(expr $temp / 1000)
base=32

# Main
Fahrenheit=$(expr $cputemp \* 9 / 5 + $base)
echo $Fahrenheit

exit
