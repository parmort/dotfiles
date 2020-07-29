if !has('folding')
  finish
endif

" Fold lines based on syntax
set foldmethod=syntax
set foldlevelstart=99
set foldnestmax=1

set foldtext=parmort#misc#foldtext()
