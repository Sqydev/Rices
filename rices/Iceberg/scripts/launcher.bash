#!/usr/bin/env bash

hyprctl dispatch togglespecialworkspace control

sleep 0.1

if ! pgrep -x btop >/dev/null; then
	alacritty --class Btop -e btop &
fi

rofi -show drun &
