local util = {}

--- @param mode string
--- @param lhs string
--- @param rhs string
--- @param options? {remap:string}
function util.abbrev(mode, lhs, rhs, options)
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

return util
