local lspconfig = require'lspconfig'

vim.fn.sign_define('LspDiagnosticsSignError', { text = 'E»' })
vim.fn.sign_define('LspDiagnosticsSignWarning', { text = 'W»' })
vim.fn.sign_define('LspDiagnosticsSignHint', { text = 'H»' })
vim.fn.sign_define('LspDiagnosticsSignInformation', { text = 'I»' })

local function mapluafn(mode, key, cmd)
  local value = '<cmd>lua '..cmd..'<CR>'
  vim.api.nvim_buf_set_keymap(0, mode, key, value, { silent= true; noremap= true })
end

local function highlight()
  local hi = require'parmort.util'.highlight
  hi('LspDiagnosticsDefaultError', { ctermfg=4, guifg='#e06c75' })
  hi('LspDiagnosticsDefaultWarning', { ctermfg=3, guifg='#d19a66' })
end

local function configureBuffer()
  mapluafn('n', '<leader>r', 'vim.lsp.buf.rename()')
  mapluafn('n', '<leader>e', 'vim.diagnostic.open_float()')
  mapluafn('n', 'gd', 'vim.lsp.buf.definition()')
  mapluafn('n', 'K', 'vim.lsp.buf.hover()')

  mapluafn('i', '<C-s>', 'vim.lsp.buf.signature_help()')

  -- vim.api.nvim_win_set_option(0, 'signcolumn', 'yes')
  vim.api.nvim_set_option_value('signcolumn', 'yes', { win=0 })

  highlight()

  vim.fn['deoplete#enable']()
end

local function use_luajit(client)
  local path = client.workspace_folders[1].name
  if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
    return
  end

  client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
    runtime = {
      version = 'LuaJIT'
    },

    workspace = {
      checkThirdParty = false,
      library = {
        vim.env.VIMRUNTIME,
        "${3rd}/luv/library",
        "${3rd}/busted/library",
      }
    }
  })
end

lspconfig.tsserver.setup {
  on_attach = configureBuffer
}

lspconfig.vimls.setup {
  on_attach = configureBuffer
}
lspconfig.ccls.setup {
  on_attach = configureBuffer
}

lspconfig.solargraph.setup {
  on_attach = configureBuffer
}

lspconfig.lua_ls.setup {
  on_init = use_luajit,
  on_attach = configureBuffer,
  settings = {
    Lua = {}
  }
}
