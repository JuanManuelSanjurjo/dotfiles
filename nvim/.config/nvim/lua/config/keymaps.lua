-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hera

-- Guardar con Ctrl+S en modo normal
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", { silent = true })
-- Guardar con Ctrl+S en modo insert (sale del insert, guarda, y vuelve)
vim.keymap.set("i", "<C-s>", "<Esc><cmd>w<cr>a", { silent = true })
