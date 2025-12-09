local github = require('parmort.util').github
local echo_train = require('parmort.util').echo_train

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.opt.winborder = 'rounded'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.cursorline = true
vim.opt.textwidth = 80
vim.opt.colorcolumn = '+1'
vim.opt.completeopt = {
  'menuone',
  'noselect',
  'noinsert'
}

vim.opt.tabline = '%!v:lua.Tabline.line()'

vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')

vim.keymap.set('n', '<leader>q', vim.cmd.q)
vim.keymap.set('n', '<leader>Q', vim.cmd.qa)
vim.keymap.set('n', '<leader><C-q>', function() vim.cmd.q { bang = true } end)

vim.keymap.set('n', 'gl', echo_train('Use <leader>n instead (from loupe)'))

vim.pack.add({
  github('catppuccin/nvim', { name = 'nvim-catppuccin' }),

  github('christoomey/vim-tmux-navigator'),
  github('justinmk/vim-dirvish'),
  github('wincent/loupe'),
  github('nvim-mini/mini.pick'),

  -- Bracket/keyword block completion
  github('tpope/vim-surround'),
  github('tpope/vim-endwise'),
  github('rstacruz/vim-closer'),

  github('tpope/vim-eunuch'),
})

require('catppuccin').setup(require('parmort.catppuccin'))
vim.cmd.colorscheme 'catppuccin'

require('mini.pick').setup()
---@diagnostic disable-next-line: undefined-global
vim.keymap.set('n', '<leader>h', function() MiniPick.builtin.help() end)
---@diagnostic disable-next-line: undefined-global
vim.keymap.set('n', '<leader>t', function() MiniPick.builtin.files() end)

vim.g.dirvish_mode = [[:sort ,^.*[\/],]]
