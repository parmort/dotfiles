set background=dark
set termguicolors

function! s:hi(grp, fg, bg, attr)
  let l:cmd = 'highlight '.a:grp

  if a:fg != ''
    let l:cmd .= ' guifg='.a:fg
  endif

  if a:bg != ''
    let l:cmd .= ' guibg='.a:bg
  endif

  if a:attr != ''
    let l:cmd .= ' gui='.a:attr
  endif

  execute l:cmd
endfunction

function! s:link(a, b)
  execute 'highlight link '.a:a.' '.a:b
endfunction

function! s:OneColors()
  call one#highlight('TabLine', '282c34', '3e4452', 'none')
  call one#highlight('TabLineSel', '61afef', '282c34', 'none')
  call one#highlight('MatchParen', '', '', 'none')
  call one#highlight('VertSplit', '3e4452', '282c34', 'none')
endfunction

function! s:OneColorsPre()
  if !exists('g:one_allow_italics')
    let g:one_allow_italics = 1
  endif
endfunction

function! s:SeoulColors()
  highlight Comment gui=italic

  highlight clear Visual
  highlight link Visual CursorLine

  highlight link vimUserFunc Function

  " Tabline
  call s:hi('TabLine', '#999872', '#565656', 'none')
  call s:hi('TabLineSel', 'fg', 'bg', 'bold')
  call s:hi('User3', '#be7572', 'bg', 'bold')

  " Statusline
  call s:hi('User4', '#9a7372', '#dfdebd', 'bold,reverse,italic')
endfunction

function! s:SeoulColorsPre()
  if !exists('g:seoul256_background')
    " Darker background, default 237
    let g:seoul256_background = 236
  endif
endfunction

function! s:NordColors()
  let l:nord0 = "#2E3440"
  let l:nord1 = "#3B4252"
  let l:nord2 = "#434C5E"
  let l:nord3 = "#4C566A"
  let l:nord4 = "#D8DEE9"
  let l:nord5 = "#E5E9F0"
  let l:nord6 = "#ECEFF4"
  let l:nord7 = "#8FBCBB"
  let l:nord8 = "#88C0D0"
  let l:nord9 = "#81A1C1"
  let l:nord10 = "#5E81AC"
  let l:nord11 = "#BF616A"
  let l:nord12 = "#D08770"
  let l:nord13 = "#EBCB8B"
  let l:nord14 = "#A3BE8C"
  let l:nord15 = "#B48EAD"

  " Tabline
  call s:hi('TabLine', l:nord10, l:nord1, 'italic')
  call s:hi('TabLineSel', 'fg', 'bg', 'bold')
  call s:hi('User3', l:nord8, 'bg', 'bold')
  call s:hi('User2', l:nord9, l:nord1, 'none')

  " Statusline
  call s:hi('Statusline', l:nord6, l:nord3, 'none')
  call s:hi('StatuslineNC', l:nord9, l:nord1, 'none')
  call s:hi('User4', 'fg', l:nord3, 'italic')

  " Fold Text
  call s:hi('Folded', l:nord10, l:nord1, 'italic')

  " Ledger
  call s:link('ledgerTransactionMetadata', 'Comment')
endfunction

function! s:NordColorsPre()
  let g:nord_cursor_line_number_background = 1
  let g:nord_italic = 1
  let g:nord_italic_comments = 1
endfunction

" Must come before colorscheme declaration
" Colorscheme autocmd fired after colorscheme loads
augroup colorschemes
  au!
  autocmd ColorScheme one call <SID>OneColors()
  autocmd ColorSchemePre one call <SID>OneColorsPre()

  autocmd ColorScheme seoul256 call <SID>SeoulColors()
  autocmd ColorSchemePre seoul256 call <SID>SeoulColorsPre()

  autocmd ColorScheme nord call <SID>NordColors()
  autocmd ColorSchemePre nord call <SID>NordColorsPre()
augroup END

colorscheme nord

autocmd colorschemes FileType json syntax match Comment +\/\/.\+$+
