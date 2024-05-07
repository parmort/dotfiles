local leader = require('parmort.keymap').leader
local cmd = require('parmort.keymap').command

local function map_builtin(mode, lhs, rhs, opts)
  local action = string.format(cmd 'lua require"telescope.builtin".%s()', rhs)
  vim.keymap.set(mode, lhs, action, opts)
end

require('telescope').setup({
  defaults = { -- Dropdown theme, without the previewer
    results_title = false,
    previewer = false,
    sorting_strategy = "ascending",
    layout_strategy = "center",

    layout_config = {
      width = function(_, max_cols, _)
        return math.min(max_cols, 80)
      end,

      height = function(_, _, max_lines)
        return math.min(max_lines, 15)
      end
    },

    border = true,
    borderchars = {
      prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
  }
})

map_builtin('n', leader 't', 'git_files')
map_builtin('n', leader 'h', 'help_tags')
map_builtin('n', leader 'p', 'reloader')
map_builtin('n', leader 'c', 'commands')
