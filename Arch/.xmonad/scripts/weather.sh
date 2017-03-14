#!/bin/sh


#curl -s 'http://www.accuweather.com/en/br/uberlandia/33809/weather-forecast/33809'|awk -F\' '/acm_RecentLocationsCarousel\.push/{print $12,$NF}'|awk 'NR==1 {gsub(/[[:punct:]]|text/,"")sub(OFS,"°:")sub("  ",""); print}' 
 curl -s "https://www.wunderground.com/q/zmw:00000.68.83525" | grep "og:title"|cut -d\" -f4|sed 's/&deg;/°C /;s/[,|]//g'|awk 'NR==1!($2="");{sub(" ", "")}1' 
