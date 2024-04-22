local util = require('parmort.util')
local highlight = util.highlight
local gui_attrs = util.gui_attrs

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
  highlight('TabLine',      gui_attrs(M[10], M[1], 'italic'))
  highlight('TabLineSel',   gui_attrs(nil,   nil,  'bold'))
  highlight('User3',        gui_attrs(M[8],  nil,  'bold'))
  highlight('User2',        gui_attrs(M[9],  M[1], nil))

  -- Statusline
  highlight('Statusline',   gui_attrs(M[6],  M[3], nil))
  highlight('StatuslineNC', gui_attrs(M[9],  M[1], nil))
  highlight('User4',        gui_attrs(nil,   M[3], 'italic'))

  -- Fold Text
  highlight('Folded',       gui_attrs(M[10], M[1], 'italic'))

  -- Ledger
  highlight('ledgerTransactionMetadata', 'Comment')
end

return M
