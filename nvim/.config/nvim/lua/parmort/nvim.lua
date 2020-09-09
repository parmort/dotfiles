local nvim = {}
nvim.command = vim.api.nvim_command

nvim.err = function (msg)
  nvim.command('echohl WarningMsg')
  nvim.command('echo "'..msg..'"')
end

return nvim
