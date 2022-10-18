local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require('lspconfig')

local servers = { 'tsserver', 'pyright' }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup { capabilities = capabilities }
end

-- Show line diagnostics automatically in hover window
-- vim.diagnostic.config({ virtual_text = false })
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
