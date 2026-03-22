local aug = vim.api.nvim_create_augroup('parmort.focus', {
  clear = false
})

vim.api.nvim_create_autocmd('WinEnter', {
  group = aug,
  pattern = '*',
  command = 'setl cursorline'
})

vim.api.nvim_create_autocmd('WinLeave', {
  group = aug,
  pattern = '*',
  command = 'setl nocursorline'
})
