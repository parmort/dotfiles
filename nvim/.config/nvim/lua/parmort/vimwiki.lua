local otl = require('parmort.outliner')

local M = {}

function M.toc()
  if not vim.g.loaded_vimwiki then
    return
  end

  -- [lnum, level, text]
  local headings = vim.fn['vimwiki#base#collect_headers']()
  local title = vim.fn['vimwiki#vars#get_wikilocal']('toc_header')

  ---@type Header[]
  local headers = {}

  for _,head in pairs(headings) do
    if head[3] ~= title then
      table.insert(headers, {
        lnum = head[1],
        level = head[2],
        text = head[3],
      })
    end
  end

  local toc = otl.genTree(headers)

  otl.setloclist(toc, 'Vimwiki')
  vim.cmd.lopen()
end

return M
