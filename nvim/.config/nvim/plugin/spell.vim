" File: spell.vim
" Author: N. Prochnau <parvus.mortalis@gmail.com>
" Description: Defines a command to turn spellcheck on or off

function! s:ToggleSpell()
  let &spell = !&spell
endfunction

command! SpellToggle call <sid>ToggleSpell()
