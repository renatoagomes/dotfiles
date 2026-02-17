#!/bin/bash
# screenshot_to_vm.sh - Screenshot a region and SCP to a Tailscale host
# Usage:
#   screenshot_to_vm.sh select      - Pick tailscale host + user via dmenu
#   screenshot_to_vm.sh screenshot  - Screenshot + SCP (auto-prompts if not set)

TARGET_FILE="$HOME/.tailscale_ssh_target"

select_host() {
    local hosts
    hosts=$(tailscale status 2>/dev/null | awk '/^[0-9]/ {print $2}')

    if [ -z "$hosts" ]; then
        notify-send "Tailscale" "No peers found. Is tailscale running?"
        return 1
    fi

    local selected
    selected=$(echo "$hosts" | dmenu -i -p "Tailscale host:")
    [ -z "$selected" ] && return 1

    local user
    user=$(echo -e "$(whoami)\nroot" | dmenu -i -p "SSH user for $selected:")
    [ -z "$user" ] && return 1

    echo "$user@$selected" > "$TARGET_FILE"
    notify-send "Tailscale target set" "$user@$selected"
    echo "$user@$selected"
}

get_target() {
    if [ -f "$TARGET_FILE" ]; then
        cat "$TARGET_FILE"
    else
        select_host
    fi
}

do_screenshot() {
    local target
    target=$(get_target)
    [ -z "$target" ] && notify-send "No target selected" "Aborting" && exit 1

    local fname="/tmp/ss_$(date +%Y%m%d_%H%M%S).png"
    scrot -s "$fname" || exit 1

    if scp -o StrictHostKeyChecking=accept-new "$fname" "$target:/tmp/"; then
        echo "/tmp/$(basename "$fname")" | xclip -selection clipboard
        rm "$fname"
        notify-send "Screenshot sent to $target" "Path copied to clipboard"
    else
        notify-send "SCP failed" "Could not reach $target"
        rm -f "$fname"
        exit 1
    fi
}

case "${1:-screenshot}" in
    select)     select_host ;;
    screenshot) do_screenshot ;;
    *)          echo "Usage: $0 {select|screenshot}" ;;
esac
