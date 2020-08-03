local function readTags(tags, file)
  for line in io.lines(file) do
    for field in string.gmatch(line, "%S+") do
      table.insert(tags, field)
      break
    end
  end

  return tags
end

local function helptags()
  local tagFiles = vim.fn.findfile('doc/tags', vim.api.nvim_get_option('runtimepath'), -1)
  local tags = {}

  for _, file in pairs(tagFiles) do
    tags = readTags(tags, file)
  end

  return tags
end

return {
  helptags = helptags
}
