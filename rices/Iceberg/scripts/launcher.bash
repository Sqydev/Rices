#!/usr/bin/env bash

# Check what workspace
current_ws=$(hyprctl activeworkspace -j | jq -r '.name')

# If in special than only toggle
if [[ "$current_ws" == "special:control" ]]; then
    hyprctl dispatch togglespecialworkspace control
    exit 0
fi

hyprctl dispatch togglespecialworkspace control

if ! pgrep -x btop >/dev/null; then
    alacritty --class Btop -e btop &
fi

# No & becouse if rofi cloases then like it switches workspaces
rofi -show drun

hyprctl dispatch togglespecialworkspace control
