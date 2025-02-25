#!/bin/bash

# Icons
SPOTIFY_ICON=""      # Spotify Icon (requires Nerd Font)
DEFAULT_MUSIC_ICON=""  # Default Music Icon (requires Nerd Font)

# Get Spotify Current Song
get_spotify_song() {
    # Check if Spotify is running
    if pgrep -x "spotify" > /dev/null; then
        local song=$(playerctl --player=spotify metadata --format "{{artist}} - {{title}}" 2>/dev/null)
        if [ -z "$song" ]; then
            echo "$SPOTIFY_ICON"  # Display only the Spotify icon when no song is playing
        else
            echo "$SPOTIFY_ICON $song"  # Display the song info with the Spotify icon
        fi
    else
        echo "$DEFAULT_MUSIC_ICON"  # Display the default music icon if Spotify is not running
    fi
}

# Output Spotify song or default music icon
get_spotify_song

