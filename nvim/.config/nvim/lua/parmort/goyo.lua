local M = {}

function M.enter()
  vim.opt_local.wrap = true
  vim.opt_local.cursorline = false

  if vim.o.filetype ~= 'gitcommit' then
    vim.cmd [[Limelight]]
    vim.opt_local.spell = true
  end
end

function M.leave()
  vim.opt_local.wrap = false
  vim.opt_local.cursorline = true

  if vim.o.filetype ~= 'gitcommit' then
    vim.cmd [[Limelight!]]
    vim.opt_local.spell = false
  end
end

return M
