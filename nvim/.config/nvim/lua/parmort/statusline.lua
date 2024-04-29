-- Statusline module definitions. Used in `plugin/statusline.lua`
-- Each module must implement an optional default value
local M = {}

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

local function isHelp()
  return vim.bo.filetype == 'help'
end

local function isReadOnly()
  return vim.bo.readonly or not vim.bo.modifiable
end

local function isNetrw()
  return vim.bo.filetype == 'netrw'
end

local function isDirvish()
  return vim.bo.filetype == 'dirvish'
end

--- @param default string|nil
--- @return string
function M.mode(default)
  default = default or ''

  if isHelp() or isReadOnly() then return default end

  local function getMode()
    if isDirvish() then
      return 'dirvish'
    elseif isNetrw() then
      return 'netrw'
    else
      return vim.api.nvim_get_mode().mode
    end
  end

  local cur = modes[getMode()]

  if not cur then return default end
  return string.format("[%s] ", cur)
end

--- @param default string|nil
--- @return string
function M.git_branch(default)
  if vim.g.loaded_fugitive and vim.fn.FugitiveGitDir() ~= '' then
    return string.format('[%s] ', vim.fn['fugitive#Head']())
  end

  return default or ''
end

--- @param default string|nil
--- @return string
function M.name(default)
  local name = nil

  if isHelp() then
    name = vim.fn.expand('%:t:r')
  elseif isNetrw() then
    name = vim.b.netrw_curdir
  elseif isDirvish() then
    name = vim.fn.expand('%:.')
  else
    name = vim.fn.expand('%:t')
  end

  if not name then
    return (default or '') .. ' '
  end

  return name .. ' '
end

--- @param default string|nil
--- @return string
function M.spell(default)
  if vim.wo.spell then
    return '[SPL] '
  end

  return default or ''
end

--- @param default string|nil
--- @return string
function M.fmod(default)
  if isHelp() then
    return '[HLP]'
  elseif isNetrw() then
    return ''
  elseif vim.wo.previewwindow then
    return '[PRV]'
  elseif isReadOnly() then
    return '[RO]'
  elseif vim.bo.modified then
    return '[+]'
  end

  return default or ''
end

--- @param default string|nil
--- @return string
function M.ftype(default)
  default = default or ''

  if isHelp() or isNetrw() or isDirvish() then
    return default
  end

  if vim.bo.filetype == '' then
    return default
  end

  return vim.bo.filetype .. ' '
end

--- @param default string|nil
--- @return string
function M.obsession(default)
  if not vim.g.loaded_obsession or not vim.g.this_obsession then
    return default or ''
  end

  return vim.fn.ObsessionStatus() .. ' '
end

--- @param default string|nil
--- @return string
function M.fformat(default)
  if vim.bo.fileformat == 'dos' then
    return '[DOS] '
  end

  return default or ''
end

return M
