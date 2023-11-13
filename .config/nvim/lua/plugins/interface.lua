return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      local C = require("catppuccin.palettes").get_palette("mocha")
      require('lualine').setup(
        {
          options = {
            theme = 'catppuccin',
            icons_enabled = false,
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
          },
          sections = {
            lualine_x = {
              {
                require("noice").api.statusline.mode.get,
                cond = require("noice").api.statusline.mode.has,
                color = { fg = C.peach },
              }
            },
          },
        }
      )
    end
  },
  {
    "utilyre/barbecue.nvim",
    lazy = false,
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      -- "nvim-tree/nvim-web-devicons",
    },
    opts = {
      theme = "catppuccin",
      show_navic = true,
      show_modified = true,
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      show_help = false,
      show_keys = false
    },
    config = function()
      local wk = require("which-key")

      wk.register({
        f = {
          name = "file",
          f = { "<cmd>Telescope find_files<cr>", "Find Files" },
          b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
          r = { "<cmd>Telescope oldfiles<cr>", "Open Recent Files" },
          n = { "<cmd>enew<cr>", "New File" },
          g = { "<cmd>Telescope live_grep<cr>", "Grep" },
          h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        },
        b = {
          name = "buffer",
          o = { "<cmd>Format<cr>", "Format Buffer" },
        },
        g = {
          name = "git",
          s = { "<cmd>Neogit<cr>", "Show Status" },
        },
        w = {
          name = "workspace"
        },
        d = {
          name = "diagnostics"
        }
      }, { prefix = "<leader>" })
    end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = false,
          },
          hover = { enabled = true, silent = true },
          signature = { enabled = true },
          dismiss = { silent = true, pending = true }
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true,         -- use a classic bottom cmdline for search
          command_palette = true,       -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,           -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true,        -- add a border to hover docs and signature help
        },
        commands = {
          all = {
            -- options for the message history that you get with `:Noice`
            view = "split",
            opts = { enter = true, format = "details" },
            filter = {},
          },
        },
        routes = {
          {
            filter = {
              event = "msg_show",
              kind = "",
              find = "written",
            },
            opts = { skip = true },
          }
        },
      })
    end
  }
}
