" Max McCarthy's init.vim (.vimrc)

" Because computers are stupid {{{
"   Fish breaks some plugins
set shell=/bin/bash

"   Kill ex-mode with fire
nnoremap Q <nop>
" }}}

" Plugins (vim-plug) {{{
call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'cocopon/lightline-hybrid.vim'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'w0ng/vim-hybrid'

" Language support
Plug 'aliva/vim-fish', { 'for': 'fish' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'apple/swift', { 'for': 'swift', 'rtp': 'utils/vim/','name': 'swift' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

call plug#end()
" }}}
"

" Backups {{{
set nobackup                             " Don't generate backups
set nowritebackup                        " Don't create backup files
set noswapfile                           " Prevent swap files
" }}}

" Tab completion {{{
set completeopt-=preview

:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"   Don't be stupid about directions
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
" }}}

" Errors and warnings {{{
set hidden

let g:coc_status_error_sign = 'errors: '
let g:coc_status_warning_sign = 'warnings: '

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-rename)
nmap <silent> gR <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" }}}

" Ergonomics {{{
"   No noises
set visualbell

"   What is ; really good for, anyway?
nnoremap ; :
vnoremap ; :

"   Better menus
set wildmenu                             " Visual autocomplete for commands

"   Matching parentheses
set showmatch
" }}}

" Searching {{{
set incsearch                            " Highlight as-you-type
set inccommand=nosplit                   " And preview substitutions
set hlsearch                             " Highlight matches
set ignorecase                           " Ignore case in query, unless...
set smartcase                            " ...different cases used
" }}}


" Style issues {{{
"   Text width
set wrap                                 " Automatically wrap lines
set linebreak                            " Insert linebreaks for long lines
set textwidth=100                        " Wrap at 100 characters

"   Trailing whitespace
function! <SID>StripTrailingWhitespace()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction

augroup whitespace
  autocmd!
  autocmd BufWritePre * :call <SID>StripTrailingWhitespace()
augroup END

"   Tab characters
set tabstop=4                            " Visual spaces per tab char
set softtabstop=4                        " Insert 4 spaces on <TAB>
set expandtab                            " Use spaces, not tabs
set shiftwidth=4                         " Indent 4 spaces
set shiftround                           " Indent to nearest multiple of 4
set autoindent                           " Automatically indent things

"   Highlight tab characters
"   Establishes highlight group for tab characters
execute "set listchars=tab:\u2023\u2023"
" }}}

" Appearance {{{
"   vim-hybrid color scheme
set background=dark
let g:hybrid_custom_term_colors = 1
colorscheme hybrid

"   Nicer vertical boundaries
set fillchars+=vert:│
" }}}

" File navigation {{{
"   Line numbers
set number                              " Show line numbers

"   Movement by visual lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
" }}}

" Windows, splits, and tabs {{{
"   Split creation
set splitbelow                          " Horizontal splits go below
set splitright                          " Vertical splits go right
" }}}

" Folding {{{
"   Fold configuration
set foldenable                          " Enable folding
set foldmethod=marker                   " Fold between {{{/}}}
set foldlevelstart=10                   " Open most folds by default

"   Keybindings
nnoremap <space> za
" }}}

" Leader shortcuts {{{
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
" }}}

