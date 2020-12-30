local info = require'nvim-treesitter.info'

return function()
  if vim.tbl_contains(info.installed_parsers(), vim.bo.filetype) then
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
  else
    vim.wo.foldmethod = 'indent'
  end
end
