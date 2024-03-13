" Author: N. Prochnau <parvus.mortalis@gmail.com>
" vim: foldmethod=marker

lua <<EOF
require('parmort.opts')
require('parmort.cmds')
require('parmort.maps')

if vim.fn.has('multi_byte') then
  vim.cmd 'setglobal fileencodings=utf-8'
end

if vim.fn.has('vim_starting') and not vim.fn.argc(-1) then
  vim.cmd.edit '.'
end

EOF

" Plugins --------------------------------------------------------- {{{
if &loadplugins
  if has('packages')
    " Misc.
    packadd! vim-obsession
    packadd! vim-eunuch
    packadd! vim-unimpaired
    packadd! vim-rsi
    packadd! vim-repeat
    packadd! vim-scriptease

    " Tie-ins
    packadd! vim-tmux-navigator
    packadd! vim-fugitive
    packadd! vim-dispatch
    packadd! vim-dadbod

    " Misc. Filetypes
    packadd! vim-cpp-modern
    packadd! sxhkd-vim
    packadd! vim-ledger
    packadd! vim-javascript
    packadd! vimtex

    " Code completion
    packadd! nvim-treesitter
    packadd! vim-closer
    packadd! nvim-lsp
    packadd! vim-commentary
    packadd! vim-endwise
    packadd! vim-ragtag
    packadd! vim-surround

    packadd! deoplete.nvim
    packadd! deoplete-lsp

    " Ruby
    packadd! vim-rails
    packadd! vim-rspec
    packadd! vim-bundler

    " Python
    packadd! SimpylFold
    packadd! vim-python-pep8-indent

    " Navigation
    packadd! telescope.nvim
    packadd! vim-dirvish
    packadd! vim-projectionist
    packadd! loupe

    " Libs
    packadd! plenary.nvim
    packadd! popup.nvim

    " Colorscheme
    packadd! nord-vim
  else
    " Catchall, in case I'm ever using an old vim (Hey, wait! You use neovim!)
    source $HOME/.config/nvim/pack/bundle/opt/vim-pathogen/autoload/pathogen.vim
    call pathogen#infect('pack/bundle/opt/{}')
  endif
endif

" Must be loaded after `packadd!` calls because vim won't load ftdetect properly
filetype indent plugin on
syntax on
" }}}
" Abbrevs --------------------------------------------------------- {{{

" Use update instead of write
cnoreabbrev w update

" Source vimrc
cnoreabbrev vs SourceConf

" }}}
