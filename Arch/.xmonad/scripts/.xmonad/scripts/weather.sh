#!/bin/sh


curl -s 'http://www.accuweather.com/en/br/uberlandia/33809/weather-forecast/33809'|awk -F\' '/acm_RecentLocationsCarousel\.push/{print $12,$NF}'|awk 'NR==1 {gsub(/[[:punct:]]|text/,"")sub(OFS,"°:")sub("  ",""); print}' 
