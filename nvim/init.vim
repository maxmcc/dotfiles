" Max McCarthy's init.vim (.vimrc)

" Because computers are stupid {{{
"   Fish breaks some plugins
set shell=/bin/bash

"   OS X keys are wrong
nnoremap <BS> <C-W>h

"   Kill ex-mode with fire
nnoremap Q <nop>

"   Tell it where to find Python
let g:python_host_prog = '/usr/local/bin/python'
" }}}

" Plugins (vim-plug) {{{
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'christoomey/vim-tmux-navigator'
Plug 'cocopon/lightline-hybrid.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'shougo/deoplete.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-surround'
Plug 'w0ng/vim-hybrid'
Plug 'wellle/tmux-complete.vim'

"  Language-specific plugins
Plug 'aliva/vim-fish', { 'for': 'fish' }
Plug 'bitc/vim-hdevtools', { 'for': 'haskell' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'scrooloose/syntastic', { 'for': 'ocaml' }
Plug 'tpope/vim-liquid', { 'for': 'liquid' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

"  Plugins managed by OPAM
Plug '~/.opam/system/share/ocp-indent', { 'rtp': 'vim', 'for': 'ocaml' }
Plug '~/.opam/system/share/merlin', { 'rtp': 'vim', 'for': 'ocaml' }
call plug#end()
" }}}

" Backups {{{
set nobackup                             " Don't generate backups
set nowritebackup                        " Don't create backup files
set noswapfile                           " Prevent swap files
" }}}

" Tab completion {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

"   Don't be stupid about directions
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
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
set hlsearch                             " Highlight matches
set ignorecase                           " Ignore case in query, unless...
set smartcase                            " ...different cases used
" }}}

" Ctrl-P {{{
let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/](\.(git|hg|svn|sass-cache)|tmp|node_modules|\.sass-cache|build)$'
      \ }
" }}}

" Style issues {{{
"   Text width
set wrap                                 " Automatically wrap lines
set linebreak                            " Insert linebreaks for long lines
set textwidth=80                         " Wrap at 80 characters

augroup column_limit
  autocmd BufEnter ocaml highlight OverLength ctermbg=darkgrey guibg=#404040
  autocmd BufEnter ocaml match OverLength '\%>80v.\+'
augroup END

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
set tabstop=2                            " Visual spaces per tab char
set softtabstop=2                        " Insert 2 spaces on <TAB>
set expandtab                            " Use spaces, not tabs
set shiftwidth=2                         " Indent 2 spaces
set shiftround                           " Indent to nearest multiple of 2
set autoindent                           " Automatically indent things

"   Highlight tab characters
"   Establishes highlight group for tab characters
execute "set listchars=tab:\u2023\u2023"
set list                                " Enable highlight list
" }}}

" Appearance {{{
"   vim-hybrid color scheme
set background=dark
let base16colorspace=256
colorscheme hybrid

"   Nicer vertical boundaries
set fillchars+=vert:│

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
set foldnestmax=10                      " Don't nest deeper than 10

"   Keybindings
nnoremap <space> za
" }}}

" Text manipulation {{{
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction

vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv
" }}}

" Leader shortcuts {{{
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" }}}

" Neomake {{{
let g:neomake_warning_sign = {
      \ 'text': '>>',
      \ 'texthl': 'Warning',
      \ }

let g:neomake_error_sign = {
      \ 'text': '>>',
      \ 'texthl': 'Error',
      \ }

let g:neomake_echo_current_error = 1
let g:neomake_verbose = 0

cnoreabbrev oldmake make
cnoreabbrev make Neomake! make

autocmd BufWritePost * Neomake
" }}}
