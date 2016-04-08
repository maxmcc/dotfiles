" Status line configuration

let g:lightline = {}
let g:lightline.component = {}
let g:lightline.component_type = {}
let g:lightline.component_expand = {}
let g:lightline.component_function = {}
let g:lightline.component_visible_condition = {}

" Appearance {{{
let g:lightline.colorscheme = 'wombat'
let g:lightline.subseparator = { 'left' : '', 'right': '│' }
" }}}

" Active frame statusline {{{
let g:lightline.active = {}
let g:lightline.active.left =
      \ [['mode', 'paste'],
      \  ['filename', 'modified'],
      \  ['readonly', 'fugitive']]
let g:lightline.active.right =
      \ [['syntastic', 'lineinfo'],
      \  ['percent'],
      \  ['fileformat', 'fileencoding', 'filetype']]
" }}}

" Inactive frame statusline {{{
let g:lightline.inactive = {}
let g:lightline.inactive.left = [['filename']]
let g:lightline.inactive.right = [['lineinfo'], ['percent']]
" }}}

" Tabline {{{
let g:lightline.tabline = {}
let g:lightline.tabline.left = [['tabs']]
let g:lightline.tabline.right = [[]]
" }}}

" File modification {{{
let g:lightline.component_function.modified = 'LightLineModified'
function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

let g:lightline.component_function.readonly = 'LightLineReadonly'
function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "read only"
  else
    return ""
  endif
endfunction
" }}}

" Syntastic {{{
let g:lightline.component_expand.syntastic = 'SyntasticStatuslineFlag'
let g:lightline.component_type.syntastic = 'error'

augroup LightlineSyntastic
  autocmd!
  autocmd BufWritePost *.ml,*.mli call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction
" }}}

" Neomake {{{
let g:lightline.component_function.neomake = 'neomake#statusline#LoclistStatus'
let g:lightline.component_type.neomake = 'error'
augroup LightlineNeomake
  autocmd!
  autocmd BufWritePost *.rs,*.tex call lightline#update()
augroup END
" }}}

" Fugitive {{{
let g:lightline.component_function.fugitive = 'LightLineFugitive'
function! LightLineFugitive()
  if exists("*fugitive#head") && ""!=fugitive#head()
    return exists('*fugitive#head') ? 'on '.fugitive#head() : ''
  else
    return ""
  endif
endfunction
" }}}
