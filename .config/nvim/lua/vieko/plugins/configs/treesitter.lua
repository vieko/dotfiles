require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "css",
    "graphql",
    "html",
    "javascript",
    "json",
    "lua",
    "python",
    "svelte",
    "tsx",
    "typescript",
    "prisma",
    "bash",
    "yaml",
    "sql",
  },
  highlight = { enable = true },
})
