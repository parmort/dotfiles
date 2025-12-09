local M = {}

function M.github(repo, opts)
  opts = opts or {}
  local spec = { src = "https://github.com/"..repo }
  for k,v in pairs(opts) do
    spec[k] = v
  end

  return spec
end

function M.echo_train(msg)
  return function()
    vim.cmd.echohl('ErrorMsg')
    vim.cmd.echo(string.format([["%s"]], msg))
    vim.cmd.echohl('None')
  end
end

return M
