local M = {}

M.state = {
  headline = vim.api.nvim_get_namespaces()['headlines_namespace'] ~= nil,
  spell = false
}

function M.enter()
  if M.state.headline and require('headlines').config[vim.bo.filetype] then
    M.state.spell = vim.opt_local.spell
    vim.opt_local.spell = true
  else
    require('twilight').enable()
  end
end

function M.leave()
  if M.state.headline and require('headlines').config[vim.bo.filetype] then
    vim.opt_local.spell = M.state.spell
  else
    require('twilight').disable()
  end
end

return M
