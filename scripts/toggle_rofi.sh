#!/bin/bash

if pgrep -x "rofi" > /dev/null; then
    pkill rofi
else
    rofi \
	-show drun \
	-theme-str '@import"~/.config/rofi/style.rasi"'
fi

