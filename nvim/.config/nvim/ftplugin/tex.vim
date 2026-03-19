compiler tex

setlocal conceallevel=0
setlocal autocomplete
setlocal complete=o
lcd %:h

" Can use `vim.ui.open` in lua (or :Open)
nnoremap <localleader>v <cmd>!xdg-open %:r.pdf &<CR>
