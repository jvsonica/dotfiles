#!/bin/bash

# The name of polybar bar which houses the main spotify module and the control modules.
PARENT_BAR="now-playing"
PARENT_BAR_PID=$(pgrep -a "polybar" | grep "$PARENT_BAR" | cut -d" " -f1)

# Set the source audio player here.
# Players supporting the MPRIS spec are supported.
# Examples: spotify, vlc, chrome, mpv and others.
# Use `playerctld` to always detect the latest player.
# See more here: https://github.com/altdesktop/playerctl/#selecting-players-to-control
PLAYER="spotify"

# Format of the information displayed
# Eg. {{ artist }} - {{ album }} - {{ title }}
# See more attributes here: https://github.com/altdesktop/playerctl/#printing-properties-and-metadata
FORMAT="{{ title }} - {{ artist }}"

# Sends $2 as message to all polybar PIDs that are part of $1
update_hooks() {
    while IFS= read -r id; do
        polybar-msg -p "$id" hook spotify-play-pause "$2" 1>/dev/null 2>&1
    done < <(echo "$1")
}

# Format output to max 60 characters
print_metadata() {
    local output
    output=$(playerctl --player=$PLAYER metadata --format "$FORMAT")
    if [ ${#output} -gt 60 ]; then
        echo "${output:0:57}..."
    else
        echo "$output"
    fi
}

# Get playback status, suppressing errors
PLAYERCTL_STATUS=$(playerctl --player=$PLAYER status 2>/dev/null)
EXIT_CODE=$?

# If playerctl failed (e.g., player not running) or status is Stopped, output nothing.
if [ $EXIT_CODE -ne 0 ] || [ "$PLAYERCTL_STATUS" = "Stopped" ]; then
    echo ""
    exit 0
fi

if [ "$1" == "--status" ]; then
    echo "$STATUS"
else
    if [ "$STATUS" = "Stopped" ]; then
        echo "No music is playing"
    elif [ "$STATUS" = "Paused" ]; then
        update_hooks "$PARENT_BAR_PID" 2
        print_metadata
    elif [ "$STATUS" = "No player is running" ]; then
        echo "$STATUS"
    else
        update_hooks "$PARENT_BAR_PID" 1
        print_metadata
    fi
fi
