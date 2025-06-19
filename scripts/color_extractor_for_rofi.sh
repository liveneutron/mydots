#!/bin/bash

# Define file paths
WAL_COLORS_FILE="$HOME/.cache/wal/colors-waybar.css"
#ROFI_CONFIG_FILE="$HOME/.config/rofi/config.rasi"
#BACKUP_FILE="$ROFI_CONFIG_FILE.bak"

other_rofi_theme="$HOME/.config/rofi/themes/rofi-theme-for-others.rasi"
bak_other_rofi_theme="$HOME/.config/rofi/themes/rofi-theme-for-others.bak"

# Check if the wal colors file exists
if [[ ! -f "$WAL_COLORS_FILE" ]]; then
    echo "Error: $WAL_COLORS_FILE does not exist."
    exit 1
fi

# Create a backup of the current Rofi config file
cp "$ROFI_CONFIG_FILE" "$BACKUP_FILE"
cp "$other_rofi_theme" "$bak_other_rofi_theme"
echo "Backup of the current config created at $BACKUP_FILE."

# Extract color definitions and format them
colors=$(grep '@define-color' "$WAL_COLORS_FILE" | sed -E 's/@define-color ([^ ]+) (#[0-9a-fA-F]{6});/\1: \2;/' | tr '\n' '\n')

# Check if colors were found
if [[ -z "$colors" ]]; then
    echo "Error: No colors found in $WAL_COLORS_FILE."
    exit 1
fi

# Delete lines 19 to 37 in the rofi config file
sed -i "19,37d" "$ROFI_CONFIG_FILE"
sed -i "19,37d" "$other_rofi_theme"

# Insert colors into the rofi config file at line 19
{
    echo "$colors"
} | sed -i "19r /dev/stdin" "$ROFI_CONFIG_FILE"  # Insert at line 19
{
    echo "$colors"
} | sed -i "19r /dev/stdin" "$other_rofi_theme"
echo "Colors have been updated in $ROFI_CONFIG_FILE."

