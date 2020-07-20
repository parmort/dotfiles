scriptencoding utf-8

function! custom#statusline#mode()
  let l:modes = {
        \ 'n': 'NORMAL',
        \ 'i': 'INSERT',
        \ 'R': 'REPLCE',
        \ 'v': 'VISUAL',
        \ 'V': 'V-LINE',
        \ '':'V-BLCK',
        \ 'c': 'C-LINE',
        \ 't': ' TERM '
        \ }
  return '[' . (s:netrw() ? 'NETRW' : get(l:modes, mode(), '')) . ']'
endfunction

function! custom#statusline#name()
  return s:helpfile() ? expand('%:t:r') :
        \ s:netrw() ? b:netrw_curdir :
        \ expand('%:t')
endfunction

function! custom#statusline#type()
  return s:helpfile() ? '' :
        \ s:netrw() ? '' :
        \ &filetype
endfunction

function! custom#statusline#mod()
  return s:surround(
        \ s:helpfile() ? 'HLP':
        \ s:netrw() ? '' :
        \ &previewwindow ? 'PRV':
        \ s:ro() ? 'RO' :
        \ &modified ? '+' :
        \ '')
endfunction

function! custom#statusline#ff()
  return &ff !=# 'dos' ? '' : s:surround('DOS') . ' '
endfunction

function! custom#statusline#git()
  if !exists('b:git_dir')
    return ''
  endif

  return s:netrw() ? '' : s:surround(fugitive#Head()) . ' '
endfunction

function! custom#statusline#coc()
  let l:status = trim(get(g:, 'coc_status', ''))
  let l:info = get(b:, 'coc_diagnostic_info', {})
  let l:string = l:info == {} ? l:status :
        \ l:status == '' ? s:coc_errors(l:info) :
        \ l:status . ', ' . s:coc_errors(l:info)
  return l:string == '' ? '' : s:surround(l:string) . ' '
endfunction

function! custom#statusline#obsession()
  return ObsessionStatus() ==# '' ? '' : ObsessionStatus() . ' '
endfunction

function! custom#statusline#spell()
  return &spell == 0 ? '' : s:surround('SPL') . ' '
endfunction

function! s:surround(val)
  if a:val != ''
    return '[' . a:val . ']'
  endif

  return ''
endfunction

function! s:coc_errors(info)
  let l:errors = get(a:info, 'error', 0)
  let l:warnings = get(a:info, 'warning', 0)
  if l:warnings == 0
    let l:string = l:errors == 0 ? '' : 'E' . l:errors
  else
    let l:string = l:errors == 0 ? 'W' . l:warnings :
          \ 'W' . l:warnings . ' E' . l:errors
  endif

  return l:string
endfunction

function! s:helpfile()
  return &filetype =~# '\v(help)'
endfunction

function! s:ro()
  return &readonly || !&modifiable
endfunction

function! s:netrw()
  return &filetype =~# '\v(netrw)'
endfunction
