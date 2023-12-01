local user_plugins = {
  -- CORE
  { "dstein64/vim-startuptime" },
  -- {
  --   "tpope/vim-fugitive",
  --   config = function()
  --     vim.keymap.set("n", "<Leader>g", "<Cmd>Git<CR>", { desc = "Git Status" })
  --   end,
  -- },
  { "tpope/vim-surround" },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },
  { "tpope/vim-repeat" },
  -- { "tpope/vim-rhubarb" },
  { "janko/vim-test" },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  { "mattn/emmet-vim" },
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    config = function()
      require("vieko.plugins.configs.bqf")
    end,
  },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<Leader>u", "<Cmd>UndotreeToggle<CR>", { desc = "Open Undo Tree" })
    end,
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({
        mapping = { "jk" },
      })
    end,
  },
  {
    "monaqa/dial.nvim",
    config = function()
      require("vieko.plugins.configs.dial")
    end,
  },
  {
    "ggandor/leap.nvim",
    requires = "tpope/vim-repeat",
    config = function()
      require("leap").set_default_keymaps()
    end,
  },
  {
    "ggandor/flit.nvim",
    config = function()
      require("flit").setup({
        keys = { f = "f", F = "F", t = "t", T = "T" },
        labeled_modes = "nv",
      })
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
  },
  -- EXPLORER
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      {
        "3rd/image.nvim",
        config = function()
          require("image").setup()
        end,
        rocks = { "magick" },
      },
    },
    config = function()
      require("vieko.plugins.configs.neo-tree")
    end,
  },
  -- TELESCOPE
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("vieko.plugins.configs.telescope")
    end,
  },
  -- WHICHKEY
  {
    "folke/which-key.nvim",
    config = function()
      require("vieko.plugins.configs.which-key")
    end,
  },
  -- LSP
  {
    "neovim/nvim-lspconfig",
    requires = {
      -- DEBUGGERS
      { "mfussenegger/nvim-dap" },
      -- LINTER / FORMATTER
      { "creativenull/diagnosticls-configs-nvim" },
      -- TOOL INSTALLER
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },
      { "jayp0521/mason-nvim-dap.nvim" },
      -- LUA SPECIFIC
      { "folke/neodev.nvim" },
      -- PYTHON SPECIFIC
      { "mfussenegger/nvim-dap-python" },
    },
    config = function()
      require("mason").setup()
      -- LSP
      require("vieko.plugins.configs.lspconfig")
      -- DEBUGGER
      require("vieko.plugins.configs.dap")
    end,
  },
  -- AUTOCOMPLETE / SNIPPETS
  {
    "hrsh7th/nvim-cmp",
    requires = {
      -- CMDLINE COMPLETION
      "hrsh7th/cmp-cmdline",
      -- PATH COMPLETION
      "hrsh7th/cmp-path",
      -- BUFFER COMPLETION
      "hrsh7th/cmp-buffer",
      -- LSP COMPLETION
      "hrsh7th/cmp-nvim-lsp",
      "onsails/lspkind-nvim",
      -- VNSIP COMPLETION
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("vieko.plugins.configs.cmp")
    end,
  },
  -- TREE SITTER
  {
    "nvim-treesitter/nvim-treesitter",
    requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
      require("vieko.plugins.configs.treesitter")
    end,
  },
  -- ROBOTS
  {
    "github/copilot.vim",
    config = function()
      require("vieko.plugins.configs.copilot")
    end,
  },
  -- {
  --   "jackMort/ChatGPT.nvim",
  --   config = function()
  --     require("vieko.plugins.configs.chatgpt")
  --   end,
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  -- },
  -- {
  --   "sourcegraph/sg.nvim",
  --   run = "cargo build --workspace",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  -- },
  -- FOLDS
  -- {
  --   "kevinhwang91/nvim-ufo",
  --   requires = { "kevinhwang91/promise-async" },
  --   config = function()
  --     require("vieko.plugins.configs.ufo")
  --   end,
  -- },
  -- THEME
  {
    "catppuccin/nvim",
    as = "catppuccin",
  },
  -- SYNTAX
  -- { "princejoogie/tailwind-highlight.nvim" },
  -- {
  --   "roobert/tailwindcss-colorizer-cmp.nvim",
  --   config = function()
  --     require("tailwindcss-colorizer-cmp").setup({
  --       color_square_width = 2,
  --     })
  --   end,
  -- },
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   config = function()
  --     require("vieko.plugins.configs.colorizer")
  --   end,
  -- },
  -- STATUSLINE
  {
    "nvim-lualine/lualine.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("vieko.plugins.configs.lualine")
    end,
  },
  -- TABLINE
  {
    "utilyre/barbecue.nvim",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    after = "nvim-web-devicons",
    config = function()
      require("vieko.plugins.configs.barbecue")
    end,
  },
  -- TERMINAL
  {
    "akinsho/nvim-toggleterm.lua",
    config = function()
      require("vieko.plugins.configs.toggleterm")
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("vieko.plugins.configs.devicons")
    end,
  },
  -- SECRETS
  -- {
  --   "laytan/cloak.nvim",
  --   config = function()
  --     require("cloak").setup({
  --       enabled = true,
  --       cloak_character = "*",
  --       highlight_group = "Comment",
  --       patterns = {
  --         {
  --           file_pattern = {
  --             ".env*",
  --             "*secrets.json",
  --           },
  --           cloak_pattern = "=.+",
  --         },
  --       },
  --       replace = nil,
  --     })
  --   end,
  -- },
}

-- SET UP Plugins
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require("packer").init({
  compile_path = string.format("%s/site/plugin/packer_compiled.lua", vim.fn.stdpath("data")),
  display = {
    prompt_border = "rounded",
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  for _, user_plugin in pairs(user_plugins) do
    use(user_plugin)
  end

  if packer_bootstrap then
    require("packer").sync()
  end
end)
