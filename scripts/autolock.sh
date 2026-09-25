#!/usr/bin/env bash

set -euo pipefail

readonly SCRIPT_NAME="$(basename "$0")"
readonly LOCK_CMD="betterlockscreen -l dim"

# Path to initial wallpaper image inside wallpapers directory
readonly DEFAULT_WALLPAPER="${HOME}/.config/i3/wallpapers/wallpaper_1.jpg"

log() {
    local -r level="$1"
    shift
    echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')] [${SCRIPT_NAME}] [${level}] $*"
}

cleanup() {
    log "INFO" "Cleaning up xidlehook processes..."
    pkill -P $$ -x xidlehook 2>/dev/null || true
    pkill -x xidlehook 2>/dev/null || true
    exit 0
}

trap cleanup SIGINT SIGTERM EXIT

# --- 1. Initial Setup for Betterlockscreen ---
init_betterlockscreen() {
    # Check if betterlockscreen cache directory exists
    if [[ ! -d "${HOME}/.cache/betterlockscreen" ]]; then
        log "INFO" "Betterlockscreen cache not found. Initializing for the first time..."
        
        if [[ -f "$DEFAULT_WALLPAPER" ]]; then
            log "INFO" "Generating betterlockscreen cache using: $DEFAULT_WALLPAPER"
            betterlockscreen -u "$DEFAULT_WALLPAPER" --fx dim
        else
            log "WARN" "Default wallpaper not found at $DEFAULT_WALLPAPER. Skipping initial cache generation."
        fi
    fi
}

# --- 2. Stop Existing Instances ---
stop_existing_instance() {
    if pgrep -x "xidlehook" >/dev/null; then
        log "INFO" "Stopping existing xidlehook instance..."
        pkill -x xidlehook || true
        sleep 0.5
    fi
}

# --- 3. Start Daemon ---
start_xidlehook() {
    stop_existing_instance

    # Disable DPMS and screen blanking to prevent conflicts with xidlehook
    xset -dpms s off

    log "INFO" "Starting xidlehook daemon..."

    # Single Profile Idle Handling:
    # Timer 1 (5 minutes / 300s)  : Lock screen via betterlockscreen
    # Timer 2 (15 minutes / 900s) : Turn off display power (DPMS Off)
    # Timer 3 (30 minutes / 1800s): Suspend the system
    xidlehook \
        --detect-sleep \
        --not-when-audio \
        --not-when-fullscreen \
        --timer 300 "$LOCK_CMD" '' \
        --timer 900 'xset dpms force off' '' \
        --timer 1800 'systemctl suspend' '' &

    local -r idlehook_pid=$!
    log "INFO" "xidlehook running with PID: ${idlehook_pid}."
    
    wait "$idlehook_pid"
}

main() {
    log "INFO" "Initializing autolock daemon..."
    init_betterlockscreen
    start_xidlehook
}

main "$@"
