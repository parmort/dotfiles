-- Modules defined in `lua/parmort/statusline.lua`
Statusline = {} -- keep global!
local stl_modules = 'parmort.statusline'

local function mod(name, default)
  if default then default = string.format("'%s'", default) end

  return string.format(
    [[%%{luaeval("require'%s'.%s(%s)")}]],
    stl_modules, name, default or ''
  )
end

function Statusline.active()
  return table.concat {
    mod('mode', ' '),
    mod('git_branch'),
    mod('name'),
    mod('spell'),
    mod('fmod'),
    '%=',  -- RIGHT ALIGN
    mod('ftype'),
    mod('obsession'),
    mod('fformat'),
    '[%p%%]'
  }
end

function Statusline.inactive()
  return table.concat {
    mod('git_branch', ' '),
    mod('name'),
    mod('spell'),
    mod('fmod'),
    '%=',  -- RIGHT ALIGN
    mod('ftype'),
    mod('fformat'),
    '[%p%%]'
  }
end

local function set_active_line()
  vim.opt_local.statusline = '%!v:lua.Statusline.active()'
end

local function set_inactive_line()
  vim.opt_local.statusline = '%!v:lua.Statusline.inactive()'
end

local grp = vim.api.nvim_create_augroup('StatusLine', { clear = true })

vim.api.nvim_create_autocmd({'WinEnter', 'BufEnter'}, {
  pattern = '*', group = grp,
  callback = set_active_line
})

vim.api.nvim_create_autocmd({'WinLeave', 'BufLeave'}, {
  pattern = '*', group = grp,
  callback = set_inactive_line
})
