#!/bin/bash

pac=$(checkupdates|perl -lne 'END { print $. }' )
aur=$(cower -u| perl -lne 'END { print $. }' )

check=$((pac + aur))
if [[ "$check" != "0" ]]
then
    echo "$pac %{F#C02A4C} %{F-} $aur"
else
    echo "%{F#C02A4C}%{F-}Updated"
fi