scriptencoding utf-8

let s:middot='·'
let s:raquo='»'
let s:small_l='ℓ'

function! parmort#foldtext() abort
  let l:lines='[' . (v:foldend - v:foldstart + 1) . s:small_l . ']'
  let l:first=substitute(getline(v:foldstart), '\v *', '', '')
  let l:dashes=substitute(v:folddashes, '-', s:middot, 'g')
  return s:raquo . l:dashes . l:lines . ': ' . l:first
endfunction

function! parmort#groot()
  let root = systemlist('git rev-parse --show-toplevel')[0]
  if v:shell_error
    echo 'Not in git repo'
  else
    execute  'lcd' root
    echo 'Changed directory to: ' . root
  endif
endfunction

function! parmort#focusline()
  if &foldmethod ==# 'marker'
    execute "keepjumps normal! zMzvzz"
  endif
endfunction

function! parmort#sourceConf()
  let l:pos = getcurpos()
  update
  so $MYVIMRC
  try
    edit
    call setpos('.', pos)
    call parmort#focusline()
  catch /E32/
  endtry
endfunction

function! parmort#runspecs(spec)
  execute 'tabnew | terminal rspec '.a:spec
  execute feedkeys('\<c-\>\<c-n>')
endfunction

function! parmort#settabspace(spc)
  exe 'set tabstop='.a:spc
  exe 'set softtabstop='.a:spc
  exe 'set shiftwidth='.a:spc
endfunction

function! parmort#nunmap(key)
  try
    exec "nunmap ".a:key
  catch /E31/
  endtry
endfunction
