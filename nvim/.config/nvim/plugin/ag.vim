if !executable('ag')
  finish
endif

set grepprg=ag\ --nogroup\ --nocolor\ --hidden

" Search for word under cursor
nnoremap U :grep! "\b<C-r><C-w>\b"<CR>:cw<CR>
