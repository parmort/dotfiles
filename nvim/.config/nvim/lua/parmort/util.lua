local M = {}

--- @param group string
--- @param attr table
function M.highlight(group, attr)
  local cmd = 'highlight '..group

  for k,v in pairs(attr) do
    cmd = cmd..' '..k..'='..v
  end

  vim.cmd(cmd)
end

--- @param mode string
--- @param lhs string
--- @param rhs string
--- @param options? {remap:string}
function M.abbrev(mode, lhs, rhs, options)
  options = options or {}
  local command = {
    cmd = mode,
    args = {lhs, rhs}
  }

  if not options.remap then
    command.cmd = command.cmd .. 'nore'
  end

  command.cmd = command.cmd .. 'abbrev'

  vim.cmd(command)
end

return M
