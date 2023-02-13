vim.g.mapleader = " "                                    -- Map leader to empty space

vim.opt.number = true                                    -- Show line numbers
vim.opt.relativenumber = true                            -- Toggle hybrid line numbers
vim.opt.wrap = false                                     -- Disable word wrapping
vim.opt.showmatch = true                                 -- Highlight matching braces
vim.opt.signcolumn = "yes"                               -- Add extra column to the left
vim.opt.cursorline = true                                -- Highlight cursor line
vim.opt.ruler = true                                     -- Show row and column ruler information
vim.opt.colorcolumn = "120"                              -- Highlight column
vim.opt.scrolloff = 8                                    -- Start scrolling when you're 8 away
vim.opt.termguicolors = true                             -- Enable true colors
vim.opt.hlsearch = false                                 -- Highlight all search results
vim.opt.ignorecase = true                                -- Always case insensitive
vim.opt.smartcase = true                                 -- Enable smart case search
vim.opt.incsearch = true                                 -- Searches for strings incrementally
vim.opt.tabstop = 2                                      -- Indicates how many spaces a tab prints on the screen
vim.opt.softtabstop = 2                                  -- Number of spaces pab
vim.opt.smarttab = true                                  -- Enable smart tabs
vim.opt.shiftwidth = 2                                   -- Number of auto indent spaces
vim.opt.expandtab = true                                 -- Expand tabs
vim.opt.smartindent = false                              -- Enable smart indenting
vim.opt.updatetime = 50                                  -- Having longer updatetime (default is 40000ms) leads to noticable delays
vim.opt.backup = false                                   -- Disable backup by default
vim.opt.swapfile = false                                 -- Disable swapt file by default
vim.opt.mouse = "a"                                      -- Enable mouse for all modes
vim.opt.clipboard = "unnamedplus"                        -- Use system clipboard
vim.opt.hidden = true                                    --
vim.opt.backspace = { "indent", "eol", "start" }         --
vim.opt.completeopt = { "menu" , "menuone", "noselect" } --
