scriptencoding utf-8

let s:middot='·'
let s:raquo='»'
let s:small_l='ℓ'

function! autoload#foldtext() abort
  let l:lines='[' . (v:foldend - v:foldstart + 1) . s:small_l . ']'
  let l:first=substitute(getline(v:foldstart), '\v *', '', '')
  let l:dashes=substitute(v:folddashes, '-', s:middot, 'g')
  return s:raquo . l:dashes . l:lines . ': ' . l:first
endfunction

function! autoload#groot()
  let root = systemlist('git rev-parse --show-toplevel')[0]
  if v:shell_error
    echo 'Not in git repo'
  else
    execute  'lcd' root
    echo 'Changed directory to: ' . root
  endif
endfunction

function! autoload#focusline()
  if &foldmethod ==# 'marker'
    execute "keepjumps normal! zMzvzz"
  endif
endfunction

function! autoload#sourceConf()
  let l:pos = getcurpos()
  update
  so ~/.vimrc
  edit
  call setpos('.', pos)
  call autoload#focusline()
endfunction

function! autoload#projectFile()
  let l:fname = '~/.projects'
  let l:buf = bufwinnr(l:fname)
  if l:buf ==? -1
    execute 'vsp '.l:fname
  else
    execute 'buffer '.l:buf
    write
    execute 'bdelete '.l:fname
  endif
endfunction

function! autoload#runspecs(spec)
  execute 'tabnew | terminal rspec '.a:spec
  execute feedkeys('\<c-\>\<c-n>')
endfunction

function! autoload#settabspace(spc)
  exe 'set tabstop='.a:spc
  exe 'set softtabstop='.a:spc
  exe 'set shiftwidth='.a:spc
endfunction
