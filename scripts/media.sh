#!/usr/bin/env bash
# Media Control with Instant Dunst Notification (playerctl / mpc fallback)

pkill -x dunstify 2>/dev/null

get_media_info() {
    local status artist title current
    
    if playerctl status >/dev/null 2>&1; then
        status=$(playerctl status 2>/dev/null)
        artist=$(playerctl metadata artist 2>/dev/null)
        title=$(playerctl metadata title 2>/dev/null)
        
        if [[ -n "$artist" && -n "$title" ]]; then
            echo "$status: $artist - $title"
        elif [[ -n "$title" ]]; then
            echo "$status: $title"
        else
            echo "$status"
        fi
    elif mpc >/dev/null 2>&1; then
        current=$(mpc current 2>/dev/null)
        if [[ -n "$current" ]]; then
            echo "$current"
        else
            echo "MPD Stopped"
        fi
    else
        echo "No media playing"
    fi
}

send_notification() {
    local action="$1"
    local old_title="$2"
    
    dunstify -a "Media" -u normal -t 2000 -h string:x-dunst-stack-tag:media "Media Control" "$action..."
    (
        if playerctl status >/dev/null 2>&1 && [[ -n "$old_title" ]]; then
            for i in {1..10}; do
                new_title=$(playerctl metadata title 2>/dev/null)
                if [[ -n "$new_title" && "$new_title" != "$old_title" ]]; then
                    break
                fi
                sleep 0.05
            done
        fi
        
        info=$(get_media_info)
        dunstify -a "Media" -u normal -t 2000 -h string:x-dunst-stack-tag:media "Media Control" "$info"
    ) &
}

old_title=$(playerctl metadata title 2>/dev/null)

case "$1" in
    play-pause)
        playerctl play-pause 2>/dev/null || mpc toggle >/dev/null 2>&1
        send_notification "Play/Pause" "$old_title"
        ;;
    next)
        playerctl next 2>/dev/null || mpc next >/dev/null 2>&1
        send_notification "Next" "$old_title"
        ;;
    prev)
        playerctl previous 2>/dev/null || mpc prev >/dev/null 2>&1
        send_notification "Previous" "$old_title"
        ;;
    *)
        echo "Usage: $0 {play-pause|next|prev}"
        exit 1
        ;;
esac
