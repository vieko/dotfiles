-- Define a function to search for an exact keyword in the buffer and handle results
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
