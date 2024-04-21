local ts_conf = require'nvim-treesitter.configs'

local config = {
  highlight = {
    enable = true,
    disable = { 'markdown' }
  }
}

ts_conf.setup(config)

local grp = vim.api.nvim_create_augroup('FoldMethod', { clear = true })

vim.api.nvim_create_autocmd({'Filetype'}, {
  pattern = '*', group = grp,
  callback = require('parmort.foldmethod')
})
