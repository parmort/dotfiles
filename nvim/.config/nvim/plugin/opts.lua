local o = vim.opt

o.clipboard      = 'unnamedplus'  -- Use the normal clipboard
o.cmdheight      = 2              -- Set lines below statusline to 2
o.textwidth      = 80
o.colorcolumn    = {'+1'}         -- Add a cc one after `textwidth`
o.cursorline     = true
o.expandtab      = true           -- Expand tabs to spaces
o.ignorecase     = true
o.linebreak      = true           -- Wrap lines at `breakat`
o.laststatus     = 2              -- Always display statusline
o.number         = true
o.relativenumber = true
o.scrolloff      = 3
o.shiftround     = true           -- Round indent to shiftwidth
o.showmode       = false          -- Don't show mode messages
o.showtabline    = 2              -- Always show the tabline
o.splitbelow     = true
o.splitright     = true
o.updatetime     = 300            -- Lower time for CursorHold autocmds
o.wrap           = false

o.tabstop        = 2
o.softtabstop    = 2
o.shiftwidth     = 2

o.shortmess      = {              -- Use abbreviations in messages
  f = true,                             -- (See `:h shortmess` for a more
  i = true,                             -- detail)
  l = true,
  m = true,
  n = true,
  r = true,
  x = true,
  I = true,                             -- Don't show intro message
  A = true,                             -- Don't show the swapfile message
  C = true,                             -- Don't show completion messages
}

o.completeopt    = {
  'menuone',                            -- Show the PUM, even with only 1 match
  'noinsert',                           -- Don't insert text until user selection
  'noselect',                           -- Don't auto-select matches
}

o.list           = true           -- Display chars set in listchars
o.listchars      = {
  trail    = '·',                       -- Trailing space
  tab      = '~>',                      -- Non-expanded tabs (usually expanded)
  nbsp     = '∅',                       -- Non-breaking space
  extends  = '»',                       -- Line extending past right of screen
  precedes = '«',                       -- Line extending past left of screen
}

o.path:append('**')               -- Recurse into subdirectories
o.wildignore:append({             -- Ignore files from wildmenu
'*.o',
'node_modules'
})

o.shadafile   = ''
o.viminfofile = ''

if vim.fn.executable('ag') then
  o.grepprg = 'ag --vimgrep $*'
end
