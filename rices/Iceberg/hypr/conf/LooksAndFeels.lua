-- Wygląd, estetyka oraz XWayland
hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 5,
        border_size = 1,
        col = {
            active_border = "rgb(775599)",
            inactive_border = "rgba(00000000)",
        }
    },
    decoration = {
        rounding = 3,
        rounding_power = 2,
    },
    xwayland = {
        force_zero_scaling = true,
    }
})
