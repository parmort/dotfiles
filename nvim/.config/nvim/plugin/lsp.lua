local key_train = require('parmort.util').keybind_training

vim.lsp.enable('luals')
vim.lsp.enable('ccls')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('parmort.lsp', {}),
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
