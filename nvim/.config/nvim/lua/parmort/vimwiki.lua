local M = {}

local function makeHeader(lvl, text)
  if lvl == 1 then
    return text
  end

  return string.rep('│ ', lvl-2) .. '├ ' .. text
end

function M.generateTOC()
  if not vim.g.loaded_vimwiki then
    return
  end

  local headers = vim.fn['vimwiki#base#collect_headers']()
  local title = vim.fn['vimwiki#vars#get_wikilocal']('toc_header')
  local toc = {}

  for _,v in pairs(headers) do
    if v[3] ~= title then
      local txt = makeHeader(v[2], v[3])

      table.insert(toc, {
        bufnr = vim.fn.bufnr('%'),
        lnum = v[1],
        text = txt
      })
    end
  end

  vim.fn.setloclist(0, toc, ' ')
  vim.fn.setloclist(0, {}, 'a', {title=title})
  vim.cmd.lopen()
end

return M
