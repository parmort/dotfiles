function! s:helptags() abort
  lua package.loaded['parmort.helptags'] = nil
  lua require('parmort.helptags')()
endfunction

command! -nargs=0 FZFHelp call <SID>helptags()
