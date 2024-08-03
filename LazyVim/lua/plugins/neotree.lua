return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VimEnter", -- Cargar después de iniciar Vim
    opts = function(_, opts)
      -- Sobrescribir la configuración de la ventana para que Neo-tree aparezca a la derecha
      opts.window = {
        position = "right",
      }

      -- Añadir o sobrescribir los mapeos de teclas
      opts.default_component_configs = {
        name = {
          use_git_status_colors = true,
        },
        git_status = {
          symbols = {
            added = "✚",
            modified = "",
            deleted = "",
            renamed = "➜",
            untracked = "★",
            ignored = "◌",
            unstaged = "✗",
            staged = "✓",
            conflict = "",
          },
        },
      }
      -- This handler closes Neo-tree automatically when a file is opened
      -- opts.event_handlers = {
      --   {
      --     event = "file_opened",
      --     handler = function(file_path)
      --       -- Cierra Neo-tree automáticamente cuando se abre un archivo
      --       require("neo-tree").close_all()
      --     end,
      --   },
      -- }

      opts.commands = {
        open = function(state)
          local node = state.tree:get_node()
          if require("neo-tree.utils").is_expandable(node) then
            state.commands.toggle_directory(state)
          else
            state.commands.open(state)
            vim.cmd("wincmd l") -- Mueve el cursor a la ventana recién abierta
          end
        end,
      }

      opts.window.mappings = {
        ["l"] = "open",
        ["<Tab>"] = "open",
        ["h"] = "close_node",
      }
    end,
  },
}
