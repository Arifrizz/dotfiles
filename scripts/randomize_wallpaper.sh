#!/bin/bash

# Path to wallpapers directory
WALLPAPERS_DIR="$HOME/dotfiles/backgrounds/.config/backgrounds"

# Select a random wallpaper
RANDOM_WALLPAPER=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)

# Set the wallpaper using feh
feh --bg-scale "$RANDOM_WALLPAPER"

# Apply pywal colors
wal -i "$RANDOM_WALLPAPER"

