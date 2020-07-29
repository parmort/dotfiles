set background=dark
set termguicolors

let g:one_allow_italics = 1
colorscheme one

call one#highlight('TabLine', '282c34', '3e4452', 'none')
call one#highlight('TabLineSel', '61afef', '282c34', 'none')
call one#highlight('MatchParen', '', '', 'none')
call one#highlight('VertSplit', '3e4452', '282c34', 'none')

autocmd FileType json syntax match Comment +\/\/.\+$+
