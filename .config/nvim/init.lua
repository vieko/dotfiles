vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]


local lazypath = vim.fn.stdpath("data") .. "/nvim-vscode/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.runtimepath:prepend(lazypath)

vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
require("lazy").setup("plugins", {
  defaults = { lazy = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

vim.api.nvim_set_keymap("x", "gc", "<Plug>VSCodeCommentary", {})
vim.api.nvim_set_keymap("n", "gc", "<Plug>VSCodeCommentary", {})
vim.api.nvim_set_keymap("o", "gc", "<Plug>VSCodeCommentary", {})
vim.api.nvim_set_keymap("n", "gcc", "<Plug>VSCodeCommentaryLine", {})

require("impatient")
require("config.options")
require("config.keymaps")

vim.cmd [[
  highlight OperatorSandwichBuns guifg='#aa91a0' gui=underline ctermfg=172 cterm=underline
  highlight OperatorSandwichChange guifg='#edc41f' gui=underline ctermfg='yellow' cterm=underline
  highlight OperatorSandwichAdd guibg='#b1fa87' gui=none ctermbg='green' cterm=none
  highlight OperatorSandwichDelete guibg='#cf5963' gui=none ctermbg='red' cterm=none
]]

vim.cmd [[
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup="IncSearch", timeout=300 }
  augroup END
]]

vim.cmd.colorscheme "catppuccin"

