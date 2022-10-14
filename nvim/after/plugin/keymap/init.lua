-- Moving through splits
vim.keymap.set('n', '<Leader>h', '<C-W>h', {})
vim.keymap.set('n', '<Leader>j', '<C-W>j', {})
vim.keymap.set('n', '<Leader>k', '<C-W>k', {})
vim.keymap.set('n', '<Leader>l', '<C-W>l', {})

-- Redo
vim.keymap.set('n', '<Leader>u', '<C-R>', {})

-- Close current buffer
vim.keymap.set('n', '<Leader>q', ':q<CR>', {})

-- Keep it centered when scrolling
vim.keymap.set('n', 'n', 'nzz', {})
vim.keymap.set('n', 'N', 'Nzz', {})
vim.keymap.set('n', 'J', 'mzJ`z', {})

-- Move to begining/end of line
vim.keymap.set('n', 'H', '^', {})
vim.keymap.set('n', 'L', '$', {})

-- Enter normal mode using jj
vim.keymap.set('i', 'jj', '<esc>', {})

-- Undo breakpoints
vim.keymap.set('i', ',', ',<c-g>u', {})
vim.keymap.set('i', '.', '.<c-g>u', {})
vim.keymap.set('i', '!', '!<c-g>u', {})
vim.keymap.set('i', '?', '?<c-g>u', {})
vim.keymap.set('i', ';', ';<c-g>u', {})
