#!/bin/bash

ICON=$HOME/Wallpapers/Arch.sh.png
TMPBG=/tmp/screen.png
maim /tmp/screen.png
convert $TMPBG -blur 0x5 $TMPBG
convert $TMPBG $ICON -gravity center -composite -matte $TMPBG
i3lock  -I 30 -e -u -n  -i $TMPBG

