local M = {}

local function init()
  -- vim.g.python3_host_prog = vim.fn.exepath("python3")
  vim.g.loaded_python3_provider = 0
  vim.g.loaded_python_provider = 0
  vim.g.loaded_perl_provider = 0
  vim.g.loaded_ruby_provider = 0
  vim.g.loaded_node_provider = 0

  vim.g["test#strategy"] = "neovim"
  vim.g["test#neovim#term_position"] = "vertical"
  vim.g["test#javascript#jest#options"] = "--watch"

  vim.g.clipboard = {
    name = "xclip",
    copy = {
      ["+"] = "xclip -selection clipboard",
      ["*"] = "xclip -selection clipboard",
    },
    paste = {
      ["+"] = "xclip -selection clipboard -o",
      ["*"] = "xclip -selection clipboard -o",
    },
    cache_enabled = 0,
  }

  vim.opt.background = "dark"
end

function M.setup()
  init()
  require("vieko.toggle")
  require("vieko.autocmds")
  require("vieko.keymaps")
  require("vieko.options")
  require("vieko.plugins")
  require("vieko.functions")
  require("vieko.colorscheme")
  if vim.g.vscode then
    require("vieko.vscode")
  end
  -- vim.lsp.set_log_level("debug")
end

return M
