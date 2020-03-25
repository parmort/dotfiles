" mks.vim: A wrapper around the :mksession command
" Maintainer: Nolan Prochnau <parvus.mortalis@gmail.com>

let s:ses_path = "$HOME/.vim/sessions/"
if exists("g:ses_path")
  let s:ses_path = g:ses_path
endif

if !exists("s:ses_file")
  let s:ses_file = ""
endif

function! custom#mks#mkses(ses_file, bang)
  let l:cmd = "mksession"

  let s:ses_file = a:ses_file !=# "" ?
        \ s:ses_path . a:ses_file :
        \ s:ses_file

  if a:bang
    let l:cmd = "mksession!"
  endif

  echo l:cmd . " " . s:ses_file
  execute l:cmd . " " . s:ses_file
endfunction

function! custom#mks#rmses(ses_title)
  execute "silent" "!rm " . s:ses_path . a:ses_title

  if v:shell_error
    echo "Could not delete file: " . a:ses_title
  endif
endfunction

function! custom#mks#complete(A,L,P)
  return systemlist("ls ".s:ses_path)
endfunction
