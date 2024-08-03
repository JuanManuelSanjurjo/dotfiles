return {
  "catppuccin/nvim",
  event = "VimEnter", -- Cargar después de iniciar Vim
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
