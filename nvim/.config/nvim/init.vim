"  =============================== General config  =============================== "
syntax enable                   " Enable syntax highlighting

set number                      " Show line numbers
set relativenumber              " Toggle hybrid line numbers
set nowrap                      " Disable word wrapping
set showmatch                   " Highlight matching brace
set visualbell                  " Use visual bell (no beeping)
set signcolumn=yes              " Add extra column to the left
set cursorline                  " Highlight cursor line
set ruler                       " Show row and column ruler information
set colorcolumn=101             " Highlight column 101 for js or 79 for python
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

"  =============================== Plugins  =============================== "
call plug#begin('~/vim/plugged')

" Base plugins
Plug 'preservim/nerdtree' " NerdTree file system explorer
Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair
Plug 'tpope/vim-commentary' " Comment stuff out quickly

" Command line fuzzy finder
Plug 'junegunn/fzf.vim' " General-purpose command-line fuzzy finder 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Makes sure that you have the latest binary

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Parser generator tootreesitterl
Plug 'sheerun/vim-polyglot' " A collection of language packs for Vim

" Linting
" Plug 'dense-analysis/ale' " Asynchronous lint engine
Plug 'prettier/vim-prettier', { 'do': 'yarn install' } " Plugin wrapper for prettier

" Intellisense code completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' } " Conquer of completion

" Git
" Plug 'tpope/vim-fugitive' " Vim plugin for git

" Theme
Plug 'vim-airline/vim-airline' " Status/tabline
Plug 'ryanoasis/vim-devicons' " Dev icons
Plug 'ayu-theme/ayu-vim' " Ayu colorscheme

call plug#end()

" ===============================  Plugin config  =============================== "
let NERDTreeShowHidden=1 " Show hidden files such as .env 
let NERDTreeMinimalUI=1  " Remove NerdTree's help line from top

let g:prettier#autoformat = 1 " Auto format on save
let g:prettier#autoformat_require_pragma = 0

let g:everforest_background = 'hard' " Theme background

" Enable tree sitter syntax highlighting
lua require'nvim-treesitter.configs'.setup { highlight = { enabled = true } }

let ayucolor="mirage"

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
nnoremap <Leader>s :w<CR>

" Close current file
nnoremap <Leader>q :q<CR>

" Toggle NerdTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Toggle fuzzy finder
nnoremap <Leader>f :Files<CR>

" ========================= Insert Mappings ============================== "
" Enter normal mode with tab inoremap <Tab> <esc>
inoremap jj <esc>

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

" ========================= COC Config ================================== "
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" ========================= Color Scheme ================================ "
colorscheme ayu 
