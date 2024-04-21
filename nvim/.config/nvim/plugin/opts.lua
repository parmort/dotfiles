vim.opt.clipboard      = 'unnamedplus'  -- Use the normal clipboard
vim.opt.cmdheight      = 2              -- Set lines below statusline to 2
vim.opt.textwidth      = 80
vim.opt.colorcolumn    = {'+1'}
vim.opt.cursorline     = true
vim.opt.expandtab      = true           -- Expand tabs to spaces
vim.opt.ignorecase     = true
vim.opt.linebreak      = true           -- Wrap lines at `breakat`
vim.opt.laststatus     = 2              -- Always display statusline
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.scrolloff      = 3
vim.opt.shiftround     = true           -- Round indent to shiftwidth
vim.opt.showmode       = false          -- Don't show mode messages
vim.opt.showtabline    = 2              -- Always show the tabline
vim.opt.splitbelow     = true
vim.opt.splitright     = true
vim.opt.updatetime     = 300            -- Lower time for CursorHold autocmds
vim.opt.wrap           = false

vim.opt.tabstop        = 2
vim.opt.softtabstop    = 2
vim.opt.shiftwidth     = 2

vim.opt.shortmess      = {              -- Use abbreviations in messages
  f = true,
  i = true,
  l = true,
  m = true,
  n = true,
  r = true,
  x = true
}

vim.opt.shortmess:append { I = true }   -- Don't show intro message
vim.opt.shortmess:append { A = true }   -- Don't show the swapfile message
vim.opt.shortmess:append { C = true }   -- Don't show completion messages

vim.opt.completeopt = {
  'menuone',                            -- Show the PUM, even with only 1 match
  'noinsert',                           -- Don't insert text until user selection
  'noselect',                           -- Don't auto-select matches
}

vim.opt.list      = true                -- Display chars set in listchars
vim.opt.listchars = {
  trail    = '·',                       -- Trailing space
  tab      = '~>',                      -- Explicit tabs (usually expanded)
  nbsp     = '∅',                       -- Non-breaking space
  extends  = '»',                       -- When line extends past right of screen
  precedes = '«',                       -- When line extends past left of screen
}

vim.opt.path:append('**')               -- Recurse into subdirectories
vim.opt.wildignore:append {             -- Ignore files from wildmenu
  '*.o',
  'node_modules'
}

vim.opt.shadafile   = ''
vim.opt.viminfofile = ''
