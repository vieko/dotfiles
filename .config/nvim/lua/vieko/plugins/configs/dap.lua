-- PYTHON
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
table.insert(require("dap").configurations.python, {
  type = "python",
  request = "launch",
  name = "My custom launch configuration",
  program = "${file}",
})
-- PYTHON DAP KEYMAPS
vim.api.nvim_set_keymap(
  "n",
  "<leader>dn",
  "<cmd>lua require('dap-python').test_method()<CR>",
  { noremap = true, silent = true, desc = "Test Method" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>df",
  "<cmd>lua require('dap-python').test_class()<CR>",
  { noremap = true, silent = true, desc = "Test Class" }
)
vim.api.nvim_set_keymap(
  "v",
  "<leader>ds",
  "<ESC><cmd>lua require('dap-python').debug_selection()<CR>",
  { noremap = true, silent = true, desc = "Debug Selection" }
)
-- DAP KEYMAPS
vim.api.nvim_set_keymap(
  "n",
  "<F5>",
  "<cmd>lua require('dap').continue()<CR>",
  { noremap = true, silent = true, desc = "Continue (DAP)" }
)
vim.api.nvim_set_keymap(
  "n",
  "<F10>",
  "<cmd>lua require('dap').step_over()<CR>",
  { noremap = true, silent = true, desc = "Step Over (DAP)" }
)
vim.api.nvim_set_keymap(
  "n",
  "<F11>",
  "<cmd>lua require('dap').step_into()<CR>",
  { noremap = true, silent = true, desc = "Step Into (DAP)" }
)
vim.api.nvim_set_keymap(
  "n",
  "<F12>",
  "<cmd>lua require('dap').step_out()<CR>",
  { noremap = true, silent = true, desc = "Step Out (DAP)" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>db",
  "<cmd>lua require('dap').toggle_breakpoint()<CR>",
  { noremap = true, silent = true, desc = "Toggle Breakpoint (DAP)" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>dB",
  "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>",
  { noremap = true, silent = true, desc = "Set Breakpoint (DAP)" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>lp",
  "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Lop Point Message: '))<CR>",
  { noremap = true, silent = true, desc = "Log Point (DAP)" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>dr",
  "<cmd>lua require('dap').repl.open()<CR>",
  { noremap = true, silent = true, desc = "Open REPL (DAP)" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>dl",
  "<cmd>lua require('dap').run_last()<CR>",
  { noremap = true, silent = true, desc = "Run Last (DAP)" }
)
