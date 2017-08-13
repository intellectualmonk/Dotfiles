#!/usr/bin/env python
# -*- coding: utf-8 -*-
# File              : .config/polybar/spotify.py
# Author            : Morgareth <morgareth@tutanota.com>
# Date              : 10.08.2017
# Last Modified Date: 10.08.2017
# Last Modified By  : Morgareth <morgareth@tutanota.com>

import dbus
try:
	bus = dbus.SessionBus()
	spotify = bus.get_object("org.mpris.MediaPlayer2.spotify", "/org/mpris/MediaPlayer2")
	spotify_iface = dbus.Interface(spotify, 'org.freedesktop.DBus.Properties')
	props = spotify_iface.Get('org.mpris.MediaPlayer2.Player', 'Metadata')
	print(str(props['xesam:artist'][0]) + " - " + str(props['xesam:album']) + " - " + str(props['xesam:title']))
	exit
exciept dbus.exceptions.DBusException:
	exit