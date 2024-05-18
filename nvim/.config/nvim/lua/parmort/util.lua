local util = {}

---@class HighlightAttributes
---@field guifg? string GUI Foreground Color
---@field guibg? string GUI Background Color
---@field gui? string GUI Attributes

---@class HighlightOpts
---@field clear? boolean If true, will clear the group first

--- @param group string
--- @param attr HighlightAttributes|string If `attr` is a string, then `group` is linked to `attr`.
--- @param opts? HighlightOpts
function util.highlight(group, attr, opts)
  opts = opts or { clear = false }

  if opts.clear then
    vim.cmd(string.format('highlight clear %s', group))
  end

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
--- @return HighlightAttributes
function util.gui_attrs(fg, bg, attr)
  --- @type HighlightAttributes
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
