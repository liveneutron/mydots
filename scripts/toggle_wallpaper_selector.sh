#!/bin/bash

if pgrep -x "rofi" > /dev/null; then
    pkill rofi
else
    ~/scripts/wall.sh
fi

