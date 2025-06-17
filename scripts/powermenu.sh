#!/bin/sh

# Power menu script using tofi

CHOSEN=$(printf "SHUTDOWN\nRESTART\nLOG OUT\nHIBERNATE\nLOCK" | ~/scripts/toggle_power_menu.sh)

case "$CHOSEN" in
	"LOCK") hyprlock ;;
	"HIBERNATE") systemctl hibernate ;;
	"RESTART") reboot;;
	"LOG OUT") hyprctl dispatch exit;;
	"SHUTDOWN") poweroff ;;
	*) exit 1 ;;
esac
