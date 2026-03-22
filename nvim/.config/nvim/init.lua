local github = require('parmort.util').github
local key_train = require('parmort.util').keybind_training

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
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.cursorline = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.textwidth = 80
vim.opt.colorcolumn = '+1'
vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
vim.opt.clipboard = 'unnamedplus'

vim.opt.foldmethod = 'indent'
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 10
vim.opt.foldtext = 'v:lua.Parmort.foldtext()'

vim.opt.showtabline = 2
vim.opt.tabline = '%!v:lua.Parmort.tabline.line()'

vim.opt.shortmess:append('I')
vim.opt.shortmess:remove('l')

vim.opt.list = true
vim.opt.listchars = {
  trail    = '·',
  tab      = '~>',
  nbsp     = '∅',
  extends  = '»',
  precedes = '«',
}

vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')

vim.keymap.set('n', '<leader>q', vim.cmd.q)
vim.keymap.set('n', '<leader>Q', vim.cmd.qa)
vim.keymap.set('n', '<leader><C-q>', function() vim.cmd.q { bang = true } end)

vim.keymap.set('n', 'gl', key_train('Use <leader>n instead (from loupe)'))

vim.keymap.set('n', '<F6>', function()
  vim.opt.spell = not vim.wo.spell
end)

-- Make fold toggling easier
vim.keymap.set('n', 'zx', 'za')
vim.keymap.set('n', 'zX', 'zA')

vim.keymap.set('n', 'Y', 'y$', {desc = 'Yank to end of line'})
vim.keymap.set('v', 'K', 'k')

vim.pack.add({
  github('catppuccin/nvim', { name = 'nvim-catppuccin' }),

  github('christoomey/vim-tmux-navigator'),
  github('justinmk/vim-dirvish'),
  github('wincent/loupe'),
  github('nvim-mini/mini.pick'),
  github('vimwiki/vimwiki'),

  -- Bracket/keyword block completion
  github('tpope/vim-surround'),
  github('tpope/vim-endwise'),
  github('rstacruz/vim-closer'),

  -- tpope being a real one
  github('tpope/vim-eunuch'),
  github('tpope/vim-rsi'),
  github('tpope/vim-unimpaired'),
  github('tpope/vim-dispatch'),
  github('tpope/vim-projectionist'),

  -- Filetypes
  github('kovetskiy/sxhkd-vim'),
  github('bfrg/vim-c-cpp-modern'),
  github('lervag/vimtex'),
  github('wuelnerdotexe/vim-astro'),
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

vim.keymap.set('n', 'ga', vim.cmd.A, {desc = 'Projectionist alternate'})
vim.keymap.set('n', '<leader>d', vim.cmd.Dispatch)
vim.keymap.set('n', '<leader>m', vim.cmd.Make)

vim.keymap.set('n', '<leader><space>', '<Plug>VimwikiToggleListItem')
