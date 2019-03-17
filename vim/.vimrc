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
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'ervandew/supertab'
  Plug 'jiangmiao/auto-pairs'
  Plug 'ledger/vim-ledger', { 'for': 'ledger' }
  Plug 'mxw/vim-jsx'
  Plug 'parmort/vim-factorybot', { 'on': 'Efactory' }
  Plug 'parmort/vim-audit'
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'PotatoesMaster/i3-vim-syntax'
  Plug 'romainl/vim-cool'
  Plug 'SirVer/ultisnips'
  Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-flagship'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-rsi'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-vinegar'
  Plug 'Valloric/ListToggle'
  Plug 'vimoutliner/vimoutliner', { 'for': 'votl' }
  Plug 'w0rp/ale'

  " Prettier
  Plug 'prettier/vim-prettier', {
    \ 'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json',
    \   'graphql', 'vue']
    \ }

  " Colorscheme
  " Plug '~/git/nord-vim'
  Plug 'nanotech/jellybeans.vim'

  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/neco-vim', { 'for': 'vim' }
    Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript' }
    Plug 'uplus/deoplete-solargraph', { 'for': 'ruby' }
  else
    " If vim, use YCM instead
    Plug 'Valloric/YouCompleteMe'
  endif
call plug#end()
" }}}
" Settings ------------------------------------------------------- {{{

" Plain vim settings {{{{
set nocompatible " Make vim behave like vim, not vi

if exists('&belloff')
  set belloff=all " Turn off all error sounds
endif

if exists('+colorcolumn')
  set cc=81 " Make the colorcolumn appear on column 81
endif

if exists('+relativenumber')
  set relativenumber " Make fancy line numbers appear
endif
set nu               " Always have the current line number displayed

if exists('+syntax')
  set cursorline " Make it easier to see current line
endif

syntax enable             " Pretty colors
filetype plugin indent on " Turn on filetype detection. See ':h filetype'

set hidden             " Don't quit abandoned buffers
set nowrap             " Don't wrap lines
set autoindent         " Copy indent from previous line
set copyindent         " Copy indent structure (i.e. tabs and spaces)
set lazyredraw         " Only redraw the screen when no user input occurs

set backspace=eol,indent,start " Make the backspace behave normally

if has('extra_search')
  set hlsearch " Highlight current search
  set incsearch " Jump to the closest match while typing search
endif
set ignorecase " Search is case-insensitive

" See `:h listchars`
set list
set listchars=trail:·
set listchars+=tab:»»
set listchars+=nbsp:∅
set listchars+=extends:»
set listchars+=precedes:«

" Make tabs be two characters in width and use spaces
cal autoload#settabspace(2)
set smarttab
set expandtab
set shiftround

autocmd BufRead,BufNewFile *.hs cal autoload#settabspace(4)

" Folding
if has('folding')
  if has('windows')
    set fillchars=vert:┃ " Make the border between vertical windows seamless
  endif
  set foldmethod=indent " Automatically fold lines that have the same indent value
  set foldlevelstart=99 " Don't fold any lines
  set foldtext=autoload#foldtext() " Set how folds look. See vim/autoload/autoload.vim
endif

" Spellchecking
setglobal spelllang=en_us

" Shortmess `:h 'shortmess'`
set shortmess=filmnrx " Use abbreviations in messages
set shortmess+=I " Don't show the intro message
set shortmess+=A " Don't show the "Attention" swapfile message

if &term =~ 'xterm-termite'
  let &t_SI .= "\<Esc>[5 q"
  let &t_EI .= "\<Esc>[2 q"
endif

" Make vim use the C-c clipboard
set clipboard=unnamedplus

" Set scrolloff
set scrolloff=3

" Split to the bottom-right instead of top-left
if has('windows')
  set splitbelow
endif

if has('vertsplit')
  set splitright
endif

" Use auto-gen files, but keep them out of the way {{{{{
if exists('$SUDO_USER')
  set noswapfile
  set nobackup
  set nowritebackup
else
  set directory=~/.vim/tmp/swap//
  set directory+=.
  set backupdir=~/.vim/tmp/backup//
  set backupdir+=.
endif

if has('persistent_undo')
  if exists('$SUDO_USER')
    set noundofile
  else
    set undodir=~/.vim/tmp/undo//
    set undodir+=.
    set undofile
  endif
endif

if has('viminfo')
  if exists('$SUDO_USER')
    set viminfo=
  else
    set viminfo+=n~/.vim/tmp/viminfo
  endif
endif
" }}}}}
" }}}}
" Colorscheme {{{{
set background=dark " Give vim a dark background
set termguicolors   " Have vim use GUI colors

colorscheme jellybeans " Make sure this comes after setting plugin vars

hi StatusLine guifg=#e8e8d3 guibg=#333333 gui=none
hi TabLine guifg=#e8e8d3 guibg=#333333 gui=italic
hi TabLineSel guifg=#e8e8d3 guibg=#333333 gui=bold
hi TabLineFill guibg=#333333
" }}}}
" Statusline {{{{
set noshowmode
set laststatus=2
hi link sl StatusLine
hi slmd guifg=#EBCB8B guibg=#333333
hi sler guifg=#bf5858 guibg=#333333
hi slwn guifg=#ab8e38 guibg=#333333
set statusline=
      \%#slmd#%{statusline#mode()}\ %#sl#%{statusline#name()}\ \ %{statusline#git()}%{statusline#mod()}
      \%=%{statusline#type()}\ [%#sler#%{statusline#err()},\ %#slwn#%{statusline#warn()}%#sl#]\
      \ [U+%0004.B]\ [%4.l/%Lℓ,\ %3.p%%]
let g:flagship_skip = 'fugitive#statusline\|FugitiveStatusline'
" }}}}
" Tabline {{{{
set showtabline=2
let g:tabprefix = 'Tabs:'
" }}}}
" PiParen {{{{
hi clear MatchParen
hi MatchParen ctermfg=9 guifg=#bf5858 cterm=bold
" }}}}
" Ctrl-P {{{{
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[/\](\.git|\.hg|\.svn|_site|node_modules)$'
      \ }
let g:ctrlp_status_func = {
      \ 'main': 'stl#ctrlp#main'
      \ }
" }}}}
" ALE {{{{
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_linters = {
      \  'javascript': ['eslint'],
      \  'python': ['pylint', 'flake8'],
      \  'html': ['htmlhint'],
      \  'java': ['javac']
      \ }

let g:ale_sign_column_always = 1
let g:ale_sign_error = '‣'
let g:ale_sign_warning = '•'

hi ALEWarning ctermfg=3 guifg=#ab8e38 cterm=underline
hi ALEError ctermfg=1 guifg=#bf5858 cterm=underline
hi ALEWarningSign ctermbg=3 guibg=#ab8e38 ctermfg=0 guifg=#2b2b2b
hi ALEErrorSign ctermbg=1 guibg=#bf5858 ctermfg=0 guifg=#2b2b2b
" }}}}
" UltiSnips {{{{
let s:SnippetDir = $HOME . '/.vim/UltiSnips'
let g:UltiSnipsSnippetDir = s:SnippetDir
let g:UltiSnipsSnippetDirectories = [s:SnippetDir]
" }}}}
" Dispatch {{{{
aug dispatch
  au!
  au! FileType markdown let b:dispatch = 'pandoc -s -o %:r.pdf %'
  au! BufRead .Xresources let b:dispatch = 'xrdb ~/.Xresources'
  au! FileType java let b:dispatch = 'processing-java --sketch=%:p:h --run'
aug end
" }}}}
" JSX {{{{
let g:jsx_ext_required = 0 " *.jsx not required for syntax to take effect
" }}}}
" vim-prettier {{{{
let g:prettier#autoformat = 0
let g:prettier#quickfix_enabled = 0
let g:prettier#config#bracket_spacing = 'true'
augroup PrettierSave
  au BufWritePre *.js,*.jsx Prettier
  au BufWritePre *.ts,*.tsx Prettier
  au BufWritePre *.css,*.less,*.scss Prettier
  au BufWritePre *.json,*.graphql,*.vue Prettier
augroup END
" }}}}
" Ag {{{{
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif
" }}}}
" Deoplete {{{{
let g:deoplete#enable_at_startup = 1
" }}}}
" So YCM and UltiSnips play nice {{{{
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabCrMapping = 0
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:ycm_key_list_select_completion = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
" }}}}
" AutoPairs {{{{
augroup autopairs
  au!
  au Filetype vim let b:AutoPairs = { "'": "'", '(':')', '[':']', '{':'}' }
augroup END
" }}}}
" vim-rspec {{{{
if has('nvim')
  let g:rspec_command = ':call autoload#runspecs("{spec}")'
endif
" }}}}

" }}}
" Commands -------------------------------------------------------- {{{

" Use a command to return to the git project root
command! Root cal autoload#groot()

" To get more functionality, have a command to run ag with options
if executable('ag')
  command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
endif

" Focus current fold
command! FocusLine cal autoload#focusline()

" Reload configuration without losing filetype specific stuff
command! -bar SourceConf cal autoload#sourceConf()
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

" Get out of bad habits
nnoremap <leader>vs :echo "Use :vs to source configuration"<CR>
nnoremap <leader>c<space> :echo "Use `gcc` to comment"<CR>
nnoremap <leader>df <nop>
vnoremap <leader>df <esc>:echo "Use C-["<CR>gv
noremap! <leader>df <C-o>:echo "Use C-["<CR>

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

" Fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gu :Gpushup<CR>

" Dispatch
nnoremap <CR>d :Dispatch<CR>
nnoremap <CR>D :Dispatch!<CR>
nnoremap <CR>m :Make<CR>
nnoremap <CR>M :Make<CR>

" Ag
nnoremap K :grep! "\b<C-r><C-w>\b"<CR>:cw<CR>

" Make Y behave like other capitals
nnoremap Y y$

" Turn previous word uppercase
inoremap <C-u> <esc>mzgUiw`za

" Project file
nnoremap <silent> gp :call autoload#projectFile()<CR>

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

nnoremap yev :e ~/.vimrc<CR>
nnoremap [ev :tabnew ~/.vimrc<CR>

nnoremap yea :e ~/.vim/autoload<CR>
nnoremap [ea :tabnew ~/.vim/autoload<CR>

nnoremap [ad :ALEDetail<CR>

onoremap <silent> ic :norm! v<CR>

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
