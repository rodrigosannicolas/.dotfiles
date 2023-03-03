vim.cmd [[highlight IndentBlanklineIndent1 guifg=#2C2E43 gui=nocombine]]

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
    },
}
