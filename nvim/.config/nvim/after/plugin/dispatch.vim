if !exists('g:loaded_dispatch')
  finish
endif

augroup dispatch
  au!
  autocmd! BufRead .Xresources let b:dispatch = 'xrdb ~/.Xresources'
augroup end
