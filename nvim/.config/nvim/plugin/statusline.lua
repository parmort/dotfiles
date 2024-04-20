-- Modules defined in `lua/parmort/statusline.lua`
Statusline = {}

--- @param name string
--- @param default string|nil
local function mod(name, default)
  if default then default = string.format("'%s'", default) end

  return string.format(
    [[%%{luaeval("require'parmort.statusline'.%s(%s)")}]],
    name, default or ''
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

local grp = vim.api.nvim_create_augroup('StatusLine', { clear = true })

vim.api.nvim_create_autocmd({'WinEnter', 'BufEnter'}, {
  pattern = '*', group = grp,
  command = 'setlocal statusline=%!v:lua.Statusline.active()'
})

vim.api.nvim_create_autocmd({'WinLeave', 'BufLeave'}, {
  pattern = '*', group = grp,
  command = 'setlocal statusline=%!v:lua.Statusline.inactive()'
})
