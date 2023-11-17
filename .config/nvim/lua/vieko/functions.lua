local function find_todos()
  -- Clear the quickfix list
  vim.fn.setqflist({})

  -- Iterate over each line in the buffer
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local qf_list = {}

  for lnum, line in ipairs(lines) do
    if string.find(line, "TODO") then
      -- Add line to the quickfix list
      table.insert(qf_list, {
        bufnr = vim.api.nvim_get_current_buf(),
        lnum = lnum,
        text = line,
      })
    end
  end

  -- Set the quickfix list and open it
  vim.fn.setqflist(qf_list, "r")
  vim.cmd("copen")
end

local function find_notes()
  -- Clear the quickfix list
  vim.fn.setqflist({})

  -- Iterate over each line in the buffer
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local qf_list = {}

  for lnum, line in ipairs(lines) do
    if string.find(line, "NOTE") then
      -- Add line to the quickfix list
      table.insert(qf_list, {
        bufnr = vim.api.nvim_get_current_buf(),
        lnum = lnum,
        text = line,
      })
    end
  end

  -- Set the quickfix list and open it
  vim.fn.setqflist(qf_list, "r")
  vim.cmd("copen")
end

vim.api.nvim_create_user_command("TodoQuickFix", find_todos, {})
vim.api.nvim_create_user_command("NoteQuickFix", find_notes, {})
