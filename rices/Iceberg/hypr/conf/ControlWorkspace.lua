-- Reguły przestrzeni roboczych oraz okien (Window Rules v2)
hl.config({
    workspace = {
        "special:control, floating:true"
    },
    windowrulev2 = {
        "workspace special:control, class:^(Btop)$",
        "float, class:^(Btop)$",
        "size 45% 55%, class:^(Btop)$",
        "move 5% 5%, class:^(Btop)$",
        
        "workspace special:control, class:^(Rofi)$",
        "float, class:^(Rofi)$",
        "center, class:^(Rofi)$",
    }
})
