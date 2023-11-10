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
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
          },
        }
      )
    end
  },
}
