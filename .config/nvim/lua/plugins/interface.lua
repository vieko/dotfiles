return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      require('lualine').setup(
        {
          options = {
            theme = 'catppuccin',
            icons_enabled = false,
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
          },
        }
      )
    end
  },
  {
    "utilyre/barbecue.nvim",
    lazy = false,
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      -- "nvim-tree/nvim-web-devicons",
    },
    opts = {
      theme = "catppuccin",
      show_navic = true,
      show_modified = true,
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  }
}
