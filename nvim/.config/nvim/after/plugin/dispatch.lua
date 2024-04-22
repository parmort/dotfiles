if not vim.fn.exists('g:loaded_dispatch') then
  return
end

local grp = vim.api.nvim_create_augroup('dispatch', { clear = true })

vim.api.nvim_create_autocmd({'BufRead'}, {
  pattern = '.Xresources,Xresources', group = grp,
  callback = function() vim.b.dispatch = 'xrdb %' end
})
