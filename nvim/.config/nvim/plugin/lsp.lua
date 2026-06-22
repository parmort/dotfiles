local key_train = require('parmort.util').keybind_training

vim.lsp.enable('luals')
vim.lsp.enable('ccls')
vim.lsp.enable('pyright')

local augroup = vim.api.nvim_create_augroup('parmort.lsp', {})

vim.api.nvim_create_autocmd('LspAttach', {
  group = augroup,
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    vim.opt.signcolumn = 'yes'

    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '<leader>r', key_train('Use `grn` to rename a symbol'))

    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(
        true, client.id, args.buf, {autotrigger = true}
      )
    end
  end,
})

local function focus_dispatch()
  local makeprg = vim.o.makeprg
  if vim.b.dispatch then
    makeprg = vim.b.dispatch
  end

  vim.cmd { cmd='FocusDispatch', args={ makeprg, '%' } }
end

-- if vim.g.loaded_dispatch then
  vim.api.nvim_create_autocmd('LspAttach', {
    group = augroup,
    callback = function(_)
      vim.keymap.set('n', '<localleader>f', focus_dispatch)
    end
  })
-- end
