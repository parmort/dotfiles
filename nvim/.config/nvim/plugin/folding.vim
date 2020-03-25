if !has('folding')
  finish
endif

" Fold lines based on syntax
set foldmethod=syntax

" Don't fold any lines
set foldlevelstart=99

" Set how folds look. See vim/autoload/autoload.vim
set foldtext=custom#misc#foldtext()
