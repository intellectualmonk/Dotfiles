#!/bin/bash

ICON=$HOME/Wallpapers/xmonad-lock.png
TMPBG=/tmp/screen.png
maim /tmp/screen.png
convert $TMPBG -blur 0x5 $TMPBG
convert $TMPBG $ICON -gravity center -composite -matte $TMPBG
i3lock -I 30 -e -u -i $TMPBG

