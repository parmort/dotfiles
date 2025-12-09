local keymap = vim.keymap.set
local leader = require('parmort.keymap').leader

local servers = {
  ['luals'] = require('parmort.lsp.luals')
}

for server, config in pairs(servers) do
  vim.lsp.config('parmort.'..server, config)
  vim.lsp.enable('parmort.'..server)
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('parmort.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    keymap('n', leader 'r', vim.lsp.buf.rename)
    keymap('n', leader 'e', vim.diagnostic.open_float)
    keymap('n', 'gd',       vim.lsp.buf.definition)
    keymap('n', 'K',        vim.lsp.buf.hover)
    keymap('i', '<C-s>',    vim.lsp.buf.signature_help)

    vim.opt.signcolumn = 'yes'

    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
    end
  end,
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = 'E»',
      [vim.diagnostic.severity.WARN]  = 'W»',
      [vim.diagnostic.severity.HINT]  = 'H»',
      [vim.diagnostic.severity.INFO]  = 'I»',
    }
  }
})

-- lspconfig.vimls.setup      { on_attach = attachToBuffer }
-- lspconfig.ccls.setup       { on_attach = attachToBuffer }
-- lspconfig.pyright.setup    { on_attach = attachToBuffer }
-- lspconfig.astro.setup      { on_attach = attachToBuffer }
