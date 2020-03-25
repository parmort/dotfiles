" File: spell.vim
" Author: S. Numerius <parvus.mortalis@gmail.com>
" Description: Defines a command to turn spellcheck on or off

function! s:ToggleSpell()
  if !&spell
    setlocal spell
    echo 'Turned Spellcheck on'
  else
    setlocal nospell
    echo 'Turned Spellcheck off'
  endif
endfunction

command! SpellToggle call <sid>ToggleSpell()
