-- Author: N. Prochnau <parvus.mortalis@gmail.com>

if vim.fn.has('multi_byte') then
  vim.cmd 'setglobal fileencodings=utf-8'
end

if vim.fn.has('vim_starting') and not vim.fn.argc(-1) then
  vim.cmd.edit '.'
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

-- Tie-ins
packadd 'vim-tmux-navigator'
packadd 'vim-fugitive'
packadd 'vim-dispatch'
packadd 'vim-dadbod'

-- Misc. Filetypes
packadd 'vim-cpp-modern'
packadd 'sxhkd-vim'
packadd 'vim-ledger'
packadd 'vim-javascript'
packadd 'vimtex'

-- Code completion
packadd 'nvim-treesitter'
packadd 'vim-closer'
packadd 'nvim-lsp'
packadd 'vim-commentary'
packadd 'vim-endwise'
packadd 'vim-ragtag'
packadd 'vim-surround'

packadd 'deoplete.nvim'
packadd 'deoplete-lsp'

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

require('parmort.opts')
require('parmort.cmds')
require('parmort.maps')
require('parmort.abbrevs')
require('parmort.statusline')

require('obsidian').setup {
  workspaces = {
    {
      name = "vault",
      path = "~/documents/vault"
    }
  },

  note_path_func = function(spec)
    local path = spec.dir / spec.title
    return path:with_suffix('.md')
  end,

  ---@return table
  note_frontmatter_func = function(note)
    -- Add the title of the note as an alias.
    if note.title then
      note:add_alias(note.title)
    end

    local out = { aliases = note.aliases, tags = note.tags }

    -- `note.metadata` contains any manually added fields in the frontmatter.
    -- So here we just make sure those fields are kept in the frontmatter.
    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end

    return out
  end,
}
