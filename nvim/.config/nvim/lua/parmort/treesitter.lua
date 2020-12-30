local au = require'parmort.util.au'
local configs = require'nvim-treesitter.configs'

configs.setup {
  highlight = {
    enable = true
  }
}

au.g('ParmortTreeSitter')
  au.c('!')
  au.c('Filetype', '*', 'lua require("parmort.foldmethod")()')
au.g('END')
