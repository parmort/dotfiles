function! s:Config()
  nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
  nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<CR>
endfunction

augroup CustomLanguageClientAutocmds
  autocmd!
  autocmd FileType * call s:Config()
augroup END
