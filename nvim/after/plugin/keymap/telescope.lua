local builtin = require("telescope.builtin")
local Remap = require("config.keymap")

local nnoremap = Remap.nnoremap

nnoremap("ff", builtin.find_files)
