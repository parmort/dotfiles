scriptencoding utf-8

function! parmort#statusline#mode() abort
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

function! parmort#statusline#name() abort
  return s:helpfile() ? expand('%:t:r') :
        \ s:netrw() ? b:netrw_curdir :
        \ s:dirvish() ? expand('%:.') :
        \ expand('%:t')
endfunction

function! parmort#statusline#type() abort
  return s:helpfile() ? '' :
        \ s:netrw() ? '' :
        \ &filetype
endfunction

function! parmort#statusline#mod() abort
  return s:surround(
        \ s:helpfile() ? 'HLP':
        \ s:netrw() ? '' :
        \ &previewwindow ? 'PRV':
        \ s:ro() ? 'RO' :
        \ &modified ? '+' :
        \ '')
endfunction

function! parmort#statusline#ff() abort
  return &ff !=# 'dos' ? '' : s:surround('DOS') . ' '
endfunction

function! parmort#statusline#git() abort
  if !exists('b:git_dir') || !exists('g:loaded_fugitive')
    return ''
  endif

  return s:netrw() ? '' : s:surround(fugitive#Head()) . ' '
endfunction

function! parmort#statusline#coc() abort
  if !exists('g:coc_enabled')
    return ''
  endif

  let l:status = trim(get(g:, 'coc_status', ''))
  let l:info = get(b:, 'coc_diagnostic_info', {})
  let l:string = l:info == {} ? l:status :
        \ l:status == '' ? s:coc_errors(l:info) :
        \ l:status . ', ' . s:coc_errors(l:info)

  return l:string == '' ? '' : s:surround(l:string) . ' '
endfunction

function! parmort#statusline#obsession() abort
  if !exists('g:loaded_obsession')
    return ''
  endif

  return ObsessionStatus() ==# '' ? '' : ObsessionStatus() . ' '
endfunction

function! parmort#statusline#spell() abort
  return &spell == 0 ? '' : s:surround('SPL') . ' '
endfunction

function! s:surround(val) abort
  if a:val != ''
    return '[' . a:val . ']'
  endif

  return ''
endfunction

function! s:coc_errors(info) abort
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

function! s:helpfile() abort
  return &filetype ==# 'help'
endfunction

function! s:ro() abort
  return &readonly || !&modifiable
endfunction

function! s:netrw() abort
  return &filetype ==# 'netrw'
endfunction

function! s:dirvish() abort
  if !exists('g:loaded_dirvish')
    return v:false
  endif

  return &filetype ==# 'dirvish'
endfunction
