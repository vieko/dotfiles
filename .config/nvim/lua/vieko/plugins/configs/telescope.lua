local telescope = require("telescope")
local telescope_actions = require("telescope.actions")
local telescope_builtin = require("telescope.builtin")

telescope.setup({
  defaults = {
    file_ignore_patterns = {
      "%.git",
      "%.next",
      "%.rustup",
      "%.icons",
      "%.gnup",
      "%.cargo",
      "%.cache",
      "node_modules/",
      "undodir/",
    },
    mappings = {
      i = {
        ["<C-k>"] = telescope_actions.move_selection_previous,
        ["<C-j>"] = telescope_actions.move_selection_next,
      },
    },
  },
})

vim.keymap.set("n", "<Leader>s", function()
  telescope_builtin.find_files({ hidden = true })
end, { desc = "Find Files" })

vim.keymap.set("n", "<Leader>c", function()
  telescope_builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Files within Config" })

vim.keymap.set("n", "<Leader>ff", function()
  telescope_builtin.live_grep()
end, { desc = "Grep Files" })

vim.keymap.set("n", "<Leader>fh", function()
  telescope_builtin.help_tags()
end, { desc = "Help Tags" })

vim.keymap.set("n", "<Leader>fb", function()
  telescope_builtin.buffers()
end, { desc = "Show Buffers" })

vim.keymap.set("n", "<Leader>gs", function()
  telescope_builtin.git_status()
end, { desc = "Git Status" })
