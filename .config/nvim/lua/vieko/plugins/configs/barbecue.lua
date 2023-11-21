require("nvim-navic").setup({
  highlight = true,
})

require("barbecue").setup({
  theme = "catppuccin",
  show_navic = true,
  show_dirname = false,
  show_modified = false,
  context_follow_icon_color = true,
  exclude_filetypes = { "toggleterm" },
})
