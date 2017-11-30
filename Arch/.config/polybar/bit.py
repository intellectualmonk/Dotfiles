#!/usr/bin/env python

import urllib.request
import json

# FOX - ARN - B2U - BTD - FLW - LOC - MBT - NEG
EXCHANGE="FOX"

# last - high - low
BTC_PRICE="last"

with urllib.request.urlopen("https://api.bitvalor.com/v1/ticker.json") as url:
    DATA = json.loads(url.read().decode())
    print("R$" + str(DATA["ticker_24h"]["exchanges"][EXCHANGE][BTC_PRICE]))
