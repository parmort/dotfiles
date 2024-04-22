if not vim.fn.exists('g:loaded_dirvish') then
  return
end

vim.g.dirvish_mode = [[:sort ,^.*[\/],]]
