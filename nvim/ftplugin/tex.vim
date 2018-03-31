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

