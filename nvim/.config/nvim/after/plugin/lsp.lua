local lsp = require('lsp-zero')
local nvim_lsp = require('lspconfig')

lsp.preset('recommended')
lsp.ensure_installed({ 'tsserver', 'eslint', 'solargraph', 'rust_analyzer' })

-- Choose first option when using lsp's go-to-definition (this is to avoid always showing 
-- node_modules as an option)
local function filter(arr, fn)
  if type(arr) ~= "table" then
    return arr
  end

  local filtered = {}

  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function filterReactDTS(value)
  return string.match(value.filename, 'react/index.d.ts') == nil
end

local function on_list(options)
  local items = options.items
  if #items > 1 then
    items = filter(items, filterReactDTS)
  end

  vim.fn.setqflist({}, ' ', { title = options.title, items = items, context = options.context })
  vim.api.nvim_command('cfirst') -- or maybe you want 'copen' instead of 'cfirst'
end

lsp.on_attach(function (client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition{on_list=on_list} end, bufopts)
end)

lsp.setup()
