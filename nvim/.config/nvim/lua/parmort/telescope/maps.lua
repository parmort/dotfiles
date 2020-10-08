local map = vim.api.nvim_set_keymap

local function action(act)
  local str = "<cmd>lua require'parmort.util'.rerequire'parmort.telescope'."
  return str .. act .. "()<CR>"
end

map('n', '<leader>t', action'git_files', {})
map('n', '<leader>h', action'help_tags', {})
