#!/bin/bash

# Path to your notification sound file
SOUND_FILE="/your/dir/path/audio-volume-change.oga"

# Function to play sound
play_sound() {
    paplay "$SOUND_FILE"
}

# Get initial volume level
previous_volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}')

# Monitor volume changes
pactl subscribe | while read -r line; do
    if echo "$line" | grep -q "sink"; then
        current_volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}')
        if [[ "$current_volume" != "$previous_volume" ]]; then
            play_sound
            previous_volume="$current_volume"
        fi
    fi
#sleep 2
done

