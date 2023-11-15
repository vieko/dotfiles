-- SET Leader
vim.g.mapleader = " "

-- DISABLE Arrows
vim.keymap.set("n", "<Up>", "")
vim.keymap.set("n", "<Down>", "")
vim.keymap.set("n", "<Left>", "")
vim.keymap.set("n", "<Right>", "")
vim.keymap.set("i", "<Up>", "")
vim.keymap.set("i", "<Down>", "")
vim.keymap.set("i", "<Left>", "")
vim.keymap.set("i", "<Right>", "")

-- move lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- half page up and down keeping the cursor centered
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- search terms stay in the middle of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- prevent capital Q from clobbering the current buffer
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<Leader>x", "<Cmd>bd<CR>", { desc = "Close current Buffer" })
vim.keymap.set("n", "<Leader>xx", "<Cmd>%bd<CR>", { desc = "Close all Buffer" })
vim.keymap.set("n", "<Leader>xo", "<Cmd>%bd<Bar>e#<Bar>bd#<CR>", { desc = "Close all Buffer but current" })
vim.keymap.set("n", "<Leader>j", "<C-w><C-j>", { desc = "Move cursor bottom window" })
vim.keymap.set("n", "<Leader>k", "<C-w><C-k>", { desc = "Move cursor top window" })
vim.keymap.set("n", "<Leader>l", "<C-w><C-l>", { desc = "Move cursor left window" })
vim.keymap.set("n", "<Leader>h", "<C-w><C-h>", { desc = "Move cursor right window" })
vim.keymap.set("n", "<Leader>r", ":%s/<C-r><C-w>/", { desc = "Replace Word" })
vim.keymap.set("n", "<Leader>w", "<Cmd>write<CR>", { desc = "Save current File" })

vim.keymap.set("n", "<C-c>", "<Cmd>bp|bd #<CR>", { desc = "Close Buffer, except the last one" })
vim.keymap.set("n", "<Tab>", "<Cmd>bnext<CR>", { desc = "Go to next Buffer" })
vim.keymap.set("n", "<S-Tab>", "<Cmd>bprevious<CR>", { desc = "Go to previous Buffer" })
vim.keymap.set("n", "<Esc>", "<Cmd>noh<Return><Esc>", { desc = "Go to NORMAL Mode, Clear any highlights" })

vim.keymap.set("n", "<Leader>z", require("vieko.utils").reload_config, { desc = "Reload Config" })
