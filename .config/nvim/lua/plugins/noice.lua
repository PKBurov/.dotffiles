return {
  -- lazy.nvim
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- You can configure Noice options here
    lsp = {
      progress = {
        enabled = true, -- Enable LSP progress notification
      },
      hover = {
        enabled = true, -- Enable hover documentation via Noice
      },
      signature = {
        enabled = true, -- Enable LSP signature help via Noice
      },
    },
    presets = {
      bottom_search = true,  -- Show search results at the bottom
      command_palette = true,  -- Enable command palette
      long_message_to_split = true,  -- Split long messages
    },
    -- More Noice options can be added here
  },
  dependencies = {
    "MunifTanjim/nui.nvim",  -- Required for Noice's UI
    "rcarriga/nvim-notify",  -- Required for Noice notifications
  },
  config = function()
    -- Configure nvim-notify to work with noice
    require("notify").setup({
      background_colour = "#000000",  -- Set background color (or 'NONE' for transparency)
    })
    
    -- Configure Noice with the setup options
    require("noice").setup({
      -- Put any additional Noice options here, like:
      routes = {  -- Optional: Custom routes for different types of messages
        {
          filter = { event = "msg_showmode" },
          view = "mini",
        },
      },
    })
  end,
}
