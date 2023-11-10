return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "javascript",
          "typescript",
          "tsx",
          "css",
          "gitcommit",
          "gitignore",
          "http",
          "sql",
          "json"
        },
        sync_install = false,
        highlight = { enable = true },
        indent = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end
  },
}
