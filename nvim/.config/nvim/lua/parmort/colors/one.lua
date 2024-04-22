local M = {}

function M.colors_pre()
  if not vim.fn.exists('g:one_allow_italics') then
    vim.g.one_allow_italics = 1
  end
end

function M.colors()
  vim.fn['one#highlight']('TabLine',    '282c34', '3e4452', 'none')
  vim.fn['one#highlight']('TabLineSel', '61afef', '282c34', 'none')
  vim.fn['one#highlight']('MatchParen', '',       '',       'none')
  vim.fn['one#highlight']('VertSplit',  '3e4452', '282c34', 'none')
end

return M
