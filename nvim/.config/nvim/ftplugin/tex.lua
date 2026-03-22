vim.cmd.compiler 'tex'

vim.opt_local.conceallevel = 0
vim.opt_local.complete = 'o'
vim.cmd.lcd '%:h'

vim.keymap.set('n', '<localleader>v', function()
  vim.ui.open(vim.fn.expand('%:r')..'.pdf')
end, { buffer = true })
