" File: spell.vim
" Author: S. Numerius <parvus.mortalis@gmail.com>
" Description: Defines a command to turn spellcheck on or off

function! s:ToggleSpell()
  if b:isSpell == 0
    setlocal spell
    let b:isSpell = 1
    echo 'Turned Spellcheck on'
  else
    setlocal nospell
    let b:isSpell = 0
    echo 'Turned Spellcheck off'
  endif
endfunction

function! s:SpellBuf(file)
  if a:file == 'quickfix'
    echo ''
  else
    call setbufvar(a:file, 'isSpell', 0)
  endif
endfunction

augroup SpellGroup
  au!
  au BufRead,BufNewFile,VimEnter * call <sid>SpellBuf(expand('<afile>'))
augroup END

command! SpellToggle call <sid>ToggleSpell()
