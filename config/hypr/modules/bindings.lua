local super = "SUPER"
local terminal = "wezterm"

-- Applications.
hl.bind(super .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(super .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(super .. " + D", hl.dsp.exec_cmd("fuzzel"))
hl.bind(super .. " + E", hl.dsp.exec_cmd("dolphin"))
hl.bind(super .. " + R", hl.dsp.exec_cmd("hyprlauncher"))

-- Windows and session.
hl.bind(super .. " + C", hl.dsp.window.close())
hl.bind(super .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(super .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(super .. " + M", hl.dsp.exec_cmd(
    "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"
))

-- Focus the adjacent window.
for _, direction in ipairs({ "left", "right", "up", "down" }) do
    hl.bind(super .. " + " .. direction, hl.dsp.focus({ direction = direction }))
end

-- Super + number switches workspace. Add Shift to move the focused window.
-- The 0 key selects workspace 10.
for workspace = 1, 10 do
    local key = tostring(workspace % 10)
    hl.bind(super .. " + " .. key, hl.dsp.focus({ workspace = workspace }))
    hl.bind(super .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = workspace }))
end

-- Hold Super and drag with the left or right mouse button.
hl.bind(super .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(super .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop volume, microphone, and brightness keys.
local repeatable = { locked = true, repeating = true }
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), repeatable)
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), repeatable)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), repeatable)
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), repeatable)

-- Media playback.
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
