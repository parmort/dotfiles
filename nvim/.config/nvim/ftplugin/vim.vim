setlocal iskeyword-=#

try
  let b:AutoPairs = deepcopy(g:AutoPairs)
  call remove(b:AutoPairs, '"')
catch
endtry

nnoremap <buffer> <localleader>s :source %<CR>
