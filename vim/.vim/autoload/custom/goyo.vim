function! custom#goyo#goyo_enter()
  setl wrap
  setl nocursorline
  setl spell
  nnoremap j gj
  nnoremap k gk
  Limelight
  CocDisable
endfunction

function! custom#goyo#goyo_leave()
  setl nowrap
  setl cursorline
  setl nospell
  Limelight!
  unmap j
  unmap k
  cal custom#misc#sourceConf()
  CocEnable
endfunction
