scriptencoding utf-8

function! statusline#mode()
  let l:modes = {
        \ 'n': 'NORMAL',
        \ 'i': 'INSERT',
        \ 'R': 'REPLCE',
        \ 'v': 'VISUAL',
        \ 'V': 'V-LINE',
        \ '':'V-BLCK',
        \ 'c': 'SEARCH',
        \ }
  return '[' . (s:netrw() ? 'NETRW' : get(l:modes, mode(), '')) . ']'
endfunction

function! statusline#name()
  return s:helpfile() ? expand('%:t:r') :
        \ s:netrw() ? b:netrw_curdir :
        \ expand('%:t')
endfunction

function! statusline#type()
  return s:helpfile() ? '' :
        \ s:netrw() ? '' :
        \ &filetype
endfunction

function! statusline#mod()
  return s:surround(
        \ s:helpfile() ? 'HLP':
        \ s:netrw() ? '' :
        \ &previewwindow ? 'PRV':
        \ s:ro() ? 'RO' :
        \ &modified ? '+' :
        \ '')
endfunction

function! statusline#git()
  if !exists('b:git_dir')
    return ''
  endif

  return s:netrw() ? '' : s:surround(' '.fugitive#Head())
endfunction

function! statusline#err()
  let l:counts = ale#statusline#Count(bufnr(''))
  return l:counts.error + l:counts.style_error
endfunction

function! statusline#warn()
  let l:counts = ale#statusline#Count(bufnr(''))
  return l:counts.total - (l:counts.error + l:counts.style_error)
endfunction

" PRIVATE FUNCS

function! s:surround(val)
  if a:val != ''
    return '[' . a:val . ']'
  endif

  return ''
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
