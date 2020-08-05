set background=dark
set termguicolors

function! s:link(group, link_to) abort
  execute 'highlight clear '.a:group
  execute 'highlight link '.a:group.' '.a:link_to
endfunction

" Must come before colorscheme declaration
" Colorscheme autocmd fired after colorscheme loads
augroup custom_colors
  au!
  autocmd Colorscheme one call one#highlight('TabLine', '282c34', '3e4452', 'none')
  autocmd Colorscheme one call one#highlight('TabLineSel', '61afef', '282c34', 'none')
  autocmd Colorscheme one call one#highlight('MatchParen', '', '', 'none')
  autocmd Colorscheme one call one#highlight('VertSplit', '3e4452', '282c34', 'none')
  autocmd Colorscheme one call one#highlight('CocErrorSign', 'b35046', '', 'none')
  autocmd Colorscheme one call one#highlight('CocWarningSign', 'e5c07b', '', 'none')
  autocmd Colorscheme one call <SID>link('CocInfoSign', 'CocWarningSign')
augroup END

let g:one_allow_italics = 1
colorscheme one

autocmd FileType json syntax match Comment +\/\/.\+$+
