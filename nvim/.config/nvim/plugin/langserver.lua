require('neodev').setup() -- Needs to come before lspconfig
local lspconfig = require('lspconfig')

local keymap = vim.keymap.set
local leader = require('parmort.keymap').leader
local highlight = require('parmort.util').highlight

local function attachToBuffer()
  keymap('n', leader 'r', vim.lsp.buf.rename)
  keymap('n', leader 'e', vim.diagnostic.open_float)
  keymap('n', 'gd',       vim.lsp.buf.definition)
  keymap('n', 'K',        vim.lsp.buf.hover)
  keymap('i', '<C-s>',    vim.lsp.buf.signature_help)

  vim.opt.signcolumn = 'yes'

  highlight('LspDiagnosticsDefaultError',   { ctermfg=4, guifg='#e06c75' })
  highlight('LspDiagnosticsDefaultWarning', { ctermfg=3, guifg='#d19a66' })

  vim.fn['deoplete#enable']()
end

vim.fn.sign_define('LspDiagnosticsSignError',       { text = 'E»' })
vim.fn.sign_define('LspDiagnosticsSignWarning',     { text = 'W»' })
vim.fn.sign_define('LspDiagnosticsSignHint',        { text = 'H»' })
vim.fn.sign_define('LspDiagnosticsSignInformation', { text = 'I»' })

lspconfig.tsserver.setup   { on_attach = attachToBuffer }
lspconfig.vimls.setup      { on_attach = attachToBuffer }
lspconfig.ccls.setup       { on_attach = attachToBuffer }
lspconfig.solargraph.setup { on_attach = attachToBuffer }
lspconfig.lua_ls.setup     { on_attach = attachToBuffer }
lspconfig.elixirls.setup   { on_attach = attachToBuffer, cmd = {'elixir-ls'} }
