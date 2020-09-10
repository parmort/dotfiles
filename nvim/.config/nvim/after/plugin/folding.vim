if !has('folding')
  finish
endif

if exists('g:loaded_nvim_treesitter')
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
else
  set foldmethod=indent
endif

set foldlevelstart=99
set foldnestmax=1

set foldtext=parmort#foldtext()
