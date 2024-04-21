local ts_info = require'nvim-treesitter.info'

return function()
  if vim.tbl_contains(ts_info.installed_parsers(), vim.bo.filetype) then
    vim.opt_local.foldmethod = 'expr'
    vim.opt_local.foldexpr = 'nvim_treesitter#foldexpr()'
  elseif vim.bo.filetype == 'tex' then
    vim.opt_local.foldmethod = 'expr'
    vim.opt_local.foldexpr = 'vimtex#fold#level(v:lnum)'
    vim.opt_local.foldtext = 'vimtex#fold#text()'
  elseif vim.bo.filetype == 'ledger' then
    vim.opt_local.foldmethod = 'syntax'
  else
    vim.opt_local.foldmethod = 'indent'
  end
end
