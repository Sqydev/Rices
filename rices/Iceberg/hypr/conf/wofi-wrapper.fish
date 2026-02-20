#!/usr/bin/fish

set choice (wofi --show drun --stdout)

if test -n "$choice"
    hyprctl dispatch togglespecialworkspace control
    
    hyprctl dispatch exec "$choice"
else
    hyprctl dispatch togglespecialworkspace control
end

hyprctl dispatch exec "[workspace special:control silent] ~/.config/hypr/conf/wofi-wrapper.fish"
