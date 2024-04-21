local paths = {
  ['swap']   = vim.env.XDG_CACHE_HOME .. '/nvim/swap//',
  ['backup'] = vim.env.XDG_CACHE_HOME .. '/nvim/backup//',
  ['undo']   = vim.env.XDG_CACHE_HOME .. '/nvim/undo//',
}

--- @param dir string
local function should_mkdir(dir)
  local msg = string.format('Create directory %s?', dir)
  return vim.fn.confirm(msg, '&Yes\n&No') == 1
end

for _, dir in ipairs(paths) do
  if not vim.fn.isdirectory(dir) and should_mkdir(dir) then
    vim.fn.mkdir(dir, 'p')
    vim.cmd.echomsg(string.format('Directory `%s` created.', dir))
  end
end

-- If root user, turn off autogen files
if vim.fn.exists('$SUDO_USER') then
  vim.opt.swapfile    = false
  vim.opt.backup      = false
  vim.opt.writebackup = false
else
  vim.opt.directory = { paths['swap'], '.' }
  vim.opt.backupdir = { paths['backup'], '.' }
end

if vim.fn.has('persistent_undo') then
  if vim.fn.exists('$SUDO_USER') then
    vim.opt.undofile = false
  else
    vim.opt.undodir  = { paths['undo'], '.' }
    vim.opt.undofile = true
  end
end
