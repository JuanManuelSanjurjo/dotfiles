-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "catppuccin-mocha"
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.default_prog = { "powershell.exe" }
config.window_background_opacity = 0.95
config.font_size = 14

-- desabilita la barra de pestañas
-- config.enable_tab_bar = false
-- config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

-- You can also change the window decorations:
config.window_decorations = "RESIZE"
config.window_padding = {
	-- top = 0,
	right = 0,
	bottom = 0,
	left = 0,
}

config.keys = {
	{
		key = "F11",
		-- mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

-- 	tab_bar = {
-- 		background = "#1e1e2e",
-- 	},
-- }
-- and finally, return the configuration to wezterm
return config
