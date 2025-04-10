vim.treesitter.query.set(
  'markdown',
  'injections',
  [[; extends
    ((inline) @injection.content
      (#lua-match? @injection.content "^%s*import")
      (#set! injection.language "typescript"))
    ((inline) @injection.content
      (#lua-match? @injection.content "^%s*export")
      (#set! injection.language "typescript"))
  ]]
)

vim.treesitter.query.set(
  'markdown',
  'highlights',
  [[; extends
    ((inline) @_inline (#lua-match? @_inline "^%s*import")) @nospell
    ((inline) @_inline (#lua-match? @_inline "^%s*export")) @nospell
  ]]
)
