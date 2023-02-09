-- Moving through splits
vim.keymap.set("n", "<Leader>h", "<C-W>h")
vim.keymap.set("n", "<Leader>j", "<C-W>j")
vim.keymap.set("n", "<Leader>k", "<C-W>k")
vim.keymap.set("n", "<Leader>l", "<C-W>l")

-- Moving through tabs
vim.keymap.set("n", "<C-l>", "gt")
vim.keymap.set("n", "<C-h>", "gT")

-- Move to begining/end of line
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

-- Redo
vim.keymap.set("n", "<Leader>u", "<C-R>")

-- Close current buffer
vim.keymap.set("n", "<Leader>q", ":q<CR>")

-- Enter normal mode using jj
vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set("t", "jj", "<C-\\><C-n>")

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

-- Move lines up and down while in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center cursor
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Reorder opened tabs
vim.keymap.set("n", "<leader>-", ":tabmove -1<CR>")
vim.keymap.set("n", "<leader>+", ":tabmove +1<CR>")
