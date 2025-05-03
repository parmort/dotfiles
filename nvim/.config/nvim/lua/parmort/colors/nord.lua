local hi = require('parmort.hi')
local highlight = hi.highlight
local gui = hi.gui_attrs

local M = {
  [0]  = "#2E3440",
  [1]  = "#3B4252",
  [2]  = "#434C5E",
  [3]  = "#4C566A",
  [4]  = "#D8DEE9",
  [5]  = "#E5E9F0",
  [6]  = "#ECEFF4",
  [7]  = "#8FBCBB",
  [8]  = "#88C0D0",
  [9]  = "#81A1C1",
  [10] = "#5E81AC",
  [11] = "#BF616A",
  [12] = "#D08770",
  [13] = "#EBCB8B",
  [14] = "#A3BE8C",
  [15] = "#B48EAD",
}

function M.colors_pre()
  vim.g.nord_cursor_line_number_background = 1
  vim.g.nord_italic = 1
  vim.g.nord_italic_comments = 1
end

function M.colors()
  -- Tabline
  highlight('TabLine',      gui(M[10], M[1], 'italic'))
  highlight('TabLineSel',   gui(nil,   nil,  'bold'))
  highlight('User3',        gui(M[8],  nil,  'bold'))
  highlight('User2',        gui(M[9],  M[1], nil))

  -- Statusline
  highlight('Statusline',   gui(M[6],  M[3], nil))
  highlight('StatuslineNC', gui(M[9],  M[1], nil))
  highlight('User4',        gui(nil,   M[3], 'italic'))

  -- Fold Text
  highlight('Folded',       gui(M[10], M[1], 'italic'))

  -- Ledger
  highlight('ledgerTransactionMetadata', 'Comment')

  -- Markdown
  highlight('@markup.list.markdown', 'Keyword')

  -- nvim-0.10 backwards-compatibility
  highlight('NormalFloat', 'Pmenu', { clear = true })
  highlight('WinSeparator', 'VertSplit')

  vim.api.nvim_set_hl(0, 'Headline', { bg = M[3] })
  vim.api.nvim_set_hl(0, 'CodeBlock', { bg = M[1] })
end

return M
