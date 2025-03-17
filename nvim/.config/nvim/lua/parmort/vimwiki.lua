local M = {}

local function makeHeader(_, lvl, text, has_next, lines)
  if lvl == 1 then
    return text
  end

  local char = '└ '
  if has_next then
    char = '├ '
  end

  local pref = ''
  for i = 1,lvl-2 do
    if lines[i] == true then
      pref = pref .. '│ '
    else
      pref = pref .. '  '
    end
  end

  return pref .. char .. text
end

function M.generateTOC()
  if not vim.g.loaded_vimwiki then
    return
  end

  -- [lnum, level, text]
  local headers = vim.fn['vimwiki#base#collect_headers']()
  local title = vim.fn['vimwiki#vars#get_wikilocal']('toc_header')
  local toc = {}

  for i = 1,#headers do
    local v = headers[i]

    -- header[4]: Add a `has_next` attribute to each header
    v[4] = false
    for j = i+1,#headers do
      if v[2] > headers[j][2] then
        break
      end

      if v[2] == headers[j][2] then
        v[4] = true
        break
      end
    end

    -- header[5]: Add a `has_next` attribute to each header
    if i > 1 then
      v[5] = headers[i-1][5]
      v[5][headers[i-1][2]-1] = headers[i-1][4]
    else
      headers[i][5] = {false, false, false, false}
    end

    if v[3] ~= title then
      local txt = makeHeader(unpack(v))

      table.insert(toc, {
        bufnr = vim.fn.bufnr('%'),
        lnum = v[1],
        text = txt
      })
    end
  end

  vim.fn.setloclist(0, toc, ' ')
  vim.fn.setloclist(0, {}, 'a', {title='Vimwiki TOC'})
  vim.cmd.lopen()
end

return M
