require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "html",
    "css",
    "prisma",
    "markdown",
    "markdown_inline",
    "svelte",
    "graphql",
    "bash",
    "lua",
    "vim",
    "python",
    "sql",
    "query",
    "dockerfile",
  },
  highlight = { enable = true },
  indent = { enable = true },
  autotag = { enable = true },
})
