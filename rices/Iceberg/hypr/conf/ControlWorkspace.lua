hl.config({
    workspace = {
        {
            id = "special:control",
            floating = true,
        },
    },
})

-- Btop
hl.window_rule({
    match = { class = "^(Btop)$" },
    workspace = "special:control",
})

hl.window_rule({
    match = { class = "^(Btop)$" },
    float = true,
})

hl.window_rule({
    match = { class = "^(Btop)$" },
    size = { "(monitor_w * 0.35)" , "(monitor_h * 0.45)" },
})

hl.window_rule({
    match = { class = "^(Btop)$" },
    move = {"window_w * 0.04", "monitor_h * 0.03"},
})

-- Rofi
hl.window_rule({
    match = { class = "^(Rofi)$" },
    workspace = "special:control",
})

hl.window_rule({
    match = { class = "^(Rofi)$" },
    float = true,
})

hl.window_rule({
    match = { class = "^(Rofi)$" },
    center = true,
})
