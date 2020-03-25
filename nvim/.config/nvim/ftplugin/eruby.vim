let b:coc_pairs = [["<%", "%>"]]
let b:coc_pairs += ["<%=", "%>"]

" Run tests
nnoremap <buffer> <CR>t :!clear<CR>:call RunCurrentSpecFile()<CR>
nnoremap <buffer> <CR>a :!clear<CR>:call RunAllSpecs()<CR>
nnoremap <buffer> <CR>s :!clear<CR>:call RunNearestSpec()<CR>

" Insert `<% end %>` on a new line
nnoremap <buffer> <silent> <CR>e mmo<% end %><esc>`m:delmarks m<CR>
