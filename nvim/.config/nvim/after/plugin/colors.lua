vim.opt.background    = 'dark'
vim.opt.termguicolors = true

local nord = require('parmort.colors.nord')

local grp = vim.api.nvim_create_augroup('ColorSchemes', { clear = true })

vim.api.nvim_create_autocmd({'ColorSchemePre'}, {
  pattern = 'nord', group = grp,
  callback = nord.colors_pre
})

vim.api.nvim_create_autocmd({'ColorScheme'}, {
  pattern = 'nord', group = grp,
  callback = nord.colors
})

vim.cmd.colorscheme 'nord'
