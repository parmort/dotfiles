local cmd = require('parmort.keymap').command

vim.keymap.set('n', 'gp', cmd 'G push', { buffer = true })
