#!/bin/sh
bar_bg="#169F85"
bar_fg="#FFFBF8"
AMASTER=`amixer get Master | awk 'END{gsub(/\[|\]|%/,""); print $4}'`
ASTAT=`amixer get Master | awk 'END{gsub(/\[|\]|%/,""); print $6}'`

if [[ $ASTAT = "on" ]]; then
    PERCBAR=`echo "$AMASTER"\
        | gdbar -bg $bar_bg -fg $bar_fg -h 4 -w 60  -ss 1 -sw 3 -nonl`
else
    PERCBAR=`echo 0 \
        | gdbar -bg $bar_bg -fg $bar_fg -h 4 -w 60  -ss 1 -sw 3 -nonl`
fi

echo "^ca(4,amixer set Master 1%+)^ca(5,amixer set Master 1%-)$PERCBAR^ca()^ca()"