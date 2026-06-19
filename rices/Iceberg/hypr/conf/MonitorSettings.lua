hl.monitor({ output = "DP-1", mode = "highrr", position = "auto-right", scale = 1 })
hl.monitor({ output = "DP-2", mode = "highrr", position = "auto-left", scale = 1 })
hl.monitor({ output = "", mode = "highrr", position = "auto", scale = 1 }) -- Fallback dla pozostałych monitorów

hl.config({
    input = {
        tablet = {
            transform = 0,
            output = "DP-1",
        }
    }
})
