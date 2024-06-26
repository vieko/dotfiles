local catppuccin = require("catppuccin")

if not catppuccin then
  return
end

-- vim.g.catppuccin_flavour = "mocha"

catppuccin.setup({
  -- flavour = "mocha",
  background = {
    dark = "mocha",
    light = "latte",
  },
  transparent_background = false,
  show_end_of_buffer = false,
  term_colors = true,
  dim_inactive = {
    enabled = true,
    shade = "dark",
    percentage = 0.15,
  },
  no_italic = false,
  no_bold = false,
  no_underline = false,
  styles = {
    comments = {},
    conditionals = {},
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
    barbecue = {
      dim_dirname = true,
      bold_basename = true,
      dim_context = false,
      alt_background = false,
    },
    cmp = true,
    dap = true,
    dap_ui = true,
    leap = false,
    mason = false,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
      inlay_hints = {
        background = true,
      },
    },
    navic = {
      enabled = false,
      custom_bg = "NONE",
    },
    neotree = false,
    telescope = { enabled = true },
    treesitter = true,
    ufo = true,
    which_key = false,
  },
})

vim.cmd([[colorscheme catppuccin]])
