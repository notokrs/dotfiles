#!/bin/sh

player_status=$(playerctl status 2> /dev/null)
artist=$(playerctl metadata artist 2> /dev/null)
title=$(playerctl metadata title 2> /dev/null)
smplayer_pid=$(pgrep -f smplayer)

if [[ "$player_status" = "Playing" && -z $smplayer_pid ]]; then
    echo $artist - $title | cut -c 1-50
elif [[ "$player_status" = "Paused" && -z $smplayer_pid ]]; then
    echo $artist - $title | cut -c 1-50
else
    echo ""
fi
