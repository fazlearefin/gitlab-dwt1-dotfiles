#!/usr/bin/env bash 

COLORSCHEME="doom-one"

lxsession &
picom &
/usr/bin/emacs --daemon &
sleep 3 && conky -c "$HOME"/.config/conky/qtile/"$COLORSCHEME"-01.conkyrc &
copyq &
nm-applet &
pamac-tray-icon-plasma &
"$HOME"/.screenlayout/layout.sh &

### UNCOMMENT ONLY ONE OF THE FOLLOWING THREE OPTIONS! ###
# 1. Uncomment to restore last saved wallpaper
xargs xwallpaper --stretch < ~/.cache/wall &
# 2. Uncomment to set a random wallpaper on login
# find /usr/share/backgrounds/dtos-backgrounds/ -type f | shuf -n 1 | xargs xwallpaper --stretch &
# 3. Uncomment to set wallpaper with nitrogen
# nitrogen --restore &
