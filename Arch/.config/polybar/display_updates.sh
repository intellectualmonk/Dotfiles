#!/bin/bash

pac="$(checkupdates| sed -n '$=')"

check=$((pac))
if [[ "$check" != "0" ]]
then
   echo "$pac"
fi

