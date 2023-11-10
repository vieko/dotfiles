-- SET Defaults
vim.opt.breakindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
--vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.copyindent = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fileencoding = "utf-8"
vim.opt.fillchars = { eob = " " }
vim.opt.foldenable = false
vim.opt.guicursor = ""
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.pumheight = 10
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.updatetime = 300
vim.opt.virtualedit = "block"

-- SET User Settings
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.spell = false
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = {
  --eol = "↲",
  tab = "» ",
  space = "·",
  extends = "›",
  precedes = "‹",
  nbsp = "␣",
}
vim.opt.colorcolumn = "80"

vim.cmd [[
  highlight CopilotSuggestion guifg=#45475A ctermfg=8
]]
