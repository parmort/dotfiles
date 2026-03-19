vim.opt_local.number = false
vim.opt_local.relativenumber = false
vim.opt_local.signcolumn = 'yes'

vim.keymap.set('n', '%', ':e %')
vim.keymap.set('n', '<leader>d', ':!mkdir %') -- Don't use vim-eunuch's :Mkdir
