return {
  "lewis6991/impatient.nvim",
  { "catppuccin/nvim", name = "catppuccin" },
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = "tpope/vim-repeat",
    config = function()
      local map = vim.api.nvim_set_keymap
      -- 2-character Sneak (default)
      local opts = { noremap = false }
      map("n", "z", "<Plug>(leap-forward-x)", opts)
      map("n", "Z", "<Plug>(leap-backward-x)", opts)

      -- visual-mode
      map("x", "z", "<Plug>(leap-forward-x)", opts)
      map("x", "Z", "<Plug>(leap-backward-x)", opts)

      -- operator-pending-mode
      map("o", "z", "<Plug>(leap-forward-x)", opts)
      map("o", "Z", "<Plug>(leap-backward-x)", opts)
    end,
  },
  {
    "ggandor/flit.nvim",
    opts = { labeled_modes = "nv" },
    event = "VeryLazy",
  },
  { 'machakann/vim-sandwich', event = 'VeryLazy', enabled = false },
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
      require("mini.surround").setup { search_method = 'cover_or_nearest' }
    end,
    version = false,
    enabled = true,
  },
}
