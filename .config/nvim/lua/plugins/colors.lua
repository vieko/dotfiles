-- CONFIGURE Colors 
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = function ()
      return { flavour = "mocha" }
    end,
  },
}
