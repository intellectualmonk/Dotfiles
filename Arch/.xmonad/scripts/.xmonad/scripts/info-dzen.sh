#!/bin/bash

FG='#404040'
BG='#2B2C2B'
fg_title='#C03A58'

font1="Inconsolata:size=10"
font_title="Inconsolata:size=10"
icons2="FontAwesome:size=11"
icons4="FontAwesome:size=9"

Disk=$(df -h / | awk 'NR==2 {total=$2; used=$3; print used" / "total}')
OS=$(hostnamectl|awk '{$1=$2="";sub(/^[ \t]+/, "")}NR==6')
HOST=$(hostnamectl|awk '{$1=$2="";sub(/^[ \t]+/, "")}NR==1')
Kernel=$(hostnamectl | awk -F- '/Kernel/{ OFS="-";NF--; print }'|awk '{print $3}')
Uptime=$(awk '{printf("%d:%02d:%02d:%02d",($1/60/60/24),($1/60/60%24),($1/60%60),($1%60))}' /proc/uptime)
Shell=$(echo "$SHELL" | awk -F/ '{for ( i=1; i <= NF; i++) sub(".", substr(toupper($i),1,1) , $i); print $NF}')
Cpu=$(awk < /proc/cpuinfo '/model name/{gsub(/[(TMR)]/,"");print $4,$5,$6,$8}' | head -1)
Gpu=$(lspci|awk '/VGA/{print $5,$8,$9}'|tr -d '[]'| awk '{print toupper(substr($0,0,1))tolower(substr($0,2))}')
Screen=$(xrandr | awk 'NR==3 {print $1}')
UPDATED=$(awk '/upgraded/ {line=$0;} END { $0=line; gsub(/[\[\]]/,"",$0);  printf "%s %s",$1,$2;}' /var/log/pacman.log)
Cores=$(nproc)
Motherboard=$(cat /sys/devices/virtual/dmi/id/board_{name,vendor} | awk '!(NR%2){print$1,p}{p=$0}')
Bdate=$(cat /sys/devices/virtual/dmi/id/bios_date)
Bvendor=$(awk < /sys/devices/virtual/dmi/id/bios_vendor '{print $NR,$2}')
Hd=$(cat /sys/class/block/sda/device/model)
Layout=$(setxkbmap -print | awk -F"+" '/xkb_symbols/{for ( i=1; i <= NF; i++) sub(".", substr(toupper($i),1,1) , $i); print $2}')

PACKAGES=$(pacman -Q | awk 'END {print NR}')
De=$(wmctrl -m | awk 'NR==1 {print $2}')
Ram=$(free -mh | awk 'NR==2 {total=$2; used=$3; print used" / "total}')
Net=$(ping -W 1 -c 1 8.8.8.8 >/dev/null 2>&1 && echo On || echo Off)
GtkTheme=$(awk < .gtkrc-2.0 -F'"' '/gtk-theme-name/{print $2}')
GtkIcon=$(awk < .gtkrc-2.0 -F'"' '/gtk-icon-theme-name/{print $2}')
GtkFont=$(awk < .gtkrc-2.0 -F'"' '/gtk-font-name/{print $2}')
Thermal=$(sensors  | awk '/Core 0/{print $3}' |awk '{if (match($0,/[0-9]+/,m)) print m[0]"°C"}')
Thermal1=$(sensors | awk '/Core 1/{print $3}' | awk '{if (match($0,/[0-9]+/,m)) print m[0]"°C"}')
Thermal2=$(sensors | awk '/Core 2/{print $3}' | awk '{if (match($0,/[0-9]+/,m)) print m[0]"°C"}') 
Thermal3=$(sensors | awk '/Core 3/{print $3}' | awk '{if (match($0,/[0-9]+/,m)) print m[0]"°C"}') 
Fan=$(sensors | awk '/fan1/{print $2,$3}')
Hdd=$(hddtemp /dev/sda | awk ' {print $NF}')
Birthd=$(tune2fs -l /dev/sda1 | awk '/Filesystem created:/{print $3,$4,$5,$7}')
Ip=$(ip route get 8.8.8.8 | awk '{print $NF; exit}')
Monitor=$(awk < /var/log/Xorg.0.log '/Display/{print $6,$7}'| tr -d '()' |sed -n '1p' ) 
Keyboard=$(hwinfo --short | awk '/keyboard/ {for(i=1; i<=1; i++) {getline; print $2,$3,$NF}}')


(
 echo "   ^fg(#FCFCFC)^fn($font_title)^p(+2)^fg($fg_title)^bg(#2B2C2B) System Information "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Host       ^fn($icons4)^fn($font1) $HOST  "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) OS         ^fn($icons4)^fn($font1) $OS  "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Kernel     ^fn($icons4)^fn($font1) $Kernel  "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Uptime     ^fn($icons4)^fn($font1) $Uptime  "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Packages   ^fn($icons4)^fn($font1) $PACKAGES  "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Update     ^fn($icons4)^fn($font1) $UPDATED  "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Wm         ^fn($icons4)^fn($font1) $De "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Theme      ^fn($icons4)^fn($font1) $GtkTheme  "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Icon       ^fn($icons4)^fn($font1) $GtkIcon "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Font       ^fn($icons4)^fn($font1) $GtkFont    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Shell      ^fn($icons4)^fn($font1) $Shell    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Birth      ^fn($icons4)^fn($font1) $Birthd  "
 echo "   ^fg(#C03A58)------------------------------------------------------------------"
 echo "   ^fg(#FCFCFC)^fn($font_title)^p(+82)^fg($fg_title)^bg(#2B2C2B) INFO "
 echo ""
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Processor  ^fn($icons4)^fn($font1) $Cpu    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) CPU(s)     ^fn($icons4)^fn($font1) $Cores    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Gpu        ^fn($icons4)^fn($font1) $Gpu    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Resolution ^fn($icons4)^fn($font1) $Screen    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Monitor    ^fn($icons4)^fn($font1) $Monitor    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Keyboard   ^fn($icons4)^fn($font1) $Keyboard    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Layout     ^fn($icons4)^fn($font1) $Layout    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Mother     ^fn($icons4)^fn($font1) $Motherboard    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) HD Model   ^fn($icons4)^fn($font1) $Hd    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Bios Date  ^fn($icons4)^fn($font1) $Bdate    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Vendor     ^fn($icons4)^fn($font1) $Bvendor    "
 echo "   ^fg(#C03A58)---------------------------------------------------------------------"
 echo "   ^fg(#FCFCFC)^fn($font_title)^p(+83)^fg($fg_title)^bg(#2B2C2B) HARDWARE "
 echo ""
 echo "   ^fg(#FCFCFC)^fn($font_title)^fg($fg_title)^bg(#2B2C2B) RAM "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Ram        ^fn($icons4)^fn($font1) $Ram  "
 echo "   ^fg(#FCFCFC)^fn($font_title)^fg($fg_title)^bg(#2B2C2B) HDD "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Disk       ^fn($icons4)^fn($font1) $Disk  "
 echo "   ^fg(#FCFCFC)^fn($font_title)^fg($fg_title)^bg(#2B2C2B) THERMAL "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Cpu-temp   ^fn($icons4)^fn($font1) $Thermal    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Cpu-temp   ^fn($icons4)^fn($font1) $Thermal1    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Cpu-temp   ^fn($icons4)^fn($font1) $Thermal2    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Cpu-temp   ^fn($icons4)^fn($font1) $Thermal3    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Hdd-temp   ^fn($icons4)^fn($font1) $Hdd    "
 echo "   ^fg(#FCFCFC)^fn($icons2)^fn($font1) Fan        ^fn($icons4)^fn($font1) $Fan    "
 echo ""
 echo "   ^fg(#C03A58)---------------------------------------------------------------------"
 echo "   ^fg(#FCFCFC)^fn($font_title)^p(+83)^fg($fg_title)^bg(#2B2C2B) POWER "
 echo "   ^ca(1,systemctl poweroff)^fg(#FCFCFC)^fn($icons2)^fn($font1) Poweroff ^ca() " 
 echo "   ^ca(1,systemctl reboot)^fg(#FCFCFC)^fn($icons2)^fn($font1) Reboot ^ca() "   
 echo "   ^ca(1,systemctl suspend)^fg(#FCFCFC)^fn($icons2)^fn($font1) Suspend ^ca() "   
 echo "   ^ca(1,systemctl suspend)^fg(#FCFCFC)^fn($icons2)^fn($font1) Lock ^ca() "   
 echo ""

) | dzen2 -p  -y 32 -w 300 -bg $BG -fg $FG -l 49 -sa l -ta c -e 'onstart=uncollapse;button1=exit;button3=exit' -fn $font1  
