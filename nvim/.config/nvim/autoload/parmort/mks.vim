" mks.vim: A wrapper around the :mksession command
" Maintainer: Nolan Prochnau <parvus.mortalis@gmail.com>

let s:ses_path = "$HOME/.cache/nvim/sessions/"
if exists("g:ses_path")
  let s:ses_path = g:ses_path
endif

if !exists("s:ses_file")
  let s:ses_file = ""
endif

function! parmort#mks#mkses(ses_file, bang)
  if exists("g:loaded_obsession")
    echo execute("Obsession " . s:ses_path . a:ses_file)
  else
    call s:mkses(a:ses_file, a:bang)
  endif
endfunction

function! parmort#mks#rmses(ses_file)
  if exists("g:loaded_obsession") && a:ses_file ==# ""
    echo execute("Obsession!")
  else
    execute "silent" "!rm " . s:ses_path . a:ses_file

    if v:shell_error
      echo "Could not delete file: " . a:ses_file
    endif
  endif
endfunction

function! parmort#mks#complete(A,L,P)
  return systemlist("ls " . s:ses_path)
endfunction

function! s:mkses(ses_file, bang)
  let l:cmd = "mksession"

  " If the a:ses_file is empty, use the current s:ses_file
  let s:ses_file = a:ses_file !=# "" ?
        \ s:ses_path . a:ses_file :
        \ execute("pwd") . "Session.vim"

  if a:bang
    let l:cmd = "mksession!"
  endif

  echo l:cmd . " " . s:ses_file
  execute l:cmd . " " . s:ses_file
endfunction
