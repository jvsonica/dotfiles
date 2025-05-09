#!/bin/bash

START_DATE="today 0:00"
END_DATE_ARG=$(date -d "+5 days" +%Y-%m-%d)

/usr/bin/gcalcli agenda --nostarted --tsv "$START_DATE" "$END_DATE_ARG" |
    /usr/bin/awk -F '\t' '{print $1, $2, $5}' |
    paste -s -d '\n' |
    xargs -0 notify-send "Upcoming Appointments"

exit 0
