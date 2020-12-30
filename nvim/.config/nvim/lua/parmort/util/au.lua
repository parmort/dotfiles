local M = {}
local au = M

function M.c(event, pat, cmd, opts)
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

function M.g(group)
  vim.cmd('augroup '..group)
end

return au
