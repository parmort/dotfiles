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
  " Gets the background of the 'CursorLine' group
  let l:cursorLineBG = synIDattr(synIDtrans(hlID('CursorLine')), 'bg')

  highlight Comment gui=italic

  highlight clear Visual
  highlight link Visual CursorLine

  highlight link vimUserFunc Function

  " Tabline
  call s:hi('TabLine', '#999872', '#565656', 'none')
  call s:hi('TabLineSel', 'fg', 'bg', 'bold')
  call s:hi('User3', '#be7572', 'bg', 'bold')
endfunction

function! s:SeoulColorsPre()
  if !exists('g:seoul256_background')
    " Darker background, default 237
    let g:seoul256_background = 236
  endif
endfunction

" Must come before colorscheme declaration
" Colorscheme autocmd fired after colorscheme loads
augroup colorschemes
  au!
  autocmd ColorScheme one call <SID>OneColors()
  autocmd ColorSchemePre one call <SID>OneColorsPre()

  autocmd ColorScheme seoul256 call <SID>SeoulColors()
  autocmd ColorSchemePre seoul256 call <SID>SeoulColorsPre()
augroup END

colorscheme seoul256

autocmd colorschemes FileType json syntax match Comment +\/\/.\+$+
