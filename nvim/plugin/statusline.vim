" Status line configuration

" Vim configuration {{{
set laststatus=2                         " Last window always has status line
set noshowmode                           " Don't show '-- INSERT --' etc.
" }}}

" Lightline configuration {{{

let g:lightline = {}
let g:lightline.component = {}
let g:lightline.component_type = {}
let g:lightline.component_expand = {}
let g:lightline.component_function = {}
let g:lightline.component_visible_condition = {}
" }}}

" Appearance {{{
let g:lightline.colorscheme = 'hybrid'
let g:lightline.subseparator = { 'left' : '', 'right': '·' }
" }}}

" Active frame statusline {{{
let g:lightline.active = {}
let g:lightline.active.left =
      \ [['mode', 'paste'],
      \  ['filename', 'modified'],
      \  ['readonly', 'fugitive']]
let g:lightline.active.right =
      \ [['lineinfo'],
      \  ['percent'],
      \  ['filetype', 'fileencoding'],
      \  ['cocinfo', 'cocerrors', 'cocwarnings']]
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

" CoC {{{
function! LightLineCoCWarnings() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    if get(info, 'warning', 0)
        return info['warning'] . ' warn'
    else
        return ''
    endif
endfunction

function! LightLineCoCErrors() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    if get(info, 'error', 0)
        return info['error'] . ' err'
    else
        return ''
    endif
endfunction

function! LightLineCoCInfo() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    return get(g:, 'coc_status', '')
endfunction

let g:lightline.component_expand.cocwarnings = 'LightLineCoCWarnings'
let g:lightline.component_type.cocwarnings = 'warning'

let g:lightline.component_expand.cocerrors = 'LightLineCoCErrors'
let g:lightline.component_type.cocerrors = 'error'

let g:lightline.component_expand.cocinfo = 'LightLineCoCInfo'

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
" }}}
