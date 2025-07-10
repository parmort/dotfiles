local M = {}

function M.colors_pre()
  require('catppuccin').setup{
    flavour = 'frappe',
    transparent_background = true,
    dim_inactive = {
      enabled = false
    },
    custom_highlights = function(c)
      local tabline = {
        bg = c.crust,
        num = c.lavender,
      }

      return {
        -- Tabline
        TabLine = { fg = c.subtext0, bg = tabline.bg },
        TabLineFill = { bg = tabline.bg },
        User2 = { fg = tabline.num, bg = tabline.bg},
        TabLineSel = { bg = c.base, style = {'bold'} },
        User3 = { fg = tabline.num, bg = c.base, style = {'bold'} },

        -- Statusline
        StatusLine = { bg = c.crust },
        StatusLineNC = { fg = c.subtext0, bg = c.surface0 },

        WinSeparator = { fg = c.crust },

        Folded = { style = {'italic'} }
      }
    end
  }
end

function M.colors()
end

return M
