##----------------------------------------------------------------------------##
## Set some defaults
##----------------------------------------------------------------------------##

export EDITOR=vim
export BROWSER=firefox
export MANPAGER=less
export TERM=rxvt-256color
export GIT_EDITOR='/usr/bin/vim'
export FILEBROWSER=dolphin

##----------------------------------------------------------------------------##
## Set PATH so it includes user's private bin if it exists
##----------------------------------------------------------------------------##

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

##----------------------------------------------------------------------------##
## For uniform qt theme and icons
##----------------------------------------------------------------------------##

#export QT_QPA_PLATFORMTHEME=gtk2

##----------------------------------------------------------------------------##
## Locales
##----------------------------------------------------------------------------##

export LANG="pt_BR.UTF-8"
export LC_MESSAGES="pt_BR.UTF-8"
export MM_CHARSET"=UTF-8"
export LC_ALL="pt_BR.UTF-8"
export LANGUAGE="pt_BR.UTF-8"
export LC_CTYPE="pt_BR.UTF-8"
export LC_NUMERIC="pt_BR.UTF-8"
export LC_TIME="pt_BR.UTF-8"
export LC_COLLATE="pt_BR.UTF-8"
export LC_MONETARY="pt_BR.UTF-8"
export LC_PAPER="pt_BR.UTF-8"
export LC_NAME="pt_BR.UTF-8"
export LC_ADDRESS="pt_BR.UTF-8"
export LC_TELEPHONE="pt_BR.UTF-8"
export LC_MEASUREMENT="pt_BR.UTF-8"
export LC_IDENTIFICATION="pt_BR.UTF-8"

##----------------------------------------------------------------------------##
## Using a GTK+ icon theme in Qt apps
##----------------------------------------------------------------------------##

#export DESKTOP_SESSION=gnome

##----------------------------------------------------------------------------##
## Auto start X
##----------------------------------------------------------------------------##

#[[ -z "$DISPLAY" && "$XDG_VTNR" -eq 1 ]] && exec startx -- vt1 &> /dev/null
