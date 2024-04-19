call deoplete#enable()
compiler tex
let &makeprg = 'pdflatex -interaction=nonstopmode %:r'
      " \.' && biber %:r'
      " \.' && pdflatex -interaction=nonstopmode %:r'

nnoremap <localleader>v <cmd>!xdg-open %:r.pdf &<CR>
