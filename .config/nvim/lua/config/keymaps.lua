-- shift lines up a line without changing the cursor position
vim.keymap.set("n", "J", "mzJ`z")

-- move lines up and down in visual mode
--vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
--vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- half page up and down keeping the cursor centered
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- search terms stay in the middle of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- prevent capital Q from clobbering the current buffer
vim.keymap.set("n", "Q", "<nop>")
