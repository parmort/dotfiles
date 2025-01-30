setlocal nonumber
setlocal norelativenumber
setlocal signcolumn=yes

nnoremap <buffer> % :e %
nnoremap <buffer> <leader>d :Mkdir %
nnoremap <buffer> <leader>c <cmd>cd%<bar>pwd<CR>

if environ()['TERM'] == 'tmux-256color'
  nnoremap <c-f> <cmd>!tmux splitw -h lf %<CR>
else
  nnoremap <c-f> <cmd>!$TERMINAL lf % &<CR>
endif
