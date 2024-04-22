scriptencoding utf-8

let s:middot='·'
let s:raquo='»'
let s:small_l='ℓ'

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

function! parmort#nunmap(key)
  try
    exec "nunmap ".a:key
  catch /E31/
  endtry
endfunction

function! parmort#traverse(file) abort
  let l:path=fnamemodify(expand('%') || getcwd(), ':p')

  while 1
    let l:candidate=l:path . '/' . a:file

    if filereadable(l:candidate)
      return l:candidate
    elseif l:path == '' || l:path =='/'
      return ''
    endif

    let l:path=fnamemodify(l:path, ':h')
  endwhile
endfunction
