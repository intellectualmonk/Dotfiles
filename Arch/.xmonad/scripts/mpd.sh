#! /bin/sh

position(){
pos=$(mpc | awk 'NR==2' | awk '{print $4}' | sed 's/(//' | sed 's/%)//')
bar=$(echo $pos | gdbar -w 190 -h 2.5 -fg "#169F85" -bg "#FFFFFF")
echo -n "$bar"
return
}

font="Exo 2-7"
icon="/home/morgareth/.xmonad/.icons"

while :; do
echo "   $(mpc current -f %artist%)
   $(mpc current -f %title%)
   $(mpc current -f %album%)
 
^p(65)^ca(1,mpc prev)^i($icon/prev.xbm)^ca()   ^ca(1,mpc toggle)^i($icon/play.xbm)^ca()   ^ca(1,mpc stop)^i($icon/stop.xbm)^ca()  ^ca(1,mpc pause)^i($icon/pause.xbm)^ca()   ^ca(1,mpc next)^i($icon/next.xbm)^ca()
$(position)"
done | dzen2 -p -y 30 -x 550 -l 5 -u -w 185 -ta l -fg '#FFFFFF' -bg '#2B2C2B' -fn "$font" -e 'onstart=uncollapse;button3=exit'




