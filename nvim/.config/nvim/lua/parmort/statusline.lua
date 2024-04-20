-- Statusline module definitions. Used in `plugin/statusline.lua`
local M = {}

local function isHelp()
  return vim.bo.filetype == 'help'
end

local function isReadOnly()
  return vim.bo.readonly or not vim.bo.modifiable
end

function M.mode()
  if isHelp() or isReadOnly() then return ' ' end

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
  return string.format("[%s] ", modes[getMode()])
end

function M.git_branch()
  if vim.g.loaded_fugitive and vim.fn.FugitiveGitDir() ~= '' then
    return string.format('[%s] ', vim.fn['fugitive#Head']())
  end

  return ''
end

function M.name()
  local name = ""
  if isHelp() then
    name = vim.fn.expand('%:t:r')
  elseif vim.bo.filetype == 'netrw' then
    name = vim.b.netrw_curdir
  elseif vim.bo.filetype == 'dirvish' then
    name = vim.fn.expand('%:.')
  else
    name = vim.fn.expand('%:t')
  end

  return name .. ' '
end

function M.spell()
  if vim.wo.spell then
    return '[SPL] '
  end

  return ''
end

function M.fmod()
  if isHelp() then
    return '[HLP]'
  elseif vim.bo.filetype == 'netrw' then
    return ''
  elseif vim.wo.previewwindow then
    return '[PRV]'
  elseif isReadOnly() then
    return '[RO]'
  elseif vim.bo.modified then
    return '[+]'
  end

  return ''
end

function M.ftype()
  if isHelp() then
    return ''
  elseif vim.bo.filetype == 'netrw' then
    return ''
  elseif vim.bo.filetype == 'dirvish' then
    return ''
  end

  return vim.bo.filetype .. ' '
end

--- @return string
function M.obsession()
  if not vim.g.loaded_obsession or not vim.g.this_obsession then
    return ''
  end

  return vim.fn.ObsessionStatus() .. ' '
end

function M.fformat()
  if vim.bo.fileformat == 'dos' then
    return '[DOS] '
  end

  return ''
end

return M
