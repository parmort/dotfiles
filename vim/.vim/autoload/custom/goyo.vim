function! custom#goyo#goyo_enter()
  setl wrap
  setl nocursorline
  setl spell
  nnoremap j gj
  nnoremap k gk
  Limelight
  call deoplete#disable()
  silent call AutoPairsToggle()
endfunction

function! custom#goyo#goyo_leave()
  setl nowrap
  setl cursorline
  setl nospell
  Limelight!
  unmap j
  unmap k
  so ~/.vimrc
  call deoplete#enable()
  silent call AutoPairsToggle()
endfunction
