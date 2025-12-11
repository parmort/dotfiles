local stl = require('parmort.statusline')

local statusline = {}
Parmort.statusline = statusline

function statusline.mode(default)
  default = default or ''

  if stl.isHelp() or stl.isReadOnly() then return default end

  local function getMode()
    if stl.isDirvish() then
      return 'dirvish'
    elseif stl.isNetrw() then
      return 'netrw'
    else
      return vim.api.nvim_get_mode().mode
    end
  end

  local cur = stl.modes[getMode()]

  if not cur then return default end
  return string.format("[%s] ", cur)
end

function statusline.git_branch(default)
  if vim.g.loaded_fugitive and vim.fn.FugitiveGitDir() ~= '' then
    return string.format('[%s] ', vim.fn['fugitive#Head']())
  end

  return default or ''
end

function statusline.name(default)
  local name = nil

  if stl.isHelp() then
    name = vim.fn.expand('%:t:r')
  elseif stl.isNetrw() then
    name = vim.b.netrw_curdir
  elseif stl.isDirvish() then
    name = vim.fn.expand('%:.')
  else
    name = vim.fn.expand('%:t')
  end

  if not name then
    return (default or '') .. ' '
  end

  return name .. ' '
end

function statusline.spell(default)
  if vim.wo.spell then
    return '[SPL] '
  end

  return default or ''
end

function statusline.fmod(default)
  if stl.isHelp() then
    return '[HLP]'
  elseif stl.isNetrw() then
    return ''
  elseif vim.wo.previewwindow then
    return '[PRV]'
  elseif stl.isReadOnly() then
    return '[RO]'
  elseif vim.bo.modified then
    return '[+]'
  end

  return default or ''
end

function statusline.ftype(default)
  default = default or ''

  if stl.isHelp() or stl.isNetrw() or stl.isDirvish() then
    return default
  end

  if vim.bo.filetype == '' then
    return default
  end

  return vim.bo.filetype .. ' '
end

function statusline.obsession(default)
  if not vim.g.loaded_obsession or not vim.g.this_obsession then
    return default or ''
  end

  return vim.fn.ObsessionStatus() .. ' '
end

function statusline.fformat(default)
  if vim.bo.fileformat == 'dos' then
    return '[DOS] '
  end

  return default or ''
end

function statusline.active()
  return table.concat {
    stl.mod('mode', ' '),
    stl.mod('git_branch'),
    stl.mod('name'),
    stl.mod('spell'),
    stl.mod('fmod'),
    '%=',  -- RIGHT ALIGN
    stl.mod('ftype'),
    stl.mod('obsession'),
    stl.mod('fformat'),
    '[%p%%]'
  }
end

function statusline.inactive()
  return table.concat {
    stl.mod('git_branch', ' '),
    stl.mod('name'),
    stl.mod('spell'),
    stl.mod('fmod'),
    '%=',  -- RIGHT ALIGN
    stl.mod('ftype'),
    stl.mod('fformat'),
    '[%p%%]'
  }
end

local aug = vim.api.nvim_create_augroup('parmort.focus', {
  clear = false
})

vim.api.nvim_create_autocmd({'WinEnter', 'BufEnter'}, {
  pattern = '*', group = aug,
  callback = function()
    vim.opt_local.statusline = '%!v:lua.Parmort.statusline.active()'
  end
})

vim.api.nvim_create_autocmd({'WinLeave', 'BufLeave'}, {
  pattern = '*', group = aug,
  callback = function()
    vim.opt_local.statusline = '%!v:lua.Parmort.statusline.inactive()'
  end
})
