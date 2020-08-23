" Author: N. Prochnau <parvus.mortalis@gmail.com>

" Preamble -------------------------------------------------------- {{{

" Use Unicode characters. Has to be at the top of the file.
" The order of these commands are important.
if has('multi_byte')
  set encoding=utf-8
  scriptencoding utf-8
  setglobal fileencodings=utf-8
endif

if !has('nvim')
  set runtimepath+=$XDG_CONFIG_HOME/nvim,$XDG_CONFIG_HOME/nvim/after
  set packpath+=$XDG_CONFIG_HOME/nvim,$XDG_CONFIG_HOME/nvim/after
  set term=xterm-256color
endif

" Open the current directory if no command-line arguments were passed in
if !argc(-1)
  edit .
endif

" }}}
" Plugins --------------------------------------------------------- {{{
if &loadplugins
  if has('packages')
    " Misc.
    packadd! vim-obsession
    packadd! vim-eunuch
    packadd! vim-unimpaired
    packadd! vim-rsi

    " Searching
    packadd! loupe
    packadd! vim-cool

    " Focus / Zen
    packadd! goyo.vim
    packadd! limelight.vim

    " Tie-ins
    packadd! vim-tmux-navigator
    packadd! vim-fugitive
    packadd! vim-dispatch

    " Misc. Filetypes
    packadd! vim-cpp-modern
    packadd! sxhkd-vim
    packadd! vim-ledger
    packadd! vim-javascript

    " Code completion
    packadd! auto-pairs
    packadd! nvim-lsp
    packadd! deoplete.nvim
    packadd! deoplete-lsp
    packadd! vim-commentary
    packadd! vim-endwise
    packadd! vim-ragtag
    packadd! vim-surround

    " Ruby
    packadd! vim-rails
    packadd! vim-bundler

    " Python
    packadd! SimpylFold
    packadd! vim-python-pep8-indent

    " Navigation
    packadd! fzf
    packadd! vim-dirvish
    packadd! vim-projectionist

    " Colorscheme
    packadd! vim-one
  else
    " Catchall, in case I'm ever using an old vim (Hey, wait! You use neovim!)
    source $HOME/.config/nvim/pack/bundle/opt/vim-pathogen/autoload/pathogen.vim
    call pathogen#infect('pack/bundle/opt/{}')
  endif
endif

" }}}
" Commands -------------------------------------------------------- {{{

" Focus current fold
command! FocusLine call parmort#focusline()

" Reload configuration without losing filetype specific stuff
command! -bar SourceConf call parmort#sourceConf()

command! -nargs=? -bar -bang -complete=customlist,parmort#mks#complete Mksession call parmort#mks#mkses(<q-args>, <bang>0)
command! -nargs=? -bar -complete=customlist,parmort#mks#complete Rmsession call parmort#mks#rmses(<q-args>)
" }}}
" Mappings ------------------------------------------------------- {{{

" Prefix Keys {{{{
let mapleader = " "
let maplocalleader = "\\"
" }}}}

" Swap ; and :
nnoremap ; :
nnoremap : ;

function! s:loclist()
  try
    lw
  catch /^Vim\%((\a\+)\)\=:E776/
  endtry
endfunction

nnoremap <F3> :cw<CR>
nnoremap <F4> :lw<CR>
nnoremap <F6> :SpellToggle<CR>

" Get used to new mappings
nnoremap <localleader>q :echo "Use Space q"<CR>
nnoremap <localleader><S-q> :echo "Use Space S-q"<CR>
nnoremap <localleader><C-q> :echo "Use Space C-q"<CR>

" Basic operations made simpler
nnoremap <leader>q :bd!<CR>
nnoremap <leader><S-q> :wqa!<CR>
nnoremap <leader><C-q> :qa!<CR>

" Map za and zA to zx and zX
nnoremap zx za
nnoremap zX zA

" Make Y behave like other capitals
nnoremap Y y$

" Unimpaired++
call parmort#nunmap("[e")
call parmort#nunmap("]e")

nmap [ee <plug>unimpairedMoveUp
xmap [ee <plug>unimpairedMoveSelectionUp
nmap ]ee <plug>unimpairedMoveDown
xmap ]ee <plug>unimpairedMoveSelectionDown

" Open vimrc in current or new tab
nnoremap [ev :e ~/.config/nvim/init.vim<CR>
nnoremap ]ev :tabnew ~/.config/nvim/init.vim<CR>

" Open vim folder in current or new tab
nnoremap [ea :e ~/.config/nvim<CR>
nnoremap ]ea :tabnew ~/.config/nvim<CR>

" Select all the things
nnoremap [h ggVG

" Text object for one character (for mnemonic purposes)
onoremap <silent> ic :norm! v<CR>

" Make escape behave sanely in terminal mode
if has('nvim')
  tnoremap <ESC> <C-\><C-n>
endif

" Projectionist
nnoremap ga :A<CR>

" Help searching
nnoremap <leader>h :FZFHelp<CR>

" Open the gemfile; use find to err if file not found
nnoremap <leader>gg :find Gemfile<CR>

" Open Goyo
nnoremap go :Goyo<CR>

" Open Netrw in current folder
nnoremap <leader>x :tabnew <bar> Dirvish <CR>

" I have a habit of holding shift for too long in v-line
vnoremap K k

" Dispatch
nnoremap <leader>d :Dispatch<CR>

" Loupe
nnoremap <nop> <Plug>(LoupeClearHighlight)

" }}}
" Abbrevs --------------------------------------------------------- {{{

" Use update instead of write
cnoreabbrev w update

" Source vimrc
cnoreabbrev vs SourceConf

" }}}
