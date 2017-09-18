#!/bin/bash
 
 
OS=$(hostnamectl|awk '{$1=$2="";sub(/^[ \t]+/, "")}NR==6')
HOST=$(hostnamectl|awk '{$1=$2="";sub(/^[ \t]+/, "")}NR==1')
KERNEL=$(hostnamectl | awk -F- '/Kernel/{ OFS="-";NF--; print }'|awk '{print $3}')
ARCH=$(uname -m)
UPTIME=$(awk '{printf("%d:%02d:%02d:%02d",($1/60/60/24),($1/60/60%24),($1/60%60),($1%60))}' /proc/uptime)
MODEL=$(cat /sys/devices/virtual/dmi/id/board_{name,vendor} | awk '!(NR%2){print$1,p}{p=$0}')
DE=$(wmctrl -m | awk 'NR==1 {print $2}' | perl -nle 'print ucfirst lc')
CPU=$(awk < /proc/cpuinfo '/model name/{gsub(/[(TMR)]/,"");print $4,$5,$6,$8}' | head -1)
GPU=$(lspci|awk '/VGA/{print $5,$8,$9}' | tr -d '[]')
SHELL=$(echo "$SHELL" | awk -F/ '{for ( i=1; i <= NF; i++) sub(".", substr(toupper($i),1,1) , $i); print $NF}')
RESOLUTION=$(xdpyinfo | awk '/dimensions:/ {printf $2}')
BIRTH=$(ls -alct /|sed '$!d'|awk '{print $7, $6, $8}')
 
 
GtkTheme=$(awk < .gtkrc-2.0 -F'"' '/gtk-theme-name/{print $2}')
GtkIcon=$(awk < .gtkrc-2.0 -F'"' '/gtk-icon-theme-name/{print $2}' )
GtkFont=$(awk < .gtkrc-2.0 -F'"' '/gtk-font-name/{print $2}')
 
 
Packages=$(pacman -Q | awk 'END {print NR}')
Layout=$(setxkbmap -print | awk -F"+" '/xkb_symbols/{for ( i=1; i <= NF; i++) sub(".", substr(toupper($i),1,1) , $i); print $2}')
Monitor=$(awk < /var/log/Xorg.0.log '/Display/{print $6,$7}'|tr -d '()'|sed -n '1p')
 
 
 echo  ""
 echo -e "\e[94m   --------------------"
 echo "   SYSTEM INFORMATION"
 echo "   --------------------"
 echo  ""
 echo -e "\e[94m     M0RG4R37H"
 echo -e "\e[94m     \e[39m$MODEL"
 echo -e "\e[94m     \e[39m$OS $ARCH"
 echo -e "\e[94m     \e[39m$KERNEL"
 echo -e "\e[94m     \e[39m$UPTIME"
 echo -e "\e[94m     \e[39m$SHELL"
 echo -e "\e[94m     \e[39m$RESOLUTION"
 echo -e "\e[94m     \e[39m$CPU"
 echo -e "\e[94m     \e[39m$GPU"
 echo -e "\e[92m   --------------------"
 echo -e "\e[92m     \e[92m$DE"
 echo -e "\e[92m     \e[39m$GtkTheme"
 echo -e "\e[92m     \e[39m$GtkIcon"
 echo -e "\e[92m     \e[39m$GtkFont"
 echo -e "\e[92m     \e[39m$BIRTH"
 echo -e "\e[91m   --------------------"
 echo -e "\e[91m     \e[31m$Packages"
 echo -e "\e[91m     \e[39m$Layout"
 echo -e "\e[91m     \e[39m$Monitor"
 echo  ""



