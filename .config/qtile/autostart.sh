#!/usr/bin/env bash 

COLORSCHEME=DoomOne

if [[ $(systemd-detect-virt) = "none" ]]; then
    echo "Not running in a Virtual Machine";
else
    xrandr -s 1920x1080 || echo "Cannot set 1920x1080 resolution.";
fi


lxsession &
picom &
/usr/bin/emacs --daemon &
killall conky
sleep 2 && conky -c "$HOME"/.config/conky/qtile/01/"$COLORSCHEME".conkyrc &
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
