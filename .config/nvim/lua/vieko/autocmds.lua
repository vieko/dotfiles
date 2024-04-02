local C = LoadCatppuccinPalette()

local U = {
  pink = "#F859A8",
}

-- refresh buffers when files change on disk
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = function()
    vim.api.nvim_command("checktime")
  end,
  desc = "Refresh buffers when files change on disk",
})

-- Transparent highlights
local function transparent_cb()
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = C.peach, bold = true })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", fg = C.text })
  vim.api.nvim_set_hl(0, "ErrorFloat", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "WarningFloat", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "InfoFloat", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "HintFloat", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = C.peach, fg = C.crust })
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
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
  desc = "Highlight on Yank",
})

-- Increment and decrement numbers
local dial_group = vim.api.nvim_create_augroup("DialGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = dial_group,
  pattern = "typescript",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "<C-a>", require("dial.map").inc_normal("typescript"), { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "<C-x>", require("dial.map").dec_normal("typescript"), { noremap = true })
  end,
  desc = "Increment and Decrement Numbers",
})

local function enable_cursorline()
  vim.wo.cursorline = true
end

local function disable_cursorline()
  vim.wo.cursorline = false
end

-- Autocommand to enable cursorline in the current window
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "InsertLeave", "FocusGained" }, {
  pattern = "*",
  callback = enable_cursorline,
})

-- Autocommand to disable cursorline in the inactive window
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave", "InsertEnter", "FocusLost" }, {
  pattern = "*",
  callback = disable_cursorline,
})

-- set .env, .env.example, .env.local, .env.development.local, .env.test.local, .env.production.local to yaml filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.env", "*.env.local" },
  command = "setfiletype dotenv",
})
