local au = require'parmort.util'.au

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  }
}

local function installed_ts(filetype)
  return vim.tbl_contains({
    'c', 'lua', 'ruby'
  }, filetype)
end

function ParmortTreesitterFolding()
  if installed_ts(vim.bo.filetype) then
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
  else
    vim.wo.foldmethod = 'indent'
  end
end

au.g('ParmortTSFolding')
  au.c('!')
  au.c('Filetype', '*', 'call v:lua.ParmortTreesitterFolding()')
au.g('END')
