#!/bin/bash

# Set the source audio player here (needs to match your main script)
PLAYER="spotify"

# Get playback status, suppressing errors
status=$(playerctl --player=$PLAYER status 2>/dev/null)
EXIT_CODE=$?

# If playerctl failed (no player) or status is Stopped, output nothing and exit successfully.
if [ $EXIT_CODE -ne 0 ] || [ "$status" = "Stopped" ]; then
    echo ""
    exit 0
fi

# If we reach here, a song is playing or paused, so output the next icon.
# Make sure the icon is correctly rendered by your font.
echo "󰒭 "
