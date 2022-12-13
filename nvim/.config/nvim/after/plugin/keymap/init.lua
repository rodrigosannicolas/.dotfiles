local Remap = require("config.keymap")

local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local vnoremap = Remap.vnoremap

-- Moving through splits
nnoremap("<Leader>h", "<C-W>h")
nnoremap("<Leader>j", "<C-W>j")
nnoremap("<Leader>k", "<C-W>k")
nnoremap("<Leader>l", "<C-W>l")

-- Redo
nnoremap("<Leader>u", "<C-R>")

-- Close current buffer
nnoremap("<Leader>q", ":q<CR>")

-- Keep it centered when scrolling
nnoremap("n", "nzz")
nnoremap("N", "Nzz")
nnoremap("J", "mzJ`z")

-- Move to begining/end of line
nnoremap("H", "^")
nnoremap("L", "$")

-- Enter normal mode using jj
inoremap("jj", "<esc>")

-- Undo breakpoints
inoremap(",", ",<c-g>u")
inoremap(".", ".<c-g>u")
inoremap("!", "!<c-g>u")
inoremap("?", "?<c-g>u")
inoremap(";", ";<c-g>u")

-- Search and replace
nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Grep word under cursor
nnoremap("<leader>g", ":grep --exclude-dir=node_modules -i -n -R <C-r><C-w> .")

-- Auto close brackets
inoremap('"', '""<left>')
inoremap("'", "''<left>")
inoremap("(", "()<left>")
inoremap("[", "[]<left>")
inoremap("{", "{  }<left><left>")
inoremap("{<CR>", "{<CR>}<ESC>O")
inoremap("{;<CR>", "{<CR>};<ESC>O")

-- Disable arrow keys
nnoremap("<Down>", "<Nop>")
nnoremap("<Left>", "<Nop>")
nnoremap("<Right>", "<Nop>")
nnoremap("<Up>", "<Nop>")
inoremap("<Down>", "<Nop>")
inoremap("<Left>", "<Nop>")
inoremap("<Right>", "<Nop>")
inoremap("<Up>", "<Nop>")
vnoremap("<Down>", "<Nop>")
vnoremap("<Left>", "<Nop>")
vnoremap("<Right>", "<Nop>")
vnoremap("<Up>", "<Nop>")
