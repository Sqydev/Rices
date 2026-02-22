#!/usr/bin/env bash

hyprctl dispatch togglespecialworkspace

if ! pgrep -x btop >/dev/null; then
    foot -e btop &
fi

rofi -show drun
