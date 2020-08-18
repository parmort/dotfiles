local function readTags(file)
  local tags = {}

  for line in io.lines(file) do
    table.insert(tags, vim.split(line, '\t')[1])
  end

  return tags
end

local function helptags()
  if vim.fn.has('nvim') == 0 then
    print('Neovim required to run helptags.')
    return
  end

  if vim.g.loaded_fzf == nil then
    print('FZF not loaded.')
    return
  end

  local tagFiles = vim.fn.findfile('doc/tags', vim.api.nvim_get_option('runtimepath'), -1)
  local tags = {}

  for _, file in ipairs(tagFiles) do
    for _, tag in ipairs(readTags(file)) do table.insert(tags, tag) end
  end

  vim.fn['fzf#run'](vim.fn['fzf#wrap']({ sink = 'help'; source = tags}))
end

return helptags
