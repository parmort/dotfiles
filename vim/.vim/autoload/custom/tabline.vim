" leaner/simpler clone of the built-in tabline, but without the window
" counts, the modified flag, or the close widget.
function custom#tabline#line() abort
  let l:line=''
  let l:current=tabpagenr()
  for l:i in range(1, tabpagenr('$'))
    if l:i == l:current
      let l:line.='%#TabLineSel#'
    else
      let l:line.='%#TabLine#'
    end
    let l:line.='%' . i . 'T' " Starts mouse click target region.
    let l:line.=' %{custom#tabline#label(' . i . ')} '
  endfor
  let l:line.='%#TabLineFill#'
  let l:line.='%T' " Ends mouse click target region(s).
  return l:line
endfunction

function custom#tabline#label(n) abort
  let l:buflist=tabpagebuflist(a:n)
  let l:winnr=tabpagewinnr(a:n)
  let l:content=s:content(bufname(buflist[winnr - 1]))

  return a:n.' '.l:content
endfunction

function s:content(bufname) abort
  if a:bufname == ''
    let l:content = fnamemodify(a:bufname, ':~:.')
  else
    let l:content = fnamemodify(a:bufname, ':t')
  endif

  return pathshorten(l:content)
endfunction
