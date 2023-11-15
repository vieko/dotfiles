local C = require("catppuccin.palettes").get_palette("mocha")

-- Transparent highlights
local function transparent_cb()
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = C.yellow, bold = true })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", fg = C.text })
  vim.api.nvim_set_hl(0, "ErrorFloat", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "WarningFloat", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "InfoFloat", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "HintFloat", { bg = "NONE" })
end

local transparent_group = vim.api.nvim_create_augroup("TransparentGroup", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  group = transparent_group,
  callback = transparent_cb,
  desc = "Transparent Highlights",
})

-- Briefly highlight code on yank
local yank_group = vim.api.nvim_create_augroup("YankGroup", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = yank_group,
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
  end,
  desc = "Highlight on Yank",
})
