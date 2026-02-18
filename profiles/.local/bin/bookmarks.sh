#!/bin/bash

use_rofi=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --rofi)
            use_rofi=true
            shift
            ;;
        *)
            echo "Usage: $0 [--rofi]"
            exit 1
            ;;
    esac
done

bookmarks_file=""
if [[ -f ~/.bookmarks.txt ]]; then
    bookmarks_file+=$(cat ~/.bookmarks.txt)
fi
if [[ -f ~/.config/bookmarks.txt ]]; then
    bookmarks_file+=$'\n'$(cat ~/.config/bookmarks.txt)
fi

if $use_rofi; then
    selected=$(echo "$bookmarks_file" | rofi -dmenu -i -p "Bookmarks" | awk -F ';' '{print $2}')
else
    selected=$(echo "$bookmarks_file" | fzf --height 40% | awk -F ';' '{print $2}')
fi

if [[ -n "$selected" ]]; then
    xdg-open "$selected"
fi
