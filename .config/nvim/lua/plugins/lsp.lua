return {
  -- SERVER
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
      vim.g.lsp_zero_ui_float_border = 0
    end,
  },
  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
    },
    config = function()
      local ih = require('lsp-inlayhints')
      ih.setup()

      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Open Diagnostic Float' })
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to Previous Diagnostic' })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to Next Diagnostic' })
      vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Set Diagnostic Loclist' })

      lsp_zero.on_attach(function(client, bufnr)
        -- local group = vim.api.nvim_create_augroup('UserLspConfig', {})
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, opts)
        -- vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>wa", function() vim.lsp.buf.add_workspace_folder() end,
          { buffer = bufnr, remap = false, desc = "Add Workspace Folder" })
        vim.keymap.set("n", "<leader>wr", function() vim.lsp.buf.remove_workspace_folder() end,
          { buffer = bufnr, remap = false, desc = "Remove Workspace Folder" })
        vim.keymap.set("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
          { buffer = bufnr, remap = false, desc = "List Workspace Folder" })
        vim.keymap.set("n", "<leader>D", function() vim.lsp.buf.type_definition() end,
          { buffer = bufnr, remap = false, desc = "Show Type Definition" })
        vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.rename() end,
          { buffer = bufnr, remap = false, desc = "Rename" })
        vim.keymap.set("n", "<leader>vc", function() vim.lsp.buf.code_action() end,
          { buffer = bufnr, remap = false, desc = "Code Action" })
        vim.keymap.set("n", "<leader>vf", function() vim.lsp.buf.format({ async = true }) end,
          { buffer = bufnr, remap = false, desc = "Format" })
        vim.keymap.set("n", "<leader>bi", function() require('lsp-inlayhints').toggle() end,
          { buffer = bufnr, remap = false, desc = "Toggle Inlay Hints" })
        vim.keymap.set("n", "<leader>bo", function() vim.lsp.buf.format({ async = true }) end,
          { buffer = bufnr, remap = false, desc = "Organize Imports" })
      end)

      -- Lua
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)


      -- TypeScript / JavaScript
      require('lspconfig').tsserver.setup({
        on_attach = function(client, bufnr)
          ih.on_attach(client, bufnr)
        end,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = 'all',
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true, -- false if it becomes too noisy
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            }
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = 'all',
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true, -- false if it becomes too noisy
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            }
          }
        }
      })
      -- require('typescript-tools').setup({})

      -- TailwindCSS
      require('lspconfig').tailwindcss.setup({})

      -- ESLint
      require('lspconfig').eslint.setup({
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })
    end
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
  }
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   opts = {},
  -- }
}
