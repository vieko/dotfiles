return {
  {
    "stevearc/conform.nvim",
    enabled = false,
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
      -- local slow_format_filetypes = {}
      -- require("conform.formatters.eslint_d").cwd = require("conform.util").root_file({
      --   ".eslint.js",
      --   ".eslint.cjs",
      --   ".eslint.yaml",
      --   ".eslint.yml",
      --   ".eslint.json",
      --   ".eslintrc.json",
      -- })
      -- require("conform.formatters.eslint_d").require_cwd = true
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { "eslint" },
          javascriptreact = { "eslint" },
          typescript = { "eslint" },
          typescriptreact = { "eslint" },
        },
        -- FORMAT ON SAVE
        -- --------------
        -- format_on_save = function(bufnr)
        --   if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        --     return
        --   end
        --   local bufname = vim.api.nvim_buf_get_name(bufnr)
        --   if bufname:match("/node_modules/") then
        --     return
        --   end
        --   if slow_format_filetypes[vim.bo[bufnr].filetype] then
        --     return
        --   end
        --   local function on_format(err)
        --     if err and err:match("timeout$") then
        --       slow_format_filetypes[vim.bo[bufnr].filetype] = true
        --     end
        --   end
        --   return { timeout_ms = 200, lsp_fallback = true }, on_format
        -- end,
        -- FORMAT AFTER SAVE
        -- -----------------
        -- format_after_save = function(bufnr)
        --   if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        --     return
        --   end
        --   if not slow_format_filetypes[vim.bo[bufnr].filetype] then
        --     return
        --   end
        --   return { lsp_fallback = true }
        -- end,
      })
    end,
  }
}
