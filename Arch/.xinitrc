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

[[ -f ~/.Xresources ]] && xrdb -merge -I "$HOME" ~/.Xresources

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

#Change blank time to 1 hour
xset s 3600 3600

#no bell
xset b off

# set monitor to sleep
xset s 600 600

##----------------------------------------------------------------------------------------------------------------------##
## Autostart programs + scripts
##----------------------------------------------------------------------------------------------------------------------##

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

devmon --exec-on-video "notify-send '%f mounted' 'Launching mpv...' -i mpv & mpc pause & mpv -vo opengl-hq dvdnav://menu"\
	--exec-on-drive "thunar %d"\
	--exec-on-disc "thunar %d"\
--exec-on-unmount "notify-send '%f' 'The device was successfully unmounted.' -i eject" &

#journalctl -f -n 0 -p 4 | xargs -d'\n' -I{} notify-send -t 2000 [LOG] -- {} &

(sleep 2s && dunst) &
compton --config ~/.config/compton.conf -b &> /tmp/compton.log
udiskie &
redshift -l -18.914608:-48.275380 -g 0.8 -m randr -v  &
xautolock -time 10 -locker slimlock -detectsleep &
xrandr --dpi 96
thunar --daemon &
[ !  -s ~/.config/mpd/pid ] && mpd
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
wmname LG3D
nitrogen --restore &
numlockx on &
(sleep 3s && conky -c ~/.xmonad/scripts/conky_dzen2 | dzen2 -p -ta r -e 'button3=' -fn 'xft:Bitstream Vera Sans Mono:size=7:antialias=true' -fg '#FCFCFC' -bg '#03070B' -x 365 -h 25 -w 1050) &

##----------------------------------------------------------------------------##
## startx
##----------------------------------------------------------------------------##

_start_session() {
  session=${1:-dwm}
  case $session in
      bspwm             ) exec bspwm;;
      xmonad            ) exec xmonad;;
      dwm               ) exec dwm;;
      # No known session, try to run it as command
      *) exec "$1";;
  esac
}
_start_session "$@"
