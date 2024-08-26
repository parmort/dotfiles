local M = {}

function M.colors()
  -- Persistent configuration can go here
  vim.api.nvim_set_hl(0, "@type.builtin", { link = "Type" })

  -- Markdown
  vim.api.nvim_set_hl(0, "@punctuation.special.markdown", { link = "markdownHeadingDelimiter" })
  vim.api.nvim_set_hl(0, "@markup.raw.markdown_inline", { link = "markdownCode" })
  vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { link = "markdownH1" })
  vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { link = "markdownH2" })
  vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { link = "markdownH3" })
  vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { link = "markdownH4" })
  vim.api.nvim_set_hl(0, "@markup.heading.5.markdown", { link = "markdownH5" })
  vim.api.nvim_set_hl(0, "@markup.heading.6.markdown", { link = "markdownH6" })

  vim.api.nvim_set_hl(0, "@markup.link.markdown_inline", { link = "markdownLinkTextDelimiter" })
  vim.api.nvim_set_hl(0, "@markup.link.label.markdown_inline", { link = "markdownLinkText" })
end

return M
