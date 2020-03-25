if !executable('ag')
  finish
endif

command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

set grepprg=ag\ --nogroup\ --nocolor\ --hidden
let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'

nnoremap U :grep! "\b<C-r><C-w>\b"<CR>:cw<CR>
