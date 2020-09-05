if !has('nvim')
  finish
endif

lua << END

local nvim_lsp = require'nvim_lsp'

nvim_lsp.tsserver.setup{}
nvim_lsp.vimls.setup{}
nvim_lsp.ccls.setup{}

END

function! s:ConfigureBuffer() abort
  nnoremap <buffer><silent> <leader>r <cmd>lua vim.lsp.buf.rename()<CR>
  nnoremap <buffer><silent> <leader>e <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
  nnoremap <buffer><silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <buffer><silent> K <cmd>lua vim.lsp.buf.hover()<CR>

  if exists('+signcolumn')
    setlocal signcolumn=yes
  endif
endfunction

sign define LspDiagnosticsErrorSign text=>>
sign define LspDiagnosticsWarningSign text=>>

augroup ParmortLspAutocmds
  autocmd!
  autocmd Filetype typescript,vim,c,cpp call s:ConfigureBuffer()
augroup END
