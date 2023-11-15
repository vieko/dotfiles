local catppuccin = require("catppuccin")

if not catppuccin then
  return
end

vim.g.catppuccin_flavour = "mocha"

catppuccin.setup({
  flavour = "mocha",
  transparent_background = false,
  show_end_of_buffer = false,
  term_colors = true,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  no_italic = false,
  no_bold = false,
  no_underline = false,
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {},
  custom_highlights = {},
  highlight_overrides = {
    mocha = function(C)
      return {
        TabLineSel = { bg = C.pink },
        CmpBorder = { fg = C.surface2 },
        Pmenu = { bg = C.none },
        TelescopeBorder = { link = "FloatBorder" },
        CopilotSuggestion = { fg = C.surface1 },
      }
    end,
  },
  integrations = {
    cmp = true,
    ufo = true,
    telescope = { enabled = true },
    treesitter = true,
    barbecue = {
      dim_dirname = true,
      bold_basename = true,
      dim_context = false,
      alt_background = false,
    },
    navic = {
      enabled = false,
      custom_bg = "NONE",
    },
    neotree = false,
    which_key = false,
  },
})

vim.cmd([[colorscheme catppuccin]])
