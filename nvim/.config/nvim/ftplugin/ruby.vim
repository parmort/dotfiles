let g:rspec_command = 'compiler rspec | Make {spec}'

" Move param to instance variable
nnoremap <buffer> <localleader>i yiwo@<Esc>pa = <Esc>p

" Run tests
nnoremap <buffer> <localleader>T :call RunCurrentSpecFile()<CR>
nnoremap <buffer> <localleader>a :call RunAllSpecs()<CR>
nnoremap <buffer> <localleader>t :call RunNearestSpec()<CR>

" Delete comments (I think, regexp is hard. I copied from interwebs)
nnoremap <silent> <localleader>c :%s/^[	\ ]*#[\ \n].*//g<CR>:%s/^\n//g<CR>:nohl<CR>gg
