" Move param to instance variable
nnoremap <buffer> <CR>i yiwo@<Esc>pa = <Esc>p

" Run tests
nnoremap <buffer> <CR>T :!clear<CR>:call RunCurrentSpecFile()<CR>
nnoremap <buffer> <CR>a :!clear<CR>:call RunAllSpecs()<CR>
nnoremap <buffer> <CR>t :!clear<CR>:call RunNearestSpec()<CR>
