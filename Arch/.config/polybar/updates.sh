#!/bin/bash

pac=$(checkupdates|perl -lne 'END { print $. }' )
aur=$(cower -u| perl -lne 'END { print $. }' )

check=$((pac + aur))
if [[ "$check" != "0" ]]
then
    echo "$pac %{F#1A8A74} %{F-} $aur"
else
    echo "%{F#1A8A74}%{F-}Updated"
fi