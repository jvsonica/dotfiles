#!/bin/bash
# Get current workspace and outputs
current_ws=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')
outputs=($(i3-msg -t get_outputs | jq -r '.[] | select(.active==true).name'))
current_output=$(i3-msg -t get_workspaces | jq -r ".[] | select(.name==\"$current_ws\").output")

# Find next output
for i in "${!outputs[@]}"; do
    if [[ "${outputs[$i]}" == "$current_output" ]]; then
        next_index=$(((i + 1) % ${#outputs[@]}))
        next_output=${outputs[$next_index]}
        break
    fi
done

# Move workspace
i3-msg "move workspace to output $next_output"
