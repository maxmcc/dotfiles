function! CoquilleKeybindings()
  map <buffer> <silent> <F7> :CoqUndo<CR>
  map <buffer> <silent> <F8> :CoqNext<CR>
  map <buffer> <silent> <F9> :CoqToCursor<CR>

  imap <buffer> <silent> <F7> <C-\><C-o>:CoqUndo<CR>
  imap <buffer> <silent> <F8> <C-\><C-o>:CoqNext<CR>
  imap <buffer> <silent> <F9> <C-\><C-o>:CoqToCursor<CR>
endfunction

let g:coquille_auto_move = 'true'
call CoquilleKeybindings()
highlight CheckedByCoq ctermbg=17 guibg=LightGreen
highlight SentToCoq ctermbg=60 guibg=LimeGreen
