#!/bin/bash

# Directories
WALLPAPER_DIR="$HOME/customization/wallpapers"
NEOFETCH_IMAGE_DIR="$HOME/customization/neofetch_images"
NEOFETCH_CONFIG="$HOME/.config/neofetch/config.conf"
DEFAULT_NEOFETCH_IMAGE="$NEOFETCH_IMAGE_DIR/default.jpg"

# Select a random wallpaper
RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Set the wallpaper using feh
feh --bg-scale "$RANDOM_WALLPAPER"

# Apply Pywal colors
wal -i "$RANDOM_WALLPAPER"

# Get the corresponding Neofetch image
IMAGE_NAME=$(basename "$RANDOM_WALLPAPER")
NEOFETCH_IMAGE="$NEOFETCH_IMAGE_DIR/${IMAGE_NAME%.*}.png"

# Check for Neofetch image and update config
if [ -f "$NEOFETCH_IMAGE" ]; then
    sed -i "s|^image_source=.*|image_source=\"$NEOFETCH_IMAGE\"|" "$NEOFETCH_CONFIG"
    echo "Updated Neofetch to use image: $NEOFETCH_IMAGE"
elif [ -f "${NEOFETCH_IMAGE%.jpg}.png" ]; then
    NEOFETCH_IMAGE="${NEOFETCH_IMAGE%.jpg}.png"
    sed -i "s|^image_source=.*|image_source=\"$NEOFETCH_IMAGE\"|" "$NEOFETCH_CONFIG"
    echo "Updated Neofetch to use image: $NEOFETCH_IMAGE"
elif [ -f "$DEFAULT_NEOFETCH_IMAGE" ]; then
    sed -i "s|^image_source=.*|image_source=\"$DEFAULT_NEOFETCH_IMAGE\"|" "$NEOFETCH_CONFIG"
    echo "No matching Neofetch image found. Using default image: $DEFAULT_NEOFETCH_IMAGE"
else
    echo "No matching Neofetch image or default image found. Neofetch not updated."
fi

# Debugging outputs
echo "Wallpaper: $RANDOM_WALLPAPER"
echo "Neofetch Image: $NEOFETCH_IMAGE"
