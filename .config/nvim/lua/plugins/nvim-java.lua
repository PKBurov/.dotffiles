return {
  "nvim-java/nvim-java",
  lazy = false,
  dependencies = {
    "nvim-java/lua-async-await",
    "nvim-java/nvim-java-core",
    "nvim-java/nvim-java-test",
    "nvim-java/nvim-java-dap",
    "MunifTanjim/nui.nvim",
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    {
      "williamboman/mason.nvim",
      opts = {
        registries = {
          "github:nvim-java/mason-registry",
          "github:mason-org/mason-registry",
        },
      },
    },
  },
  config = function()
    require("java").setup {}

    -- Directly require the lspconfig module here, and not from configs.lspconfig
    local lspconfig = require("lspconfig")
    
    -- Ensure that the following variables are correctly set
    local on_attach = require("nvchad.configs.lspconfig").on_attach
    local capabilities = require("nvchad.configs.lspconfig").capabilities

    -- Check if on_attach and capabilities are correctly loaded
    if not on_attach then
      print("Error: on_attach is not available.")
      return
    end
    if not capabilities then
      print("Error: capabilities is not available.")
      return
    end

    -- Setup the Java LSP (jdtls)
    lspconfig.jdtls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "java" },
    }
  end,
}
