local nvim_lsp = require'nvim_lsp'
local nlua_lsp = require'nlua.lsp.nvim'

vim.fn.sign_define('LspDiagnosticsErrorSign', { text = 'E»' })
vim.fn.sign_define('LspDiagnosticsWarningSign', { text = 'W»' })
vim.fn.sign_define('LspDiagnosticsHintSign', { text = 'H»' })
vim.fn.sign_define('LspDiagnosticsInformationSign', { text = 'I»' })

local function mapluafn(mode, key, cmd)
  local value = '<cmd>lua '..cmd..'<CR>'
  vim.api.nvim_buf_set_keymap(0, mode, key, value, { silent= true; noremap= true })
end

local function configureBuffer()
  mapluafn('n', '<leader>r', 'vim.lsp.buf.rename()')
  mapluafn('n', '<leader>e', 'vim.lsp.util.show_line_diagnostics()')
  mapluafn('n', 'gd', 'vim.lsp.buf.definition()')
  mapluafn('n', 'K', 'vim.lsp.buf.hover()')

  mapluafn('i', '<C-s>', 'vim.lsp.buf.signature_help()')

  vim.api.nvim_win_set_option(0, 'signcolumn', 'yes')
end

local common = {
  on_attach = configureBuffer,
}

nlua_lsp.setup(nvim_lsp, common)

nvim_lsp.tsserver.setup(common)
nvim_lsp.vimls.setup(common)
nvim_lsp.ccls.setup(common)
