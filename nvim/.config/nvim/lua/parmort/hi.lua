local hi = {}

---@class HiAttributes
---@field guifg? string GUI Foreground Color
---@field guibg? string GUI Background Color
---@field gui? string GUI Attributes

---@class HiOpts
---@field clear? boolean If true, will clear the group first

--- A wrapper around :highlight
---@param group string (string) Highlight Group name. See `:h highlight-groups`
---@param attr HiAttributes|string (table|string) The attributes for `group`, given as one of the following:
---    - (string) The name of a hl-group to link to `group`.
---    - (table) The attributes to assign to `group`. See `:h highlight-args`
---@param opts? HiOpts (table|nil) Options for highlighting a group:
---    - clear: (boolean) Clear `group` before setting a highlight. Useful for
---             linking groups together (defaults to `false`)
---@return nil
function hi.highlight(group, attr, opts)
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

--- Generate a table of attributes for using gui colors. To not pass an
--- attribute, pass `nil` into the function---all parameters are required.
---@param fg string|nil (string|nil) The hex value of the foreground color
---    (defaults to 'fg')
---@param bg string|nil (string|nil) The hex value of the background color
---    (defaults to 'bg')
---@param attr string|nil (string|nil) The comma-separated list of attributes,
---    See `:h attr-list` (defaults to 'none')
---@return HiAttributes (table) The list of attributes for gui colors
function hi.gui_attrs(fg, bg, attr)
  --- @type HiAttributes
  return {
    guifg = fg or 'fg',
    guibg = bg or 'bg',
    gui = attr or 'none'
  }
end

return hi
