local leader = require('parmort.keymap').leader
local cmd = require('parmort.keymap').command

local function keymap(mode, lhs, rhs, opts)
  local action = string.format(cmd 'lua require"parmort.telescope".%s()', rhs)
  vim.keymap.set(mode, lhs, action, opts)
end

keymap('n', leader 't', 'git_files')
keymap('n', leader 'h', 'help_tags')
keymap('n', leader 'p', 'reloader')
keymap('n', leader 'c', 'commands')
