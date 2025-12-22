compiler tex

setlocal conceallevel=0
setlocal autocomplete
setlocal complete=o
lcd %:h

nnoremap <localleader>v <cmd>!xdg-open %:r.pdf &<CR>
