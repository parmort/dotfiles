" leaner/simpler clone of the built-in tabline, but without the window
" counts, the modified flag, or the close widget.
function! parmort#tabline#line() abort
  let l:line=''
  let l:current=tabpagenr()

  for l:i in range(1, tabpagenr('$'))
    if l:i == l:current
      let l:hig='%#TabLineSel#'
      let l:labg='%3*'
    else
      let l:hig='%#TabLine#'
      let l:labg='%2*'
    end
    let l:line.=l:hig
    let l:line.='%' . i . 'T' " Starts mouse click target region.
    let l:line.=' '.l:labg.i.' '.l:hig.'%{parmort#tabline#label(' . i . ')} '
  endfor

  let l:line.='%#TabLineFill#'
  let l:line.='%T' " Ends mouse click target region(s).
  return l:line
endfunction

function! parmort#tabline#label(n) abort
  let l:buflist=tabpagebuflist(a:n)
  let l:winnr=tabpagewinnr(a:n)
  let l:content=s:content(bufname(buflist[winnr - 1]))

  if getbufinfo(buflist[winnr-1])[0]['changed']
    let l:content .= " ●"
  end

  return l:content
endfunction

function! s:content(bufname) abort
  if a:bufname == ''
    let l:content = fnamemodify(a:bufname, ':~:.')
  else
    let l:content = fnamemodify(a:bufname, ':t')
  endif

  return pathshorten(l:content)
endfunction
