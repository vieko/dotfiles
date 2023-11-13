return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = "v3.x",
    keys = {
      {
        "<leader>ft",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            -- source = "buffers",
            -- position = "left",
          })
        end,
        desc = "Toggle NeoTree",
      }
    },
    opts = {
      close_if_last_window = true
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    }
  }
}
