if !has('folding')
  finish
endif

" Fold lines based on syntax
set foldmethod=syntax

" Don't fold any lines
set foldlevelstart=99

" Don't nest folds
set foldnestmax=1

" Set how folds look. See vim/autoload/autoload.vim
set foldtext=parmort#misc#foldtext()
