set background=dark
set termguicolors

" Must come before colorscheme declaration
" Colorscheme autocmd fired after colorscheme loads
augroup colorschemes
  au!
  autocmd Colorscheme one call one#highlight('TabLine', '282c34', '3e4452', 'none')
  autocmd Colorscheme one call one#highlight('TabLineSel', '61afef', '282c34', 'none')
  autocmd Colorscheme one call one#highlight('MatchParen', '', '', 'none')
  autocmd Colorscheme one call one#highlight('VertSplit', '3e4452', '282c34', 'none')
augroup END

let g:one_allow_italics = 1
colorscheme one

autocmd colorschemes FileType json syntax match Comment +\/\/.\+$+
