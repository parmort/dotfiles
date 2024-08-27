local M = {}

function M.enter()
  if vim.o.filetype ~= 'gitcommit' then
    vim.opt_local.spell = true
  end
end

function M.leave()
  if vim.o.filetype ~= 'gitcommit' then
    vim.opt_local.spell = false
  end
end

return M
