" vim: fdm=marker :
set nocompatible               " Make vim behave like vim, not vi
filetype plugin indent on      " Turn on filetype detection. See ':h filetype'
set hidden                     " Don't quit abandoned buffers
set nowrap                     " Don't wrap lines
set autoindent                 " Copy indent from previous line
set copyindent                 " Copy indent structure (i.e. tabs and spaces)
set bs=eol,start,indent        " Make the backspace behave normally except indent
set clipboard=unnamedplus      " Make vim use the C-c clipboard
set scrolloff=3                " Set scrolloff
set linebreak                  " Wrap lines at `breakat`
setglobal spelllang=en_us      " Spellchecking
set signcolumn=yes

let s:TRUSTED_LOCAL = '.git/safe/../../.vimrc.local'
if filereadable(s:TRUSTED_LOCAL)
  execute "source " . s:TRUSTED_LOCAL
endif

" File Searching {{{{
set path+=**
set wildmenu
set wildignore=*.o,node_modules
" }}}}
" Belloff {{{{
if exists('&belloff')
  set belloff=all " Turn off all error sounds
endif
" }}}}
" Colorcolumn {{{{
if exists('+colorcolumn')
  set cc=81 " Make the colorcolumn appear on column 81
endif
" }}}}
" Numbering {{{{
if exists('+relativenumber')
  set relativenumber " Make fancy line numbers appear
endif
set nu               " Always have the current line number displayed
" }}}}
" Syntax {{{{
if exists('+syntax')
  set cursorline " Make it easier to see current line
endif
syntax enable             " Pretty colors
" }}}}
" Searching {{{{
if has('extra_search')
  set hlsearch " Highlight current search
  set incsearch " Jump to the closest match while typing search
endif
set ignorecase " Search is case-insensitive
" }}}}
" Listchars {{{{
" See `:h listchars`
set list
set listchars=trail:·
set listchars+=tab:»»
set listchars+=nbsp:∅
set listchars+=extends:»
set listchars+=precedes:«
" }}}}
" Indenting {{{{
" Make tabs be 2 characters in width and use spaces
cal parmort#misc#settabspace(2)
set smarttab
set expandtab
set shiftround
" }}}}
" Fillchars {{{{
if has('folding')
  if has('windows')
    set fillchars=vert:┃ " Make the border between vertical windows seamless
  endif
endif
" }}}}
" Shortmess {{{{
" Shortmess `:h 'shortmess'`
set shortmess=filmnrx " Use abbreviations in messages
set shortmess+=I " Don't show the intro message
set shortmess+=A " Don't show the "Attention" swapfile message
" }}}}
" Window splitting {{{{
" Split to the bottom-right instead of top-left
if has('windows')
  set splitbelow
endif

if has('vertsplit')
  set splitright
endif
" }}}}
" Colorscheme {{{{
set background=dark " Give vim a dark background
set termguicolors

let g:one_allow_italics = 1
colorscheme one

call one#highlight('TabLine', '282c34', '3e4452', 'none')
call one#highlight('TabLineSel', '61afef', '282c34', 'none')
call one#highlight('MatchParen', '', '', 'none')

autocmd FileType json syntax match Comment +\/\/.\+$+
" }}}}
" Statusline {{{{
set noshowmode
set laststatus=2

set statusline=
      \%{parmort#statusline#mode()}\ %{parmort#statusline#git()}%{parmort#statusline#name()}\ %{parmort#statusline#ff()}%{parmort#statusline#spell()}%{parmort#statusline#mod()}
      \%=%{parmort#statusline#type()}\ %{parmort#statusline#coc()}%{parmort#statusline#obsession()}
      \[U+%0004.B]\ [%4.l/%4.Lℓ,\ %3.p%%]
" }}}}
" Tabline {{{{
if has('windows')
  set showtabline=2
  set tabline=%!parmort#tabline#line()
endif
" }}}}
" Goyo {{{{
function! s:goyo_enter()
  set wrap
endfunction

function! s:goyo_leave()
  set nowrap
  SourceConf
endfunction

autocmd! User GoyoEnter nested call parmort#goyo#goyo_enter()
autocmd! User GoyoLeave nested call parmort#goyo#goyo_leave()
" }}}}
" vimtex {{{{
let g:vimtex_view_general_viewer = 'zathura'
" }}}}
" Endwise {{{{
let g:endwise_no_mappings = 0
"}}}}
" COC {{{{{
set cmdheight=2
set updatetime=300
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
inoremap <expr> <Plug>CustomCocCR pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
imap <CR> <Plug>CustomCocCR<Plug>DiscretionaryEnd

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation() abort
  if (index(['vim','help','vim.vimrc'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <silent> <space>r <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" }}}}}
" vim-rspec {{{{
let g:rspec_command = "call parmort#misc#runspecs('{spec}')"
" }}}}
" dirvish {{{{
let g:dirvish_mode = ':sort ,^.*[\/],'

let g:dirvish_git_indicators = {
      \ 'Modified': '!',
      \ 'Staged': '+',
      \ 'Untracked': '?',
      \ 'Renamed': '»',
      \ 'Unmerged': '=',
      \ 'Ignored': 'I',
      \ 'Unknown': ''
      \ }
" }}}}
