-- CONFIGURE Colors
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = function()
      return {
        flavour = "mocha",
        highlight_overrides = {
          mocha = function(mocha)
            return {
              CopilotSuggestion = { fg = mocha.surface1 },
            }
          end
        },
        integrations = {
          barbecue = {
            dim_dirname = true, -- directory name is dimmed by default
            bold_basename = true,
            dim_context = false,
            alt_background = false,
          },
          leap = false,
          mini = {
            enabled = true,
            indentscope_color = ""
          },
          noice = false,
          neogit = true,
          cmp = true,
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
            custom_bg = "NONE", -- "lualine" will set background to mantle
          },
          notify = false,
          treesitter = true,
          telescope = {
            enabled = true,
          },
          lsp_trouble = false,
          which_key = false,
        }
      }
    end,
  },
}
