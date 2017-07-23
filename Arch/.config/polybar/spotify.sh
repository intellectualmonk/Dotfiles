#!/bin/bash

player_status=$(playerctl status 2> /dev/null)
if [[ $player_status -eq 0 ]]; then
    metadata="$(playerctl metadata artist) - $(playerctl metadata album) -  $(playerctl metadata title)"
fi

if [[ $player_status = "Playing" ]]; then
    echo " $metadata"       
elif [[ $player_status = "Paused" ]]; then 
    echo "Spotify - Paused"       
else
    echo "Spotify - Off"
fi