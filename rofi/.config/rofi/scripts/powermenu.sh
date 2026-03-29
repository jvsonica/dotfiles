#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu
#
## Available Styles
#
## style-1   style-2   style-3   style-4   style-5

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
theme_path="${script_dir}/powermenu.rasi"
confirm_theme_path="${script_dir}/powermenu-confirm.rasi"

confirm=true
for arg in "$@"; do
    case "$arg" in
        --confirm)
            confirm=true
            ;;
        --no-confirm)
            confirm=false
            ;;
    esac
done

# CMDs
uptime="$(uptime -p | sed -e 's/up //g')"
host="$(hostname)"

# Options
shutdown=''
reboot=''
lock=''
hibernate=''
logout=''
yes=''
no=''

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "Goodbye ${USER}" \
		-mesg "Uptime: $uptime" \
		-theme "$theme_path"
}

# Confirmation CMD
confirm_cmd() {
	rofi -dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme "$confirm_theme_path"
}

# Ask for confirmation
confirm_exit() {
	if [[ "$confirm" == true ]]; then
		echo -e "$yes\n$no" | confirm_cmd
	else
		printf '%s\n' "$yes"
	fi
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$hibernate\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
		elif [[ $1 == '--hibernate' ]]; then
			systemctl hibernate
		elif [[ $1 == '--logout' ]]; then
			i3-msg exit
		fi
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
	$lock)
		if which betterlockscreen >/dev/null 2>&1; then
			betterlockscreen -l
		elif which i3lock >/dev/null 2>&1; then
			i3lock
		fi
        ;;
	$hibernate)
		run_cmd --hibernate
        ;;
	$logout)
		run_cmd --logout
        ;;
esac
