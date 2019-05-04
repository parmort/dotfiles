if !has('folding')
  finish
endif

" Automatically fold lines that have the same indent value
set foldmethod=indent

" Don't fold any lines
set foldlevelstart=99

" Set how folds look. See vim/autoload/autoload.vim
set foldtext=custom#misc#foldtext()
