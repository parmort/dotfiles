local ts_info = require'nvim-treesitter.info'

return function()
  if vim.tbl_contains(ts_info.installed_parsers(), vim.bo.filetype) then
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
  elseif vim.bo.filetype == 'tex' then
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'vimtex#fold#level(v:lnum)'
    vim.wo.foldtext = 'vimtex#fold#text()'
  else
    vim.wo.foldmethod = 'indent'
  end
end
