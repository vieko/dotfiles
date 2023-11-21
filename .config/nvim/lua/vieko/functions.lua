function Search_and_populate_quickfix(keyword)
  -- Check if the quickfix window is already open
  if vim.fn.getwinvar(0, "&filetype") == "qf" then
    print("Quickfix window is already open")
    return
  end

  -- Clear the existing quickfix list
  vim.fn.setqflist({})

  -- Get the current buffer content
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  -- Initialize a table to store quickfix items
  local quickfix_list = {}

  -- Create a regular expression pattern to match the exact keyword
  local pattern = "\\<\\(" .. vim.fn.escape(keyword, "\\") .. "\\)\\>"

  -- Iterate through each line in the buffer
  for i, line in ipairs(lines) do
    -- Check if the line contains the exact keyword
    if vim.fn.match(line, pattern) > -1 then
      -- Create a quickfix item
      local quickfix_item = {
        filename = vim.fn.bufname(),
        lnum = i,
        text = line,
      }

      -- Add the item to the quickfix list
      table.insert(quickfix_list, quickfix_item)
    end
  end

  -- Check if there are results in the quickfix list
  if #quickfix_list > 0 then
    -- Populate the quickfix list with the collected items
    vim.fn.setqflist(quickfix_list)

    -- Open the quickfix window
    vim.cmd("copen")
  else
    -- Print a message if there are no results
    print("No results found for: " .. keyword)
  end
end

function BufferNavigation(direction)
  local skip_buffer_types = { "nofile", "help", "terminal", "quickfix" }

  local function should_skip(buf)
    local buftype = vim.api.nvim_buf_get_option(buf, "buftype")
    for _, skip_buftype in ipairs(skip_buffer_types) do
      if buftype == skip_buftype then
        return true
      end
    end
    return false
  end

  local current_buf = vim.api.nvim_get_current_buf()
  if should_skip(current_buf) then
    local current_buf_type = vim.api.nvim_buf_get_option(current_buf, "buftype")
    print("(" .. current_buf_type .. ") is in the skip list.")
    return
  end

  local buf_list = vim.api.nvim_list_bufs()
  local num_bufs = #buf_list
  local index = vim.fn.bufnr("%") -- Current buffer number
  local step = direction == "next" and 1 or -1
  local checked_buffers = 0

  while checked_buffers < num_bufs do
    index = (index + step - 1) % num_bufs + 1
    local buf = buf_list[index]

    if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) and not should_skip(buf) then
      vim.api.nvim_set_current_buf(buf)
      return
    end

    checked_buffers = checked_buffers + 1
  end

  print("No suitable buffer found.")
end
