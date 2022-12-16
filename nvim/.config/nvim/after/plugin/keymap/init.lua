-- Moving through splits
vim.keymap.set("n", "<Leader>h", "<C-W>h")
vim.keymap.set("n", "<Leader>j", "<C-W>j")
vim.keymap.set("n", "<Leader>k", "<C-W>k")
vim.keymap.set("n", "<Leader>l", "<C-W>l")

-- Redo
vim.keymap.set("n", "<Leader>u", "<C-R>")

-- Close current buffer
vim.keymap.set("n", "<Leader>q", ":q<CR>")

-- Move to begining/end of line
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

-- Enter normal mode using jj
vim.keymap.set("i", "jj", "<esc>")

-- Undo breakpoints
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", "!", "!<c-g>u")
vim.keymap.set("i", "?", "?<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- Search and replace
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Grep word under cursor
vim.keymap.set("n", "<leader>g", ":grep --exclude-dir=node_modules -i -n -R <C-r><C-w> .")

-- Auto close brackets
vim.keymap.set("i", '"', '""<left>')
vim.keymap.set("i", "'", "''<left>")
vim.keymap.set("i", "(", "()<left>")
vim.keymap.set("i", "[", "[]<left>")
vim.keymap.set("i", "{", "{  }<left><left>")
vim.keymap.set("i", "{<CR>", "{<CR>}<ESC>O")
vim.keymap.set("i", "{;<CR>", "{<CR>};<ESC>O")

-- Move lines up and down while in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center cursor
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

