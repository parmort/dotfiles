local function strip(text)
  return vim.fn.substitute(text, '\v +', '', '')
end

function Foldtext()
  local lines = vim.v.foldend - vim.v.foldstart + 1
  local line_text = vim.trim(vim.fn.getline(vim.v.foldstart))
  local dashes = vim.fn.substitute(vim.v.folddashes, '-', '·', 'g')

  vim.cmd.echom(line_text)
  return string.format('»%s[%dℓ]: %s',
    dashes, lines, line_text
  )
end

vim.opt.foldmethod = 'indent'
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 10
vim.opt.foldtext = 'v:lua.Foldtext()'
