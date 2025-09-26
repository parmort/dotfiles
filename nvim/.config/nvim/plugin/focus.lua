local au = vim.api.nvim_create_autocmd
local focus_grp = vim.api.nvim_create_augroup('ParmortFocus', {})

au('WinEnter', {
  group = focus_grp,
  pattern = '*',
  command = 'setl cursorline'
})

au('WinLeave', {
  group = focus_grp,
  pattern = '*',
  command = 'setl nocursorline'
})
