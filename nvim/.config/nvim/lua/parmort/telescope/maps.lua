local function map(key, act, default)
  local action = function(act, default)
    local str
    if not default then
      str = "<cmd>lua require'parmort.telescope'."
    else
      str = "<cmd>lua require'telescope.builtin'."
    end
    return str .. act .. "()<CR>"
  end

  vim.api.nvim_set_keymap('n', key, action(act, default), {noremap = true})
end

map('<leader>t', 'git_files')
map('<leader>h', 'help_tags')
map('<leader>p', 'reloader')

-- Development maps
map('<leader>H', 'help_tags', true)
