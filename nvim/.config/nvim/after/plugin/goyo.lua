if not vim.fn.exists(':Goyo') then
  return
end

local myGoyo = require('parmort.goyo')
local grp = vim.api.nvim_create_augroup('ParmortGoyo', { clear = true })

vim.api.nvim_create_autocmd({'User'}, {
  pattern = 'GoyoEnter', group = grp, nested = true,
  callback = myGoyo.enter
})

vim.api.nvim_create_autocmd({'User'}, {
  pattern = 'GoyoLeave', group = grp, nested = true,
  callback = myGoyo.leave
})
