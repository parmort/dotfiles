local M = {}

function M.github(repo, opts)
  opts = opts or {}
  local spec = { src = "https://github.com/"..repo }
  for k,v in pairs(opts) do
    spec[k] = v
  end

  return spec
end

return M
