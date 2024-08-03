return {
  {
    "supermaven-inc/supermaven-nvim",
    event = "VimEnter", -- Cargar después de iniciar Vim
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-l>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-j>",
        },
      })
    end,
  },
}
