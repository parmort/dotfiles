local middot='·'
local raquo='»'
local small_l='ℓ'

local function strip(text)
  return vim.fn.substitute(text, '\v *', '', '')
end

function Foldtext()
  local lines = vim.v.foldend - vim.v.foldstart + 1
  local line_text = strip(vim.fn.getline(vim.v.foldstart))
  local dashes = vim.fn.substitute(vim.v.folddashes, '-', middot, 'g')

  return string.format('%s%s[%d%s]: %s',
    raquo, dashes, lines, small_l, line_text
  )
end

vim.opt.foldmethod = 'indent'
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 10
vim.opt.foldtext = 'v:lua.Foldtext()'
