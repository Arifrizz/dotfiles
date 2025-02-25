#!/bin/bash

# Path to wallpapers directory
WALLPAPERS_DIR="$HOME/.loacal/programs"

# Select a random wallpaper
RANDOM_WALLPAPER=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)


