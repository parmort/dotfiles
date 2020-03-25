scriptencoding utf-8

let s:middot='·'
let s:raquo='»'
let s:small_l='ℓ'

function! custom#misc#foldtext() abort
  let l:lines='[' . (v:foldend - v:foldstart + 1) . s:small_l . ']'
  let l:first=substitute(getline(v:foldstart), '\v *', '', '')
  let l:dashes=substitute(v:folddashes, '-', s:middot, 'g')
  return s:raquo . l:dashes . l:lines . ': ' . l:first
endfunction

function! custom#misc#groot()
  let root = systemlist('git rev-parse --show-toplevel')[0]
  if v:shell_error
    echo 'Not in git repo'
  else
    execute  'lcd' root
    echo 'Changed directory to: ' . root
  endif
endfunction

function! custom#misc#focusline()
  if &foldmethod ==# 'marker'
    execute "keepjumps normal! zMzvzz"
  endif
endfunction

function! custom#misc#sourceConf()
  let l:pos = getcurpos()
  update
  so $MYVIMRC
  try
    edit
    call setpos('.', pos)
    call custom#misc#focusline()
  catch /E32/
  endtry
endfunction

function! custom#misc#runspecs(spec)
  execute 'tabnew | terminal rspec '.a:spec
  execute feedkeys('\<c-\>\<c-n>')
endfunction

function! custom#misc#settabspace(spc)
  exe 'set tabstop='.a:spc
  exe 'set softtabstop='.a:spc
  exe 'set shiftwidth='.a:spc
endfunction

function! custom#misc#nunmap(key)
  try
    exec "nunmap ".a:key
  catch /E31/
  endtry
endfunction
