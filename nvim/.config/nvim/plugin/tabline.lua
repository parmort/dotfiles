Tabline = {}

local labels = {}

--- @param bufnr number
local function fname(bufnr)
  local name = vim.fn.bufname(bufnr)

  if name == '' then
    name = '[No Name]'
  elseif vim.fn.isdirectory(name) == 1 then
    name = vim.fn.fnamemodify(name, ':~:h')
  else
    name = vim.fn.fnamemodify(name, ':t')
  end

  return vim.fn.pathshorten(name)end

function Tabline.line()
  local line = {}
  local cur = vim.fn.tabpagenr()

  for i=1,vim.fn.tabpagenr('$') do
    local hi_grp, label_grp

    if i == cur then
      hi_grp = '%#TabLineSel#'
      label_grp='%3*'
    else
      hi_grp = '%#Tabline#'
      label_grp = '%2*'
    end

    line[i] = string.format('%s%%%dT %s%d %s%%{v:lua.Tabline.label(%d)} ',
      hi_grp, i, label_grp, i, hi_grp, i)
  end

  return string.format('%s%%#TablineFill#%%T', table.concat(line))
end

function Tabline.label(tabnr)
  -- Remember, lua is 1-indexed
  local winnr = vim.fn.tabpagewinnr(tabnr)
  local bufnr = vim.fn.tabpagebuflist(tabnr)[winnr]

  local modified = ''
  if vim.fn.getbufinfo(bufnr)[1]['changed'] == 1 then
    modified = ' ●'
  end

  -- If not a floating window, set the label
  local winid = vim.fn.win_getid(winnr, tabnr)
  if vim.api.nvim_win_get_config(winid).relative == '' then
    labels[tabnr] = fname(bufnr) .. modified
  end

  return labels[tabnr]
end

vim.opt.tabline = '%!v:lua.Tabline.line()'
