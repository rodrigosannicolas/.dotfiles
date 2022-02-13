"========================= General config =============================== "
syntax enable                   " Enable syntax highlighting

set number                      " Show line numbers
set relativenumber              " Toggle hybrid line numbers
set nowrap                      " Disable word wrapping
set showmatch                   " Highlight matching brace
set visualbell                  " Use visual bell (no beeping)
set signcolumn=yes              " Add extra column to the left
set cursorline                  " Highlight cursor line
set ruler                       " Show row and column ruler information
set colorcolumn=101             " Highlight column 101
set scrolloff=8                 " Start scrolling when you're 8 away
set termguicolors               " Enable true colors
set foldmethod=indent           " Enable folding
set foldlevelstart=99           " Open folds by default
set splitright                  " Open new splits to the right
set nohlsearch                  " Highlight all search results
set ignorecase                  " Always case-insensitive
set smartcase                   " Enable smart-case search
set incsearch                   " Searches for strings incrementally
set tabstop=2                   " Indicates how many spaces a tab prints on the screen
set shiftwidth=2                " Number of auto-indent spaces
set softtabstop=2               " Number of spaces per Tab
set autoindent                  " Auto-indent new lines
set smartindent                 " Enable smart-indent
set smarttab                    " Enable smart-tabs
set undolevels=1000             " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour
set clipboard=unnamedplus       " Use system clipboard by default
set hidden                      " TextEdit might fail if hidden is not set
set updatetime=300              " Having longer updatetime (default is 4000ms) leads to noticeable delays
set nobackup                    " Disable backup by default

"========================= Plugins ===================================== "
call plug#begin('~/vim/plugged')
" NerdTree file system explorer
Plug 'preservim/nerdtree'
" General-purpose command-line fuzzy finder (makes sure that you have the latest binary)
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Parser generator tool
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Better syntax highlighting
Plug 'pangloss/vim-javascript'
" Conquer of completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'
" Comment stuff out quickly
Plug 'tpope/vim-commentary'
" Dev icons
Plug 'ryanoasis/vim-devicons'
" Vim plugin for git
Plug 'tpope/vim-fugitive'
" Plugin wrapper for prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Status/tabline
Plug 'vim-airline/vim-airline'
" Colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/everforest'
call plug#end()

" ========================= Plugin config ================================ "
" Show hidden files such as .env 
let NERDTreeShowHidden=1
" Remove NerdTree's help line from top
let NERDTreeMinimalUI=1

" Auto format on save
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" Theme background
let g:everforest_background = 'hard'

" Enable tree sitter syntax highlighting
" lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" ========================= Leader mappings ============================== "
let mapleader=" "

" Moving through splits
nnoremap <Leader>h <C-W>h
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>l <C-W>l

" Redo
nnoremap <Leader>u <C-R>

" Update current file
nnoremap <Leader>s :wa<CR>

" Close current file
nnoremap <Leader>q :q<CR>

" Toggle NerdTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Toggle fuzzy finder
nnoremap <Leader>f :Files<CR>

" ========================= Insert Mappings ============================== "
" Enter normal mode with jj
inoremap jj <esc>

" Disable arrow keys
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap ; ;<c-g>u

" ========================= Normal Mappings ============================== "
" Copy from the current position to the end with Y.
nnoremap Y y$

" Keep it centered
nnoremap n nzz
nnoremap N Nzz
nnoremap J mzJ`z

" Move to beginning/end of line
nnoremap H ^
nnoremap L $

" Moving through tabs
nnoremap <tab> :tabnext<CR>
nnoremap <s-tab> :tabprev<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ========================= Autocommands ================================ "
" Exit Vim if NerdTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" ========================= Custom Functions ============================= "
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" ========================= Color Scheme ================================ "
colorscheme everforest
