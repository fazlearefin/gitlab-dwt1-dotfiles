#!/usr/bin/env bash
#  ____ _____
# |  _ \_   _|  Derek Taylor (DistroTube)
# | | | || |    http://www.youtube.com/c/DistroTube
# | |_| || |    http://www.gitlab.com/dwt1/
# |____/ |_|
#
# This is a test script

myDir="$HOME/test/"

dirOptions=$(cd ${myDir} && /bin/ls -d */ | cut -d " " -f 1)
dirChoice=$(echo -e "${dirOptions[@]}\nquit" | dmenu -i -p 'My directories: ')

if [ "$dirChoice" == "quit" ]; then
  echo "Program terminated."
elif [ -n "$dirChoice" ]; then
  fileChoice=$(/bin/ls ${myDir}'/'${dirChoice} -Apb | cut -d " " -f 1 | \
					grep -v / | dmenu -i -l 15 -p 'Edit this file: ')
  [ -n "$fileChoice" ] && exec emacsclient -c ${myDir}${dirChoice}${fileChoice}
fi
