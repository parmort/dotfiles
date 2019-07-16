" File: vimrc
" Author: S. Numerius <parvus.mortalis@gmail.com>

" Preamble -------------------------------------------------------- {{{

" Use Unicode characters. Has to be at the top of the file.
" The order of these commands are important.
if has('multi_byte')
  set encoding=utf-8
  scriptencoding utf-8
  setglobal fileencodings=utf-8
endif

" }}}
" Vim-Plug -------------------------------------------------------- {{{
call plug#begin('~/.vim/plugged')
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'chriskempson/base16-vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'ledger/vim-ledger', { 'for': 'ledger' }
  Plug 'lervag/vimtex', { 'for': 'tex' }
  Plug 'mustache/vim-mustache-handlebars' ", { 'for':  }
  Plug 'parmort/vim-factorybot', { 'on': 'Efactory' }
  Plug 'parmort/vim-audit'
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'PotatoesMaster/i3-vim-syntax'
  Plug 'romainl/vim-cool'
  Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
  Plug 'tpope/vim-bundler'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-ragtag'
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-rsi'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-vinegar'
  Plug 'vimoutliner/vimoutliner', { 'for': 'votl' }
  Plug 'vimwiki/vimwiki'
  Plug 'w0rp/ale'
  Plug 'wincent/command-t', {
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }

  " Colorscheme
  Plug 'nanotech/jellybeans.vim'

  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/neco-vim', { 'for': 'vim' }
    Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript' }
    Plug 'tbodt/deoplete-tabnine', { 'for': 'ruby', 'do': './install.sh' }
  endif
call plug#end()
" }}}
" Settings ------------------------------------------------------- {{{

set nocompatible               " Make vim behave like vim, not vi
filetype plugin indent on      " Turn on filetype detection. See ':h filetype'
set hidden                     " Don't quit abandoned buffers
set nowrap                     " Don't wrap lines
set autoindent                 " Copy indent from previous line
set copyindent                 " Copy indent structure (i.e. tabs and spaces)
set lazyredraw                 " Only redraw the screen when no user input occurs
set bs=eol,start               " Make the backspace behave normally except indent
set clipboard=unnamedplus      " Make vim use the C-c clipboard
set scrolloff=3                " Set scrolloff
set linebreak                  " Wrap lines at `breakat`
setglobal spelllang=en_us      " Spellchecking

" File Searching {{{{
set path+=**
set wildmenu
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
cal custom#misc#settabspace(2)
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
" Statusline {{{{
set noshowmode
set laststatus=2
function! s:statusline() abort
  call Base16hi("User1", g:base16_gui0C, g:base16_gui02, g:base16_cterm0C, g:base16_cterm02)
  call Base16hi("User2", g:base16_gui08, g:base16_gui02, g:base16_cterm08, g:base16_cterm02)
  call Base16hi("User3", g:base16_gui0A, g:base16_gui02, g:base16_cterm0A, g:base16_cterm02)
endfunction
set statusline=
      \%1*%{custom#statusline#mode()}\ %*%{custom#statusline#git()}%{custom#statusline#name()}\ %{custom#statusline#mod()}
      \%=%{custom#statusline#type()}\ [%2*%{custom#statusline#err()}%*,\ %3*%{custom#statusline#warn()}%*]\
      \ [U+%0004.B]\ [%4.l/%Lℓ,\ %3.p%%]
" }}}}
" Colorscheme {{{{
set background=dark " Give vim a dark background
set termguicolors   " Have vim use GUI colors

hi Comment cterm=italic gui=italic

function! s:base16_customize() abort
  call Base16hi("WildMenu", g:base16_gui05, g:base16_gui03, g:base16_cterm05, g:base16_cterm03)
endfunction
augroup on_change_colorschema
  autocmd!
  autocmd ColorScheme * call s:base16_customize()
  autocmd ColorScheme * call s:statusline()
augroup END

colorscheme base16-material-darker

autocmd FileType json syntax match Comment +\/\/.\+$+
" }}}}
" Tabline {{{{
if has('windows')
  set showtabline=2
  set tabline=%!custom#tabline#line()
endif
" }}}}
" Deoplete {{{{
let g:deoplete#enable_at_startup = 1
" }}}}
" vim-rspec {{{{
if has('nvim')
  let g:rspec_command = ':call custom#misc#runspecs("{spec}")'
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

autocmd! User GoyoEnter nested call custom#goyo#goyo_enter()
autocmd! User GoyoLeave nested call custom#goyo#goyo_leave()
" }}}}
" vimtex {{{{
let g:vimtex_view_general_viewer = 'zathura'
" }}}}
" vimwiki {{{{{
let g:vimwiki_list = [{'path': '~/docs/vimwiki/',
      \ 'syntax': 'markdown', 'ext': '.mdown'}]
" }}}}}

" }}}
" Commands -------------------------------------------------------- {{{

" Use a command to return to the git project root
command! Root cal custom#misc#groot()

" Focus current fold
command! FocusLine cal custom#misc#focusline()

" Reload configuration without losing filetype specific stuff
command! -bar SourceConf cal custom#misc#sourceConf()

command! -nargs=? -bar -bang -complete=customlist,custom#mks#complete Mksession cal custom#mks#mkses(<q-args>, <bang>0)
command! -nargs=1 -bar -complete=customlist,custom#mks#complete Rmsession cal custom#mks#rmses(<q-args>)

command! -bang -nargs=0 QFix call QFixToggle(<bang>0)
function! QFixToggle(loc)
  if a:loc
    if exists("g:lfix_win")
      lclose
      unlet g:lfix_win
    else
      lopen 10
      let g:lfix_win = bufnr("$")
    endif
  else
    if exists("g:qfix_win")
      cclose
      unlet g:qfix_win
    else
      copen 10
      let g:qfix_win = bufnr("$")
    endif
  endif
endfunction
" }}}
" Mappings ------------------------------------------------------- {{{

" Prefix Keys {{{{
nnoremap <Space> <nop>
nnoremap <CR> <nop>

let mapleader = "\\"
let maplocalleader = ","
" }}}}

" Make enter behave correctly in the quickfix
au BufReadPost quickfix nnoremap <silent><buffer> <CR> <CR><C-w>j:q<CR>

" Swap ; and :
nnoremap ; :
nnoremap : ;

" Function Keys {{{{
set pastetoggle=<F2>
nnoremap <F3> :QFix<CR>
nnoremap <F4> :QFix!<CR>
" nnoremap <F5>
nnoremap <F6> :SpellToggle<CR>
" nnoremap <F7>
" nnoremap <F8>
" nnoremap <F9>
" nnoremap <F10>
" nnoremap <F12>
" }}}}

nnoremap <Space>q @q

" Still retain little-used functionality of comma
nnoremap ,, ,

" Stop using custom mappings for already decent mappings
nnoremap <leader>bn :echo "Use gt"<CR>
nnoremap <leader>bp :echo "Use gT"<CR>

nnoremap <leader>e mmggVG

" Autocomplete text
inoremap <C-]> <C-x><C-]>

" Basic operations made simpler
nnoremap <leader>q :bd!<CR>
nnoremap <leader><S-q> :wqa!<CR>
nnoremap <leader><C-q> :qa!<CR>

" Spacing
nnoremap <leader><Tab> i<Tab><Esc>
nnoremap <leader><Space> i<Space><Esc>

" Make Formatting Uniform
nnoremap <leader>d<Tab> ma:%s/	/  /g<CR>`a:delmarks a<CR>
nnoremap <leader>d<Space> ma:let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar>
      \ :nohl <Bar> :unlet _s <CR>`a:delmarks a<CR>

" Map za and zA to zx and zX
nnoremap zx za
nnoremap zX zA

" Make Y behave like other capitals
nnoremap Y y$

" Turn previous word uppercase
inoremap <C-u> <esc>mzgUiw`za

" Project file
nnoremap <silent> gp :call custom#misc#projectFile()<CR>

" Unimpaired++
call custom#misc#nunmap("[e")
call custom#misc#nunmap("]e")

nmap [ee <plug>unimpairedMoveUp
xmap [ee <plug>unimpairedMoveSelectionUp
nmap ]ee <plug>unimpairedMoveDown
xmap ]ee <plug>unimpairedMoveSelectionDown

nnoremap [ev :e ~/.vimrc<CR>
nnoremap ]ev :tabnew ~/.vimrc<CR>

nnoremap [ea :e ~/.vim/autoload<CR>
nnoremap ]ea :tabnew ~/.vim/autoload<CR>

nnoremap [ad :ALEDetail<CR>

onoremap <silent> ic :norm! v<CR>

if has('nvim')
  tnoremap <ESC> <C-\><C-n>
endif

nnoremap ga :A<CR>
nnoremap gr :R<CR>

nmap <C-p> <Plug>(CommandT)
nmap <leader>h <Plug>(CommandTHelp)
nmap <leader>s <Plug>(CommandTBuffer)
nmap <leader>j <nop>

nnoremap <leader>gg :find Gemfile<CR>

nnoremap <silent> <localleader>c :%s/^[	\ ]*#[\ \n].*//g<CR>:%s/^\n//g<CR>:nohl<CR>gg

nnoremap go :Goyo<CR>

nnoremap <leader>x :Texplore<CR>

vnoremap K k

vnoremap p <esc>:echo 'Use "_p instead'<CR>gv
" }}}
" Abbrevs --------------------------------------------------------- {{{

" Use update instead of write
cnoreabbrev w update

" Vim-Plug
cnoreabbrev pi PlugInstall
cnoreabbrev pu PlugUpdate
cnoreabbrev pc PlugClean

" UltiSnips
cnoreabbrev snipe UltiSnipsEdit

" Source vimrc
cnoreabbrev vs SourceConf

" Shebang
inoreabbrev <expr> #!! "#!/usr/bin/" . (empty(&filetype) ? 'bash' : 'env '.&filetype)

" }}}
" Macros ----------------------------------------------------------- {{{
augroup macros

  " Add a semicolon to the end of current line
  au FileType javascript,typescript,cpp,arduino nnoremap <CR>s maA;<Esc>`a:delmarks<Space>a<CR>

augroup END
" }}}
