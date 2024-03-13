local function abbrev(mode, lhs, rhs, options)
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

abbrev('c', 'w', 'update')
abbrev('c', 'vs', 'SourceConf')
