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
  },
  highlight = { enable = true },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})
