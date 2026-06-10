#!/bin/bash
status=$(playerctl status 2>/dev/null)
if [[ $status == "Playing" ]]; then
    icon=" "
elif [[ $status == "Paused" ]]; then
    icon=" "
else
    exit 0
fi
metadata=$(playerctl metadata --format "{{artist}} - {{title}}")
echo "{\"text\": \"$icon $metadata\", \"class\": \"$status\"}"
