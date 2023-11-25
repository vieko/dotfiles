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
vim.keymap.set("n", "<Tab>", ":lua BufferNavigation('next')<CR>", { desc = "Go to next Buffer" })
vim.keymap.set("n", "<S-Tab>", ":lua BufferNavigation('prev')<CR>", { desc = "Go to previous Buffer" })
vim.keymap.set("n", "<Esc>", "<Cmd>noh<Return><Esc>", { desc = "Go to NORMAL Mode, Clear any highlights" })

vim.keymap.set("n", "<Leader>z", require("vieko.utils").reload_config, { desc = "Reload Config" })

-- QuickFix
vim.keymap.set("n", "<Leader>qf", "<Cmd>lua vim.diagnostic.setqflist()<CR>", { desc = "Show Diagnostics in Quickfix" })
vim.keymap.set("n", "<Leader>qa", "<Cmd>cclose<CR>", { desc = "Close Quickfix" })
vim.api.nvim_set_keymap(
  "n",
  "<Leader>qt",
  [[:lua Search_and_populate_quickfix('TODO')<CR>]],
  { noremap = true, silent = true, desc = "Show TODOs in Quickfix" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>qn",
  [[:lua Search_and_populate_quickfix('NOTE')<CR>]],
  { noremap = true, silent = true, desc = "Show NOTEs in Quickfix" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>qb",
  [[:lua Search_and_populate_quickfix('BUG')<CR>]],
  { noremap = true, silent = true, desc = "Show BUGs in Quickfix" }
)

-- Function to cycle through window layouts
function Cycle_window_layouts()
  -- Define a sequence of commands to cycle layouts
  local commands = { "wincmd H", "wincmd J", "wincmd K", "wincmd L", "wincmd =" }
  -- Store the current layout state
  local current_layout = vim.g.current_layout_cycle or 1

  -- Execute the command for the current layout
  vim.api.nvim_command(commands[current_layout])

  -- Update the layout state
  current_layout = current_layout + 1
  if current_layout > #commands then
    current_layout = 1
  end
  vim.g.current_layout_cycle = current_layout
end

-- Set a keymap to call this function, e.g., mapping to <Leader>rl
vim.api.nvim_set_keymap(
  "n",
  "<C-w>r",
  ":lua Cycle_window_layouts()<CR>",
  { noremap = true, silent = true, desc = "Cycle Window Layouts" }
)
