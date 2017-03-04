#/bin/bash

count=$(checkupdates  | awk 'END {print NR}')
line_count=$(expr $count + 1)

( 
 echo " ^fg(#FCFCFC)^fn(FontAwesome:size=11)^fg(#dcdcdc)^fn(Inconsolata:size=9) Updates"; echo
 checkupdates | awk '{print $1}' | sed 's/^/   \^fn(FontAwesome:size=9)^fg(#169F85)^fg(#dcdcdc)^fn(Inconsolata:size=9) /'
 
) | dzen2 -p -x "1000" -y "30" -w "165"  -fg '#FCFCFC' -bg '#2B2C2B' -l "$line_count" -sa 'l' -ta 'c' -e 'onstart=uncollapse;button1=exit;button3=exit'  -fn  'xft:Inconsolata:pixelsize=9:antialias=True:hinting=True'
