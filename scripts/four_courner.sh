#!/bin/bash

# Open terminal in the top-left corner
i3-msg "split h; exec kitty --title terminal1" &
# Open terminal in the top-right corner
i3-msg "split v; exec kitty --title terminal2" &
# Open terminal in the bottom-left corner
i3-msg "split h; exec kitty --title terminal3" &
# Open terminal in the bottom-right corner
i3-msg "split v; exec kitty --title terminal4" &

