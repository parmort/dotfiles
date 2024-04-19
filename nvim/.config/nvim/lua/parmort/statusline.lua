local function mode()
  local function getMode()
    if vim.bo.filetype == 'dirvish' then
      return 'dirvish'
    elseif vim.bo.filetype == 'netrw' then
      return 'netrw'
    else
      return vim.api.nvim_get_mode().mode
    end
  end

  local modes = {
    ['n']       = 'NORMAL',
    ['i']       = 'INSERT',
    ['R']       = 'REPLCE',
    ['v']       = 'VISUAL',
    ['V']       = 'V-LINE',
    ['']      = 'V-BLCK',
    ['c']       = 'C-LINE',
    ['t']       = ' TERM ',
    ['netrw']   = 'NET-RW',
    ['dirvish'] = 'DIRVSH'
  }
  return string.format("[%s]", modes[getMode()])
end

local function git_branch()
  if vim.g.loaded_fugitive and vim.fn.FugitiveGitDir() ~= '' then
    return string.format('[%s] ', vim.fn['fugitive#Head']())
  end

  return ''
end

local function name()
  if vim.bo.filetype == 'help' then
    return vim.fn.expand('%:t:r')
  elseif vim.bo.filetype == 'netrw' then
    return vim.b.netrw_curdir
  elseif vim.bo.filetype == 'dirvish' then
    return vim.fn.expand('%:.')
  end

  return vim.fn.expand('%:t')
end

local function spell()
  if vim.wo.spell then
    return '[SPL] '
  end

  return ''
end

local function fmod()
  if vim.bo.filetype == 'help' then
    return '[HLP]'
  elseif vim.bo.filetype == 'netrw' then
    return ''
  elseif vim.wo.previewwindow then
    return '[PRV]'
  elseif vim.bo.readonly or not vim.bo.modifiable then
    return '[RO]'
  elseif vim.bo.modified then
    return '[+]'
  end

  return ''
end

local function ftype()
  if vim.bo.filetype == 'help' then
    return ''
  elseif vim.bo.filetype == 'netrw' then
    return ''
  elseif vim.bo.filetype == 'dirvish' then
    return ''
  end

  return vim.bo.filetype
end

local function obsession()
  if not vim.g.loaded_obsession or not vim.g.this_obsession then
    return ''
  end

  return vim.fn.ObsessionStatus() .. ' '
end

local function fformat()
  if vim.bo.fileformat == 'dos' then
    return '[DOS] '
  end

  return ''
end

function Statusline()
  return table.concat {
    mode() .. ' ',
    git_branch(),
    name() .. ' ',
    spell(),
    fmod(),
    '%=',  -- RIGHT ALIGN
    ftype() .. ' ',
    obsession(),
    fformat(),
    '[%p%%]'
  }
end

vim.opt.statusline = '%!v:lua.Statusline()'
