function! parmort#goyo#goyo_enter()
  setl wrap
  setl nocursorline

  if !exists('g:loaded_flashy') || !g:inFlashy
    nnoremap j gj
    nnoremap k gk
  endif

  if &filetype != 'gitcommit'
    Limelight
    setl spell
  endif
endfunction

function! parmort#goyo#goyo_leave()
  setl nowrap
  setl cursorline

  if !exists('g:loaded_flashy') || !g:inFlashy
    unmap j
    unmap k
  endif

  if &filetype != 'gitcommit'
    Limelight!
    setl nospell
  endif
endfunction
