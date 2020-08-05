" File: audit.vim
" Author: S. Numerius <parvus.mortalis@gmail.com>
" License: MIT License. Found in `LICENSE` file
" Copr. 2018 S. Numerius. No rights reserved.

if exists('did_plugin_ultisnips')
  call UltiSnips#AddFiletypes('vimrc.vim')
endif

if exists('g:loaded_ale_dont_use_this_in_other_plugins_please')
  execute 'ALEDisableBuffer'
endif

if has('folding')
  setlocal foldmethod=marker
  setlocal foldlevel=0
endif
