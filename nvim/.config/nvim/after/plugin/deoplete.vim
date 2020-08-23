if !exists('g:loaded_deoplete')
  finish
endif

let deoplete#enable_at_startup = 1
call deoplete#enable()
