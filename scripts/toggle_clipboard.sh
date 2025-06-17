#!/bin/bash

if pgrep -x "rofi" > /dev/null; then
    pkill rofi
else
    cliphist list | rofi \
	-dmenu \
	-theme-str '@import"~/.config/rofi/style.rasi"' | cliphist decode | wl-copy
fi

