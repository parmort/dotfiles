function! s:reload() abort
  lua for k in pairs(package.loaded) do if k:match("^parmort") then package.loaded[k] = nil end end
endfunction

function! s:helptags() abort
  call <SID>reload()
  lua require('parmort.helptags')()
endfunction

command! -nargs=0 FZFHelp call <SID>helptags()
