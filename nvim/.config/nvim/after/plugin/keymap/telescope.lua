local builtin = require('telescope.builtin')
local file_browser = require "telescope".extensions.file_browser.file_browser

vim.keymap.set('n', '<leader>fb', file_browser)
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  -- ripgrep needs to be installed for this to work
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
