function! stl#ctrlp#main(focus, byfname, regex, prev, item, next, marked)
  hi slci guifg=#B48EAD guibg=#4c566a

  return '%#slmd#['.a:focus.']%#sl# %{statusline#name()} '
        \.s:item(a:item, a:prev, a:next)
        \.'%='.s:marked(a:marked)
endfunction

function! s:item(item, prev, next)
  let l:larrow = has('multi_byte') ? '«' : '<'
  let l:rarrow = has('multi_byte') ? '»' : '>'

  return flagship#surround(a:prev.l:larrow.' %#slci#'
        \.s:abbrev(a:item).'%#sl# '
        \.l:rarrow.a:next)
endfunction

function! s:abbrev(var)
  return a:var ==# 'mru files' ? 'mru' :
        \ a:var ==# 'files' ? 'fil' :
        \ a:var ==# 'buffers' ? 'buf' : ''
endfunction

function! s:marked(var)
  return a:var ==# ' <->' ? ' <0>' : a:var
endfunction
