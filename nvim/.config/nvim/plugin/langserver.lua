require('neodev').setup() -- Needs to come before lspconfig
local lspconfig = require('lspconfig')

local keymap = vim.keymap.set
local leader = require('parmort.keymap').leader

local function attachToBuffer()
  keymap('n', leader 'r', vim.lsp.buf.rename)
  keymap('n', leader 'e', vim.diagnostic.open_float)
  keymap('n', 'gd',       vim.lsp.buf.definition)
  keymap('n', 'K',        vim.lsp.buf.hover)
  keymap('i', '<C-s>',    vim.lsp.buf.signature_help)

  vim.opt.signcolumn = 'yes'

  vim.fn['deoplete#enable']()
end

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

lspconfig.tsserver.setup   { on_attach = attachToBuffer }
lspconfig.vimls.setup      { on_attach = attachToBuffer }
lspconfig.ccls.setup       { on_attach = attachToBuffer }
lspconfig.solargraph.setup { on_attach = attachToBuffer }
lspconfig.lua_ls.setup     { on_attach = attachToBuffer }
lspconfig.elixirls.setup   { on_attach = attachToBuffer, cmd = {'elixir-ls'} }
lspconfig.pyright.setup    { on_attach = attachToBuffer }
