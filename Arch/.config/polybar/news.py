#!/usr/bin/python
# Depends on python-feedparser
# Read Arch Linux RSS news;


import feedparser

D = feedparser.parse("https://www.archlinux.org/feeds/news/")

for f in range(0, 1):
    print(D.entries[f].title, )
    xy = D.entries[f].title
