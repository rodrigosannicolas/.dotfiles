local Remap = require("config.keymap")

local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

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
