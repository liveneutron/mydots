#!/bin/bash

if pgrep -x "rofi" > /dev/null; then
    pkill rofi
else
	rofi -X11 -dmenu no-custom -i -theme-str '@import"~/.config/rofi/themes/rofi_theme_for_power_btn.rasi"'
fi

