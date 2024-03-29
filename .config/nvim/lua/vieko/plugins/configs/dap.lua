local dap = require("dap")
dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
dap.defaults.fallback.focus_terminal = false

require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

function Close_dap_terminal(target_name, target_type)
  local buffers = vim.api.nvim_list_bufs()
  for _, buf in ipairs(buffers) do
    local name = vim.api.nvim_buf_get_name(buf)
    local type = vim.api.nvim_buf_get_option(buf, "buftype")
    if (name == target_name) or (type == target_type) then
      vim.api.nvim_command("bd! " .. buf)
    end
  end
end

-- PYTHON DAP KEYMAPS
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>dn",
--   "<cmd>lua require('dap-python').test_method()<CR>",
--   { noremap = true, silent = true, desc = "Test Method [DAP Python]" }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>df",
--   "<cmd>lua require('dap-python').test_class()<CR>",
--   { noremap = true, silent = true, desc = "Test Class [DAP Python]" }
-- )
-- vim.api.nvim_set_keymap(
--   "v",
--   "<leader>ds",
--   "<ESC><cmd>lua require('dap-python').debug_selection()<CR>",
--   { noremap = true, silent = true, desc = "Debug Selection [DAP Python]" }
-- )

-- DAP KEYMAPS
vim.api.nvim_set_keymap(
  "n",
  "<F5>",
  "<cmd>lua require('dap').continue()<CR>",
  { noremap = true, silent = true, desc = "Continue [DAP]" }
)
vim.api.nvim_set_keymap(
  "n",
  "<F10>",
  "<cmd>lua require('dap').step_over()<CR>",
  { noremap = true, silent = true, desc = "Step Over [DAP]" }
)
vim.api.nvim_set_keymap(
  "n",
  "<F11>",
  "<cmd>lua require('dap').step_into()<CR>",
  { noremap = true, silent = true, desc = "Step Into [DAP]" }
)
vim.api.nvim_set_keymap(
  "n",
  "<F12>",
  "<cmd>lua require('dap').step_out()<CR>",
  { noremap = true, silent = true, desc = "Step Out [DAP]" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>db",
  "<cmd>lua require('dap').toggle_breakpoint()<CR>",
  { noremap = true, silent = true, desc = "Toggle Breakpoint [DAP]" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>dB",
  "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>",
  { noremap = true, silent = true, desc = "Set Breakpoint [DAP]" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>lp",
  "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Lop Point Message: '))<CR>",
  { noremap = true, silent = true, desc = "Log Point [DAP]" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>dr",
  "<cmd>lua require('dap').repl.toggle()<CR>",
  { noremap = true, silent = true, desc = "Toggle REPL [DAP]" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>dl",
  "<cmd>lua require('dap').run_last()<CR>",
  { noremap = true, silent = true, desc = "Run Last [DAP]" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Leader>dc",
  ':lua Close_dap_terminal("[dap terminal] Launch file", "terminal")<CR>',
  { noremap = true, silent = true, desc = "Close Terminal [DAP]" }
)
-- vim.api.nvim_set_keymap(
--   "n",
--   "<Leader>dh",
--   "<cmd>lua require('dap.ui.widgets').hover()<CR>",
--   { noremap = true, silent = true, desc = "Hover [DAP]" }
-- )
-- vim.api.nvim_set_keymap(
--   "v",
--   "<Leader>dh",
--   "<cmd>lua require('dap.ui.widgets').hover()<CR>",
--   { noremap = true, silent = true, desc = "Hover [DAP]" }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<Leader>dp",
--   "<cmd>lua require('dap.ui.widgets').preview()<CR>",
--   { noremap = true, silent = true, desc = "Preview [DAP]" }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<Leader>df",
--   ":lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').frames)<CR>",
--   { noremap = true, silent = true, desc = "Frames [DAP]" }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<Leader>ds",
--   ":lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').scopes)<CR>",
--   { noremap = true, silent = true, desc = "Scopes [DAP]" }
-- )
