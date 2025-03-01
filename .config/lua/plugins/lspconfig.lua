return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig") -- Load your existing LSP config
    end,
  },
}
