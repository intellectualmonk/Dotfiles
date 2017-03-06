#/bin/bash

count=$(checkupdates  | awk 'END {print NR}')
line_count=$(expr $count + 1)

( 
 echo " ^fg(#FCFCFC)^fn(FontAwesome:size=11)^fg(#dcdcdc)^fn(xft:Inconsolata:pixelsize=10:antialias=True:hinting=True) Updates"; echo
 checkupdates | awk '{print $1}' | sed 's/^/   \^fn(FontAwesome:size=9)^fg(#15967D)^fg(#dcdcdc)^fn(xft:Inconsolata:pixelsize=10:antialias=True:hinting=True) /'
 
) | dzen2 -p -x "1000" -y "32" -w "165"  -fg '#FCFCFC' -bg '#232323' -l "$line_count" -sa 'l' -ta 'c' -e 'onstart=uncollapse;button1=exit;button3=exit'  -fn  'xft:Inconsolata:pixelsize=10:antialias=True:hinting=True'
