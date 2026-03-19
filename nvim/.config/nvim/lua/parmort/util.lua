local M = {}

function M.github(repo, opts)
  opts = opts or {}
  local spec = { src = "https://github.com/"..repo }
  for k,v in pairs(opts) do
    spec[k] = v
  end

  return spec
end

function M.err_to_user(msg)
  vim.cmd.echohl('ErrorMsg')
  vim.cmd.echo(string.format([["%s"]], msg))
  vim.cmd.echohl('None')
end

---For use with keybinds. Creates a function that echoes `msg`.
function M.keybind_training(msg)
  return function()
    M.err_to_user(msg)
  end
end

return M
