local util = require('parmort.util')
local highlight = util.highlight
local gui_attrs = util.gui_attrs

local M = {}

function M.colors_pre()
  if not vim.fn.exists('g:seoul256_background') then
    -- Darker background, default 237
    vim.g.seoul256_background = 236
  end
end

function M.colors()
  highlight('Comment', { gui = 'italic' })

  vim.cmd [[highlight clear Visual]]
  highlight('Visual', 'CursorLine')

  highlight('vimUserFunc', 'Function')

  -- Tabline
  highlight('Tabline',    gui_attrs('#999872', '#565656', nil))
  highlight('TabLineSel', gui_attrs(nil,       nil,       'bold'))
  highlight('User3',      gui_attrs('#be7572', nil,       'bold'))

  -- Statusline
  highlight('User4', gui_attrs('#9a7372', '#dfdebd', 'bold,reverse,italic'))
end

return M
