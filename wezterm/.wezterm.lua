-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Theme
config.color_scheme = 'Catppuccin Macchiato'
-- config.color_scheme = 'Catppuccin Frappe'

-- Font
config.font = wezterm.font 'Hack Nerd Font'
config.font_size = 10

-- GUI interface
config.enable_tab_bar = false
-- config.window_decorations = "NONE"

return config
