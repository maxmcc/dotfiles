function! UpdateSkim(status)
  if !a:status | return | endif

  let l:out = b:vimtex.out()
  let l:cmd = [g:vimtex_view_general_viewer, '-r']
  if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
  endif
  if has('nvim')
    call jobstart(l:cmd + [line('.'), l:out])
  elseif has('job')
    call job_start(l:cmd + [line('.'), l:out])
  else
    call system(join(l:cmd + [line('.'), shellescape(l:out)], ' '))
  endif
endfunction

let g:vimtex_latexmk_build_dir='./build'
let g:tex_flavor='latex'
let g:vimtex_latexmk_options='-xelatex -shell-escape -pdf'
let g:vimtex_quickfix_ignored_warnings = [
      \ 'Underfull',
      \ 'Overfull',
      \ 'specifier changed to',
      \ ]

let g:vimtex_syntax_minted = [
      \ {'lang': 'ocaml'},
      \ {'lang': 'haskell'},
      \ {'lang' : 'c'},
      \]

let g:vimtex_view_general_viewer
      \ = 'displayline'
let g:vimtex_view_general_options = '-r @line @pdf'

" This adds a callback hook that updates Skim after compilation
let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
