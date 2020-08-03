if !exists(':Goyo')
  finish
endif

autocmd! User GoyoEnter nested call parmort#goyo#goyo_enter()
autocmd! User GoyoLeave nested call parmort#goyo#goyo_leave()
