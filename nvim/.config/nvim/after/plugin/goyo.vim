if !exists(':Goyo')
  finish
endif

function! s:goyo_enter() abort
  set wrap
endfunction

function! s:goyo_leave() abort
  set nowrap
  SourceConf
endfunction

autocmd! User GoyoEnter nested call parmort#goyo#goyo_enter()
autocmd! User GoyoLeave nested call parmort#goyo#goyo_leave()
