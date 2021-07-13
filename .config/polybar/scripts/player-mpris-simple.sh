#!/bin/sh

player_status=$(playerctl status 2> /dev/null)
smplayer_pid=$(pgrep -f smplayer)

if [[ "$player_status" = "Playing" && -z $smplayer_pid ]]; then
    echo  $(playerctl metadata artist) - $(playerctl metadata title)
elif [ "$player_status" = "Paused" ]; then
    echo $(playerctl metadata artist) - $(playerctl metadata title)
else
    echo ""
fi
