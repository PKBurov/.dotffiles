local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

-- Add your servers here
local servers = { "html", "cssls", "pyre", "clangd"}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.clangd.setup {
 init_options = {
    fallbackFlags = {'--std=c++20'}
  },
}

