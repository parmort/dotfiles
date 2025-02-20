local keymap = vim.keymap.set

local util = require('parmort.keymap')
local leader = util.leader
local cmd = util.command
local plug = util.plug

local function toggle_spellcheck()
  vim.opt.spell = not vim.wo.spell
end

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Swap ; and :
keymap('n', ';', ':')
keymap('n', ':', ';')

keymap('n', '<F6>', toggle_spellcheck, {desc = 'Toggle spellcheck'})

-- Make closing operations easier
keymap('n', leader 'q',     cmd 'bd!')
keymap('n', leader '<S-q>', cmd 'wqa!')
keymap('n', leader '<C-q>', cmd 'qa!')

keymap('n', 'zx', 'za')
keymap('n', 'zX', 'zA')

keymap('n', 'Y', 'y$', {desc = 'Make Y behave like other capitals'})

-- Unimpaired++
vim.fn['parmort#nunmap']('[e')
vim.fn['parmort#nunmap'](']e')

keymap('n', '[ee', plug 'unimpairedMoveUp',            {remap = true})
keymap('x', '[ee', plug 'unimpairedMoveSelectionUp',   {remap = true})
keymap('n', ']ee', plug 'unimpairedMoveDown',          {remap = true})
keymap('x', ']ee', plug 'unimpairedMoveSelectionDown', {remap = true})

keymap('t', '<ESC>', '<C-\\><C-n>', {desc = 'Make ESC sane in term mode'})

keymap('n', 'ga', cmd 'A', {desc = 'Projectionist Alternate'})

keymap('n', 'go', cmd 'ZenMode')

keymap('v', 'K', 'k') -- I have a habit of holding shift for too long getting into v-line

keymap('n', leader 'd', cmd 'Dispatch')
keymap('n', leader 'm', cmd 'Make')

keymap('n', '<nop>', plug '(LoupeClearHighlight)')

keymap('n', leader '<space>', plug 'VimwikiToggleListItem')

keymap('n', 'gl', cmd 'nohlsearch<BAR>diffupdate', {desc = 'Turn off search highlighting'})
