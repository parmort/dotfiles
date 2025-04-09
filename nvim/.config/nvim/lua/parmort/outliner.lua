local M = {}

function M.closeQFWindow()
  if vim.w.qf_toc or vim.regex("\\<TOC$"):match_str(vim.w.quickfix_title) then
    vim.cmd.lclose()
  end
end

---@alias Header { lnum: integer, level: integer, text: string,
---has_next: boolean?, lines: boolean[]? }

---@alias TOC { bufnr: integer, lnum: integer, text: string }

local function makeHeader(h)
  if h.level == 1 then
    return h.text
  end

  local char = '└ '
  if h.has_next then
    char = '├ '
  end

  local pref = ''
  for i = 1,h.level-2 do
    if h.lines[i] == true then
      pref = pref .. '│ '
    else
      pref = pref .. '  '
    end
  end

  return pref .. char .. h.text
end

---@param headers Header[]
---@return TOC[]
function M.genTree(headers)
  ---@type TOC[]
  local toc = {}

  for i = 1,#headers do
    local cur = headers[i]

    cur.has_next = false
    for j = i+1,#headers do
      if cur.level > headers[j].level then
        break
      end

      if cur.level == headers[j].level then
        cur.has_next = true
        break
      end
    end

    if i > 1 then
      cur.lines = headers[i-1].lines
      cur.lines[headers[i-1].level-1] = headers[i-1].has_next
    else
      headers[i].lines = {false, false, false, false}
    end

    local txt = makeHeader(cur)

    table.insert(toc, {
      bufnr = vim.fn.bufnr('%'),
      lnum = cur.lnum,
      text = txt
    })
  end

  return toc
end

---@param toc TOC[]
---@param title string
function M.setloclist(toc, title)
  vim.fn.setloclist(0, toc, ' ')
  vim.fn.setloclist(0, {}, 'a', {title=title..' TOC'})
end

return M
