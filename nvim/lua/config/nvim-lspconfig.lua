local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require('lspconfig')

local servers = { 'tsserver', 'pyright' }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup { capabilities = capabilities }
end
