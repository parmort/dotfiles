local map = vim.api.nvim_set_keymap

map('n', '<leader>t', "<cmd>lua require'parmort.telescope'.git_files()<CR>", {})
