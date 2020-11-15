local M = {}
local util = M

function M.err(msg)
  vim.api.nvim_command('echohl WarningMsg')
  vim.api.nvim_command('echo "'..msg..'"')
  vim.api.nvim_command('echohl None')
end

function M.prequire(pkg)
  local ok, msg = pcall(function() require(pkg) end)

  if not ok then
    M.err(msg)
  end
end

function M.highlight(group, attr)
  local cmd = 'highlight '..group

  for k,v in pairs(attr) do
    cmd = cmd..' '..k..'='..v
  end

  vim.cmd(cmd)
end

M.au = {}
function M.au.c(event, pat, cmd, opts)
  local str = 'autocmd'
  opts = opts or {}

  if event == '!' then
    vim.cmd(str .. '!')
    return
  end

  if opts.group then
    str = str .. ' ' .. opts.group
  end

  str = str .. ' ' .. event .. ' ' .. pat

  if opts.once then
    str = str .. ' ++once'
  end

  if opts.nested then
    str = str .. ' ++nested'
  end

  str = str .. ' ' .. cmd

  vim.cmd(str)
end

function M.au.g(group)
  vim.cmd('augroup '..group)
end

return util
