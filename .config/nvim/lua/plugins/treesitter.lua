return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = false,
        ensure_installed = {
          "lua",
          "bash",
          "ruby",
          "html",
          "css",
          "scss",
          "javascript",
          "typescript",
          "json",
          "lua",
          "python",
          "cpp",
          "c",
        },
        highlight = { enable = true },
        indent = { enable = false },
      })
    end
  }
}
