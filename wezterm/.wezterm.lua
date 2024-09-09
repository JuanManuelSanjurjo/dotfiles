-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- desabilita la barra de pestañas
-- config.enable_tab_bar = false
-- config.hide_tab_bar_if_only_one_tab = true
-- config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = true

config.initial_cols = 140
config.initial_rows = 30
config.color_scheme = "catppuccin-mocha"
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" })
-- config.default_prog = { "powershell.exe" }
-- config.default_prog = { "C:/Program Files/PowerShell/7/pwsh.exe" }
config.default_prog = {'wsl','~','--cd', '/mnt/c/Users/juanm/Desktop'}
config.window_background_opacity = 0.95
config.font_size = 12
config.window_frame = {
	-- inactive_titlebar_bg = "#353535",
	active_titlebar_bg = "#1f1730",
	inactive_titlebar_fg = "#cccccc",
	-- active_titlebar_fg = "#ffffff",
	-- inactive_titlebar_border_bottom = "#2b2042",
	-- active_titlebar_border_bottom = "#2b2042",
	-- button_fg = "purple",
	-- button_bg = "#2b2042",
	-- button_hover_fg = "#ffffff",
	-- button_hover_bg = "#3b3052",
	-- border_left_width = "0.5cell",
	-- border_right_width = "0.5cell",
	-- border_bottom_height = "0.25cell",
	-- border_top_height = "0.25cell",
	-- border_left_color = "purple",
	-- border_right_color = "purple",
	-- border_bottom_color = "purple",
	-- border_top_color = "purple",
}

-- You can also change the window decorations:
config.window_decorations = "RESIZE"
config.window_padding = {
	top = 0,
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

-- return the configuration to wezterm
return config
