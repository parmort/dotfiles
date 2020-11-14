local function map(key, act)
  local action = function(act)
    local str = "<cmd>lua require'parmort.util'.rerequire'parmort.telescope'."
    return str .. act .. "()<CR>"
  end

  vim.api.nvim_set_keymap('n', key, action(act), {noremap = true})
end

map('<leader>t', 'git_files')
map('<leader>h', 'help_tags')
map('<leader>p', 'reloader')
