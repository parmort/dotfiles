compiler tsc

nnoremap <buffer> gq :silent !prettier --write %<CR>:e<CR>
nnoremap <buffer> <localleader>i O// prettier-ignore<esc>
nnoremap <buffer> <localleader>s <cmd>!yarn start<CR>
