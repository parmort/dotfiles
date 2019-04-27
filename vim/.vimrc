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
  Plug 'vim-ctrlspace/vim-ctrlspace'
  Plug 'jiangmiao/auto-pairs'
  Plug 'ledger/vim-ledger', { 'for': 'ledger' }
  Plug 'mxw/vim-jsx'
  Plug 'parmort/vim-factorybot', { 'on': 'Efactory' }
  Plug 'parmort/vim-audit'
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'PotatoesMaster/i3-vim-syntax'
  Plug 'romainl/vim-cool'
  Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-rsi'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-vinegar'
  Plug 'Valloric/ListToggle'
  Plug 'vimoutliner/vimoutliner', { 'for': 'votl' }
  Plug 'vim-scripts/ZoomWin'
  Plug 'w0rp/ale'

  " Colorscheme
  Plug 'nanotech/jellybeans.vim'

  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/neco-vim', { 'for': 'vim' }
    Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript' }
    Plug 'uplus/deoplete-solargraph', { 'for': 'ruby' }
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
set backspace=eol,indent,start " Make the backspace behave normally
set clipboard=unnamedplus      " Make vim use the C-c clipboard
set scrolloff=3                " Set scrolloff
setglobal spelllang=en_us      " Spellchecking

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
" Colorscheme {{{{
set background=dark " Give vim a dark background
set termguicolors   " Have vim use GUI colors

colorscheme jellybeans

hi StatusLine guifg=#e8e8d3 guibg=#333333 gui=none
hi TabLine guifg=#e8e8d3 guibg=#333333 gui=italic
hi TabLineSel guifg=#e8e8d3 guibg=#333333 gui=bold
hi TabLineFill guibg=#333333
" }}}}
" Statusline {{{{
set noshowmode
set laststatus=2
set showtabline=2
" }}}}
" Deoplete {{{{
let g:deoplete#enable_at_startup = 1
" }}}}
" vim-rspec {{{{
if has('nvim')
  let g:rspec_command = ':call custom#misc#runspecs("{spec}")'
endif
" }}}}

" }}}
" Commands -------------------------------------------------------- {{{

" Use a command to return to the git project root
command! Root cal custom#misc#groot()

" Focus current fold
command! FocusLine cal custom#misc#focusline()

" Reload configuration without losing filetype specific stuff
command! -bar SourceConf cal custom#misc#sourceConf()

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
let g:lt_quickfix_list_toggle_map = '<F3>'
let g:lt_location_list_toggle_map = '<F4>'
" nnoremap <F5>
nnoremap <F6> :SpellToggle<CR>
" nnoremap <F7>
" nnoremap <F8>
" nnoremap <F9>
" nnoremap <F10>
" nnoremap <F12>
" }}}}

nnoremap <Space>q @q

" Buffer navigation
nnoremap <leader>bn :tabn<CR>
nnoremap <leader>bp :tabp<CR>

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
try
  unmap [e
  unmap ]e
catch /E31/
endtry

nmap [ee <plug>unimpairedMoveUp
xmap [ee <plug>unimpairedMoveSelectionUp
nmap ]ee <plug>unimpairedMoveDown
xmap ]ee <plug>unimpairedMoveSelectionDown

nnoremap ]ev :e ~/.vimrc<CR>
nnoremap [ev :tabnew ~/.vimrc<CR>

nnoremap ]ea :e ~/.vim/autoload<CR>
nnoremap [ea :tabnew ~/.vim/autoload<CR>

nnoremap [ad :ALEDetail<CR>

onoremap <silent> ic :norm! v<CR>

nnoremap <silent> <C-p> :CtrlSpace O<CR>

tnoremap <ESC> <C-\><C-n>

nnoremap ga :A<CR>
nnoremap gr :R<CR>
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
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

" }}}
" Macros ----------------------------------------------------------- {{{
augroup macros

  " Add a semicolon to the end of current line
  au FileType javascript,typescript,cpp,arduino nnoremap <CR>s maA;<Esc>`a:delmarks<Space>a<CR>

augroup END
" }}}
