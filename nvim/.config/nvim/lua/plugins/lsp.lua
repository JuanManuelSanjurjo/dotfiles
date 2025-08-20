return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      emmet_language_server = {
        filetypes = {
          "astro",
          "css",
          "eruby",
          "html",
          "javascript",
          "javascriptreact",
          "less",
          "php",
          "pug",
          "sass",
          "scss",
          "typescriptreact",
        },
        init_options = {
          excludeLanguages = {},
          extensionsPath = {},
          preferences = {},
          showAbbreviationSuggestions = true,
          showExpandedAbbreviation = "always",
          showSuggestionsAsSnippets = false,
          syntaxProfiles = {},
          variables = {},
        },
      },
    },
  },
}
