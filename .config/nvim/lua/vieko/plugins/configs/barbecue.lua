require("nvim-navic").setup({
  highlight = true,
})

require("barbecue").setup({
  theme = "catppuccin",
  show_navic = true,
  show_dirname = true,
  show_modified = true,
  context_follow_icon_color = true,
  symbols = {
    modified = "[+]",
    -- separator = ">",
    -- ellipsis = "...",
  },
  modifiers = {
    dirname = ":~:.",
  },
  exclude_filetypes = { "toggleterm", "terminal", "neo-tree", "qf", "" },
})
