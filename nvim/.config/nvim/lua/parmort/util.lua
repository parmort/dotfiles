local util = {}

--- @param group string
--- @param attr table|string If a string, then `group` is linked to `attr`; otherwise, `attr` is a table of attributes
function util.highlight(group, attr)
  if type(attr) == 'string' then
    vim.cmd(string.format('highlight link %s %s', group, attr))
    return
  end

  local cmd = 'highlight '..group

  for k,v in pairs(attr) do
    cmd = cmd..' '..k..'='..v
  end

  vim.cmd(cmd)
end

--- @param fg   string|nil
--- @param bg   string|nil
--- @param attr string|nil
function util.gui_attrs(fg, bg, attr)
  return {
    guifg = fg or 'fg',
    guibg = bg or 'bg',
    gui = attr or 'none'
  }
end

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
