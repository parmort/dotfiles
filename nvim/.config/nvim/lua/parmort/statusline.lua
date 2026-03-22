local M = {}

function M.isHelp()
  return vim.bo.filetype == 'help'
end

function M.isReadOnly()
  return vim.bo.readonly or not vim.bo.modifiable
end

function M.isNetrw()
  return vim.bo.filetype == 'netrw'
end

function M.isDirvish()
  return vim.bo.filetype == 'dirvish'
end

M.modes = {
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

function M.mod(name, default)
  if default then default = string.format("'%s'", default) end

  return string.format(
    [[%%{v:lua.Parmort.statusline.%s(%s)}]],
    name, default or ''
  )
end

return M
