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
" General-purpose command-line fuzzy finder
Plug 'junegunn/fzf.vim'
" Makes sure that you have the latest binary
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Colorscheme
Plug 'joshdick/onedark.vim'
" Parser generator tool
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Conquer of completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'
" Comment stuff out quickly
Plug 'tpope/vim-commentary'
" " Status/tabline
" Plug 'vim-airline/vim-airline'
" " Show git diff in the sign column
" Plug 'airblade/vim-gitgutter'
" " Better syntax highlighting
" Plug 'sheerun/vim-polyglot'
" " Plugin wrapper for prettier
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()

" ========================= Plugin config ================================ "
" Show hidden files such as .env 
let NERDTreeShowHidden=1

" CoC extensions
" let g:coc_global_extensions = ['coc-eslint', 'coc-json', 'coc-tsserver',]

" Enable tree sitter syntax highlighting
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" ========================= Leader mappings ============================== "
let mapleader=" "

" Moving through splits
nnoremap <Leader>h <C-W>h
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>l <C-W>l

" Update current file
nnoremap <Leader>s :w<CR>

" Close current file
nnoremap <Leader>q :q<CR>

" Toggle NerdTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Toggle fuzzy finder
nnoremap <silent><Leader>f :Files<CR>

" ========================= Insert Mappings ============================== "
" Enter normal mode with jh
inoremap jh <esc>

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
" Navigate tabs with C-H and C-L.
nnoremap <C-H> :tabprev<CR>
nnoremap <C-L> :tabnext<CR>

" Copy from the current position to the end with Y.
nnoremap Y y$

" Keep it centered
nnoremap n nzz
nnoremap N Nzz
nnoremap J mzJ`z

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
colorscheme onedark
