return {
  -- Mason package manager
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason integration with LSPConfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "clangd",
          "clang-format",
          "codelldb",
          "lua-language-server",
          "html-lsp",
          "css-lsp",
          "tsserver",
          "pyright",
          "bashls",
          "jsonls",
          "jdtls",
        },
        automatic_installation = true,
      }

      -- Auto-configure installed LSP servers
      local lspconfig = require("lspconfig")
      local servers = {
        lua_ls = {},
        html = {},
        cssls = {},
        tsserver = {},
        pyright = {},
        bashls = {},
        jsonls = {},
      }

      for server, config in pairs(servers) do
        lspconfig[server].setup(config)
      end
    end,
  },

  -- Mason integration with formatters and linters
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = { "nvimtools/none-ls.nvim" },
    config = function()
      require("mason-null-ls").setup {
        ensure_installed = {
          "prettier",
          "stylua",
          "eslint_d",
          "flake8",
        },
        automatic_installation = true,
      }
    end,
  },
}

