local github = require('parmort.util').github

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

vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')

vim.keymap.set('n', '<leader>q', vim.cmd.q)
vim.keymap.set('n', '<leader>Q', vim.cmd.qa)
vim.keymap.set('n', '<leader><C-q>', function() vim.cmd.q { bang = true } end)

vim.pack.add({
  github('catppuccin/nvim', { name = 'nvim-catppuccin' }),

  github('christoomey/vim-tmux-navigator'),
  github('justinmk/vim-dirvish'),
  github('wincent/loupe'),

  github('tpope/vim-surround'),
  github('tpope/vim-endwise'),
  github('tpope/vim-eunuch'),
})

require('catppuccin').setup(require('parmort.catppuccin'))
vim.cmd.colorscheme 'catppuccin'

vim.g.dirvish_mode = [[:sort ,^.*[\/],]]
