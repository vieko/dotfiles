-- SET cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    local cl = vim.wo.cursorline
    if cl then
      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
      vim.wo.cursorline = false
    end
  end,
})

-- SET Highlight yanked text
vim.cmd [[
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup="IncSearch", timeout=100 }
  augroup END
]]

-- SET Notify when Neogit Push is complete
local group = vim.api.nvim_create_augroup('MyCustomNeogitEvents', { clear = true })
vim.api.nvim_create_autocmd('User', {
  pattern = 'NeogitPushComplete',
  group = group,
  callback = require('neogit').close,
})

-- FORMAT ON SAVE for Lua
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- AUTO SAVE with Conform
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args)
--     require("conform").format({ bufnr = args.buf })
--   end,
-- })

-- SET Theme Tweaks
-- local C = require("catppuccin.palettes").get_palette("mocha")
-- vim.cmd [[
--   highlight CopilotSuggestion guifg=#45475A ctermfg=8
-- ]]
