-- local C = require("catppuccin.palettes").get_palette("mocha")

vim.cmd([[
    hi BqfPreviewBorder guifg=#cdd6f4
    hi BqfPreviewTitle guifg=#cdd6f4
    hi BqfPreviewThumb guibg=#89b4fa
    hi link BqfPreviewRange Search
]])

-- TODO: show title with the type of buffer
require("bqf").setup({
  auto_enable = true,
  auto_resize_height = true, -- highly recommended enable
  preview = {
    win_height = 12,
    win_vheight = 12,
    delay_syntax = 80,
    show_title = false,
    show_scroll_bar = false,
    should_preview_cb = function(bufnr, qwinid)
      local ret = true
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      local fsize = vim.fn.getfsize(bufname)
      if fsize > 100 * 1024 then
        -- skip file size greater than 100k
        ret = false
      elseif bufname:match("^fugitive://") then
        -- skip fugitive buffer
        ret = false
      end
      return ret
    end,
  },
  -- make `drop` and `tab drop` to become preferred
  func_map = {
    drop = "o",
    openc = "O",
    split = "<C-s>",
    tabdrop = "<C-t>",
    -- set to empty string to disable
    tabc = "",
    ptogglemode = "z,",
  },
})
