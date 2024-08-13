-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.fn.executable("pwsh") == 1 then
  vim.o.shell = "pwsh"
elseif vim.fn.executable("powershell") == 1 then
  vim.o.shell = "powershell"
end
vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
vim.o.shellquote = ""
vim.o.shellxquote = ""

-- If neovide is the frontend it will trigger this options
if vim.g.neovide then
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_vfx_opacity = 0.8
  vim.g.neovide_cursor_vfx_particle_lifetime = 0.5
  vim.g.neovide_cursor_vfx_particle_speed = 10
  vim.g.neovide_cursor_vfx_particle_size = 20
  vim.g.neovide_cursor_vfx_trail_lifetime = 0.5
  vim.g.neovide_cursor_vfx_trail_speed = 10
  vim.g.neovide_cursor_vfx_trail_width = 2
  vim.g.neovide_input_use_logo = 1
  vim.g.neovide_input_use_logo_per_window = 1
  vim.g.neovide_transparency = 0.95
  vim.g.neovide_scale = 1.0
  vim.g.neovide_hide_mouse_when_typing = 1
  vim.g.neovide_hide_from_tasks = 1
  vim.g.neovide_cursor_animation_length = 0.1
  vim.g.neovide_cursor_trail_length = 0.4
  vim.g.neovide_cursor_antialiasing = 1
  vim.g.neovide_cursor_vfx_render = 1
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_fullscreen = true
  vim.g.neovide_padding_bottom = 0
end
