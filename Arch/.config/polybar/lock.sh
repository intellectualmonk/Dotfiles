#!/bin/bash

maim /tmp/screen.png
convert /tmp/screen.png -scale 15% -scale 670% -fill black -colorize 20% /tmp/screen.png
lock_icon=$HOME/Wallpapers/image_032.png

if [[ -f $lock_icon ]]; then
  px=0
  py=0
  r=$(file "$lock_icon" | grep -E  -o '[0-9]{3} x [0-9]{3}')
  rx=$(echo "$r" |  awk '{print $1}')
  ry=$(echo "$r" |  awk '{print $3}')
  sr=$(xrandr --query | awk '/ connected/{print $3}' )

  for res in $sr; do
    srx=$(echo "$res" | cut -d'x' -f 1)                   # x pos
    sry=$(echo "$res" | cut -d'x' -f 2 | cut -d'+' -f 1)  # y pos
    srox=$(echo "$res" | cut -d'x' -f 2 | cut -d'+' -f 2) # x offset
    sroy=$(echo "$res" | cut -d'x' -f 2 | cut -d'+' -f 3) # y offset

    px=$((srox + srx/2 - rx/2))
    py=$((sroy + sry/2 - ry/2))

    convert /tmp/screen.png "$lock_icon" -geometry +$px+$py -composite -matte /tmp/screen.png
  done
fi

i3lock -u  -e  -n -i /tmp/screen.png