-- vim: fdm=marker

vim.opt.background    = 'dark'
vim.opt.termguicolors = true

local nord  = require('parmort.colors.nord')
local one   = require('parmort.colors.one')
local seoul = require('parmort.colors.seoul')

local grp = vim.api.nvim_create_augroup('ColorSchemes', { clear = true })

-- NORD {{{
vim.api.nvim_create_autocmd({'ColorSchemePre'}, {
  pattern = 'nord', group = grp,
  callback = nord.colors_pre
})

vim.api.nvim_create_autocmd({'ColorScheme'}, {
  pattern = 'nord', group = grp,
  callback = nord.colors
})
-- }}}

-- ONE {{{
vim.api.nvim_create_autocmd({'ColorSchemePre'}, {
  pattern = 'one', group = grp,
  callback = one.colors_pre
})

vim.api.nvim_create_autocmd({'ColorScheme'}, {
  pattern = 'one', group = grp,
  callback = one.colors
})
-- }}}

-- SEOUL {{{
vim.api.nvim_create_autocmd({'ColorSchemePre'}, {
  pattern = 'seoul', group = grp,
  callback = seoul.colors_pre
})

vim.api.nvim_create_autocmd({'ColorScheme'}, {
  pattern = 'seoul', group = grp,
  callback = seoul.colors
})
-- }}}

vim.cmd.colorscheme 'nord'
