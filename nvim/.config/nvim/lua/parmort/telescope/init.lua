require'plenary.reload'.reload_module('telescope')

local telescope = require'telescope.builtin'
local P = {}

local function global(opts)
  return require'telescope.themes'.get_dropdown(vim.tbl_deep_extend('keep', opts, {
    previewer = false
  }))
end

function P.git_files()
  telescope.git_files(global{})
end

function P.help_tags()
  telescope.help_tags(global{})
end

function P.reloader()
  telescope.reloader(global{})
end

return P
