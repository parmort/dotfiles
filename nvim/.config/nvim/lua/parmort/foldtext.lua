return function()
  local lines = vim.v.foldend - vim.v.foldstart + 1
  local line_text = vim.trim(vim.fn.getline(vim.v.foldstart))
  local dashes = vim.fn.substitute(vim.v.folddashes, '-', '·', 'g')

  return string.format('»%s[%dℓ]: %s',
    dashes, lines, line_text
  )
end
