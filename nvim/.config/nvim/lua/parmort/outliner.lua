local M = {}

function M.closeQFWindow()
  if vim.w.qf_toc or vim.regex("\\<TOC$"):match_str(vim.w.quickfix_title) then
    vim.cmd.lclose()
  end
end

return M
