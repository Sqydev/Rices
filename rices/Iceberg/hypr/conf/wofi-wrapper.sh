#!/bin/bash

SPECIAL_WS="special:control"

while true; do
    choice=$(wofi --show drun --stdout --conf /dev/null)

    if [ -n "$choice" ]; then
        hyprctl dispatch togglespecialworkspace control
        
        hyprctl dispatch exec "$choice"
        
        sleep 0.2
    else
        hyprctl dispatch togglespecialworkspace control
        sleep 0.5
    fi
done
