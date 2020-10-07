local theme = require'telescope.themes'.get_dropdown
local telescope = require'telescope.builtin'
local P = {}

function P.git_files()
  telescope.git_files(theme{ preview = false })
end

return P
