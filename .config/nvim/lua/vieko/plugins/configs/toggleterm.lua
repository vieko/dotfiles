require("toggleterm").setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    else
      return 20
    end
  end,
  hide_numbers = true,
  shade_terminals = false,
  start_in_insert = true,
  persist_size = true,
})

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local function open_toggleterm(direction)
  local buf_dir = vim.fn.expand("%:p:h")
  vim.cmd("ToggleTerm direction=" .. direction .. " dir='" .. buf_dir .. "'")
end

vim.keymap.set("n", "<Leader>tv", function()
  open_toggleterm("vertical")
end, { desc = "Toggle Terminal Vertical" })
vim.keymap.set("n", "<Leader>th", function()
  open_toggleterm("horizontal")
end, { desc = "Toggle Terminal Horizontal" })
