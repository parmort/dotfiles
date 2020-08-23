if !has('nvim')
  finish
endif

lua << END

local lsp = require'nvim_lsp'

lsp.tsserver.setup{}
lsp.vimls.setup{}

END
