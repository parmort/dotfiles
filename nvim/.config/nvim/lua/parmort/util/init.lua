local M = {}
local util = M
M.nvim = require'parmort.util.nvim'

function M.prequire(pkg)
  local ok, msg = pcall(function() require(pkg) end)

  if not ok then
    M.nvim.err(msg)
  end
end

return util
