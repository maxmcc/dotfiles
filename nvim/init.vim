" Max McCarthy's init.vim (.vimrc)

" Because computers are stupid {{{
"   Fish breaks some plugins
set shell=/bin/bash

"   OS X keys are wrong
nnoremap <BS> <C-W>h

"   Kill ex-mode with fire
nnoremap Q <nop>
" }}}

" Plugins (vim-plug) {{{
call plug#begin()
  Plug 'airblade/vim-gitgutter'          " Diff markings in gutter
  Plug 'christoomey/vim-tmux-navigator'  " Unify vim and tmux splits (!!)
  Plug 'ervandew/supertab'               " Tab-based autocomplete
  Plug 'itchyny/lightline.vim'           " Lightweight status line
  Plug 'mhinz/vim-startify'              " Nicer startup UI and MRU list
  Plug 'scrooloose/nerdtree'             " Nicer filesystem navigation
  Plug 'tpope/vim-git'                   " Some misc git niceties
  Plug 'tpope/vim-fugitive'              " Some misc git niceties
  Plug 'w0ng/vim-hybrid'                 " Muted, dark colorscheme

"  Language-specific plugins
  Plug 'aliva/vim-fish',                 { 'for': 'fish' }
  Plug 'LaTeX-Box-Team/LaTeX-Box',       { 'for': 'tex' }
  Plug 'the-lambda-church/coquille',     { 'for': 'coq' }
  Plug 'rust-lang/rust.vim',             { 'for': 'rust' }
  Plug 'cespare/vim-toml',               { 'for': 'toml' }
call plug#end()
" }}}

" Status line (lightline) {{{
set laststatus=2                         " Last window always has status line
set noshowmode                           " Don't show '-- INSERT --' etc.

"   Lightline status line config
let g:lightline = {
  \   'colorscheme': 'Tomorrow_Night',
  \   'active': {
  \     'left':  [ [ 'mode', 'paste' ],
  \                [ 'fugitive', 'filename' ]
  \              ],
  \     'right': [ [ 'syntastic', 'lineinfo' ],
  \                ['percent'],
  \                [ 'fileformat', 'fileencoding', 'filetype' ]
  \              ]
  \   },
  \   'component_expand': {
  \     'syntastic': 'SyntasticStatuslineFlag',
  \   },
  \   'component_type': {
  \     'syntastic': 'error',
  \   },
  \ }

"   Lightline tab bar config
let g:lightline.tabline = {
  \   'left': [ [ 'tabs' ] ],
  \   'right': [ [  ] ]
  \ }
" }}}

" Backups {{{
set nobackup                             " Don't generate backups
set nowritebackup                        " Don't create backup files
set noswapfile                           " Prevent swap files
" }}}

" Ergonomics {{{
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
set hlsearch                             " Highlight matches
set ignorecase                           " Ignore case in query, unless...
set smartcase                            " ...different cases used
" }}}

" Style issues {{{
"   Text width
set wrap                                 " Automatically wrap lines
set linebreak                            " Insert linebreaks for long lines
set textwidth=80                         " Wrap at 80 characters

augroup column_limit
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#404040
  autocmd BufEnter * match OverLength '\%>80v.\+'
augroup END

"   Trailing whitespace
fun! <SID>StripTrailingWhitespace()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

augroup whitespace
  autocmd!
  autocmd BufWritePre * :call <SID>StripTrailingWhitespace()
augroup END

"   Tab characters
set tabstop=2                            " Visual spaces per tab char
set softtabstop=2                        " Insert 2 spaces on <TAB>
set expandtab                            " Use spaces, not tabs
set shiftwidth=2                         " Indent 2 spaces
set shiftround                           " Indent to nearest multiple of 2
set autoindent                           " Automatically indent things

"   Highlight tab characters
" Establishes highlight group for tab characters
execute "set listchars=tab:\u2023\u2023"
set list                                " Enable highlight list
" }}}

" Appearance {{{
"   vim-hybrid color scheme
set background=dark
let base16colorspace=256
colorscheme hybrid

"   GUI vim
if has('gui_running')
  set guioptions-=T                     " Remove toolbar
  set guioptions-=e                     " Remove GUI tabs
  set guioptions-=r                     " Remove right scroll bar
  set guioptions-=L                     " Remove left scroll bra
  set guifont=FiraMono-Regular:h14      " Set nice font
  set linespace=2                       " Increase line spacing slightly
endif
" }}}

" File navigation {{{
"   Line numbers
set number                              " Show line numbers
" set cursorline                        " Highlight current line
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
set foldnestmax=10                      " Don't nest deeper than 10

"   Keybindings
nnoremap <space> za
" }}}

" Leader shortcuts {{{
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" }}}

