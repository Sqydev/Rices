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

while true; do
	rofi -show drun
	exit_code=$?

	if [[ $exit_code -eq 0 ]]; then
    	break
    fi
	
	if [[ $exit_code -eq 10 ]]; then
        continue
    fi

	hyprctl dispatch togglespecialworkspace control
	break
done

hyprctl dispatch togglespecialworkspace control
