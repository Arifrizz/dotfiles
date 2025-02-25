#!/bin/bash

# Source pywal colors
source ~/.cache/wal/colors.sh

# Launch dmenu with pywal colors
dmenu_run -nb "$background" -nf "$foreground" -sb "$color1" -sf "$color15"

