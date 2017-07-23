#!/bin/sh

if [ "$(mpc status | awk 'NR==2 {print $1}')" = "[playing]" ]; then
                MPC=$(mpc current --format "%title%")
                echo "$MPC"
        else
                echo "Paused"
        fi

