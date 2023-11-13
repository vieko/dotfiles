return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = true
  },
  {
    "max397574/better-escape.nvim",
    lazy = false,
    config = function()
      require("better_escape").setup({
        mapping = { "jk" },
      })
    end,
  },
  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.constant.new({ elements = { "let", "const" } }),
        },
      })
    end,
  },
  {
    'echasnovski/mini.nvim',
    event = "VeryLazy",
    config = function()
      require('mini.surround').setup { search_method = 'cover_or_nearest' }
      require('mini.comment').setup { options = { ignore_blank_line = true } }
      require('mini.move').setup {}
      require('mini.splitjoin').setup { mappings = { toggle = 'gJ' } }
      require('mini.pairs').setup {}
    end,
  },
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = "tpope/vim-repeat",
    config = function()
      local map = vim.api.nvim_set_keymap
      -- 2-character Sneak (default)
      local opts = { noremap = false }
      map("n", "s", "<Plug>(leap-forward-x)", opts)
      map("n", "S", "<Plug>(leap-backward-x)", opts)
      -- visual-mode
      map("x", "s", "<Plug>(leap-forward-x)", opts)
      map("x", "S", "<Plug>(leap-backward-x)", opts)
      -- operator-pending-mode
      map("o", "s", "<Plug>(leap-forward-x)", opts)
      map("o", "S", "<Plug>(leap-backward-x)", opts)
    end,
  },
  {
    "ggandor/flit.nvim",
    opts = { labeled_modes = "nv" },
    event = "VeryLazy",
  },
  {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    opts = {
      icons = false,
      auto_close = true,
    },
    keys = {
      { "<leader>xx", function() return require("trouble").toggle() end, desc = "Toggle Trouble" },
    },
  },
}
