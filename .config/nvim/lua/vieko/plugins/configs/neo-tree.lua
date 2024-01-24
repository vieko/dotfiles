local C = require("catppuccin.palettes").get_palette("mocha")

require("neo-tree").setup({
  sources = {
    "filesystem",
    "buffers",
    "git_status",
    "document_symbols",
  },
  close_if_last_window = false,
  default_component_configs = {
    diagnostics = {
      symbols = {
        hint = "H",
        info = "I",
        warn = "!",
        error = "X",
      },
      highlights = {
        hint = "DiagnosticSignHint",
        info = "DiagnosticSignInfo",
        warn = "DiagnosticSignWarn",
        error = "DiagnosticSignError",
      },
    },
    modified = {
      symbol = "[+]",
      highlight = "NeoTreeModified",
    },
    name = {
      trailing_slash = false,
      highlight_opened_files = false,
      use_git_status_colors = false,
      highlight = "NeoTreeFileName",
    },
    git_status = {
      symbols = {
        added = "A",
        modified = "M",
        deleted = "D",
        renamed = "R",
        untracked = "?",
        ignored = "!",
        unstaged = "U",
        staged = "S",
        conflict = "C",
      },
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

vim.api.nvim_set_hl(0, "NeoTreeModified", { fg = C.text })
vim.api.nvim_set_hl(0, "NeoTreeFadeText1", { fg = C.surface1 })
vim.api.nvim_set_hl(0, "NeoTreeFadeText2", { fg = C.surface1 })
vim.api.nvim_set_hl(0, "NeoTreeDotfile", { fg = C.surface1 })
vim.api.nvim_set_hl(0, "NeoTreeDimText", { fg = C.surface1 })
vim.api.nvim_set_hl(0, "NeoTreeHiddenByName", { fg = C.surface1 })
vim.api.nvim_set_hl(0, "NeoTreeWindowsHidden", { fg = C.surface1 })

vim.keymap.set("n", "<Leader>tt", "<Cmd>Neotree reveal toggle<CR>", { desc = "Toggle File Tree" })
vim.keymap.set("n", "<Leader>tc", "<Cmd>Neotree action=close source=filesystem<CR>", { desc = "Close File Tree" })
vim.keymap.set("n", "<Leader>tf", "<Cmd>Neotree reveal action=focus<CR>", { desc = "Focus File Tree" })
vim.keymap.set("n", "<Leader>ts", "<Cmd>Neotree document_symbols<CR>", { desc = "Show Document Symbols" })
