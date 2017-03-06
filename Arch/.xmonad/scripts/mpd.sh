#! /bin/sh

position(){
pos=$(mpc | awk 'NR==2' | awk '{print $4}' | sed 's/(//' | sed 's/%)//')
bar=$(echo $pos | gdbar -w 190 -h 2.5 -fg "#15967D" -bg "#FFFFFF")
echo -n "$bar"
return
}

font="xft:Exo 2:pixelsize=9:antialias=True:hinting=True"
icon="/home/morgareth/.xmonad/.icons"

while :; do
echo "   $(mpc current -f %artist%)
   $(mpc current -f %title%)
   $(mpc current -f %album%)

^p(65)^ca(1,mpc prev)^i($icon/prev.xbm)^ca()   ^ca(1,mpc toggle)^i($icon/play.xbm)^ca()   ^ca(1,mpc stop)^i($icon/stop.xbm)^ca()  ^ca(1,mpc pause)^i($icon/pause.xbm)^ca()   ^ca(1,mpc next)^i($icon/next.xbm)^ca()
$(position)"
done | dzen2 -p -y 32 -x 620 -l 5 -u -w 185 -ta l -fg '#FFFFFF' -bg '#232323' -fn "$font" -e 'onstart=uncollapse;button3=exit'




