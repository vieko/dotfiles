-- CONFIGURE Colors
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = function()
      return {
        flavour = "mocha",
        integrations = {
          barbecue = {
            dim_dirname = true, -- directory name is dimmed by default
            bold_basename = true,
            dim_context = false,
            alt_background = false,
          }
        }
      }
    end,
  },
}
