vim.opt.conceallevel = 2

local keymap = vim.keymap.set
local util = require('parmort.util.keymap')
local cmd, l = util.command, util.leader

keymap('n', '<C-]>', cmd 'ObsidianFollowLink vsplit', {buffer = true})
keymap('n', l 't', cmd 'ObsidianQuickSwitch', {buffer = true})
