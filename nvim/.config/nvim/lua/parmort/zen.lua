local M = {}

M.state = {
  headline = vim.api.nvim_get_namespaces()['headlines_namespace'] ~= nil,
  spell = false
}

M.ft = {
  'markdown',
  'vimwiki'
}

function M.enter()
  if vim.tbl_contains(M.ft, vim.bo.filetype) then
    M.state.spell = vim.opt_local.spell
    vim.opt_local.spell = true
  else
    require('twilight').enable()
  end
end

function M.leave()
  if vim.tbl_contains(M.ft, vim.bo.filetype) then
    vim.opt_local.spell = M.state.spell
  else
    require('twilight').disable()
  end
end

return M
