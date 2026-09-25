#!/usr/bin/env bash
# Brightness Control with Dunst Notification (brightnessctl)

get_brightness() {
    brightnessctl -m | cut -d',' -f4 | tr -d '%'
}

case "$1" in
    up)
        brightnessctl set +5%
        bright=$(get_brightness)
        dunstify -a "Brightness" -u low -h string:x-dunst-stack-tag:brightness -h int:value:"$bright" "Brightness: ${bright}%"
        ;;
    down)
        brightnessctl set 5%-
        bright=$(get_brightness)
        dunstify -a "Brightness" -u low -h string:x-dunst-stack-tag:brightness -h int:value:"$bright" "Brightness: ${bright}%"
        ;;
esac
