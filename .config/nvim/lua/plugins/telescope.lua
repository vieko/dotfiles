return {
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.4',
    dependencies = {
      {'nvim-lua/plenary.nvim'},
      {
        "debugloop/telescope-undo.nvim",
        keys = { { "<leader>U", "<cmd>Telescope undo<cr>" } },
        config = function()
          require("telescope").load_extension("undo")
        end,
      },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        config = function()
          require('telescope').load_extension('fzf')
        end,
      },
      -- {'nvim-tree/nvim-web-devicons', }
    },
    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({})
        end,
        desc = "Find Files",
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep({})
        end,
        desc = "Live Grep",
      },
      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers({})
        end,
        desc = "Find Buffers",
      },
      {
        "<leader>fh",
        function()
          require("telescope.builtin").help_tags({})
        end,
        desc = "Find Neovim Help",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.5,
          },
          width = 0.8,
          height = 0.8,
          preview_cutoff = 120,
        },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  }
}
