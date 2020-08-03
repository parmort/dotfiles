function! s:helptags() abort
  let l:spec = { 'sink': 'help',
        \ 'source': luaeval("require('helptags').helptags()") }
  call fzf#run(fzf#wrap(l:spec))
endfunction

command! -nargs=0 FZFHelp call <SID>helptags()
