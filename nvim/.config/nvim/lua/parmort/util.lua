local M = {}

--- @param group string
--- @param attr table|string If `attr` is a string, then `group` is linked to `attr`; otherwise, `attr` is a table of attributes for `:highlight`
function M.highlight(group, attr)
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
function M.gui_attrs(fg, bg, attr)
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
