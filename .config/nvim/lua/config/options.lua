-- SET Defaults
vim.opt.backup = false
vim.opt.breakindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.copyindent = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fileencoding = "utf-8"
vim.opt.fillchars = { eob = " " }
vim.opt.foldenable = false
vim.opt.guicursor = ""
vim.opt.history = 100
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.infercase = true
vim.opt.laststatus = 3
vim.opt.linebreak = true
vim.opt.mouse = "a"
vim.opt.preserveindent = true
vim.opt.pumheight = 10
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 2
vim.opt.showtabline = 2
vim.opt.sidescrolloff = 8
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 500
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.virtualedit = "block"
vim.opt.writebackup = false

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
vim.opt.shell = "fish"

vim.cmd [[
  highlight CopilotSuggestion guifg=#45475A ctermfg=8
]]
