local M = {}
local nvim = M

-- M.command = vim.api.nvim_command

function M.err(msg)
  M.command('echohl WarningMsg')
  M.command('echo "'..msg..'"')
  vim.api.nvim_command('echohl None')
end

return nvim
