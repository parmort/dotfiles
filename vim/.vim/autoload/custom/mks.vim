" mks.vim: A wrapper around the :mksession command
" Maintainer: Nolan Prochnau <parvus.mortalis@gmail.com>

let s:ses_path = "$HOME/.vim/sessions/"
if exists("g:ses_path")
  let s:ses_path = g:ses_path
endif

function! custom#mks#mkses(ses_title)
  execute "mksession " . s:ses_path . a:ses_title
endfunction

function! custom#mks#rmses(ses_title)
  execute "silent" "!rm " . s:ses_path . a:ses_title

  if v:shell_error
    echo "Could not delete file: " . a:ses_title
  endif
endfunction

function! custom#mks#ldses(ses_title)
  execute "source " . s:ses_path . a:ses_title
endfunction

function! custom#mks#complete(A,L,P)
  return systemlist("ls ".s:ses_path)
endfunction
