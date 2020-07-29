if !exists('g:coc_enabled')
  finish
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation() abort
  if (index(['vim','help','vim.vimrc'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

nnoremap <silent> K :call <SID>show_documentation()<CR>

" HACK: Fixes https://github.com/tpope/vim-endwise/issues/22
inoremap <expr> <Plug>CustomCocCR pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
if exists('g:loaded_endwise')
  imap <CR> <Plug>CustomCocCR<Plug>DiscretionaryEnd
else
  imap <CR> <Plug>CustomCocCR
endif

nmap <silent> gd <Plug>(coc-definition)

" Remap for rename current word
nmap <silent> <leader>r <Plug>(coc-rename)

augroup coc_config
  autocmd!

  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')
augroup end
