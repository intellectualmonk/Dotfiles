#!/bin/bash

FG='#404040'
BG='#2B2C2B'
fg_title='#169F85'

font1="Inconsolata:size=10"
font_title="Inconsolata:size=10"
icons2="FontAwesome:size=11"
icons4="FontAwesome:size=9"

#A simple popup showing system information
Disk=$(df -h / | awk 'NR==2 {total=$2; used=$3; print used" / "total}')
OS=$(awk -F'"' '/NAME/{$0=$2}NR==1' /etc/os-release)
HOST=$(hostname)
Kernel=$(uname -r  | sed -r 's/-\w+$//')
Uptime=$(awk '{printf("%d:%02d:%02d:%02d",($1/60/60/24),($1/60/60%24),($1/60%60),($1%60))}' /proc/uptime)
Shell=$(echo "$SHELL" | awk -F'/' '{print $NF}')
Cpu=$(awk '/model name/' /proc/cpuinfo | awk 'NR==1 {print $4,$5,$6,$8}' | sed 's/ *([A-Z]*) */ /g')
Gpu=$(glxinfo | grep "Device:" | awk '{print $2,$4 $5}' | sed 's/([^>]*)/ /')
Screen=$(xrandr | awk 'NR==3 {print $1}')
UPDATED=$(awk '/upgraded/ {line=$0;} END { $0=line; gsub(/[\[\]]/,"",$0);  printf "%s %s",$1,$2;}' /var/log/pacman.log)
Cores=$(nproc)

PACKAGES=$(pacman -Q | awk 'END {print NR}')
De=$(wmctrl -m | awk 'NR==1 {print $2}')
Ram_used=$(free -m | awk '/Mem/{print $3" MB"}')
Ram_total=$(free -m | awk '/Mem/{print $2" MB"}')
Net=$(ping -W 1 -c 1 8.8.8.8 >/dev/null 2>&1 && echo On || echo Off})
GtkTheme=$(awk < .gtkrc-2.0 -F'"' '/gtk-theme-name/{print $2}')
GtkIcon=$(awk < .gtkrc-2.0 -F'"' '/gtk-icon-theme-name/{print $2}')
GtkFont=$(awk < .gtkrc-2.0 -F'"' '/gtk-font-name/{print $2}')
Thermal=$(sensors | grep "Core 0" | awk '{print $3}' | egrep -o  '[0-9]+' | head -n 1)°C 
Thermal1=$(sensors | grep "Core 1" | awk '{print $3}' | egrep -o  '[0-9]+' | head -n 1)°C 
Thermal2=$(sensors | grep "Core 2" | awk '{print $3}' | egrep -o  '[0-9]+' | head -n 1)°C 
Thermal3=$(sensors | grep "Core 3" | awk '{print $3}' | egrep -o  '[0-9]+' | head -n 1)°C 
Fan=$(sensors | awk '/fan1/{print $2,$3}')
Hdd=$(hddtemp /dev/sda | awk ' {print $2, $NF}' | sed 's/\b\([[:alpha:]]\)\([[:alpha:]]*\)\b/\u\1\L\2/g')
Birthd=$(tune2fs -l /dev/sda1 | awk '/Filesystem created:/{print $3,$4,$5,$7}')
Ip=$(ip route get 8.8.8.8 | awk '{print $NF; exit}')
Monitor=$(hwinfo --short | awk '/monitor/ {for(i=1; i<=1; i++) {getline; print}}' | sed 's/^ \+//') 
Gitdir="github.com/Morgareth"
Plus="goo.gl/bRzI0i"
Twitter="goo.gl/3lwcRW"
Face="goo.gl/ySwhjD"
Mail="goo.gl/f9qtxa"
Mail1="goo.gl/ffXGsx"


(
 echo "   ^fg($fg_title)^fn($font_title)^p(-100)System^p()^fg()" # Fist line goes to title
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Host       ^fn($icons4)^fn($font1) $HOST  "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) OS         ^fn($icons4)^fn($font1) $OS  "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Kernel     ^fn($icons4)^fn($font1) $Kernel  "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Uptime     ^fn($icons4)^fn($font1) $Uptime  "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Packages   ^fn($icons4)^fn($font1) $PACKAGES  "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Update     ^fn($icons4)^fn($font1) $UPDATED  "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Birth      ^fn($icons4)^fn($font1) $Birthd  "
 echo "   ^fg(#169F85)------------------------------------------------------------------"
 echo "   ^fg(#FCFCFC)^fn($font_title)^fg($fg_title)^bg(#2B2C2B) INFO "
 echo ""
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Wm 	       ^fn($icons4)^fn($font1) $De	"
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Theme      ^fn($icons4)^fn($font1) $GtkTheme  "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Icon       ^fn($icons4)^fn($font1) $GtkIcon	"
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Font       ^fn($icons4)^fn($font1) $GtkFont    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Shell      ^fn($icons4)^fn($font1) $Shell    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Processor  ^fn($icons4)^fn($font1) $Cpu    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) CPU(s)     ^fn($icons4)^fn($font1) $Cores    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Gpu        ^fn($icons4)^fn($font1) $Gpu    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Resolution ^fn($icons4)^fn($font1) $Screen    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Monitor    ^fn($icons4)^fn($font1) $Monitor    "
 echo "   ^fg(#169F85)---------------------------------------------------------------------"
 echo "   ^fg(#FCFCFC)^fn($font_title)^fg($fg_title)^bg(#2B2C2B) HARDWARE "
 echo ""
 echo "   ^fg(#FCFCFC)^fn($font_title)^fg($fg_title)^bg(#2B2C2B) RAM "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Ram        ^fn($icons4)^fn($font1) $Ram_used / $Ram_total "
 echo "   ^fg(#FCFCFC)^fn($font_title)^fg($fg_title)^bg(#2B2C2B) HDD "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Disk       ^fn($icons4)^fn($font1) $Disk  "
 echo "   ^fg(#FCFCFC)^fn($font_title)^fg($fg_title)^bg(#2B2C2B) THERMAL "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Cpu-temp   ^fn($icons4)^fn($font1) $Thermal    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Cpu-temp   ^fn($icons4)^fn($font1) $Thermal1    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Cpu-temp   ^fn($icons4)^fn($font1) $Thermal2    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Cpu-temp   ^fn($icons4)^fn($font1) $Thermal3    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Hdd-temp   ^fn($icons4)^fn($font1) $Hdd    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Fan        ^fn($icons4)^fn($font1) $Fan    "
 echo "   ^fg(#169F85)---------------------------------------------------------------------"
 echo "   ^fg(#FCFCFC)^fn($font_title)^fg($fg_title)^bg(#2B2C2B) CONTACT ME "
 echo "" 
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Author     ^fn($icons4)^fn($font1)  $HOST  "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Github     ^fn($icons4)^fn($font1)  $Gitdir  "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Google+    ^fn($icons4)^fn($font1)  $Plus  "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Twitter    ^fn($icons4)^fn($font1)  $Twitter  "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Facebook   ^fn($icons4)^fn($font1)  $Face  "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Email      ^fn($icons4)^fn($font1)  $Mail  "
 echo "   ^fg(#169F85)---------------------------------------------------------------------"
 echo "   ^fg(#FCFCFC)^fn($font_title)^fg($fg_title)^bg(#2B2C2B) POWER "
 echo ""
 echo "   ^ca(1,systemctl poweroff)^fg(#FCFCFC)^fn($icons2)^fn($font1) Poweroff ^ca() " 
 echo "   ^ca(1,systemctl reboot)^fg(#FCFCFC)^fn($icons2)^fn($font1) Reboot ^ca() "   
 echo "   ^ca(1,systemctl suspend)^fg(#FCFCFC)^fn($icons2)^fn($font1) Suspend ^ca() "   
 echo ""

) | dzen2 -p  -y 30 -w 300 -bg $BG -fg $FG -l 49 -sa l -ta c -e 'onstart=uncollapse;button1=exit;button3=exit' -fn $font1  
