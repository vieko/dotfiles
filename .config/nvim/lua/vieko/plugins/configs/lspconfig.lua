require("neodev").setup()
local lspconfig = require("lspconfig")
local diagnosticls = require("diagnosticls-configs")
local format_group = vim.api.nvim_create_augroup("LspFormatGroup", {})
local format_opts = { async = false, timeout_ms = 2500 }

local function register_fmt_keymap(name, bufnr)
  vim.keymap.set("n", "<leader>p", function()
    vim.lsp.buf.format(vim.tbl_extend("force", format_opts, { name = name, bufnr = bufnr }))
  end, { desc = "Format current Buffer [LSP]", buffer = bufnr })
end

local function fmt_cb(bufnr)
  return function(err, res, ctx)
    if err then
      local err_msg = type(err) == "string" and err or err.message
      -- you can modify the log message / level (or ignore it completely)
      vim.notify("FORMATTING: " .. err_msg, vim.log.levels.WARN)
      return
    end

    -- don't apply results if buffer is unloaded or has been modified
    if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
      return
    end

    if res then
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
      vim.api.nvim_buf_call(bufnr, function()
        vim.cmd("silent noautocmd update")
      end)
    end
  end
end

local function register_fmt_autosave(name, bufnr)
  vim.api.nvim_clear_autocmds({ group = format_group, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = format_group,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf_request(
        bufnr,
        "textDocument/formatting",
        vim.lsp.util.make_formatting_params({}),
        fmt_cb(bufnr)
      )
    end,
    desc = "Format on Save [LSP]",
  })
end

-- GLOBAL DIAGNOSTIC CONFIG
vim.diagnostic.config({
  underline = { severity_limit = "Error" },
  signs = true,
  update_in_insert = false,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

local function on_attach(client, bufnr)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition [LSP]", buffer = bufnr })
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to Type Definition", buffer = bufnr })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration [LSP]", buffer = bufnr })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implentation [LSP]", buffer = bufnr })
  vim.keymap.set("n", "gw", vim.lsp.buf.document_symbol, { desc = "Search Document Symbols [LSP]", buffer = bufnr })
  vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, { desc = "Search Workspace Symbols [LSP]", buffer = bufnr })
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show References [LSP]", buffer = bufnr })
  vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, { desc = "Show Signature Help [LSP]", buffer = bufnr })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show on Hover", buffer = bufnr })
  vim.keymap.set("n", "<leader>af", vim.lsp.buf.code_action, { desc = "Code Action [LSP]", buffer = bufnr })
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename [LSP]", buffer = bufnr })
  vim.keymap.set(
    "n",
    "<leader>ls",
    vim.diagnostic.open_float,
    { desc = "Show Diagnostic at line [LSP]", buffer = bufnr }
  )

  if client.name == "tsserver" then
    vim.keymap.set(
      "n",
      "<Leader>oi",
      "<Cmd>OrganizeImports<CR>",
      { desc = "Organize Imports [TS]", buffer = bufnr }
    )
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

local default_config = {
  on_attach = on_attach,
  capabilities = capabilities,
}

require("mason-tool-installer").setup({
  ensure_installed = {
    "eslint_d",
    "prettier",
    "stylua",
    "codelldb",
  },
})
require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "cssls",
    "diagnosticls",
    "dockerls",
    "gopls",
    "html",
    "jsonls",
    "pylsp",
    "lua_ls",
    "tailwindcss",
    "tsserver",
    "yamlls",
  },
  automatic_installation = true,
})

-- lANGUAGE SERVERS
lspconfig.pylsp.setup(default_config)
lspconfig.bashls.setup(default_config)
lspconfig.cssls.setup(default_config)
lspconfig.dockerls.setup(default_config)
lspconfig.html.setup(default_config)
lspconfig.jsonls.setup(default_config)
lspconfig.yamlls.setup(default_config)
lspconfig.gopls.setup(default_config)

-- TAILWIND CSS
local tw_highlight = require("tailwind-highlight")
lspconfig.tailwindcss.setup({
  on_attach = function(client, bufnr)
    tw_highlight.setup(client, bufnr, {
      single_column = false,
      mode = "background",
      debounce = 200,
    })

    on_attach(client, bufnr)
  end,
})

-- TYPESCRIPT / JAVASCRIPT
local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
  vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    },
  },
})

-- LUA
local lua_rtp = vim.split(package.path, ";")
table.insert(lua_rtp, "lua/?.lua")
table.insert(lua_rtp, "lua/?/init.lua")
lspconfig.lua_ls.setup(vim.tbl_extend("force", default_config, {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}))

diagnosticls.init({
  on_attach = function(_, bufnr)
    register_fmt_keymap("diagnosticls", bufnr)
    register_fmt_autosave("diagnosticls", bufnr)
  end,
})

local web_configs = {
  linter = require("diagnosticls-configs.linters.eslint_d"),
  formatter = require("diagnosticls-configs.formatters.prettier"),
}

diagnosticls.setup({
  javascript = web_configs,
  javascriptreact = web_configs,
  typescript = web_configs,
  typescriptreact = web_configs,
  lua = {
    formatter = require("diagnosticls-configs.formatters.stylua"),
  },
})
