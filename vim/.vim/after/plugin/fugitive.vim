if !exists('g:loaded_fugitive')
  finish
endif

nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gu :Gpushup<CR>
