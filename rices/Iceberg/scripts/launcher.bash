#!/usr/bin/env bash

current_ws=$(hyprctl activeworkspace -j | jq -r '.name')
is_rofi_running=$(pgrep -x rofi)

# 1. If special and rofi -> kill and escape
if [[ "$current_ws" == "special:control" ]]; then
    if [[ -n "$is_rofi_running" ]]; then
        pkill rofi
    fi
    hyprctl dispatch togglespecialworkspace control
    exit 0
fi

# TODO: Make it so this is unnesesery
# 2. If rofi works -> kill it
if [[ -n "$is_rofi_running" ]]; then
    pkill rofi
    exit 0
fi

# 3. Btop is dead -> do it
if ! pgrep -x btop >/dev/null; then
    alacritty --class Btop -e btop &
fi

hyprctl dispatch togglespecialworkspace control

rofi -show drun

# TODO: Here if shift is held than just restart rofi

hyprctl dispatch togglespecialworkspace control
