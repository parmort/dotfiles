require("headlines").setup({
  markdown = {
    query = vim.treesitter.query.parse(
      "markdown",
      [[
        (thematic_break) @dash

        (fenced_code_block) @codeblock

        (block_quote_marker) @quote
        (block_quote (paragraph (inline (block_continuation) @quote)))
        (block_quote (paragraph (block_continuation) @quote))
        (block_quote (block_continuation) @quote)
      ]]
    ),
    -- fat_headlines = false,
    -- bullets = { "#", "◉", ">", "↪", }
    -- bullet_highlights = {}
  }
})
