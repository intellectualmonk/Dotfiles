#!/bin/python3
import urllib.request

CITY = "Uberlandia"
API_KEY = "642a76e68929c32f7bdee0ed86ed30a3"

WEATHER=eval(str(urllib.request.urlopen("http://api.openweathermap.org/data/2.5/weather?q={}&APPID={}".format(CITY, API_KEY)).read())[2:-1])

INFO = WEATHER["weather"][0]["description"].capitalize()
TEMP = int(float(WEATHER["main"]["temp"]) - 272.15)

print("%s, %i°C" % (INFO, TEMP))
