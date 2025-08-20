-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.path:prepend(vim.env.HOME .. "/.nvm/versions/node/v20.17.0/bin")
vim.env.PATH = vim.env.HOME .. "/.nvm/versions/node/v20.17.0/bin:" .. vim.env.PATH

return {
  -- Configura la shell para que sea bash --login (o zsh --login)
  shell = "/usr/bin/bash --login", -- Usando bash
  -- shell = "/bin/zsh --login"  -- Usando zsh
  shellcmdflag = "-c", -- Fuerza el modo comando
  shellquote = "", -- Evita comillas no deseadas
  shellxquote = "", -- Igual que arriba
}
