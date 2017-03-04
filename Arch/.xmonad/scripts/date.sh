#!/bin/bash

TODAY=$(expr `date +'%d'` + 0)
MONTH=`date +'%m'`
YEAR=`date +'%Y'`

(
echo " ^fg(#FCFCFC)^fn(FontAwesome:size=11)^fg(#dcdcdc)^fn(Inconsolata:size=9) Calendar"; echo
\
cal -w | sed -re "s/^(.*[A-Za-z][A-Za-z]*.*)$/^fg(#2D2D2D)^bg(#169F85)\1/;s/(^|[ ])($TODAY)($|[ ])/\1^bg(#169F85)^fg(#2B2C2B)\2^fg(#6C6C6C)^bg(#2B2C2B)\3/"
sleep 20
) | dzen2 -fg '#FCFCFC' -bg '#2B2C2B' -fn 'Inconsolata-9' -x 1223 -y 30 -w 143 -l 9 -sa c -e 'onstart=uncollapse;button3=exit'



