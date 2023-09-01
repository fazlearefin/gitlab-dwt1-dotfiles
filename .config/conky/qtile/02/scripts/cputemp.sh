#!/bin/bash

# Main
cpuTemp=$(sensors | grep Tctl | awk -F '+' '{print $2}')
echo "$cpuTemp"

exit
