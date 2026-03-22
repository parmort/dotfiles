local M = {}

function M.github(repo, opts)
  opts = opts or {}
  local spec = { src = "https://github.com/"..repo }
  for k,v in pairs(opts) do
    spec[k] = v
  end

  return spec
end

function M.keybind_training(msg)
  return function()
    vim.notify(msg, vim.log.levels.WARN)
  end
end

return M
