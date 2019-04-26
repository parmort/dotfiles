if !exists('g:loaded_dispatch')
  finish
endif

aug dispatch
  au!
  au! BufRead .Xresources let b:dispatch = 'xrdb ~/.Xresources'
aug end

nnoremap <CR>d :Dispatch<CR>
nnoremap <CR>D :Dispatch!<CR>
