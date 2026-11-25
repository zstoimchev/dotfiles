local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font_size = 14.0

config.color_scheme = "Catppuccin Mocha"
config.window_padding = { left = 12, right = 12, top = 8, bottom = 8 }

return config
