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
  }
}
