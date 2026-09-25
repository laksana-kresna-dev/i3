#!/usr/bin/env bash
# Volume & Microphone Control with Dunst Notification (PipeWire / wpctl)

get_volume() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}'
}

is_muted() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q "MUTED"
}

get_mic_volume() {
    wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print int($2 * 100)}'
}

is_mic_muted() {
    wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q "MUTED"
}

case "$1" in
    up)
        wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+
        vol=$(get_volume)
        dunstify -a "Volume" -u low -h string:x-dunst-stack-tag:volume -h int:value:"$vol" "Volume: ${vol}%"
        ;;
    down)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        vol=$(get_volume)
        dunstify -a "Volume" -u low -h string:x-dunst-stack-tag:volume -h int:value:"$vol" "Volume: ${vol}%"
        ;;
    mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        if is_muted; then
            dunstify -a "Volume" -u low -h string:x-dunst-stack-tag:volume "Audio: Muted"
        else
            vol=$(get_volume)
            dunstify -a "Volume" -u low -h string:x-dunst-stack-tag:volume -h int:value:"$vol" "Audio: ${vol}%"
        fi
        ;;
    mic-up)
        wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SOURCE@ 5%+
        vol=$(get_mic_volume)
        dunstify -a "Microphone" -u low -h string:x-dunst-stack-tag:mic -h int:value:"$vol" "Mic Volume: ${vol}%"
        ;;
    mic-down)
        wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%-
        vol=$(get_mic_volume)
        dunstify -a "Microphone" -u low -h string:x-dunst-stack-tag:mic -h int:value:"$vol" "Mic Volume: ${vol}%"
        ;;
    mic-mute)
        wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
        if is_mic_muted; then
            dunstify -a "Microphone" -u low -h string:x-dunst-stack-tag:mic "Microphone: Muted"
        else
            vol=$(get_mic_volume)
            dunstify -a "Microphone" -u low -h string:x-dunst-stack-tag:mic "Microphone: Active (${vol}%)"
        fi
        ;;
esac
