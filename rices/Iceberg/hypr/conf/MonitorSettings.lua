-- Konfiguracja monitorów (przekazujemy tabele z jawnymi polami)
hl.monitor({ output = "DP-1", mode = "highrr", position = "auto-right", scale = 1 })
hl.monitor({ output = "DP-2", mode = "highrr", position = "auto-left", scale = 1 })
hl.monitor({ output = "", mode = "highrr", position = "auto", scale = 1 }) -- Fallback dla pozostałych monitorów

-- Konfiguracja tabletu graficznego
-- Sposób 1: Globalnie dla wszystkich tabletów (zagnieżdżona tabela input -> tablet)
hl.config({
    input = {
        tablet = {
            transform = 0,
            output = "DP-1",
        }
    }
})

-- Sposób 2 (Zalecany): Dla konkretnego urządzenia za pomocą hl.device()
-- Dokładną nazwę urządzenia znajdziesz wpisując w terminalu polecenie: hyprctl devices
-- hl.device({
--     name = "nazwa-twojego-tabletu-z-hyprctl",
--     output = "DP-1",
-- })
