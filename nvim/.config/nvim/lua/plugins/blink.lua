return {
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "super-tab" },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = { documentation = { auto_show = false } },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = {
        -- Aunque esto esté en prefer_rust_with_warning,
        -- lo vamos a forzar luego en `config = function()`
        implementation = "prefer_rust_with_warning",
      },
    },

    opts_extend = { "sources.default" },

    --- 👇 Este bloque se ejecuta luego de aplicar las opciones anteriores
    config = function(_, opts)
      require("blink.cmp").setup(opts)

      -- 🔧 Forzar implementación en Lua para evitar el error con `string.buffer`
      local ok, fuzzy = pcall(require, "blink.cmp.fuzzy")
      if ok then
        fuzzy.set_implementation("lua")
        -- 🚫 Deshabilitar futuros cambios a 'rust' para evitar errores
        fuzzy.set_implementation = function()
          vim.notify(
            "[Blink] El cambio a implementación 'rust' ha sido bloqueado (string.buffer no disponible)",
            vim.log.levels.WARN
          )
        end
      end
    end,
  },
}
