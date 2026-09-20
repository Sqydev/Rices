local mainMod = "SUPER"

hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("bash $HOME/.config/Rices/rices/Iceberg/scripts/launcher.bash"))

hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("librewolf"))
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("hyprshot -m output --output-folder ~/Screenshots"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("vesktop"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("steam"))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("alacritty"))

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + ALT + M", hl.dsp.exit())

hl.bind(mainMod .. " + ALT + Q", hl.dsp.exec_cmd("kill -9 $(hyprctl activewindow -j | jq -r '.pid')"))
hl.bind(mainMod .. " + ALT + F", hl.dsp.exec_cmd("kill -19 $(hyprctl activewindow -j | jq -r '.pid')"))
hl.bind(mainMod .. " + ALT + D", hl.dsp.exec_cmd("kill -18 $(hyprctl activewindow -j | jq -r '.pid')"))

hl.bind(mainMod .. " + Left",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + Up",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + Down",  hl.dsp.focus({ direction = "d" }))

for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = tostring(i) }))

    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = tostring(i) }))
end

hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = "10" }))

hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "10" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
