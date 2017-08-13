#!/bin/bash

#-------------------------------# 
#  ╻ ╻╻┏┓╻╻╺┳╸┏━┓┏━╸            #
#  ┏╋┛┃┃┗┫┃ ┃ ┣┳┛┃              #
# ╹╹ ╹╹╹ ╹╹ ╹ ╹┗╸┗━╸            #
# by Morgareth                  #
# no login manager since forever#
#-------------------------------#

##----------------------------------------------------------------------------##
## Update Xresources 
##----------------------------------------------------------------------------##

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

##----------------------------------------------------------------------------##
## My fonts   
##----------------------------------------------------------------------------##

xset +fp ~/.local/share/fonts
xset fp+ /usr/share/fonts/TTF
xset fp+ /usr/share/fonts/OTF
xset fp+ /usr/share/fonts/artwiz-fonts
xset fp+ /usr/share/fonts/local
xset fp+ /usr/share/fonts/misc
xset fp rehash

##----------------------------------------------------------------------------##
## General settings 
##----------------------------------------------------------------------------##
#x cursor
xsetroot -cursor_name left_ptr&

#typematic delay/ rate
xset r rate 200 20

#no bell
xset b off

# set monitor to sleep
xset s 600 600

##----------------------------------------------------------------------------------------------------------------------##
## Autostart programs + scripts
##----------------------------------------------------------------------------------------------------------------------##

devmon --exec-on-video "notify-send '%f mounted' 'Launching mpv...' -i mpv & mpc pause & mpv -vo opengl-hq dvdnav://menu"\
	--exec-on-drive "thunar %d"\
	--exec-on-disc "thunar %d"\
--exec-on-unmount "notify-send '%f' 'The device was successfully unmounted.' -i eject" &

#journalctl -f -n 0 -p 4 | xargs -d'\n' -I{} notify-send -t 2000 [LOG] -- {} &

(sleep 2s && dunst) &
compton --config ~/.config/compton.conf -b &> /tmp/compton.log
udiskie &
numlockx &
redshift -l -18.914608:-48.275380 -g 0.8 -m randr -v  & 
xautolock -time 10 -locker slimlock -detectsleep &   
xrandr --dpi 96 
thunar --daemon &
#[ !  -s ~/.config/mpd/pid ] && mpd
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
wmname LG3D
hsetroot -tile  Wallpapers/image_015.png 
firefox  & 

##----------------------------------------------------------------------------##
## startx
##----------------------------------------------------------------------------##

_start_session() {
  session=${1:-bspwm}
  case $session in
      bspwm             ) exec bspwm;;
      xmonad            ) exec xmonad;;
      2bwm              ) exec 2bwm ;;
      # No known session, try to run it as command
      *) exec "$1";;
  esac
}
_start_session "$@"
