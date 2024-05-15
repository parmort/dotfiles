-- Author: N. Prochnau <parvus.mortalis@gmail.com>

if vim.fn.has('multi_byte') then
  vim.cmd 'setglobal fileencodings=utf-8'
end

local function packadd(package)
  vim.cmd.packadd { package, bang = true }
end

packadd 'vim-obsession'
packadd 'vim-eunuch'
packadd 'vim-unimpaired'
packadd 'vim-rsi'
packadd 'vim-repeat'
packadd 'vim-scriptease'
packadd 'limelight.vim'
packadd 'goyo.vim'

-- Tie-ins
packadd 'vim-tmux-navigator'
packadd 'vim-fugitive'
packadd 'vim-dispatch'

packadd 'vim-dadbod'
packadd 'vim-dadbod-ui'

-- Misc. Filetypes
packadd 'vim-cpp-modern'
packadd 'sxhkd-vim'
packadd 'vim-ledger'
packadd 'vim-javascript'
packadd 'vimtex'
packadd 'vim-elixir'

-- Code completion
packadd 'neodev.nvim'
packadd 'nvim-treesitter'
packadd 'vim-closer'
packadd 'nvim-lsp'
packadd 'vim-commentary'
packadd 'vim-endwise'
packadd 'vim-ragtag'
packadd 'vim-surround'

packadd 'deoplete.nvim'
packadd 'deoplete-lsp'

packadd 'trouble.nvim'

-- Ruby
packadd 'vim-rails'
packadd 'vim-rspec'
packadd 'vim-bundler'

-- Python
packadd 'SimpylFold'
packadd 'vim-python-pep8-indent'

-- Navigation
packadd 'telescope.nvim'
packadd 'vim-dirvish'
packadd 'vim-projectionist'
packadd 'loupe'

packadd 'obsidian.nvim'

-- Libs
packadd 'plenary.nvim'
packadd 'popup.nvim'

-- Colorscheme
packadd 'nord-vim'

-- CUSTOM --
packadd 'rasi.vim'
