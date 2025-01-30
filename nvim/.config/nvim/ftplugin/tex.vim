call deoplete#enable()
compiler tex
let &makeprg = 'pdflatex -interaction=nonstopmode %:r'

setlocal conceallevel=0
lcd %:h

nnoremap <localleader>v <cmd>!xdg-open %:r.pdf &<CR>

if exists("g:loaded_dispatch")
  nnoremap <localleader>b <cmd>Dispatch biber %:r<CR>
else
  nnoremap <localleader>b <cmd>!biber %:r<CR>
endif
