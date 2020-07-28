function! parmort#goyo#goyo_enter()
  setl wrap
  setl nocursorline
  setl spell
  if !exists('g:loaded_flashy') || !g:inFlashy
    nnoremap j gj
    nnoremap k gk
  endif
  Limelight
  CocDisable
endfunction

function! parmort#goyo#goyo_leave()
  setl nowrap
  setl cursorline
  setl nospell
  Limelight!
  if !exists('g:loaded_flashy') || !g:inFlashy
    unmap j
    unmap k
  endif
  CocEnable
endfunction
