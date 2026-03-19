local err = require('parmort.util').err_to_user

vim.opt_local.number = false
vim.opt_local.relativenumber = false
vim.opt_local.signcolumn = 'yes'

vim.keymap.set('n', '%', ':e %')

if (vim.g.loaded_eunuch) then
  vim.keymap.set('n', '<leader>d', ':Mkdir %')
else
  err('vim-eunuch not loaded, `:Mkdir` not available.')
end
