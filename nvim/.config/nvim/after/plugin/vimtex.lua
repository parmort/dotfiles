-- vim.g.vimtex_mappings_enabled = 0

vim.fn['deoplete#custom#var']('omni', 'input_patterns', {
  tex = vim.g['vimtex#re#deoplete']
})
