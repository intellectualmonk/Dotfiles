#!/bin/bash 

pacman=$(checkupdates | wc -l)
aur=$(checkupdates-aur | wc -l)

updates=$((pacman + aur))
if [ "$updates" -gt 0 ]; then
  echo "$pacman %{F#5b5b5b}%{F-} $aur"
fi

