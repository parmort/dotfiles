local telescope = require'telescope.builtin'
local M = {}

local function theme(opts)
  return require'telescope.themes'.get_dropdown(vim.tbl_deep_extend('keep', opts, {
    previewer = false
  }))
end

function M.git_files()
  telescope.git_files(theme{})
end

function M.help_tags()
  telescope.help_tags(theme{})
end

function M.reloader()
  telescope.reloader(theme{})
end

function M.commands()
  telescope.commands(theme{})
end

return M
