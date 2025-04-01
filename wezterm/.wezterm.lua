-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Theme
-- config.color_scheme = "Catppuccin Frappe"
config.color_scheme = "tokyonight"

-- Font
-- config.font = wezterm.font("Hack Nerd Font")
config.font_size = 11.5

-- Use Comic Sans on April Fool's
local april_fools_font = "Comic Shanns Mono Nerd Font"
local font_exists, _ = pcall(wezterm.font, april_fools_font)
if os.date("%m-%d") == "04-01" and font_exists then
    config.font = wezterm.font(april_fools_font)
    config.font_size = 12
end

-- GUI interface
config.enable_tab_bar = false
config.window_decorations = "NONE"
config.window_padding = {
    left = 0,
    right = 0,
    top = 5,
    bottom = 0,
}

-- Always show "wezterm" as window title
wezterm.on("format-window-title", function()
    return "wezterm"
end)

return config
