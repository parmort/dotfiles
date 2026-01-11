local github = require('parmort.util').github
local echo_train = require('parmort.util').echo_train

-- Expose a single global for various functions
if not Parmort then
  Parmort = {
    foldtext = require('parmort.foldtext'),
    tabline = require('parmort.tabline')
  }
end

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.opt.winborder = 'rounded'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.cursorline = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.textwidth = 80
vim.opt.colorcolumn = '+1'
vim.opt.completeopt = {
  'menuone',
  'noselect',
  'noinsert'
}

vim.opt.foldmethod = 'indent'
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 10
vim.opt.foldtext = 'v:lua.Parmort.foldtext()'

vim.opt.showtabline = 2
vim.opt.tabline = '%!v:lua.Parmort.tabline.line()'

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
  -- github('ledger/vim-ledger'),
})

require('catppuccin').setup(require('parmort.catppuccin'))
vim.cmd.colorscheme 'catppuccin'

require('mini.pick').setup()
--- @diagnostic disable-next-line: undefined-global
local mp = MiniPick
vim.keymap.set('n', '<leader>h', function() mp.builtin.help() end)
vim.keymap.set('n', '<leader>t', function() mp.builtin.files() end)

vim.g.dirvish_mode = [[:sort ,^.*[\/],]]
