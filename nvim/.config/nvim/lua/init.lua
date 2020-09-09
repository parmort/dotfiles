local nvim = require'parmort.nvim'

local function pload(module)
  local ok, msg = pcall(function() require(module) end)

  if not ok then
    nvim.err(msg)
  end
end

pload('parmort.lsp')
