local C = require("catppuccin.palettes").get_palette("mocha")

vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰻂", texthl = "DiagnosticSignHint" })

require("neo-tree").setup({
  close_if_last_window = true,
  default_component_configs = {
    modified = {
      symbol = "●",
      highlight = "NeoTreeModified",
    },
  },
  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = true,
      hide_gitignored = true,
      hide_hidden = true,
      hide_by_name = {
        "node_modules",
      },
      always_show = {
        ".gitignore",
      },
    },
  },
})

vim.api.nvim_set_hl(0, "NeoTreeFadeText1", { fg = C.surface1 })
vim.api.nvim_set_hl(0, "NeoTreeFadeText2", { fg = C.surface1 })
vim.api.nvim_set_hl(0, "NeoTreeDotfile", { fg = C.surface1 })
vim.api.nvim_set_hl(0, "NeoTreeDimText", { fg = C.surface1 })
vim.api.nvim_set_hl(0, "NeoTreeHiddenByName", { fg = C.surface1 })
vim.api.nvim_set_hl(0, "NeoTreeWindowsHidden", { fg = C.surface1 })

vim.keymap.set("n", "<Leader>tt", "<Cmd>Neotree reveal toggle<CR>", { desc = "Toggle File Tree" })
vim.keymap.set("n", "<Leader>tc", "<Cmd>Neotree action=close source=filesystem<CR>", { desc = "Close File Tree" })
vim.keymap.set("n", "<Leader>tf", "<Cmd>Neotree reveal action=focus<CR>", { desc = "Focus File Tree" })
